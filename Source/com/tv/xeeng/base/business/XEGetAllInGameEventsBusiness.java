/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEGetAllInGameEventsResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.databaseDriven.UserDB;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.UserEntity;
import com.tv.xeeng.game.data.XEInGameEventEntity;
import com.tv.xeeng.memcached.data.XEDataUtils;
import com.tv.xeeng.memcached.data.XEGlobalCache;
import com.tv.xeeng.protocol.AbstractBusiness;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponsePackage;
import com.tv.xeeng.protocol.MessageFactory;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import org.slf4j.Logger;

/**
 *
 * @author ThangTD
 */
public class XEGetAllInGameEventsBusiness extends AbstractBusiness {

	private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEGetAllInGameEventsBusiness.class);

	private static final String MEMCACHED_NAME = "InGameEvents";

	@Override
	public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) throws ServerException {
		mLog.debug("[GET IN-GAME EVENTS]: Catch");

		MessageFactory msgFactory = aSession.getMessageFactory();
		XEGetAllInGameEventsResponse respone = (XEGetAllInGameEventsResponse) msgFactory.getResponseMessage(aReqMsg.getID());
		respone.session = aSession;

		Object raw = XEGlobalCache.getCache(MEMCACHED_NAME);
		List<XEInGameEventEntity> itemsList = null;

		if (raw != null) {
			itemsList = (List<XEInGameEventEntity>) raw;
		}

		if (itemsList == null) {
			try {
				itemsList = XEDataUtils.getAllInGameEventsFromDB();

			} catch (SQLException ex) {
				mLog.error(ex.getMessage());
			}

			if (itemsList != null) {
				XEGlobalCache.setCache(MEMCACHED_NAME, itemsList, XEGlobalCache.TIMEOUT_30_MIN);
			}
		}
		for (XEInGameEventEntity event : itemsList) {
			if (event.getId() == 14) {
				try {
					UserEntity user = new UserDB().getUserInfo(aSession.getUID());
				event.setDescription(event.getDescription()+ "\nBạn có " + user.specialPoint + " lần lật bài miễn phí");
				} catch (SQLException ex) {
					java.util.logging.Logger.getLogger(XEGetAllInGameEventsBusiness.class.getName()).log(Level.SEVERE, null, ex);
				}
			}
		}
		if (itemsList == null) {
			respone.setFailure(ResponseCode.FAILURE, "Hiện tại không có sự kiện nào diễn ra trong hệ thống Xeeng Online");
		} else {
			respone.setSuccess(ResponseCode.SUCCESS, itemsList);
		}

		aResPkg.addMessage(respone);

		return 1;
	}
}
