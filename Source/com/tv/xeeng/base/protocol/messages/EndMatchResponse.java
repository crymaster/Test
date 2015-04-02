package com.tv.xeeng.base.protocol.messages;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONObject;

import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.tienlen.data.TienLenPlayer;
import com.tv.xeeng.protocol.AbstractResponseMessage;
import com.tv.xeeng.protocol.IResponseMessage;

public class EndMatchResponse extends AbstractResponseMessage
{
	public String					mErrorMsg;
	public long						mMatchId;
	public long						roomOwnerID;
	public int						zoneID;
	public long 					idWin;
	public long						newOwner	= 0;

	// Thomc: Tienlen
	public ArrayList<String[]>		tienlenResult;
	public List<TienLenPlayer>		playings;

	public long						perfectType	= 0;		// Hết ván vì tới
															// trắng!
	public String					lastCards;				// quân bài(s) cuối
															// cùng được đánh ra
	public ArrayList<long[]>		fightInfo;				// gửi về khi xảy ra
															// chặt heo/hàng
	public long						uid;					// khi còn 2 người
															// chơi mà uid thoát
															// ra sẽ endgame nên
															// phải gửi uid về

	public void setZoneID(int z)
	{
		zoneID = z;
	}

	public void setLastCards(String cards)
	{
		this.lastCards = cards;
	}

	// chặt heo/hàng phải gửi thông tin $ về room

	public void setFightInfo(ArrayList<long[]> fightInfo_)
	{
		this.fightInfo = fightInfo_;
	}

	public void setSuccessTienLen(int code, ArrayList<String[]> result, long idwin_, List<TienLenPlayer> playings)
	{
		mCode = code;
		this.tienlenResult = result;
		this.idWin = idwin_;
		this.playings = playings;
	}
	
	public void setNewRoomOwner(long id)
	{
		this.roomOwnerID = id;
	}

	public void setSuccess(int aCode, long idwin_, long aMatchId)
	{
		mMatchId = aMatchId;
		mCode = aCode;
		idWin = idwin_;
	}

	public void setFailure(int aCode, String aErrorMsg)
	{
		mCode = aCode;
		mErrorMsg = aErrorMsg;
	}

	public long	moneyLost;
	public long	moneyWin;

	public void setMoneyWinLost(long l, long w)
	{
		this.moneyLost = l;
		this.moneyWin = w;
	}

	public IResponseMessage createNew()
	{
		return new EndMatchResponse();
	}


	public IResponseMessage clone(ISession session)
	{
		EndMatchResponse resMsg = (EndMatchResponse) createNew();
		resMsg.mMatchId = mMatchId;
		resMsg.session = session;
		resMsg.setID(this.getID());
		resMsg.mCode = mCode;

		resMsg.roomOwnerID = roomOwnerID;
		resMsg.zoneID = zoneID;
		// Tienlen
		resMsg.tienlenResult = tienlenResult;
		resMsg.perfectType = perfectType;// Hết ván vì tới trắng!
		resMsg.lastCards = lastCards; // quân bài(s) cuối cùng được đánh ra
		resMsg.fightInfo = fightInfo;// gửi về khi xảy ra chặt heo/hàng
		resMsg.uid = uid;// khi còn 2 người chơi mà uid thoát ra sẽ endgame nên
							// phải gửi uid về
		resMsg.playings = playings;
		resMsg.newOwner = newOwner;
		resMsg.idWin = idWin;
		return resMsg;
	}
}
