package com.tv.xeeng.base.protocol.messages;

import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.game.tienlen.data.Poker;
import com.tv.xeeng.protocol.AbstractResponseMessage;
import com.tv.xeeng.protocol.IResponseMessage;

import java.util.ArrayList;

public class GetPokerResponse extends AbstractResponseMessage {

	public long uid;
	public String name;
	public ArrayList<Poker> tienlenCards = new ArrayList<Poker>();
	public int zoneId;

	// Thomc for Tienlen
	public byte[] tienlenCards_new;
	public boolean isNewMatch = false;
    public int dutyType;

	public long first_id = 0;
	public long matchNum = 0;

	public void setTienLenCards(
		ArrayList<com.tv.xeeng.game.tienlen.data.Poker> cards) {
		this.tienlenCards = cards;
	}

	public void setTienLenCards(byte[] cards) {
		this.tienlenCards_new = cards;
	}

	public long beginID = -1;

	public void setBeginID(long b) {
		beginID = b;
	}

	public void setSuccess(int aCode, long id, String n) {
		mCode = aCode;
		uid = id;
		name = n;

	}

	public IResponseMessage createNew() {
		return new GetPokerResponse();
	}

	@Override
	public IResponseMessage clone(ISession session) {
		GetPokerResponse resMsg = (GetPokerResponse) createNew();

		resMsg.session = session;
		resMsg.setID(this.getID());
		resMsg.mCode = mCode;
		// resMsg.mErrorMsg = mErrorMsg;
		resMsg.uid = uid;
		resMsg.beginID = beginID;
		resMsg.zoneId = zoneId;
		return resMsg;
	}

}
