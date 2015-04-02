/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.business;

import com.tv.xeeng.base.protocol.messages.XEGetChatMessagesRequest;
import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.protocol.messages.XEGetChatMessagesResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.XEPrivateMessageEntity;
import com.tv.xeeng.memcached.data.XEDataUtils;
import com.tv.xeeng.protocol.AbstractBusiness;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponsePackage;
import com.tv.xeeng.protocol.MessageFactory;
import java.sql.SQLException;
import java.util.List;
import org.slf4j.Logger;

/**
 *
 * @author son
 */
public class XEGetChatMessagesBusiness extends AbstractBusiness{
    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEGetChatMessagesBusiness.class);
    
    
    @Override
    public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg){
        mLog.debug("[Get Chat Messages] : Catch");
        MessageFactory msgFactory = aSession.getMessageFactory();
        XEGetChatMessagesResponse res
                = (XEGetChatMessagesResponse) msgFactory.getResponseMessage(aReqMsg.getID());
        XEGetChatMessagesRequest rq = (XEGetChatMessagesRequest) aReqMsg;
        
        List<XEPrivateMessageEntity> lstPM = null;
        try {
            lstPM = XEDataUtils.getChatMessages(aSession.getUID(),rq.receivedId,rq.limit,rq.offset);
        } catch (SQLException ex) {
            mLog.error(ex.getMessage());
        }

        if (lstPM != null) {
            res.mCode = ResponseCode.SUCCESS;
            res.setMessage(XEDataUtils.serializeList(lstPM));
        } else {
            res.mCode = ResponseCode.FAILURE;
            res.setMessage("Có lỗi xảy ra.");
        }
//        }

        aResPkg.addMessage(res);

        return 1;
    }
    
}
