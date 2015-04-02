/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.protocol.messages;

import com.tv.xeeng.game.data.SimplePlayer;
import com.tv.xeeng.game.data.SimpleTable;
import com.tv.xeeng.game.tienlen.data.TienLenPlayer;
import com.tv.xeeng.protocol.AbstractResponseMessage;
import com.tv.xeeng.protocol.IResponseMessage;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author tuanda
 */
public class JoinResponse extends AbstractResponseMessage {

    public String mErrorMsg;

    public int phongID;

    public SimpleTable table;

    public ArrayList<TienLenPlayer> mTienLenPlayer;
    public ArrayList<TienLenPlayer> mWaitingPlayerTienlen;

    public List<? extends SimplePlayer> playing;
    public List<? extends SimplePlayer> waiting;

    public SimplePlayer roomOwner;
    public String roomName;
    public long mMatchId;
    public long minBet;
    public int zoneID;
    public int capacity;
    public boolean isPlaying;
    public boolean isResume;
    public boolean isObserve;
    public long turn;
    public int deck;
    public String cards;
    public int currCard = 0;

    public boolean isInvite = false;

    public boolean isJoinAfterPlaying = false;
    public long currentID = 0;

    // tien len
    public boolean isHidePoker = true;
	public int duty;

    public long currentIdPlayer;

    public void setIsJoinAfterPlaying(boolean isTrue) {
        this.isJoinAfterPlaying = isTrue;
    }

    // Tho :end
    // ba cay
    public int ownerIndex;

    public void setFailure(int aCode, String aErrorMsg) {
        mCode = aCode;
        mErrorMsg = aErrorMsg;
    }

    public void setOwner(SimplePlayer owner) {
        this.roomOwner = owner;
    }

    public void setCapacity(int c) {
        capacity = c;
    }

    public void setSuccess(int aCode, String rName, long bet, int zone) {
        zoneID = zone;
        mCode = aCode;
        roomName = rName;
        minBet = bet;
    }

    public void setRoomID(long aRoomId) {
        mMatchId = aRoomId;
    }

    public void setCurrentPlayersTienLen(ArrayList<TienLenPlayer> aValues, ArrayList<TienLenPlayer> bValues, SimplePlayer owner) {
        roomOwner = owner;
        mTienLenPlayer = aValues;
        mWaitingPlayerTienlen = bValues;
    }
    
    public void setCurrentPlayers(List<? extends SimplePlayer> playing, List<? extends SimplePlayer> waiting, SimplePlayer owner) {
        roomOwner = owner;
        this.playing = playing;
        this.waiting = waiting;
    }
    
    public IResponseMessage createNew() {
        return new JoinResponse();
    }
}
