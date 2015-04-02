package com.tv.xeeng.base.protocol.messages;

import java.util.ArrayList;

import com.tv.xeeng.game.data.SimplePlayer;
import com.tv.xeeng.game.tienlen.data.TienLenPlayer;
import com.tv.xeeng.protocol.AbstractResponseMessage;
import com.tv.xeeng.protocol.IResponseMessage;

public class RestartResponse extends AbstractResponseMessage {

	public String mErrorMsg;
	public boolean isEmptyRoom;
	public SimplePlayer roomOwner;

	public long matchID;
	public String roomName;
	public int zoneID;
	//Thomc
	public ArrayList<TienLenPlayer> tienLenPlayer;

	public void setZoneID(int z) {
		zoneID = z;
	}

	//Thomc
	public void setTienLenSuccess(int aCode, SimplePlayer owner, ArrayList<TienLenPlayer> pls,
		long match, String name) {
		mCode = aCode;
		roomOwner = owner;
		tienLenPlayer = pls;
		matchID = match;
		roomName = name;
	}

	public void setFailure(int aCode, String aErrorMsg, boolean isEmpty) {
		mCode = aCode;
		mErrorMsg = aErrorMsg;
	}

	public IResponseMessage createNew() {
		return new RestartResponse();
	}
}
