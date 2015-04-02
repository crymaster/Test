/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEGetRouletteGuideResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.databaseDriven.RouletteDB;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.XERouletteItemEntity;
import com.tv.xeeng.protocol.AbstractBusiness;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponsePackage;
import com.tv.xeeng.protocol.MessageFactory;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;

/**
 *
 * @author thangtd
 */
public class XEGetRouletteGuideBusiness extends AbstractBusiness {

    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEGetRouletteGuideBusiness.class);

    @Override
    public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) throws ServerException {
        mLog.debug("[GET ROULETTE GUIDE]: Catch");

        MessageFactory msgFactory = aSession.getMessageFactory();
        XEGetRouletteGuideResponse resRoulette = (XEGetRouletteGuideResponse) msgFactory.getResponseMessage(aReqMsg.getID());
        resRoulette.session = aSession;

        List<XERouletteItemEntity> tmpList = new ArrayList<>();
        for (XERouletteItemEntity entity : RouletteDB.getListItems()) {
            if (entity.getLevel() == 1 && entity.getPrice() > 0) {
                tmpList.add(entity);
            }
        }

        if (tmpList.isEmpty()) {
            resRoulette.setFailure(ResponseCode.FAILURE, "Không tìm thấy dữ liệu!");
        } else {

            resRoulette.setSuccess(ResponseCode.SUCCESS, tmpList);
        }

        aResPkg.addMessage(resRoulette);

        return 1;
    }

}
