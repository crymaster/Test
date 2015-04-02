/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tv.xeeng.base.protocol.messages.json;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEGetAllCashShopItemsResponse;
import com.tv.xeeng.game.data.AIOConstants;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.XECashShopEntity;
import com.tv.xeeng.protocol.IMessageProtocol;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponseMessage;
import org.json.JSONObject;
import org.slf4j.Logger;

/**
 *
 * @author ThangTD
 */
public class XEGetAllCashShopItemsJSON implements IMessageProtocol {
    
    private final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEGetAllCashShopItemsJSON.class);

    @Override
    public boolean decode(Object paramObject, IRequestMessage paramIRequestMessage) throws ServerException {
        return true;
    }

    @Override
    public Object encode(IResponseMessage paramIResponseMessage) throws ServerException {
        try {
            JSONObject encodingObj = new JSONObject();
            XEGetAllCashShopItemsResponse response = (XEGetAllCashShopItemsResponse) paramIResponseMessage;

            StringBuilder sb = new StringBuilder();
            sb.append(Integer.toString(paramIResponseMessage.getID())).append(AIOConstants.SEPERATOR_BYTE_1);
            sb.append(Integer.toString(response.mCode)).append(AIOConstants.SEPERATOR_NEW_MID);

            if (response.mCode == ResponseCode.SUCCESS) {
                int size = response.itemsList.size();
                if (size != 0) {
                    StringBuilder sb1 = new StringBuilder();
                    for (int i = 0; i < size; i++) {
                        XECashShopEntity item = response.itemsList.get(i);
                        sb1.append(item.getCode()).append(AIOConstants.SEPERATOR_BYTE_1);
                        sb1.append(item.getName()).append(AIOConstants.SEPERATOR_BYTE_1);
                        sb1.append(item.getDescription()).append(AIOConstants.SEPERATOR_BYTE_1);
                        sb1.append(item.getPrice()).append(AIOConstants.SEPERATOR_BYTE_1);
                        sb1.append(item.getType()).append(AIOConstants.SEPERATOR_BYTE_2);
                    }
                    sb1.deleteCharAt(sb1.length() - 1);
                    sb.append(sb1);
                }
            }

            encodingObj.put("v", sb);

            return encodingObj;
        } catch (Throwable t) {
            mLog.error("[ENCODER] " + paramIResponseMessage.getID(), t);
            return null;
        }
    }
    
}
