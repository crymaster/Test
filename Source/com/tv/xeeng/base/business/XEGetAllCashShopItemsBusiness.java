/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEGetAllCashShopItemsResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.XECashShopEntity;
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
public class XEGetAllCashShopItemsBusiness extends AbstractBusiness {
    
    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEGetAllCashShopItemsBusiness.class);

    private static final String MEMCACHED_NAME = "CashShopItems";
    
    @Override
    public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) throws ServerException {
        mLog.debug("[GET CASH SHOP ITEMS]: Catch");

        MessageFactory msgFactory = aSession.getMessageFactory();
        XEGetAllCashShopItemsResponse respone = (XEGetAllCashShopItemsResponse) msgFactory.getResponseMessage(aReqMsg.getID());
        respone.session = aSession;        
        
        Object raw = XEGlobalCache.getCache(MEMCACHED_NAME);
        List<XECashShopEntity> itemsList = null;
        
        if (raw != null) {
            itemsList = (List<XECashShopEntity>) raw;
        }
        
        if (itemsList == null) {
            try {
                itemsList = XEDataUtils.getAllCashShopItemsFromDB();
            } catch (SQLException ex) {
                mLog.error(ex.getMessage());
            }
            
            if (itemsList != null)
                XEGlobalCache.setCache(MEMCACHED_NAME, itemsList, XEGlobalCache.TIMEOUT_30_MIN);
        }
        
        if (itemsList == null) {
            respone.setFailure(ResponseCode.FAILURE, "Không lấy được vật phẩm");
        } else {
            respone.setSuccess(ResponseCode.SUCCESS, itemsList);
        }
        
        aResPkg.addMessage(respone);
        
        return 1;
    }
    
}
