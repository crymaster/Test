package com.tv.xeeng.base.protocol.messages;


import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.protocol.AbstractResponseMessage;
import com.tv.xeeng.protocol.IResponseMessage;

public class SendAdvResponse extends AbstractResponseMessage {

    public String message;
    public String adv;
    public String active;
    public long activateTime = 0;
    public String popup; // added by Thangtd

    public void setSuccess(String adv) {
        mCode = ResponseCode.SUCCESS;
        this.adv = adv;
    }
    
    public void setSucess(String adv, String popup) {
        mCode = ResponseCode.SUCCESS;
        this.adv = adv;
        this.popup = popup;
    }

    public SendAdvResponse() {
    }

    public void setFailure(int aCode, String msg) {
        mCode = aCode;
        message = msg;
    }

    public IResponseMessage createNew() {
        return new SendAdvResponse();
    }
}
