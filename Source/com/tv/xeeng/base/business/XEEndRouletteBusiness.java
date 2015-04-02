/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEEndRouletteResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.databaseDriven.DBCache;
import com.tv.xeeng.databaseDriven.RouletteDB;
import com.tv.xeeng.databaseDriven.UserDB;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.UserEntity;
import com.tv.xeeng.game.data.Utils;
import com.tv.xeeng.game.data.XELogRouletteEntity;
import com.tv.xeeng.memcached.data.CacheUserInfo;
import com.tv.xeeng.memcached.data.XEDataUtils;
import com.tv.xeeng.protocol.AbstractBusiness;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponsePackage;
import com.tv.xeeng.protocol.MessageFactory;
import java.sql.SQLException;
import java.util.logging.Level;
import org.slf4j.Logger;

/**
 *
 * @author thangtd
 */
public class XEEndRouletteBusiness extends AbstractBusiness {

    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEEndRouletteBusiness.class);

    @Override
    public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) throws ServerException {
        mLog.debug("[END ROULETTE]: Catch: " + aSession.getUID());

        MessageFactory msgFactory = aSession.getMessageFactory();
        XEEndRouletteResponse resRoulette = (XEEndRouletteResponse) msgFactory.getResponseMessage(aReqMsg.getID());
        resRoulette.session = aSession;

        boolean isEventOpen = true;

        if (!DBCache.isRouletteEvent || RouletteDB.getListInfos().isEmpty()) {
            isEventOpen = false;
        }

        if (!isEventOpen) {
            resRoulette.setResult(ResponseCode.FAILURE, "Tính năng này đang được bảo trì. Bạn vui lòng quay lại sau nhé!");
        } else {
            XELogRouletteEntity cacheData = RouletteDB.getCacheUserRouletteStatus(aSession.getUID());
            if (cacheData != null) {
                if (cacheData.getPrice() > 0) {
                    UserDB userDB = new UserDB();
                    UserEntity user = userDB.getUserInfoNoException(aSession.getUID());
                    if (user == null || user.mUsername == null) {
                        resRoulette.setResult(ResponseCode.FAILURE, "Người dùng không tồn tại!");
                    } else {
                        try {
                            RouletteDB.endRoulette(cacheData);
                        } catch (SQLException ex) {
                            mLog.error(ex.getMessage());
                        }
                        
                        long value = (long) (cacheData.getFee() * cacheData.getPrice());
                        resRoulette.setResult(ResponseCode.SUCCESS, "Xin chúc mừng! Bạn đã nhận được " + Utils.convertValue(value) + " " + cacheData.getFeeType().replaceAll("Xeng", "Xèng"));
                        
                        // Update cache
                        CacheUserInfo cacheUser = new CacheUserInfo();
                        cacheUser.deleteCacheUser(user);
                        
                        RouletteDB.deleteCacheUserRouletteStatus(cacheData.getUserId());
                    }
                } else {
                    resRoulette.setResult(ResponseCode.FAILURE, "Nhận thưởng không thành công!");
                }
            } else {
                resRoulette.setResult(ResponseCode.FAILURE, "Không tìm thấy dữ liệu tương ứng!");
            }
        }

        aResPkg.addMessage(resRoulette);

        return 1;
    }

}
