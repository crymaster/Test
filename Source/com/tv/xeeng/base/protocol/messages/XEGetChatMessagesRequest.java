package com.tv.xeeng.base.protocol.messages;

import com.tv.xeeng.protocol.AbstractRequestMessage;
import com.tv.xeeng.protocol.IRequestMessage;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author son
 */
public class XEGetChatMessagesRequest extends AbstractRequestMessage{
    public long receivedId;
    public int limit;
    public int offset;
    
    @Override
    public IRequestMessage createNew() {
        return new XEGetChatMessagesRequest();
    }
    
}
