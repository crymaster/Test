/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEGetRouletteInfoResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.databaseDriven.DBCache;
import com.tv.xeeng.databaseDriven.RouletteDB;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.XELogRouletteEntity;
import com.tv.xeeng.protocol.AbstractBusiness;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponsePackage;
import com.tv.xeeng.protocol.MessageFactory;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import org.slf4j.Logger;

/**
 *
 * @author thangtd
 */
public class XEGetRouletteInfoBusiness extends AbstractBusiness {

    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEGetRouletteInfoBusiness.class);

    @Override
    public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) throws ServerException {
        mLog.debug("[GET ROULETTE INFO]: Catch");

        MessageFactory msgFactory = aSession.getMessageFactory();
        XEGetRouletteInfoResponse resRoulette = (XEGetRouletteInfoResponse) msgFactory.getResponseMessage(aReqMsg.getID());
        resRoulette.session = aSession;

        boolean isEventOpen = true;

        if (!DBCache.isRouletteEvent || RouletteDB.getListInfos().isEmpty()) {
            isEventOpen = false;
        }

        if (!isEventOpen) {
            resRoulette.setFailure(ResponseCode.FAILURE, "Tính năng này đang được bảo trì. Bạn vui lòng quay lại sau nhé!");
        } else {
            try {
                SimpleDateFormat parser = new SimpleDateFormat("HH:mm");
                Date startTime = parser.parse("04:15");
                Date endTime = parser.parse("04:45");

                Date currTime = new Date();
                if (currTime.after(startTime) && currTime.before(endTime)) {
                    resRoulette.setFailure(ResponseCode.FAILURE, "Tính năng này được bảo trì từ 04h15 đến 04h45 hàng ngày. Bạn vui lòng quay lại sau khoảng thời gian này nhé!");
                } else {
                    String lastItem = null;
                    boolean isContinue = false;
                    boolean isGift = false;
                    float price = 0;
                    long fee = 0;
                    String feeType = null;

                    XELogRouletteEntity cacheData = RouletteDB.getCacheUserRouletteStatus(aSession.getUID());
                    if (cacheData != null) {
                        lastItem = cacheData.getItem();
                        isGift = cacheData.getPrice() > 0;
                        isContinue = (cacheData.getRound() < RouletteDB.MAX_ROULETTE_ROUND) && isGift && !cacheData.isStop();
                        price = cacheData.getPrice();
                        fee = cacheData.getFee();
                        feeType = cacheData.getFeeType();
                    }

                    resRoulette.setSuccess(ResponseCode.SUCCESS, RouletteDB.getListInfos(), lastItem, isContinue,
                            isGift, price, fee, feeType);
                }
            } catch (ParseException ex) {
                mLog.error(ex.getMessage());
            }
        }

        aResPkg.addMessage(resRoulette);

        return 1;
    }

}
