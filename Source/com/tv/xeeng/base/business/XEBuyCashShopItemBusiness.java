/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEBuyCashShopItemRequest;
import com.tv.xeeng.base.protocol.messages.XEBuyCashShopItemResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.databaseDriven.InventoryDB;
import com.tv.xeeng.databaseDriven.UserDB;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.UserEntity;
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
 * @author ThangTD
 */
public class XEBuyCashShopItemBusiness extends AbstractBusiness {

    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEBuyCashShopItemBusiness.class);

    @Override
    public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) throws ServerException {
        mLog.debug("[BUY CASH SHOP ITEM]: Catch - " + aSession.getUID());

        MessageFactory msgFactory = aSession.getMessageFactory();
        XEBuyCashShopItemRequest request = (XEBuyCashShopItemRequest) aReqMsg;
        XEBuyCashShopItemResponse response = (XEBuyCashShopItemResponse) msgFactory.getResponseMessage(aReqMsg.getID());
        response.session = aSession;

        UserDB userDB = new UserDB();
        UserEntity user = userDB.getUserInfoNoException(aSession.getUID());
        if (user == null || user.mUsername == null) {
            response.setResult(ResponseCode.FAILURE, "Người dùng không tồn tại!");
        } else {
            int result = -3;
            try {
                result = XEDataUtils.buyCashShopItem(user.mUid, request.getItemCode());
            } catch (SQLException ex) {
                mLog.error(ex.getMessage());
            }

            if (result == -1) {
                response.setResult(ResponseCode.FAILURE, "Vật phẩm không tồn tại!");
            } else if (result == -2) {
                response.setResult(ResponseCode.FAILURE, "Bạn không đủ tiền để mua vật phẩm!");
            } else if (result == 1) {
                response.setResult(ResponseCode.SUCCESS, "Mua vật phẩm thành công!");

                /* update cache */
                CacheUserInfo cacheUser = new CacheUserInfo();
                cacheUser.deleteCacheUser(user);

                InventoryDB.deleteCacheUserInventory(user.mUid);
            } else {
                response.setResult(ResponseCode.FAILURE, "Có lỗi xảy ra!");
            }
        }

        aResPkg.addMessage(response);

        return 1;
    }
}
