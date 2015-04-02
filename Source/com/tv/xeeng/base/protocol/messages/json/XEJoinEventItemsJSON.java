/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tv.xeeng.base.protocol.messages.json;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEJoinEventItemsRequest;
import com.tv.xeeng.base.protocol.messages.XEJoinEventItemsResponse;
import com.tv.xeeng.game.data.AIOConstants;
import com.tv.xeeng.protocol.IMessageProtocol;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponseMessage;
import org.json.JSONException;
import org.json.JSONObject;
import org.slf4j.Logger;

/**
 *
 * @author ThangTD
 */
public class XEJoinEventItemsJSON implements IMessageProtocol {

    private final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEJoinEventItemsJSON.class);
    
    @Override
    public boolean decode(Object paramObject, IRequestMessage paramIRequestMessage) throws ServerException {
        try {
            JSONObject jsonData = (JSONObject) paramObject;
            String v = jsonData.getString("v");
            String[] values = v.split(AIOConstants.SEPERATOR_BYTE_1);
            
            XEJoinEventItemsRequest req = (XEJoinEventItemsRequest) paramIRequestMessage;
            req.setEventId(Integer.parseInt(values[0]));
            return true;
        } catch (JSONException e) {
            return false;
        }
    }

    @Override
    public Object encode(IResponseMessage paramIResponseMessage) throws ServerException {
        try {
            JSONObject encodingObj = new JSONObject();
            XEJoinEventItemsResponse response = (XEJoinEventItemsResponse) paramIResponseMessage;
            
            StringBuilder sb = new StringBuilder();
            sb.append(Integer.toString(paramIResponseMessage.getID())).append(AIOConstants.SEPERATOR_BYTE_1);
            sb.append(Integer.toString(response.mCode)).append(AIOConstants.SEPERATOR_NEW_MID);
            sb.append(response.getMessage()).append(AIOConstants.SEPERATOR_BYTE_1);
            sb.append(response.getItemCode());

            encodingObj.put("v", sb);

            return encodingObj;
        } catch (Throwable t) {
            mLog.error("[ENCODER] " + paramIResponseMessage.getID(), t);
            return null;
        }
    }
    
}
