/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tv.xeeng.base.protocol.messages.json;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEOpenEventCardRequest;
import com.tv.xeeng.base.protocol.messages.XEOpenEventCardResponse;
import com.tv.xeeng.game.data.AIOConstants;
import com.tv.xeeng.game.data.ResponseCode;
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
public class XEOpenEventCardJSON implements IMessageProtocol {

    private final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEOpenEventCardJSON.class);
    
    @Override
    public boolean decode(Object paramObject, IRequestMessage paramIRequestMessage) throws ServerException {
        try {
            JSONObject jsonData = (JSONObject) paramObject;
            String v = jsonData.getString("v");
            String[] values = v.split(AIOConstants.SEPERATOR_BYTE_1);
            
            XEOpenEventCardRequest req = (XEOpenEventCardRequest) paramIRequestMessage;
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
            XEOpenEventCardResponse response = (XEOpenEventCardResponse) paramIResponseMessage;

            StringBuilder sb = new StringBuilder();
            sb.append(Integer.toString(paramIResponseMessage.getID())).append(AIOConstants.SEPERATOR_BYTE_1);
            sb.append(Integer.toString(response.mCode)).append(AIOConstants.SEPERATOR_NEW_MID);
            sb.append(response.getMessage());

            if (response.mCode == ResponseCode.SUCCESS) {
                sb.append(AIOConstants.SEPERATOR_BYTE_1).append(response.getPrize());
            }
            
            encodingObj.put("v", sb);

            return encodingObj;
        } catch (Throwable t) {
            mLog.error("[ENCODER] " + paramIResponseMessage.getID(), t);
            return null;
        }
    }
    
}
