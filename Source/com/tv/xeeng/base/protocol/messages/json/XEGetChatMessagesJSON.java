/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.protocol.messages.json;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEGetChatMessagesRequest;
import com.tv.xeeng.base.protocol.messages.XEGetChatMessagesResponse;
import com.tv.xeeng.game.data.AIOConstants;
import com.tv.xeeng.protocol.IMessageProtocol;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponseMessage;
import org.json.JSONObject;
import org.slf4j.Logger;

/**
 *
 * @author son
 */
public class XEGetChatMessagesJSON implements IMessageProtocol {

    private final Logger mLog
            = LoggerContext.getLoggerFactory().getLogger(XEGetChatMessagesJSON.class);

    @Override
    public boolean decode(Object aEncodedObj, IRequestMessage aDecodingObj) throws ServerException {
        try{
            JSONObject jsondata = (JSONObject) aEncodedObj;
            XEGetChatMessagesRequest rq = (XEGetChatMessagesRequest) aDecodingObj;
            String[] arr = jsondata.get("v").toString().split(AIOConstants.SEPERATOR_BYTE_1);
            rq.receivedId = Long.valueOf(arr[0]);
            rq.limit = Integer.valueOf(arr[1]);
            rq.offset = Integer.valueOf(arr[2]);
            return true;
        }
        catch(Throwable t){
            mLog.error("[DECODER] " + aDecodingObj.getID(), t);
            return false;
        }
    }

    @Override
    public Object encode(IResponseMessage aResponseMessage) throws ServerException {
        try {
            JSONObject encodingObj = new JSONObject();

            XEGetChatMessagesResponse res = (XEGetChatMessagesResponse) aResponseMessage;
            StringBuilder sb = new StringBuilder();
            sb.append(Integer.toString(aResponseMessage.getID())).append(AIOConstants.SEPERATOR_BYTE_1);
            sb.append(Integer.toString(res.mCode)).append(AIOConstants.SEPERATOR_NEW_MID);
            sb.append(res.getMessage());

            encodingObj.put("v", sb.toString());
            return encodingObj;
        } catch (Throwable t) {
            mLog.error("[ENCODER] " + aResponseMessage.getID(), t);
            return null;
        }
    }
}
