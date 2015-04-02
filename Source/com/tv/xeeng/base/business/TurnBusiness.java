package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.EndMatchResponse;
import com.tv.xeeng.base.protocol.messages.TurnRequest;
import com.tv.xeeng.base.protocol.messages.TurnResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.game.data.AIOConstants;
import com.tv.xeeng.game.data.MatchEntity;
import com.tv.xeeng.game.data.MessagesID;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.SimplePlayer;
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
public class TurnBusiness extends AbstractBusiness {

    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(TurnBusiness.class);

    public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) {
        mLog.debug("[TURN] : Catch  ; " + aSession.getUserName());
        MessageFactory msgFactory = null;// aSession.getMessageFactory();
        TurnResponse resMatchTurn = null;
        // (TurnResponse) msgFactory.getResponseMessage(aReqMsg.getID());
        // boolean isFinish = false;
        try {
            TurnRequest rqMatchTurn = (TurnRequest) aReqMsg;
            System.out.println(" request match turn: " + aReqMsg.toString());
            MatchEntity matchEntity = CacheMatch.getMatch(rqMatchTurn.mMatchId);
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

            if (room == null || (room.getAttactmentData().matchID != rqMatchTurn.mMatchId)) {
                Zone zone = aSession.findZone(zoneId);
                room = zone.findRoom(rqMatchTurn.mMatchId);
            }

            // Thread.sleep(10000);
            long currID = rqMatchTurn.uid;
            if (currID == 0) {
                currID = aSession.getUID();
            }

            if (room != null) {
                // mLog.debug("[TURN] Current room = " + room.getName());
                // mLog.debug("[TURN] Current player = " +
                // aSession.getUserName());
                msgFactory = room.getAttactmentData().getNotNullSession().getMessageFactory();
                resMatchTurn = (TurnResponse) msgFactory.getResponseMessage(aReqMsg.getID());

                resMatchTurn.session = aSession;
                switch (zoneId) {
                    case ZoneID.TIENLEN: {
                        TienLenTable table = (TienLenTable) room.getAttactmentData();
                        // if(rqMatchTurn.tienlenCards.compareTo("")!=0){
                        TienLenPlayer player = table.findPlayer(currID);

                        if (!table.isPlaying) {
                            mLog.error("TLMN Error --- danh bai khi da ket thuc van! --- " + currID);
                            return 1;
                        }

                        int res = table.play(currID, rqMatchTurn.tienlenCards, rqMatchTurn.isGiveup, rqMatchTurn.isTimeoutTL);
                        mLog.debug("--- TLMN TURN DEBUG --- RESULT CODE = " + res);
                        switch (res) {
                            case TienLenTable.SUCCESS:
                                resMatchTurn.setSuccessTienLen(ResponseCode.SUCCESS, rqMatchTurn.tienlenCards, table.getCurrentTurnID(), table.isNewRound, ZoneID.TIENLEN);
                                resMatchTurn.setcurrID(currID);
                                resMatchTurn.setIsGiveup(rqMatchTurn.isGiveup);
                                resMatchTurn.isDuty = table.getDuty().isYourDuty();
                                resMatchTurn.session = aSession;

                                if (table.fightOccur) {
                                    resMatchTurn.setFightInfo(table.fightInfo);
                                }
                                // notify to other players
                                // room.broadcastMessage(resMatchTurn, aSession, true);
                                // isFinish = true;

                                table.broadcastMsg(resMatchTurn, table.getNewPlayings(), table.getNewWaitings(), player, true);

                                break;

                            case TienLenTable.END_MATCH:
                                table.resetAutoKickOut();
                                table.isPlaying = false;
                                EndMatchResponse endMatchRes = (EndMatchResponse) msgFactory.getResponseMessage(MessagesID.MATCH_END);
                                // set the result
                                endMatchRes.setZoneID(ZoneID.TIENLEN);
                                endMatchRes.session = aSession;

                                endMatchRes.setSuccessTienLen(ResponseCode.SUCCESS, table.GetEndGame(currID), currID, (ArrayList<TienLenPlayer>) table.getPlayings().clone());
                                endMatchRes.setLastCards(rqMatchTurn.tienlenCards);

                                if (table.fightOccur) {
                                    resMatchTurn.setFightInfo(table.fightInfo);
                                }

                                // room.broadcastMessage(endMatchRes, aSession, true);
                                // isFinish = true;
                                long newOwnerId = 0;
                                if (((TienLenPlayer) table.owner).isOut || ((TienLenPlayer) table.owner).notEnoughMoney()) {
                                    SimplePlayer newOwnerPlayer = table.ownerQuit();
                                    if (newOwnerPlayer != null) {
                                        newOwnerId = newOwnerPlayer.id;
                                        room.setOwnerName(newOwnerPlayer.username);
                                        table.owner = newOwnerPlayer;
                                    }
                                }

                                endMatchRes.newOwner = newOwnerId;
                                table.broadcastMsg(endMatchRes, table.getNewPlayings(), table.getNewWaitings(), player, true);

                                table.supRemOldVer(endMatchRes.newOwner, AIOConstants.PROTOCOL_MODIFY_MID);
                                //room.setPlaying(false);
                                //  Begin remove player which doesn't have enough
                                // money
                                // set current ownerId()
                                table.setOwnerId(table.owner.id);

                                //table.removeNotEnoughMoney(room);
                                //  End remove player which doesn't have enough
                                // money
                                table.resetPlayers();

                                break;
                            case TienLenTable.INVALID_TURN:
                                resMatchTurn.setFailure(ResponseCode.FAILURE, "Không phải lượt đi của bạn!");
                                break;
                            case TienLenTable.INVALID_PLAY:
                                resMatchTurn.setFailure(ResponseCode.FAILURE, "Đi không hợp lệ!");
                                break;
                            case TienLenTable.INVALID_FIGTH:
                                resMatchTurn.setFailure(ResponseCode.FAILURE, "Chặt không hợp lệ!");
                                break;
                            case TienLenTable.INVALID_GIVEUP:
                                resMatchTurn.setFailure(ResponseCode.FAILURE, "Bạn không được bỏ lượt!");
                                break;
                            case TienLenTable.CARDS_NOT_FOUND:
                                resMatchTurn.setFailure(ResponseCode.FAILURE, "Không tìm thấy quân bài bạn đánh!");
                                break;
                            default:
                                resMatchTurn.setFailure(ResponseCode.FAILURE, "Lỗi play!");
                                break;
                        }

                        break;
                    }
                    default:
                        break;
                }

            } else {
                mLog.error("Room is null ; matchID : " + rqMatchTurn.mMatchId + " ; " + aSession.getUserName() + " ; zone = " + aSession.getCurrentZone());

                msgFactory = aSession.getMessageFactory();
                resMatchTurn = (TurnResponse) msgFactory.getResponseMessage(aReqMsg.getID());

                resMatchTurn.setFailure(ResponseCode.FAILURE, "Bạn cần tham gia vào một trận trước khi chơi.");
                aSession.write(resMatchTurn);
            }
        } catch (Throwable t) {
            resMatchTurn.setFailure(ResponseCode.FAILURE, t.getMessage());
            mLog.error("Process message " + aReqMsg.getID() + " error.", t);
            try {
                aSession.write(resMatchTurn);
            } catch (ServerException ex) {
            }

        } finally {
            /*
             * if ((resMatchTurn != null) && (!isFinish)) {
             * aResPkg.addMessage(resMatchTurn); }
             */
        }
        return 1;
    }
}
