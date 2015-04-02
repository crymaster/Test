/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.CancelRequest;
import com.tv.xeeng.base.protocol.messages.JoinRequest;
import com.tv.xeeng.base.protocol.messages.NewRequest;
import com.tv.xeeng.base.protocol.messages.NewResponse;
import com.tv.xeeng.base.room.NRoomEntity;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.databaseDriven.RoomDB;
import com.tv.xeeng.game.data.MatchEntity;
import com.tv.xeeng.game.data.MessagesID;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.UserEntity;
import com.tv.xeeng.game.data.ZoneID;
import com.tv.xeeng.game.room.Phong;
import com.tv.xeeng.game.room.Room;
import com.tv.xeeng.game.room.XEGameConstants;
import com.tv.xeeng.game.room.Zone;
import com.tv.xeeng.game.tienlen.data.TienLenPlayer;
import com.tv.xeeng.game.tienlen.data.TienLenTable;
import com.tv.xeeng.memcached.data.CacheMatch;
import com.tv.xeeng.memcached.data.CacheUserInfo;
import com.tv.xeeng.protocol.AbstractBusiness;
import com.tv.xeeng.protocol.IBusiness;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponsePackage;
import com.tv.xeeng.protocol.MessageFactory;

import org.slf4j.Logger;

/**
 * @author tuanda
 * @modified thangtd - 25/02/2014
 */
public class NewBusiness extends AbstractBusiness {

	private static final Logger mLog = LoggerContext.getLoggerFactory()
		.getLogger(NewBusiness.class);
	private static final int TIMES = 4;
	private static final String MSG_NOT_ENOUGH_MONEY = "Bạn không đủ tiền để vào bàn. Số tiền bạn có nhỏ hơn 4 lần tiền bàn";
	private static final String MSG_NOT_ENOUGH_MONEY_TO_CREATE = "Bạn không đủ tiền để tạo bàn. Số tiền bạn có nhỏ hơn 4 lần tiền bàn";

	private String getRandomRoomName() {
		String[] roomNames = {"Đại gia thì vào", "Không thử sao biết",
			"Cao thủ vào đây chiến hết", "A đù lại thắng",
			"Làm giàu không khó", "Không dành cho gà", "Chơi tới bến",
			"Đấu với Thần Bài", "Buồn phiền vì nhiều tiền",
			"Tiền hết tình tan",
			"Tiền không thiếu nhưng nhiều thì không có"};

		return roomNames[(int) Math.floor(Math.random() * roomNames.length)];
	}

