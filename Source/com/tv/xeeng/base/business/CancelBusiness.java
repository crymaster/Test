/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.CancelRequest;
import com.tv.xeeng.base.protocol.messages.CancelResponse;
import com.tv.xeeng.base.protocol.messages.TurnResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.game.data.MatchEntity;
import com.tv.xeeng.game.data.MessagesID;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.SimplePlayer;
import com.tv.xeeng.game.data.SimpleTable;
import com.tv.xeeng.game.data.ZoneID;
import com.tv.xeeng.game.room.Room;
import com.tv.xeeng.game.room.Zone;
import com.tv.xeeng.game.tienlen.data.TienLenPlayer;
import com.tv.xeeng.game.tienlen.data.TienLenTable;
import com.tv.xeeng.memcached.data.CacheMatch;
import com.tv.xeeng.protocol.AbstractBusiness;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponsePackage;
import com.tv.xeeng.protocol.MessageFactory;

import java.util.ArrayList;

import org.slf4j.Logger;

/**
 *
 * @author tuanda
 */
public class CancelBusiness extends AbstractBusiness {

    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(CancelBusiness.class);

    private void writeWithRooms(ISession aSession, CancelRequest request, CancelResponse response, int phongId, Zone zone) throws ServerException {
        response.mCode = ResponseCode.SUCCESS;

        if (request.isSendMe) {
            response.phongId = phongId;
            response.zone = zone;
            response.session = aSession;

            if (aSession != null) {
                aSession.write(response);
            }
        }

        if (aSession != null) {
            aSession.setRoom(null);
        }
    }

