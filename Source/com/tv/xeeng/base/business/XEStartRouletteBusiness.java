/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEStartRouletteRequest;
import com.tv.xeeng.base.protocol.messages.XEStartRouletteResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.databaseDriven.DBCache;
import com.tv.xeeng.databaseDriven.RouletteDB;
import com.tv.xeeng.databaseDriven.UserDB;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.UserEntity;
import com.tv.xeeng.game.data.XELogRouletteEntity;
import com.tv.xeeng.game.data.XERouletteInfoEntity;
import com.tv.xeeng.game.data.XERouletteItemEntity;
import com.tv.xeeng.memcached.data.CacheUserInfo;
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
 * @author thangtd
 */
public class XEStartRouletteBusiness extends AbstractBusiness {

    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEStartRouletteBusiness.class);

    @Override
    public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) throws ServerException {
        mLog.debug("[START ROULETTE]: Catch: " + aSession.getUID());

        MessageFactory msgFactory = aSession.getMessageFactory();
        XEStartRouletteResponse resRoulette = (XEStartRouletteResponse) msgFactory.getResponseMessage(aReqMsg.getID());
        resRoulette.session = aSession;
        XEStartRouletteRequest rqRoulette = (XEStartRouletteRequest) aReqMsg;

        boolean isEventOpen = true;

        if (!DBCache.isRouletteEvent || RouletteDB.getListInfos().isEmpty()) {
            isEventOpen = false;
        }

        if (!isEventOpen) {
            resRoulette.setFailure(ResponseCode.FAILURE, "Tính năng này đang được bảo trì. Bạn vui lòng quay lại sau nhé!");
        } else {
            UserDB userDB = new UserDB();
            UserEntity user = userDB.getUserInfoNoException(aSession.getUID());
            if (user == null || user.mUsername == null) {
                resRoulette.setFailure(ResponseCode.FAILURE, "Người dùng không tồn tại!");
            } else {
                int level = 1;
                int currRound = 0;
                String lastItem = "none";

                XELogRouletteEntity cacheData = RouletteDB.getCacheUserRouletteStatus(aSession.getUID());
                if (cacheData != null) {
                    currRound = cacheData.getRound();
                    lastItem = cacheData.getItem();
                    level = cacheData.getLevel();
                }

                if (currRound >= RouletteDB.MAX_ROULETTE_ROUND) {
                    resRoulette.setFailure(ResponseCode.FAILURE, "Bạn đã đạt tối đa số vòng quay!");
                    aResPkg.addMessage(resRoulette);
                    return 1;
                }

                // Check if the request is valid
                int firstLevel = 1;
                boolean isValidRequest = false;

                for (XERouletteInfoEntity info : RouletteDB.getListInfos()) {
                    if ((info.getValue() == rqRoulette.getValue() && (info.getType().equalsIgnoreCase(rqRoulette.getType())))) {
                        isValidRequest = true;
                        firstLevel = info.getLevel();
                        break;
                    }
                }

                if (!isValidRequest) {
                    resRoulette.setFailure(ResponseCode.FAILURE, "Dữ liệu đầu vào không chính xác!");
                    aResPkg.addMessage(resRoulette);
                    return 1;
                }

                XELogRouletteEntity savedItem = new XELogRouletteEntity();

                // First Round
                if (currRound == 0) {
                    boolean isEnoughMoney = false;

                    if ((user.money >= rqRoulette.getValue()) && ("gold").equalsIgnoreCase(rqRoulette.getType())) {
                        isEnoughMoney = true;
                    } else if ((user.xeeng >= rqRoulette.getValue()) && ("xeng").equalsIgnoreCase(rqRoulette.getType())) {
                        isEnoughMoney = true;
                    }

                    if (!isEnoughMoney) {
                        resRoulette.setFailure(ResponseCode.FAILURE, "Bạn không đủ " + rqRoulette.getType().replaceAll("Xeng", "Xèng") + " để chơi!");
                        aResPkg.addMessage(resRoulette);

                        return 1;
                    }

                    try {
                        // Charge fee
                        RouletteDB.startRoulette(user.mUid, rqRoulette.getValue(), rqRoulette.getType());

                        // Update cache
                        CacheUserInfo cacheUser = new CacheUserInfo();
                        cacheUser.deleteCacheUser(user);

                        savedItem.setFee(rqRoulette.getValue());
                        savedItem.setFeeType(rqRoulette.getType());
                        savedItem.setLevel(firstLevel);
                    } catch (SQLException ex) {
                        mLog.error(ex.getMessage());
                    }
                }

                currRound++;

                // Collect all the items correspond to the round
                List<XERouletteItemEntity> listItems = new ArrayList<XERouletteItemEntity>();
                for (XERouletteItemEntity item : RouletteDB.getListItems()) {
                    if (item.getRound() == currRound && item.getLastItem().equalsIgnoreCase(lastItem)
                            && item.getLevel() == level) {
                        listItems.add(item);
                    }
                }

                // Get random item with fixed rate
                Random ran = new Random();
                float sum = 0;
                float value = ran.nextFloat() * 100;
                int index = -1;

                for (int i = 0; i < listItems.size(); i++) {
                    XERouletteItemEntity it = (XERouletteItemEntity) listItems.get(i);
                    if ((value >= sum) && (value < (sum + it.getRate()))) {
                        index = i;
                        break;
                    }
                    sum += it.getRate();
                }

                if (index != -1) {
                    XERouletteItemEntity selectedItem = (XERouletteItemEntity) listItems.get(index);

                    savedItem.setUserId(aSession.getUID());
                    savedItem.setRound(currRound);
                    savedItem.setPrice(selectedItem.getPrice());
                    savedItem.setStop(selectedItem.isStop());

                    if (currRound == 1) {
                        savedItem.setItem(selectedItem.getNextItem());
                    } else {
                        savedItem.setItem(lastItem + ";" + selectedItem.getNextItem());
                    }

                    if (cacheData != null) {
                        savedItem.setFee(cacheData.getFee());
                        savedItem.setFeeType(cacheData.getFeeType());
                        savedItem.setLevel(cacheData.getLevel());
                    }

                    boolean isGift = savedItem.getPrice() > 0;
                    boolean isContinue = (currRound < RouletteDB.MAX_ROULETTE_ROUND) && isGift && !selectedItem.isStop();

                    // Update cache for next round
                    RouletteDB.deleteCacheUserRouletteStatus(savedItem.getUserId());
                    if (isGift) {
                        RouletteDB.setCacheUserRouletteStatus(savedItem);
                    }

                    resRoulette.setSuccess(ResponseCode.SUCCESS, savedItem.getItem(), isContinue, isGift, savedItem.getPrice());
                } else {
                    resRoulette.setFailure(ResponseCode.FAILURE, "Không tìm thấy dữ liệu phù hợp!");
                    aResPkg.addMessage(resRoulette);

                    return 1;
                }
            }
        }

        aResPkg.addMessage(resRoulette);

        return 1;
    }

}
