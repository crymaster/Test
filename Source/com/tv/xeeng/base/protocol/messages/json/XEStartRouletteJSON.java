/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.protocol.messages.json;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEStartRouletteRequest;
import com.tv.xeeng.base.protocol.messages.XEStartRouletteResponse;
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
 * @author thangtd
 */
public class XEStartRouletteJSON implements IMessageProtocol {
    
    private final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEStartRouletteJSON.class);
    
    @Override
    public boolean decode(Object paramObject, IRequestMessage paramIRequestMessage) throws ServerException {
        try {
            JSONObject jsonData = (JSONObject) paramObject;
            String v = jsonData.getString("v");
            String[] values = v.split(AIOConstants.SEPERATOR_BYTE_1);
            
            if (values.length >= 2) {
                XEStartRouletteRequest req = (XEStartRouletteRequest) paramIRequestMessage;
                req.setValue(Long.parseLong(values[0]));
                req.setType(values[1]);
            }
            
            return true;
        } catch (JSONException e) {
            return false;
        }
    }
    
    @Override
    public Object encode(IResponseMessage paramIResponseMessage) throws ServerException {
        try {
            JSONObject encodingObj = new JSONObject();
            XEStartRouletteResponse response = (XEStartRouletteResponse) paramIResponseMessage;
            
            StringBuilder sb = new StringBuilder();
            sb.append(Integer.toString(paramIResponseMessage.getID())).append(AIOConstants.SEPERATOR_BYTE_1);
            sb.append(Integer.toString(response.mCode)).append(AIOConstants.SEPERATOR_NEW_MID);
            
            if (response.mCode == ResponseCode.FAILURE) {
                sb.append(response.getMessage());
            } else if (response.mCode == ResponseCode.SUCCESS) {
                sb.append(response.getResult()).append(AIOConstants.SEPERATOR_BYTE_1);
                sb.append(response.isIsContinue() ? "1" : "0").append(AIOConstants.SEPERATOR_BYTE_1);
                sb.append(response.isIsGift() ? "1" : "0").append(AIOConstants.SEPERATOR_BYTE_1);
                sb.append(String.valueOf(response.getPrice()));
            }
            
            encodingObj.put("v", sb);
            
            return encodingObj;
        } catch (JSONException t) {
            mLog.error("[ENCODER] " + paramIResponseMessage.getID(), t);
            return null;
        }
    }
    
}