	@Override
	public int handleMessage(ISession aSession, IRequestMessage aReqMsg,
		IResponsePackage aResPkg) throws ServerException {

		mLog.debug("[CREATE NEW ROOM]: Catch");

		MessageFactory msgFactory = aSession.getMessageFactory();
		NewResponse resMatchNew = (NewResponse) msgFactory
			.getResponseMessage(aReqMsg.getID());

		resMatchNew.session = aSession;

		try {
			NewRequest rqMatchNew = (NewRequest) aReqMsg;

			if (checkInvalidName(rqMatchNew.roomName)) {
				throw new BusinessException("Tên bàn không hợp lệ.");
			}

			aSession.setChatRoom(0);

			if (rqMatchNew.uid == 0) {
				rqMatchNew.uid = aSession.getUID();
			}
			CacheUserInfo cacheUser = new CacheUserInfo();
			UserEntity user = cacheUser.getUserInfo(rqMatchNew.uid);

			resMatchNew.setCash(user.money);
			long moneyBet = rqMatchNew.moneyBet;
			int zoneID = aSession.getCurrentZone();
			Zone zone = aSession.findZone(zoneID);
			int phongId = rqMatchNew.phongID; //kênh bình dân/đại gia/ triệu phú

			int index = rqMatchNew.tableIndex;
			RoomDB roomDB = new RoomDB();
			NRoomEntity roomEntity = roomDB.getRoomEntity(zoneID, phongId); //kênh bình dân/đại gia/ triệu phú
			if (roomEntity == null) {
				phongId = aSession.getPhongID();
				roomEntity = roomDB.getRoomEntity(zoneID, phongId);
				if (roomEntity == null) {
					throw new BusinessException(
						"Bị lỗi bạn thử cập nhật lại xem sao");
				}
			}

			if (moneyBet < roomEntity.getMinCash()) {
				moneyBet = roomEntity.getMinCash();
			}
			// moneyBet = resMatchNew.minBet >roomEntity.getMinCash()?
			// resMatchNew.minBet:roomEntity.getMinCash();
			rqMatchNew.moneyBet = moneyBet;
			Phong phong = zone.getPhong(phongId); //kênh bình dân/đại gia/ triệu phú
			// long matchID = zone.isCreatable(index, phongId);
			long matchID = phong.isCreableTable(index);
			if (matchID != 0) {

				IBusiness business = msgFactory
					.getBusiness(MessagesID.MATCH_JOIN);
				JoinRequest rqMatchJoin = (JoinRequest) msgFactory
					.getRequestMessage(MessagesID.MATCH_JOIN);
				resMatchNew = null;// don't want to send to client if

				try {
					rqMatchJoin.mMatchId = matchID;
					rqMatchJoin.roomID = phongId;
					rqMatchJoin.uid = rqMatchNew.uid;
					rqMatchJoin.zone_id = zoneID;
					business.handleMessage(aSession, rqMatchJoin, aResPkg);
					return 1;
				} catch (ServerException se) {
					se.printStackTrace();
				}

			} else if (user != null) {

				aSession.setRoomID(phongId);

				if (rqMatchNew.size == 0) {
					rqMatchNew.size = 4;
				}

				/* nếu không đặt tên bàn thì tạo ngẫu nhiên */
				if (rqMatchNew.roomName == null
					|| rqMatchNew.roomName.length() == 0) {
					rqMatchNew.roomName = getRandomRoomName();
				}

				switch (zoneID) {
					case ZoneID.TIENLEN: {
						if ((user.money < TIMES * moneyBet)) {
							resMatchNew.setFailure(ResponseCode.FAILURE,
								MSG_NOT_ENOUGH_MONEY);
						} else {
							// rqMatchNew.roomName = "[Tiến lên] " +
							// XEGameConstants.getRandomName();
							Room newRoom = zone.createRoom(rqMatchNew.roomName,
								rqMatchNew.uid, phongId);
							/*
							 * zone.createOrDeleteTable(rqMatchNew.phongID,
							 * newRoom.getRoomId(), rqMatchNew.tableIndex, true);
							 */
							newRoom.setPhongID(rqMatchNew.phongID);
							newRoom.setIndex(rqMatchNew.tableIndex);
							newRoom.join(aSession);
							newRoom.setZoneID(zoneID);
							newRoom.setPassword(rqMatchNew.password);
							newRoom.setName(rqMatchNew.roomName);
							newRoom.setPlayerSize(rqMatchNew.size);
							newRoom.setOwnerName(user.mUsername);
							// mLog.debug("RoomName:" + rqMatchNew.roomName);
							// mLog.debug("Size:" + rqMatchNew.size);
							TienLenPlayer owner = new TienLenPlayer(user.mUid);
							owner.setCash(user.money);
							owner.avatarID = user.avatarID;
							owner.level = user.level;
							owner.username = user.mUsername;
							owner.currentSession = aSession;
							owner.moneyForBet = rqMatchNew.moneyBet;
							owner.currentMatchID = newRoom.getRoomId();
							owner.setReady(true);

							TienLenTable table = new TienLenTable(owner, moneyBet,
								newRoom.getRoomId(), rqMatchNew.size);
							table.name = rqMatchNew.roomName;
							table.setOwnerSession(aSession);
							table.setTableIndex(rqMatchNew.tableIndex);
							table.setRoom(newRoom);
							aSession.setRoom(newRoom);

							// index = rqMatchNew.tableIndex;
							table.setMaximumPlayer(4);
							table.setPhongID(rqMatchNew.phongID);

							newRoom.setAttachmentData(table);
							resMatchNew.setSuccess(ResponseCode.SUCCESS,
								newRoom.getRoomId(), rqMatchNew.uid,
								table.firstCashBet, rqMatchNew.size);
							resMatchNew.isHidePoker = table.isHidePoker();
							resMatchNew.session = aSession;

							MatchEntity entity = new MatchEntity(
								newRoom.getRoomId(), zoneID, newRoom, phongId);
							CacheMatch.add(entity);
						}
						break;
					}
				

					default:
						break;
				}
			}

		} catch (BusinessException be) {
			resMatchNew.setFailure(ResponseCode.FAILURE, be.getMessage());
			mLog.error("Process message " + aReqMsg.getID() + " error.", be);
		} catch (Throwable t) {
			resMatchNew.setFailure(ResponseCode.FAILURE,
				"Bị lỗi " + t.toString());
			mLog.error("Process message " + aReqMsg.getID() + " error.", t);
		} finally {
			if ((resMatchNew != null)) {
				aResPkg.addMessage(resMatchNew);
			}
		}
		return 1;
	}

	private void correctWrongTable(ISession aSession, MessageFactory msgFactory) {
		try {
			if (aSession.getRoom() != null
				&& aSession.getRoom().getAttactmentData() != null) {

				IResponsePackage responsePkg = aSession.getDirectMessages();
				IBusiness business = msgFactory
					.getBusiness(MessagesID.MATCH_CANCEL);

				CancelRequest cancelRq = (CancelRequest) msgFactory
					.getRequestMessage(MessagesID.MATCH_CANCEL);
				cancelRq.mMatchId = aSession.getRoom().getRoomId();
				cancelRq.isSendMe = false;
				business.handleMessage(aSession, cancelRq, responsePkg);

			}
		} catch (Throwable ex) {
			if (ex != null) {
				mLog.error(ex.getMessage(), ex);
			}
		}

	}

	private boolean checkInvalidName(String name) {
		if (name == null) {
			return false;
		}

		for (String badWord : XEGameConstants.BLACKLIST_WORDS) {
			if (name.contains(badWord)) {
				return true;
			}
		}

		return false;
	}

}
