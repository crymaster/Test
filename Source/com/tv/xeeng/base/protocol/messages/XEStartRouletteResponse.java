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
 * @author thangtd
 */
public class XEStartRouletteResponse extends AbstractResponseMessage {

    private String message;
    private String result;
    private boolean isContinue;
    private boolean isGift;
    private float price;
    
    @Override
    public IResponseMessage createNew() {
        return new XEStartRouletteResponse();
    }

    public void setFailure(int aCode, String msg) {
        mCode = aCode;
        setMessage(msg);
    }
    
    public void setSuccess(int aCode, String result, boolean isContinue, boolean isGift, float price) {
        mCode = aCode;
        setResult(result);
        setIsContinue(isContinue);
        setIsGift(isGift);
        setPrice(price);
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
     * @return the result
     */
    public String getResult() {
        return result;
    }

    /**
     * @param result the result to set
     */
    public void setResult(String result) {
        this.result = result;
    }

    /**
     * @return the isContinue
     */
    public boolean isIsContinue() {
        return isContinue;
    }

    /**
     * @param isContinue the isContinue to set
     */
    public void setIsContinue(boolean isContinue) {
        this.isContinue = isContinue;
    }

    /**
     * @return the isGift
     */
    public boolean isIsGift() {
        return isGift;
    }

    /**
     * @param isGift the isGift to set
     */
    public void setIsGift(boolean isGift) {
        this.isGift = isGift;
    }

    /**
     * @return the price
     */
    public float getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(float price) {
        this.price = price;
    }
    
}
