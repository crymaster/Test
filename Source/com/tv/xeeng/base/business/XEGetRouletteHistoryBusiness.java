/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEGetRouletteHistoryResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.databaseDriven.RouletteDB;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.XELogRouletteEntity;
import com.tv.xeeng.memcached.data.XEGlobalCache;
import com.tv.xeeng.protocol.AbstractBusiness;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponsePackage;
import com.tv.xeeng.protocol.MessageFactory;
import java.sql.SQLException;
import java.util.List;
import org.slf4j.Logger;

/**
 *
 * @author thangtd
 */
public class XEGetRouletteHistoryBusiness extends AbstractBusiness {

    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEGetRouletteHistoryBusiness.class);

    private static final String MEMCACHED_NAME = "RouletteHistory";

    @Override
    public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) throws ServerException {
        mLog.debug("[GET ROULETTE HISTORY]: Catch");

        MessageFactory msgFactory = aSession.getMessageFactory();
        XEGetRouletteHistoryResponse resRoulette = (XEGetRouletteHistoryResponse) msgFactory.getResponseMessage(aReqMsg.getID());
        resRoulette.session = aSession;

        String key = MEMCACHED_NAME;
        Object raw = XEGlobalCache.getCache(key);
        List<XELogRouletteEntity> itemsList = null;

        if (raw != null) {
            itemsList = (List<XELogRouletteEntity>) raw;
        }

        if (itemsList == null) {
            try {
                itemsList = RouletteDB.getRouletteHistoryFromDB();
            } catch (SQLException ex) {
                mLog.error(ex.getMessage());
            }
        }

        if (itemsList == null) {
            resRoulette.setFailure(ResponseCode.FAILURE, "Không lấy được dữ liệu");
        } else {
            resRoulette.setSuccess(ResponseCode.SUCCESS, itemsList);

            XEGlobalCache.setCache(key, itemsList, XEGlobalCache.TIMEOUT_2_MIN);
        }

        aResPkg.addMessage(resRoulette);

        return 1;
    }

}
