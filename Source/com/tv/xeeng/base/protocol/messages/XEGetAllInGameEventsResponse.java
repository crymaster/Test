/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tv.xeeng.base.protocol.messages;

import com.tv.xeeng.game.data.XEInGameEventEntity;
import com.tv.xeeng.protocol.AbstractResponseMessage;
import com.tv.xeeng.protocol.IResponseMessage;
import java.util.List;

/**
 *
 * @author ThangTD
 */
public class XEGetAllInGameEventsResponse extends AbstractResponseMessage {
    
    private String message;
    public List<XEInGameEventEntity> itemsList;
    
    @Override
    public IResponseMessage createNew() {
        return new XEGetAllInGameEventsResponse();
    }
    
    public void setFailure(int aCode, String msg) {
        mCode = aCode;
        setMessage(msg);
    }
    
    public void setSuccess(int aCode, List<XEInGameEventEntity> items) {
        mCode = aCode;
        setItemsList(items);
    }

    /**
     * @return the message
     */
    public String getMessage() {
        return message;
    }

    /**
     * @param message the message to set
     */
    public void setMessage(String message) {
        this.message = message;
    }

    /**
     * @return the itemsList
     */
    public List<XEInGameEventEntity> getItemsList() {
        return itemsList;
    }

    /**
     * @param itemsList the itemsList to set
     */
    public void setItemsList(List<XEInGameEventEntity> itemsList) {
        this.itemsList = itemsList;
    }
}
