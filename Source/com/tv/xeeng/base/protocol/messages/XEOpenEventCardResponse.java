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
 * @author ThangTD
 */
public class XEOpenEventCardResponse extends AbstractResponseMessage {

    private String message;
    private String prize;
    
    @Override
    public IResponseMessage createNew() {
        return new XEOpenEventCardResponse();
    }

    public void setSuccess(int aCode, String msg, String prize) {
        mCode = aCode;
        this.message = msg;
        this.setPrize(prize);
    }
    
    public void setFailure(int aCode, String msg) {
        mCode = aCode;
        this.message = msg;
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
     * @return the prize
     */
    public String getPrize() {
        return prize;
    }

    /**
     * @param prize the prize to set
     */
    public void setPrize(String prize) {
        this.prize = prize;
    }
    
}
