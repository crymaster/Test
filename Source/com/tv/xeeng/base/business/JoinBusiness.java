/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.*;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.game.data.*;
import com.tv.xeeng.game.room.Room;
import com.tv.xeeng.game.room.Zone;
import com.tv.xeeng.game.tienlen.data.TienLenPlayer;
import com.tv.xeeng.game.tienlen.data.TienLenTable;
import com.tv.xeeng.game.tienlen.data.Utils;
import com.tv.xeeng.memcached.data.CacheMatch;
import com.tv.xeeng.memcached.data.CacheUserInfo;
import com.tv.xeeng.protocol.*;

import org.slf4j.Logger;


/**
 *
 * @author tuanda
 */
public class JoinBusiness extends AbstractBusiness {

	private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(JoinBusiness.class);
	private static final int TIMES = 4;
	private static final int XITO_TIMES = 50;
	private static final String MSG_NOT_ENOUGH_MONEY = "Bạn không đủ tiền để tham gia. Số tiền bạn có nhỏ hơn 4 lần tiền bàn";
	private static final String MSG_FULL_TABLE = "Bàn này đầy rồi, bạn thông cảm chờ nhé!";

	private void correctWrongTable(ISession aSession, MessageFactory msgFactory, long matchId) {
		try {
			if (aSession.getRoom() != null && aSession.getRoom().getRoomId() != matchId && matchId > 0
				&& aSession.getRoom().getAttactmentData() != null) {
				mLog.debug("[CORRECT ROOM]: Catch " + aSession.getUID() + " in room " + aSession.getRoom().getAttactmentData().getMatchID());
				IResponsePackage responsePkg = aSession.getDirectMessages();
				IBusiness business = msgFactory.getBusiness(MessagesID.MATCH_CANCEL);

				CancelRequest cancelRq = (CancelRequest) msgFactory.getRequestMessage(MessagesID.MATCH_CANCEL);
				// cancelRq.mMatchId = aSession.getRoom().getRoomId();
				cancelRq.mMatchId = aSession.getRoom().getAttactmentData().getMatchID(); // changed
				// by
				// ThangTD
				cancelRq.isSendMe = false;
				business.handleMessage(aSession, cancelRq, responsePkg);
			}
		} catch (Throwable ex) {
			if (ex != null) {
				mLog.error(ex.getMessage(), ex);
			}
		}
	}

