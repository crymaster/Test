/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.protocol.messages;

import com.tv.xeeng.protocol.AbstractResponseMessage;
import com.tv.xeeng.protocol.IResponseMessage;

/**
 *
 * @author son
 */

public class XEGetChatMessagesResponse extends AbstractResponseMessage{
    private String message;
    
    @Override
    public IResponseMessage createNew() {
        return new XEGetChatMessagesResponse();
    }
    
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
