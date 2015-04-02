package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.KickOutRequest;
import com.tv.xeeng.base.protocol.messages.KickOutResponse;
import com.tv.xeeng.base.protocol.messages.OutResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.game.data.MessagesID;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.ZoneID;
import com.tv.xeeng.game.room.Room;
import com.tv.xeeng.game.room.Zone;
import com.tv.xeeng.game.tienlen.data.TienLenPlayer;
import com.tv.xeeng.game.tienlen.data.TienLenTable;
import com.tv.xeeng.protocol.AbstractBusiness;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponsePackage;
import com.tv.xeeng.protocol.MessageFactory;

import org.slf4j.Logger;

public class KickOutBusiness extends AbstractBusiness {

    private static final Logger mLog = LoggerContext.getLoggerFactory()
            .getLogger(KickOutBusiness.class);
    private static final String NOT_OWNER_PERSON = "Bạn không phải là chủ bàn - không có quyền đuổi người khác!";
    private static final String PLAYER_OUT = "Người chơi này đã thoát rồi!";
    private static final String PLAYING_TABLE = "Bạn không thể đuổi người khác khi bàn đang chơi!";

    public int handleMessage(ISession aSession, IRequestMessage aReqMsg,
            IResponsePackage aResPkg) throws ServerException {
        mLog.debug("[KICK OUT] : Catch");
        MessageFactory msgFactory = aSession.getMessageFactory();
        KickOutResponse resKickOut = (KickOutResponse) msgFactory
                .getResponseMessage(aReqMsg.getID());
        resKickOut.session = aSession;
        try {
            KickOutRequest rqKickOut = (KickOutRequest) aReqMsg;
            Zone bacayZone = aSession.findZone(aSession.getCurrentZone());
            Room currentRoom = bacayZone.findRoom(rqKickOut.mMatchId);
            if (currentRoom != null) {
                OutResponse broadcastMsg = (OutResponse) msgFactory
                        .getResponseMessage(MessagesID.OUT);
                switch (aSession.getCurrentZone()) {
                    case ZoneID.TIENLEN: {
                        TienLenTable currentTable = (TienLenTable) currentRoom
                                .getAttactmentData();
                        if (aSession.getUID() == currentTable.owner.id) {
                            TienLenPlayer player = (TienLenPlayer) currentTable
                                    .findPlayer(rqKickOut.uid);
                            if (player == null) {
                                resKickOut.setFailure(ResponseCode.FAILURE,
                                        "Người chơi này đã thoát rồi!");
                            } else if (currentTable.isPlaying) {
                                resKickOut
                                        .setFailure(
                                                ResponseCode.FAILURE,
                                                "Bàn đang chơi và "
                                                + player.username
                                                + " đang chơi. Bạn không thể đuổi ra ngoài được. Chờ hết ván đi!");
                            } else {
                                resKickOut.session = player.currentSession;
                                broadcastMsg.setSuccess(ResponseCode.SUCCESS,
                                        rqKickOut.uid, player.username
                                        + " bị chủ bàn đá ra ngoài",
                                        player.username, 0);
                                // send broadcast msg to friends
                                currentTable
                                        .broadcastMsg(broadcastMsg,
                                                currentTable.getNewPlayings(),
                                                currentTable.getNewWaitings(),
                                                player, true);
                                /*
                                 * currentRoom.broadcastMessage(broadcastMsg,
                                 * aSession, true);
                                 */

                                resKickOut.setSuccess(ResponseCode.SUCCESS);

                                Room room = player.currentSession
                                        .leftRoom(rqKickOut.mMatchId);
                                player.currentSession.setLastFP(System
                                        .currentTimeMillis() - 20000); // for fast
                                // play
                                if (room != null) {
                                    room.left(player.currentSession);
                                } else {
                                    mLog.error("Kick out error room is null : "
                                            + rqKickOut.mMatchId);
                                }
                                player.isOutGame = true;
                                currentTable.remove(player);
                                mLog.error("--- TLMN REMOVE PLAYER DEBUG --- "
                                        + player.username + " is kicked out");
                                currentTable.dontWantAnyUser = true;
                                player.currentSession.setRoom(null);

                            }
                        } else {
                            resKickOut
                                    .setFailure(ResponseCode.FAILURE,
                                            "Bạn không phải là chủ bàn - không có quyền đuổi người khác!");
                        }
                        break;
                    }

                    default:
                        break;
                }

            } else {
                resKickOut.setFailure(ResponseCode.FAILURE,
                        "Bạn đã thoát khỏi bàn!");
            }

        } catch (Throwable t) {
            resKickOut.setFailure(ResponseCode.FAILURE, "Bị lỗi kick out");
            mLog.error("Process message " + aReqMsg.getID() + " error.", t);
        } finally {
            if ((resKickOut != null && resKickOut.mCode == ResponseCode.FAILURE)) {
                aResPkg.addMessage(resKickOut);
            }
        }
        return 1;
    }
}