	@Override
	public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) throws ServerException {
		MessageFactory msgFactory = aSession.getMessageFactory();
		JoinResponse resMatchJoin = (JoinResponse) msgFactory.getResponseMessage(MessagesID.MATCH_JOIN);
		resMatchJoin.setSession(aSession);

		try {
			mLog.debug("[JOIN ROOM]: Catch " + aSession.getUID());
			JoinRequest rqMatchJoin = (JoinRequest) aReqMsg;
			if (rqMatchJoin.roomID > 0) {
				resMatchJoin.phongID = rqMatchJoin.roomID;
			}

			correctWrongTable(aSession, msgFactory, rqMatchJoin.mMatchId);
            // else {
			// RoomDB db = new RoomDB();
			// db.getRooms(aSession.getCurrentZone()).get(0).getId();
			// }
			// if (rqMatchJoin.zone_id >= 0) {
			// aSession.setCurrentZone(rqMatchJoin.zone_id);
			// }
			// aSession.setRoomID(rqMatchJoin.roomID); // what 'stand for?

			MatchEntity matchEntity = CacheMatch.getMatch(rqMatchJoin.mMatchId);
			aSession.setChatRoom(0);
			Room room = null;
			int zoneID = 0;

			if (matchEntity != null) {
				room = matchEntity.getRoom();
				zoneID = matchEntity.getZoneId();
				resMatchJoin.phongID = matchEntity.getPhongID();
			}

			if (room == null) {
				// retry to find by old method
				zoneID = aSession.getCurrentZone();
				Zone zone = aSession.findZone(zoneID);
				// get the current room to notify to the opponent
				room = zone.findRoom(rqMatchJoin.mMatchId);
			}

			// zone.enterRoom(rqMatchJoin.roomID);
			if (room != null) {
				mLog.debug("[JOIN ROOM] : match_id = " + rqMatchJoin.mMatchId);
                // Get user information
				// UserDB userDb = new UserDB();
				// UserEntity newUser = userDb.getUserInfo(rqMatchJoin.uid);

				CacheUserInfo cacheUser = new CacheUserInfo();
				UserEntity newUser = cacheUser.getUserInfo(aSession.getUID());

				if (newUser == null) {
					throw new BusinessException(Messages.NONE_EXISTS_PLAYER);
				}

                // RoomDB roomDB = new RoomDB();
				// roomDB.userIn(zoneID, rqMatchJoin.roomID);
				switch (zoneID) {
					case ZoneID.TIENLEN: {
						if (newUser != null) {
							long moneyOfPlayer = newUser.money;
							long uid = newUser.mUid;
							JoinedResponse broadcastMsg = (JoinedResponse) msgFactory.getResponseMessage(MessagesID.MATCH_JOINED);
							broadcastMsg.setSession(aSession);
							TienLenTable table = (TienLenTable) room.getAttactmentData();
							// Check money of player
							if (moneyOfPlayer < TIMES * table.firstCashBet) {
								resMatchJoin.setFailure(ResponseCode.FAILURE, MSG_NOT_ENOUGH_MONEY);
								aSession.write(resMatchJoin);
								return 1;
							}

							// Bấm vào bàn n lần!!!
							if (table.containPlayer(uid)) {
								try {
									if (aSession.getByteProtocol() > AIOConstants.PROTOCOL_ADVERTISING) {
										reJoinTienLen(table, aSession, newUser, rqMatchJoin.mMatchId, room);
									} else {
										resMatchJoin.setFailure(ResponseCode.FAILURE, "Bạn vẫn đang còn trong bàn, vui lòng chờ hết ván nhé!");
										aSession.write(resMatchJoin);
										return 1;
									}
								} catch (Throwable e) {
									resMatchJoin.setFailure(ResponseCode.FAILURE, "Bạn vẫn đang còn trong bàn, vui lòng chờ hết ván nhé!");
									aSession.write(resMatchJoin);
									return 1;
								}
								return 1;
							}

							if ((table.getPlayings().size() + table.getWaitings().size()) >= table.getMaximumPlayer()) {
								resMatchJoin.setFailure(ResponseCode.FAILURE, "Bàn này đầy rồi, bạn thông cảm chờ nhé!");
								aSession.write(resMatchJoin);
								return 1;
							}

							TienLenPlayer newPlayer = new TienLenPlayer(uid);
							newPlayer.setAvatarID(newUser.avatarID);
							newPlayer.setLevel(newUser.level);
							newPlayer.setCash(newUser.money);
							newPlayer.setUsername(newUser.mUsername);
							newPlayer.vipId = newUser.vipId;
							newPlayer.moneyForBet = table.firstCashBet;
							newPlayer.currentMatchID = rqMatchJoin.mMatchId;
							newPlayer.currentSession = aSession;
							newPlayer.setCurrentOwner(table.ownerSession);

							table.join(newPlayer);
							room.join(aSession);
							aSession.setRoom(room);

							resMatchJoin.isPlaying = table.isPlaying;
							if (table.isPlaying) {
								if (table.getDuty() != null) {
									resMatchJoin.duty = table.getDuty().getType();
								}
								resMatchJoin.isObserve = true;
								resMatchJoin.cards = Utils
									.bytesToString(table.lastCards);
								resMatchJoin.turn = table.getCurrentTurnID();
							}

							broadcastMsg
								.setSuccess(ResponseCode.SUCCESS, uid,
									newUser.mUsername, newUser.level,
									newUser.avatarID, newUser.money,
									ZoneID.TIENLEN);

							// join's values
							resMatchJoin.setSuccess(ResponseCode.SUCCESS,
								room.getName(), table.firstCashBet,
								aSession.getCurrentZone());
							resMatchJoin.setRoomID(rqMatchJoin.mMatchId);
							resMatchJoin.setCurrentPlayersTienLen(
								table.getPlayings(), table.getWaitings(),
								table.owner);
							resMatchJoin.isHidePoker = table.isHidePoker();

							// send broadcast msg to friends
							broadcastMsg.vipId = newUser.vipId;
							table.broadcastMsg(broadcastMsg,
								table.getNewPlayings(), table.getNewWaitings(),
								newPlayer, false);
							// room.broadcastMessage(broadcastMsg, aSession, false);

							aSession.write(resMatchJoin);
						}

						break;
					}

					default:
						break;
				}

			} else { // send back only player
				resMatchJoin.setFailure(ResponseCode.FAILURE, "Bàn đã bị hủy!");

				aResPkg.addMessage(resMatchJoin);
			}
		} catch (BusinessException ex) {
			resMatchJoin.setFailure(ResponseCode.FAILURE, ex.getMessage());
			aSession.write(resMatchJoin);
			mLog.debug(ex.getMessage());
		} catch (Throwable t) {
			mLog.error("Process message " + aReqMsg.getID() + " error.", t);
			resMatchJoin.setFailure(ResponseCode.FAILURE, "Lỗi xảy ra");
			aSession.write(resMatchJoin);
		}
		return 1;
	}

	private void reJoinTienLen(TienLenTable table, ISession aSession,
		UserEntity newUser, long matchId, Room room)
		throws SimpleException, ServerException {
		MessageFactory msgFactory = aSession.getMessageFactory();
		ReconnectResponse resReconn = (ReconnectResponse) msgFactory
			.getResponseMessage(MessagesID.RECONNECT);

		if (table.getCurrPlayer().id == newUser.mUid) {
			table.setLastActivated(System.currentTimeMillis());
			table.setCurrentTimeOut(25000);
		}

		TienLenPlayer reconnPlayer = table.findPlayer(newUser.mUid);
		reconnPlayer.isReady = true;
		reconnPlayer.isObserve = false;
		reconnPlayer.isOut = false;
		reconnPlayer.isOutGame = false;
		reconnPlayer.setAvatarID(newUser.avatarID);
		reconnPlayer.setLevel(newUser.level);
		reconnPlayer.setCash(newUser.money);
		reconnPlayer.setUsername(newUser.mUsername);
		reconnPlayer.vipId = newUser.vipId;
		reconnPlayer.moneyForBet = table.firstCashBet;
		reconnPlayer.currentMatchID = matchId;

		if ((reconnPlayer.currentSession != null)
			&& (reconnPlayer.currentSession.getID() != null)) {
			if (reconnPlayer.currentSession.getID().compareTo(aSession.getID()) != 0) {
				Room r = reconnPlayer.currentSession.getJoinedRooms()
					.lastElement();
				reconnPlayer.currentSession.leftRoom(r.getRoomId());
				r.left(aSession);
				// }
				try {
					reconnPlayer.currentSession.close();
				} catch (Throwable e) {
					e.printStackTrace();
				}
			}
		}
		reconnPlayer.currentSession = aSession;
		reconnPlayer.currentOwner = table.ownerSession;
		// reconnPlayer.currentSession = aSession;

		room.join(aSession);
		aSession.setRoom(room);
		if (table.isPlaying) {
			resReconn.isObserve = true;
			resReconn.isPlaying = true;

			resReconn.cards = Utils.bytesToString(table.lastCards);
			if (resReconn.cards == null) {
				resReconn.cards = "";
			}

			resReconn.turn = table.getCurrentTurnID();
			resReconn.myHandCards = Utils.bytesToString(reconnPlayer.myHand);
			resReconn.duty = table.getDuty().getType();
			resReconn.currUserHasDuty = table.getDuty().getCurrDutyPlayerId();
		}

		resReconn.setSuccess(ResponseCode.SUCCESS, room.getName(),
			table.firstCashBet, ZoneID.TIENLEN);
		resReconn.setRoomID(matchId);
		resReconn.setCurrentPlayersTienLen(table.getPlayings(),
			table.getWaitings(), table.owner);
		resReconn.isResume = true;
		resReconn.isHidePoker = table.isHidePoker();
		aSession.write(resReconn);
	}

}
