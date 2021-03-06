/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tv.xeeng.base.protocol.messages;

import com.tv.xeeng.protocol.AbstractRequestMessage;
import com.tv.xeeng.protocol.IRequestMessage;

/**
 *
 * @author ThangTD
 */
public class XEJoinEventItemsRequest extends AbstractRequestMessage {

    private long eventId;
    
    @Override
    public IRequestMessage createNew() {
        return new XEJoinEventItemsRequest();
    }

    /**
     * @return the eventId
     */
    public long getEventId() {
        return eventId;
    }

    /**
     * @param eventId the eventId to set
     */
    public void setEventId(long eventId) {
        this.eventId = eventId;
    }
}
