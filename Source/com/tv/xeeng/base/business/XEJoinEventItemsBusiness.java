/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEJoinEventItemsRequest;
import com.tv.xeeng.base.protocol.messages.XEJoinEventItemsResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.databaseDriven.EventItemsDB;
import com.tv.xeeng.databaseDriven.InventoryDB;
import com.tv.xeeng.databaseDriven.UserDB;
import com.tv.xeeng.game.data.EventItemEntity;
import com.tv.xeeng.game.data.InventoryItemEntity;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.UserEntity;
import com.tv.xeeng.memcached.data.CacheUserInfo;
import com.tv.xeeng.memcached.data.XEDataUtils;
import com.tv.xeeng.protocol.AbstractBusiness;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponsePackage;
import com.tv.xeeng.protocol.MessageFactory;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import org.slf4j.Logger;

/**
 *
 * @author ThangTD
 */
public class XEJoinEventItemsBusiness extends AbstractBusiness {
    
    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEJoinEventItemsBusiness.class);
    
    @Override
    public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) throws ServerException {
        mLog.debug("[JOIN EVENT ITEMS]: Catch");
        MessageFactory msgFactory = aSession.getMessageFactory();
        XEJoinEventItemsRequest rqJoin = (XEJoinEventItemsRequest) aReqMsg;
        XEJoinEventItemsResponse resJoin = (XEJoinEventItemsResponse) msgFactory.getResponseMessage(aReqMsg.getID());
        resJoin.session = aSession;
        
        UserDB userDB = new UserDB();
        UserEntity user = userDB.getUserInfoNoException(aSession.getUID());
        if (user == null || user.mUsername == null) {
            resJoin.setFailure(ResponseCode.FAILURE, "Người dùng không tồn tại!");
        } else {
            List<InventoryItemEntity> inventory = null;
            try {
                inventory = InventoryDB.getUserInventory(user.mUid);
            } catch (SQLException ex) {
                mLog.error(ex.getMessage());
            }
            
            HashMap<String, InventoryItemEntity> maps = new HashMap<String, InventoryItemEntity>();
            for (InventoryItemEntity item : inventory) {
                maps.put(item.getItemCode(), item);
            }
            
            EventItemEntity item = null;
            List<EventItemEntity> joinLstItems = EventItemsDB.getJoinListItems();
            for (EventItemEntity entity : joinLstItems) {
                if (rqJoin.getEventId() == entity.getEventId()) {
                    item = entity;
                    break;
                }
            }
            
            if (item != null) {
                if (user.money < item.getFee()) {
                    resJoin.setFailure(ResponseCode.FAILURE, "Bạn cần " + item.getFee() + " Gold để đổi quà!");
                } else {
                    boolean isSuccess = true;
                    
                    String[] components = item.getComponents().split(";");
                    for (String component : components) {
                        String[] params = component.split("-");
                        if (params.length > 1) {
                            InventoryItemEntity entity = maps.get(params[0]);
                            if (entity == null) {
                                isSuccess = false;
                                break;
                            }
                            
                            if (entity.getQuantity() < Integer.parseInt(params[1])) {
                                isSuccess = false;
                                break;
                            }
                        }
                    }
                    
                    if (isSuccess) {
                        Random ran = new Random();
                        int value = ran.nextInt(101);
                        if (value >= 0 && value <= item.getRate()) {
                            try {
                                if (XEDataUtils.joinEventItems(user.mUid, item.getCode(), item.getName(), item.getDescription(), item.getFee(), item.getEventId())) {
                                    resJoin.setSuccess(ResponseCode.SUCCESS, "Đổi quà thành công! Bạn có muốn sử dụng " + item.getName() + " ngay không?", item.getCode());

                                    /* update cache */
                                    CacheUserInfo cacheUser = new CacheUserInfo();
                                    cacheUser.deleteCacheUser(user);
                                    
                                    InventoryDB.deleteCacheUserInventory(user.mUid);
                                } else {
                                    resJoin.setFailure(ResponseCode.FAILURE, "Đổi quà không thành công!");
                                }
                            } catch (SQLException ex) {
                                mLog.error(ex.getMessage());
                            }
                        } else {
                            resJoin.setFailure(ResponseCode.FAILURE, "Đổi quà không thành công!");
                        }
                    } else {
                        resJoin.setFailure(ResponseCode.FAILURE, "Đổi quà không thành công!");
                    }
                }
            } else {
                resJoin.setFailure(ResponseCode.FAILURE, "Sự kiện không tồn tại!");
            }
        }
        
        aResPkg.addMessage(resJoin);
        
        return 1;
    }
}
