/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tv.xeeng.base.protocol.messages;

import com.tv.xeeng.game.data.XECashShopEntity;
import com.tv.xeeng.protocol.AbstractResponseMessage;
import com.tv.xeeng.protocol.IResponseMessage;
import java.util.List;

/**
 *
 * @author ThangTD
 */
public class XEGetAllCashShopItemsResponse extends AbstractResponseMessage {

    private String message;
    public List<XECashShopEntity> itemsList;
    
    @Override
    public IResponseMessage createNew() {
        return new XEGetAllCashShopItemsResponse();
    }
    
    public void setFailure(int aCode, String msg) {
        mCode = aCode;
        setMessage(msg);
    }
    
    public void setSuccess(int aCode, List<XECashShopEntity> items) {
        mCode = aCode;
        itemsList = items;
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
}
