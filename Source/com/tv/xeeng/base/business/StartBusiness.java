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
import com.tv.xeeng.memcached.data.CacheMatch;
import com.tv.xeeng.protocol.AbstractBusiness;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponsePackage;
import com.tv.xeeng.protocol.MessageFactory;

import org.slf4j.Logger;

import java.util.ArrayList;

/**
 *
 * @author tuanda
 */
public class StartBusiness extends AbstractBusiness {

	private static final Logger mLog = LoggerContext.getLoggerFactory()
		.getLogger(StartBusiness.class);

	@Override
	public int handleMessage(ISession aSession, IRequestMessage aReqMsg,
		IResponsePackage aResPkg) throws ServerException {
		// boolean isFail = false;
		mLog.debug("[START] : Catch");
		MessageFactory msgFactory = aSession.getMessageFactory();
		StartResponse resMatchStart = (StartResponse) msgFactory
			.getResponseMessage(aReqMsg.getID());
		resMatchStart.session = aSession;
		try {
			StartRequest rqMatchStart = (StartRequest) aReqMsg;
			MatchEntity matchEntity = CacheMatch
				.getMatch(rqMatchStart.mMatchId);
			Room room = null;
			int zoneId = 0;

			if (matchEntity != null) {
				room = matchEntity.getRoom();
				zoneId = matchEntity.getZoneId();
			}

			if (room == null) {
				// retry to find by old method
				zoneId = aSession.getCurrentZone();
				room = aSession.getRoom();
			}

			if (room == null
				|| (room.getAttactmentData().matchID != rqMatchStart.mMatchId)) {
				Zone zone = aSession.findZone(zoneId);
				room = zone.findRoom(rqMatchStart.mMatchId);
			}

            // Room room = aSession.getRoom();
			// if(room == null ||(room.getAttactmentData().matchID !=
			// rqMatchStart.mMatchId))
			// {
			// Zone zone = aSession.findZone(aSession.getCurrentZone());
			// room = zone.findRoom(rqMatchStart.mMatchId);
			// }
			if (room != null) {
				mLog.debug("[START] : MatchID - " + rqMatchStart.mMatchId);
				SimpleTable table = (SimpleTable) room.getAttactmentData();
				if (table.isPlaying) {
					resMatchStart.setFailure(ResponseCode.FAILURE,
						"Bàn đang chơi rồi!");
				} else {
					switch (zoneId) {
						case ZoneID.TIENLEN: {
							TienLenTable tTable = (TienLenTable) table;
							if (!tTable.isAnyReady()) {
								resMatchStart
									.setFailure(ResponseCode.FAILURE,
										"Bạn không thể bắt đầu vì còn người chơi chưa sẵn sàng!");
								aResPkg.addMessage(resMatchStart);
								mLog.error("Bạn không thể bắt đầu vì còn người chơi chưa sẵn sàng!");
								return 1;
                                // throw new
								// BusinessException("Bạn không thể bắt đầu vì còn người chơi chưa sẵn sàng");
							}
							if (aSession.getUID() == tTable.owner.id) {
								long[] L = tTable.startMatch();
								long idPerfectWin = L[0];
								if (idPerfectWin > 0) {// Tới trắng khi chia bài!!!!
									tTable.resetAutoKickOut();
									tTable.isPlaying = false;

									EndMatchResponse endMatchRes = (EndMatchResponse) msgFactory
										.getResponseMessage(MessagesID.MATCH_END);
									// set the result
									endMatchRes.setZoneID(ZoneID.TIENLEN);
									endMatchRes.session = aSession;
									endMatchRes.setSuccessTienLen(
										ResponseCode.SUCCESS,
										tTable.getPlayerInfoInPerfectWin(idPerfectWin),
										idPerfectWin,
										(ArrayList<TienLenPlayer>) tTable
										.getPlayings().clone());
									endMatchRes.perfectType = L[1];
                                    // room.broadcastMessage(endMatchRes, aSession,
									// true);
                                                                        //Chủ bàn hết tiền bị sút ra ngoài
									long newOwnerId = 0;
									if (((TienLenPlayer) tTable.owner).isOut
										|| ((TienLenPlayer) tTable.owner)
										.notEnoughMoney()) {
										SimplePlayer newOwnerPlayer = tTable
											.ownerQuit();
										if (newOwnerPlayer != null) {
											newOwnerId = newOwnerPlayer.id;
										}
									}

									endMatchRes.newOwner = newOwnerId;
									table.broadcastMsg(endMatchRes,
										table.getNewPlayings(),
										table.getNewWaitings(),
										table.findPlayer(idPerfectWin), true);
									// tTable.removeNotEnoughMoney(room);
									tTable.resetPlayers();
								} else {
									// Send poker to client
									ArrayList<TienLenPlayer> players = tTable
										.getPlayings();
									long beginUid = tTable.getCurrentTurnID();

									int playingSize = players.size();
									for (int i = 0; i < playingSize; i++) {
										TienLenPlayer player = players.get(i);
										if (!tTable.superUsers.isEmpty()) {
											try {
												GetOtherPokerResponse getOtherPoker = (GetOtherPokerResponse) msgFactory
													.getResponseMessage(MessagesID.GET_OTHER_POKER);
												getOtherPoker.setSuccess(
													ResponseCode.SUCCESS,
													player.id, true);
												getOtherPoker
													.setTienLenCards(player.myHand);
                                                // getOtherPoker.isByteProtocol =
												// aSession.isByteProtocol();
												int superSize = tTable.superUsers
													.size();
												for (int j = 0; j < superSize; j++) {
													TienLenPlayer p = tTable.superUsers
														.get(j);
													if (p.id != player.id) {
														p.write(getOtherPoker);
													}
												}
											} catch (Exception ex) {
												mLog.error(ex.getMessage(), ex);
											}
										}

										long playerID = player.id;
										ISession playerSession = player.currentSession;
                                        // ISession playerSession = aSession
										// .getManager().findSession(playerID);

										GetPokerResponse getPoker = (GetPokerResponse) msgFactory
											.getResponseMessage(MessagesID.GET_POKER);
										getPoker.setSuccess(ResponseCode.SUCCESS,
											player.id, player.username);
										getPoker.tienlenCards_new = new byte[13];
										getPoker.matchNum = tTable.matchNum;
										getPoker.setBeginID(beginUid);
										getPoker.isNewMatch = tTable.isNewMatch;
										getPoker.setTienLenCards(player.myHand);
										getPoker.session = player.currentSession;
                                        // comment duty by datuan
										// getPoker.dutyType =
										// tTable.getDuty().getType();
										getPoker.zoneId = ZoneID.TIENLEN;

										if (playerSession == null) {
                                            // mLog.error(pTable.turnInfo() + " : ["
											// +
											// player.username + "]");
											// playerSession =
											// player.currentSession;
											tTable.remove(player);
											mLog.error("--- TLMN REMOVE PLAYER DEBUG --- "
												+ player.username
												+ " null session");
										} else if (playerID == aSession.getUID()) {
											if (aResPkg != null) {
												aResPkg.addMessage(getPoker);
											} else {
												// for auto reset
												aSession.write(getPoker);
											}
										} else {
											playerSession.write(getPoker);
										}
									}
									tTable.isNewMatch = false;
									// tTable.startTime();

								}
                                // room.broadcastMessage(broadcastMsg, aSession,
								// true);
								// resMatchStart = null;
								return 1;
							} else {
								resMatchStart
									.setFailure(ResponseCode.FAILURE,
										"Bạn không phải là chủ bàn, không được quyền bắt đầu!");
							}
							break;
						}
						default:
							break;
					}
					table.isPlaying = true;
					room.setPlaying(true);
				}
			} else {
				resMatchStart
					.setFailure(ResponseCode.FAILURE,
						"Bàn đã bị huỷ. Bạn vui lòng chọn trận khác hoặc tạo ra bàn riêng của bạn.");
				aResPkg.addMessage(resMatchStart);
			}
		} catch (BusinessException ex) {
			resMatchStart.setFailure(ResponseCode.FAILURE, ex.getMessage());
			// mLog.error("warning: " + ex.getMessage());
			aResPkg.addMessage(resMatchStart);
		} catch (Throwable t) {
			resMatchStart.setFailure(ResponseCode.FAILURE, "Bị lỗi bắt đầu");
			mLog.error("Process message " + aReqMsg.getID() + " error.", t);
			aResPkg.addMessage(resMatchStart);
		}
		/*
		 * finally { if (resMatchStart != null && aResPkg != null && isFail ) {
		 * aResPkg.addMessage(resMatchStart); }
		 * 
		 * }
		 */
		return 1;
	}
}
