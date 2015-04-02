/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.protocol.messages;

import com.tv.xeeng.game.data.XERouletteInfoEntity;
import com.tv.xeeng.protocol.AbstractResponseMessage;
import com.tv.xeeng.protocol.IResponseMessage;
import java.util.List;

/**
 *
 * @author thangtd
 */
public class XEGetRouletteInfoResponse extends AbstractResponseMessage {

    private String message;
    public List<XERouletteInfoEntity> itemsList;
    private String result;
    private boolean isContinue;
    private boolean isGift;
    private float price;
    private long fee;
    private String feeType;

    @Override
    public IResponseMessage createNew() {
        return new XEGetRouletteInfoResponse();
    }

    public void setFailure(int aCode, String msg) {
        mCode = aCode;
        setMessage(msg);
    }

    public void setSuccess(int aCode, List<XERouletteInfoEntity> items, String result, boolean isContinue, 
            boolean isGift, float price, long fee, String feeType) {
        mCode = aCode;
        setItemsList(items);
        setResult(result);
        setIsContinue(isContinue);
        setIsGift(isGift);
        setPrice(price);
        setFee(fee);
        setFeeType(feeType);
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
    public List<XERouletteInfoEntity> getItemsList() {
        return itemsList;
    }

    /**
     * @param itemsList the itemsList to set
     */
    public void setItemsList(List<XERouletteInfoEntity> itemsList) {
        this.itemsList = itemsList;
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

    /**
     * @return the fee
     */
    public long getFee() {
        return fee;
    }

    /**
     * @param fee the fee to set
     */
    public void setFee(long fee) {
        this.fee = fee;
    }

    /**
     * @return the feeType
     */
    public String getFeeType() {
        return feeType;
    }

    /**
     * @param feeType the feeType to set
     */
    public void setFeeType(String feeType) {
        this.feeType = feeType;
    }
}
