/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEOpenEventCardRequest;
import com.tv.xeeng.base.protocol.messages.XEOpenEventCardResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.databaseDriven.EventGiftsDB;
import com.tv.xeeng.databaseDriven.EventItemsDB;
import com.tv.xeeng.databaseDriven.InventoryDB;
import com.tv.xeeng.databaseDriven.UserDB;
import com.tv.xeeng.game.data.EventGiftEntity;
import com.tv.xeeng.game.data.EventItemEntity;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.UserEntity;
import com.tv.xeeng.game.data.Utils;
import com.tv.xeeng.memcached.data.CacheUserInfo;
import com.tv.xeeng.memcached.data.XEDataUtils;
import com.tv.xeeng.protocol.AbstractBusiness;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponsePackage;
import com.tv.xeeng.protocol.MessageFactory;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.slf4j.Logger;

/**
 *
 * @author ThangTD
 */
public class XEOpenEventCardBusiness extends AbstractBusiness {

	private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEOpenEventCardBusiness.class);

	@Override
	public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) throws ServerException {
		mLog.debug("[OPEN EVENT CARD]: Catch");

		MessageFactory msgFactory = aSession.getMessageFactory();
		XEOpenEventCardResponse resOpen = (XEOpenEventCardResponse) msgFactory.getResponseMessage(aReqMsg.getID());
		resOpen.session = aSession;
		XEOpenEventCardRequest rqOpen = (XEOpenEventCardRequest) aReqMsg;

		UserDB userDB = new UserDB();
		UserEntity user = userDB.getUserInfoNoException(aSession.getUID());
		boolean isSpecialPoint = false;

		if (user == null || user.mUsername == null) {
			resOpen.setFailure(ResponseCode.FAILURE, "Người dùng không tồn tại!");
		} else {
			EventItemEntity item = null;
			List<EventItemEntity> openLstItems = EventItemsDB.getOpenListItems();
			for (EventItemEntity entity : openLstItems) {
				if (rqOpen.getEventId() == entity.getEventId()) {
					item = entity;
					break;
				}
			}
			isSpecialPoint = item.getFeeType().equalsIgnoreCase("SPoint");
			if (item != null) {
				if ((item.getFee() > 0 && user.money < item.getFee() && item.getFeeType().equalsIgnoreCase("Gold"))
					|| (item.getFee() > 0 && user.xeeng < item.getFee() && item.getFeeType().equalsIgnoreCase("Xeng"))
					|| (item.getFee() > 0 && user.specialPoint < item.getFee() && isSpecialPoint)) {
					if (isSpecialPoint) {
						resOpen.setFailure(ResponseCode.FAILURE, "Bạn cần nạp thẻ để lật bài!");
					} else {
						resOpen.setFailure(ResponseCode.FAILURE, "Bạn cần " + item.getFee() + " " + item.getFeeType() + " để lật bài!");
					}
				} else {
					// Collect all the gifts correspond to the item
					List<EventGiftEntity> giftsList = new ArrayList<EventGiftEntity>();
					for (EventGiftEntity gift : EventGiftsDB.getItemsList()) {
						if (gift.getEvitCode().equalsIgnoreCase(item.getCode()) && gift.getEventId() == item.getEventId()) {
							giftsList.add(gift);
						}
					}

					if (!giftsList.isEmpty()) {
						// Get random gift with fixed rate
						Random ran = new Random();
						float sum = 0;
						float value = ran.nextFloat() * 100;
						int index = -1;

						for (int i = 0; i < giftsList.size(); i++) {
							EventGiftEntity gift = (EventGiftEntity) giftsList.get(i);
							if ((value >= sum) && (value < (sum + gift.getRate())) && (gift.getQuantity() != 0)) {
								index = i;
								break;
							}

							sum += gift.getRate();
						}

						// Gift found
						if (index != -1) {
							EventGiftEntity gift = (EventGiftEntity) giftsList.get(index);
							if (gift != null) {
								int result = -3;
								try {
									user.specialPoint -= item.getFee();
									result = XEDataUtils.openEventCard(user.mUid, item.getCode(), gift.getEvgfCode(), item.getLimit(), item.getEventId(), item.getFee(), item.getFeeType());
								} catch (SQLException ex) {
									mLog.error(ex.getMessage());
								}

								if (result == 1) {
									if (!isSpecialPoint) {
										resOpen.setSuccess(ResponseCode.SUCCESS, "Xin chúc mừng! Bạn đã nhận được " + Utils.convertValue(gift.getValue()) + " " + gift.getType(), gift.getValue() + " " + gift.getType());
									} else {
										if (gift.getValue() == 0) {
											resOpen.setSuccess(ResponseCode.SUCCESS, "Chúc bạn may mắn lần sau. Bạn còn " + user.specialPoint + " lần mở bài miễn phí.", "May mắn lần sau");
										} else {
											resOpen.setSuccess(ResponseCode.SUCCESS, "Xin chúc mừng! Bạn đã nhận được " + Utils.convertValue(gift.getValue()) + " " + gift.getType() + ". Bạn còn " + user.specialPoint + " lần mở bài miễn phí.", gift.getValue() + " " + gift.getType());
										}
									}	
									/* update cache */
									CacheUserInfo cacheUser = new CacheUserInfo();
									cacheUser.deleteCacheUser(user);
									EventGiftsDB.reload();
								} else if (result == -2) { // Already reached the limit quantity of the gifts
									resOpen.setFailure(ResponseCode.FAILURE, "Bạn đã lật đủ " + item.getLimit() + " lá bài!");
								} else if (result == -1) { // Already got the special gift, Let's find the other one
									EventGiftEntity otherGift = null;
									boolean isDone = false;
									for (EventGiftEntity gf : giftsList) {
										if (!gf.isIsLimitUsage()) {
											otherGift = gf;
											break;
										}
									}
									if (otherGift != null) {
										try {
											if (XEDataUtils.openEventCard(user.mUid, item.getCode(), otherGift.getEvgfCode(), item.getLimit(), item.getEventId(), item.getFee(), item.getFeeType()) == 1) {
												isDone = true;
											}
										} catch (SQLException ex) {
											mLog.error(ex.getMessage());
										}
									}

									if (isDone) {
										resOpen.setSuccess(ResponseCode.SUCCESS, "Xin chúc mừng! Bạn đã nhận được " + Utils.convertValue(gift.getValue()) + " " + gift.getType(), gift.getValue() + " " + gift.getType());
									} else {
										resOpen.setFailure(ResponseCode.FAILURE, "Chúc bạn may mắn lần sau!");
									}
								} else {
									resOpen.setFailure(ResponseCode.FAILURE, "Chúc bạn may mắn lần sau!");
								}
							}
						} else {
							resOpen.setFailure(ResponseCode.FAILURE, "Chúc bạn may mắn lần sau!");
						}
					} else {
						resOpen.setFailure(ResponseCode.FAILURE, "Phần thưởng không tồn tại!");
					}
				}
			} else {
				resOpen.setFailure(ResponseCode.FAILURE, "Sự kiện không tồn tại!");
			}
		}

		aResPkg.addMessage(resOpen);

		return 1;
	}
}