    @SuppressWarnings("unchecked")
    @Override
    public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) {
        mLog.debug("[CANCEL]: Catch");
        MessageFactory msgFactory;//aSession.getMessageFactory();
        CancelResponse resMatchCancel = null;//(CancelResponse) msgFactory.getResponseMessage(aReqMsg.getID());
        Room room = null;
        int zoneID = aSession.getCurrentZone();
        CancelRequest rqMatchCancel = (CancelRequest) aReqMsg;
        long matchId = rqMatchCancel.mMatchId;

        //fix wrong zone
        if (matchId > 0) {
            MatchEntity matchEntity = CacheMatch.getMatch(matchId);
            if (matchEntity != null) {
                room = matchEntity.getRoom(); //find room by new method
                zoneID = matchEntity.getZoneId();
            }
        }

        Zone zone = aSession.findZone(zoneID);
        try {
//            CancelRequest rqMatchCancel = (CancelRequest) aReqMsg;
//            long matchId = rqMatchCancel.mMatchId;

            long uid = aSession.getUID();
//            mLog.debug("[CANCEL]: ID - " + uid + ", match id - " + matchId);

            if (matchId > 0) {
                if (room == null) //found by new method
                {
                    room = aSession.getRoom();
                }

                if (room == null || (room.getAttactmentData().matchID != matchId)) {
                    //find by old method
                    room = zone.findRoom(matchId);
                }

                if (room != null) {
                    //int zoneId = aSession.getCurrentZone();
                    if (zoneID == ZoneID.PHOM || zoneID == ZoneID.TIENLEN || zoneID == ZoneID.BAU_CUA_TOM_CA || zoneID == ZoneID.NEW_BA_CAY) {
                        msgFactory = room.getAttactmentData().getNotNullSession().getMessageFactory();
                    } else {
                        msgFactory = aSession.getMessageFactory();
                    }

                    resMatchCancel = (CancelResponse) msgFactory.getResponseMessage(aReqMsg.getID());
                    resMatchCancel.session = aSession;
                    resMatchCancel.phongId = room.phongID;
//                    resMatchCancel.zone = bacayZone;
//					RoomDB roomDB = new RoomDB();
//					roomDB.userOut(zoneID, aSession.getPhongID());
                    if (aSession.getRoomID() != 0) {
                        //bacayZone.outRoom(aSession.getRoomID());
                        aSession.setRoomID(0);
                    }

                    aSession.setLastFP(System.currentTimeMillis() - 20000); //for fast play

                    switch (zoneID) {
                        case ZoneID.TIENLEN: {
                            resMatchCancel.setZone(ZoneID.TIENLEN);
                            TienLenTable table = (TienLenTable) room.getAttactmentData();
                            uid = aSession.getUID();

                            resMatchCancel.setUid(uid);
                            if (table == null) {
                                mLog.error("Table is null ! uid : " + uid);
                            } else {
                                TienLenPlayer player = table.findPlayer(uid);
                                if (table.isPlaying) {
                                    if (player != null && !player.isObserve) {
                                        player.isOut = true;
                                        player.isOutGame = true;
                                        return 1;
                                    }

                                    if (player != null && player.isObserve) {
                                        table.remove(player);
//                                        mLog.error("--- TLMN REMOVE PLAYER DEBUG --- " + player.username + " quit the game");
                                        writeWithRooms(aSession, rqMatchCancel, resMatchCancel, room.phongID, zone);

                                        table.broadcastMsg(resMatchCancel, table.getNewPlayings(), table.getNewWaitings(), player, false);
                                        room.left(aSession);
                                        return 1;
                                    }

                                    writeWithRooms(aSession, rqMatchCancel, resMatchCancel, room.phongID, zone);
                                    room.left(aSession);
                                    return 1;
                                } else {
                                    if (player != null) {
                                        table.remove(player);
                                    }

                                    if (table.numRealPlaying() == 0) {
                                        resMatchCancel.mCode = ResponseCode.SUCCESS;
//                                        room.broadcastMessage(resMatchCancel,
//                                                aSession, false);

                                        writeWithRooms(aSession, rqMatchCancel, resMatchCancel, room.phongID, zone);

                                        //table.broadcastMsg(resMatchCancel, table.getNewPlayings(), table.getNewWaitings(), player, false);
                                        table.destroy();
                                        room.allLeft();
                                        //table = null;
                                        return 1;
                                    } // Trường hợp khi người chơi thoát hết, chỉ
                                    // còn chủ room thì lần sau sẽ bắt đầu ván
                                    // mới
                                    else if (table.getPlayings().size() == 1 && player != null && !player.isObserve) {
                                        table.isNewMatch = true;
                                    }

                                    if (uid == table.owner.id) {
                                        TienLenPlayer p1 = table.ownerQuit();
                                        if (p1 != null) {
                                            room.setOwnerName(p1.username);
                                            resMatchCancel.newOwner = p1.id;
                                            table.owner = p1;
                                        }
                                        resMatchCancel.setSuccess(ResponseCode.SUCCESS, uid);
                                    }

                                    writeWithRooms(aSession, rqMatchCancel, resMatchCancel, room.phongID, zone);
                                    table.broadcastMsg(resMatchCancel, table.getNewPlayings(), table.getNewWaitings(), player, false);

                                    room.left(aSession);
                                    return 1;
                                }
                            }

                            break;
                        }

                        default:
                            break;
                    }
                    // Finally

                    if (aSession.getCurrentZone() == ZoneID.NEW_BA_CAY || aSession.getCurrentZone() == ZoneID.BAU_CUA_TOM_CA
                            || aSession.getCurrentZone() == ZoneID.AILATRIEUPHU || aSession.getCurrentZone() == ZoneID.PIKACHU) {
//                        resMatchCancel.setSuccess(ResponseCode.SUCCESS, uid);
//                        writeWithRooms(aSession, rqMatchCancel, resMatchCancel, room.phongID, bacayZone);
//                        aSession.leftRoom(matchId);
//                        room.left(aSession);
//
//                        SimpleTable table = room.getAttactmentData();
//                        if (table != null) {
//                            table.broadcastMsg(resMatchCancel, table.getNewPlayings(), new ArrayList<SimplePlayer>(), null, false);
//                        }

                    } else {
                        Room currentRoom = aSession.leftRoom(matchId);
                        if (currentRoom != null) {
                            currentRoom.left(aSession);
                            //System.out.println("chạy qua finally!");

                            if (aSession.getCurrentZone() == ZoneID.TIENLEN) {
                                resMatchCancel.mCode = 1;
                            }

                            writeWithRooms(aSession, rqMatchCancel, resMatchCancel, room.phongID, zone);

                            if (room != null) {
                                //TODO:  fix don't send resmatchcancel to this session
                               /* if( aSession.getCurrentZone() == ZoneID.PHOM || aSession.getCurrentZone() == ZoneID.TIENLEN)
                                 {*/
                                SimpleTable table = room.getAttactmentData();
                                if (table != null) {
                                    table.broadcastMsg(resMatchCancel, table.getNewPlayings(), new ArrayList<SimplePlayer>(), null, false);
                                }
                                /* }
                                 else
                                 {
                                 room.broadcastMessage(resMatchCancel, aSession,
                                 false);
                                 }*/
                            }
                        }
                    }
                } else {
                    msgFactory = aSession.getMessageFactory();
                    resMatchCancel = (CancelResponse) msgFactory.getResponseMessage(aReqMsg.getID());
                    resMatchCancel.mCode = 1;
                    resMatchCancel.session = aSession;
                    resMatchCancel.uid = aSession.getUID();
                    aSession.write(resMatchCancel);
                }
            }
        } catch (Throwable t) {
            try {
                writeWithRooms(aSession, rqMatchCancel, resMatchCancel, room.phongID, zone);
                room.left(aSession);
            } catch (ServerException ex) {
                mLog.error("!!!!!Error cancel ", ex);
            } catch (Exception ex) {
                mLog.error("Cancel business error", ex);
            }
        }

        return 1;
    }

    private void sendNextTurn(TienLenTable table, long currID, ISession aSession, TienLenPlayer player) {
        MessageFactory msgFactory = aSession.getMessageFactory();

        TurnResponse resMatchTurn = (TurnResponse) msgFactory.getResponseMessage(MessagesID.MATCH_TURN);
        resMatchTurn.setSuccessTienLen(ResponseCode.SUCCESS, "", table.getCurrentTurnID(), table.isNewRound, ZoneID.TIENLEN);
        resMatchTurn.setcurrID(currID);
        resMatchTurn.setIsGiveup(true);
        resMatchTurn.isDuty = table.getDuty().isYourDuty();
        resMatchTurn.session = aSession;
        if (table.fightOccur) {
            resMatchTurn.setFightInfo(table.fightInfo);
        }

        table.broadcastMsg(resMatchTurn, table.getNewPlayings(), table.getNewWaitings(), player, true);
    }
}
