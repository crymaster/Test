/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEUseInventoryItemRequest;
import com.tv.xeeng.base.protocol.messages.XEUseInventoryItemResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.databaseDriven.EventGiftsDB;
import com.tv.xeeng.databaseDriven.EventItemsDB;
import com.tv.xeeng.databaseDriven.InventoryDB;
import com.tv.xeeng.databaseDriven.UserDB;
import com.tv.xeeng.game.data.EventGiftEntity;
import com.tv.xeeng.game.data.EventItemEntity;
import com.tv.xeeng.game.data.InventoryItemEntity;
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
import java.util.logging.Level;
import org.slf4j.Logger;

/**
 *
 * @author ThangTD
 */
public class XEUseInventoryItemBusiness extends AbstractBusiness {

	private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEUseInventoryItemBusiness.class);

	@Override
	public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) throws ServerException {
		mLog.debug("[USE INVENTORY ITEM]: Catch");

		MessageFactory msgFactory = aSession.getMessageFactory();
		XEUseInventoryItemResponse resUse = (XEUseInventoryItemResponse) msgFactory.getResponseMessage(aReqMsg.getID());
		resUse.session = aSession;
		XEUseInventoryItemRequest rqUse = (XEUseInventoryItemRequest) aReqMsg;

		UserDB userDB = new UserDB();
		UserEntity user = userDB.getUserInfoNoException(aSession.getUID());
		if (user == null || user.mUsername == null) {
			resUse.setResult(ResponseCode.FAILURE, "Người dùng không tồn tại!");
		} else {
			List<InventoryItemEntity> itemsList = null;
			try {
				itemsList = InventoryDB.getUserInventory(user.mUid);
			} catch (SQLException ex) {
				mLog.error(ex.getMessage());
			}
			System.out.println("itemsList.size = " + itemsList.size());
			boolean isItemFound = false;

			if (itemsList != null) {
				for (InventoryItemEntity item : itemsList) {
					if (item.getItemCode().equalsIgnoreCase(rqUse.getItemCode()) && item.getQuantity() >= 1 && item.getIsUsable()) {
						System.out.println("Item:" + item.getName());
						isItemFound = true;
						break;
					}
				}
			}

			if (!isItemFound) {
				resUse.setResult(ResponseCode.FAILURE, "Vật phẩm không tồn tại!");
			} else {
				// Collect all the gifts correspond to the item
				List<EventGiftEntity> giftsList = new ArrayList<EventGiftEntity>();
				for (EventGiftEntity gift : EventGiftsDB.getItemsList()) {
					if (gift.getEvitCode().equalsIgnoreCase(rqUse.getItemCode())) {
						giftsList.add(gift);
					}
				}
				System.out.println("giftsList.size = " + giftsList.size());
				if (!giftsList.isEmpty()) {
					// Get random gift with fixed rate
					Random ran = new Random();
					float sum = 0;
					float value = ran.nextFloat() * 100;
					int index = -1;

					for (int i = 0; i < giftsList.size(); i++) {
						EventGiftEntity gift = (EventGiftEntity) giftsList.get(i);
						if ((value >= sum) && (value < (sum + gift.getRate()))) {
							if (gift.getQuantity() != 0) {
								index = i;
							} else {
								for(int j = 0; j < giftsList.size(); j++){
									if(!giftsList.get(j).isIsLimitUsage()){
										index = j;
										break;
									}
								}
							}
							break;
						}

						sum += gift.getRate();
					}

					// Gift found
					if (index != -1) {
						EventGiftEntity gift = (EventGiftEntity) giftsList.get(index);
						EventItemEntity eventItem = null;
						System.out.println("Gift: " + gift.getEvgfCode());
						for (EventItemEntity entity : EventItemsDB.getJoinListItems()) {
							System.out.println("Join item: " + entity.getName());
							if (rqUse.getItemCode().equalsIgnoreCase(entity.getCode())) {
								eventItem = entity;
								break;
							}
						}

						if (gift != null && eventItem != null) {
							int result = -3;
							try {
								result = XEDataUtils.useInventoryItem(user.mUid, rqUse.getItemCode(), gift.getEvgfCode(), eventItem.getLimit(), eventItem.getEventId());
							} catch (SQLException ex) {
								mLog.error(ex.getMessage());
							}

							if (result == 1) {
								resUse.setResult(ResponseCode.SUCCESS, "Xin chúc mừng! Bạn đã nhận được " + Utils.convertValue(gift.getValue()) + " " + gift.getType());

								/* update cache */
								CacheUserInfo cacheUser = new CacheUserInfo();
								cacheUser.deleteCacheUser(user);

								EventGiftsDB.reload();

								InventoryDB.deleteCacheUserInventory(user.mUid);
							} else if (result == -2) { // Already reached the limit quantity of the gifts
								resUse.setResult(ResponseCode.FAILURE, "Bạn đã sử dụng đủ " + eventItem.getLimit() + " " + eventItem.getName());
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
										if (XEDataUtils.useInventoryItem(user.mUid, rqUse.getItemCode(), otherGift.getEvgfCode(), eventItem.getLimit(), eventItem.getEventId()) == 1) {
											isDone = true;
										}
									} catch (SQLException ex) {
										mLog.error(ex.getMessage());
									}
								}

								if (isDone) {
									resUse.setResult(ResponseCode.SUCCESS, "Xin chúc mừng! Bạn đã nhận được " + Utils.convertValue(otherGift.getValue()) + " " + gift.getType());
								} else {
									resUse.setResult(ResponseCode.FAILURE, "Chúc bạn may mắn lần sau!");
								}
							} else {
								resUse.setResult(ResponseCode.FAILURE, "Chúc bạn may mắn lần sau!");
							}
						} else {
							resUse.setResult(ResponseCode.FAILURE, "Chúc bạn may mắn lần sau");
						}
					} else {
						resUse.setResult(ResponseCode.FAILURE, "Chúc bạn may mắn lần sau!");
					}
				} else {
					resUse.setResult(ResponseCode.FAILURE, "Phần thưởng không tồn tại!");
				}
			}
		}

		aResPkg.addMessage(resUse);

		return 1;
	}
}
