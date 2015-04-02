/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tv.xeeng.base.protocol.messages;

import com.tv.xeeng.game.data.XELogRouletteEntity;
import com.tv.xeeng.protocol.AbstractResponseMessage;
import com.tv.xeeng.protocol.IResponseMessage;
import java.util.List;

/**
 *
 * @author thangtd
 */
public class XEGetRouletteHistoryResponse extends AbstractResponseMessage {

    private String message;
    public List<XELogRouletteEntity> itemsList;
    
    @Override
    public IResponseMessage createNew() {
        return new XEGetRouletteHistoryResponse();
    }
    
    public void setFailure(int aCode, String msg) {
        mCode = aCode;
        setMessage(msg);
    }
    
    public void setSuccess(int aCode, List<XELogRouletteEntity> items) {
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
    public List<XELogRouletteEntity> getItemsList() {
        return itemsList;
    }

    /**
     * @param itemsList the itemsList to set
     */
    public void setItemsList(List<XELogRouletteEntity> itemsList) {
        this.itemsList = itemsList;
    }
}
