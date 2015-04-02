package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XENewRequest;
import com.tv.xeeng.base.protocol.messages.XENewResponse;
import com.tv.xeeng.base.room.NRoomEntity;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.databaseDriven.RoomDB;
import com.tv.xeeng.game.data.MatchEntity;
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
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponsePackage;
import com.tv.xeeng.protocol.MessageFactory;

import org.slf4j.Logger;

public class XENewBusiness extends AbstractBusiness {

    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XENewBusiness.class);

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
    public int handleMessage(ISession paramISession, IRequestMessage paramIRequestMessage, IResponsePackage paramIResponsePackage) throws ServerException {
        XENewRequest req = (XENewRequest) paramIRequestMessage;
        MessageFactory msgFactory = paramISession.getMessageFactory();
        XENewResponse resp = (XENewResponse) msgFactory.getResponseMessage(req.getID());

        Long uid = paramISession.getUID();

        resp.session = paramISession;
        Zone zone = paramISession.findZone(req.zoneID);
        if (zone != null) {
            paramISession.setCurrentZone(req.zoneID);
            try {
                paramISession.setChatRoom(0);
                CacheUserInfo cacheUser = new CacheUserInfo();
                UserEntity user = cacheUser.getUserInfo(uid.longValue());
                if (user == null) {
                    resp.mCode = ResponseCode.FAILURE;
                    resp.setErrorMsg("Session không hợp lệ (không thấy thông tin user");
                    return 1;
                }

                resp.setOwnerCash(user.money);

                Phong phong = zone.xeGetPhong(req.levelID);
//                DebugUtils.dumpPhongs(zone.getMPhongs());
                if (phong == null) {
                    resp.mCode = ResponseCode.FAILURE;
                    resp.setErrorMsg("Không tìm thấy phòng. LevelID không hợp lệ");
                    // paramIResponsePackage.addMessage(resp);
                    return 1;
                }

                int phongId = phong.id;

                int tableIndex = phong.getAvailableTable();

                RoomDB roomDB = new RoomDB();
                NRoomEntity roomEntity = roomDB.getRoomEntity(req.zoneID, phongId);
                if (roomEntity == null) {
                    phongId = paramISession.getPhongID();
                    roomEntity = roomDB.getRoomEntity(req.zoneID, phongId);
                    if (roomEntity == null) {
                        throw new BusinessException("Bị lỗi bạn thử cập nhật lại xem sao");
                    }
                }

                long roomMinBet = roomEntity.getMinCash();
                req.moneyBet = (req.moneyBet < roomMinBet) ? roomMinBet : req.moneyBet;
                if ((user.money < 4 * req.moneyBet)) {
                    resp.mCode = ResponseCode.FAILURE;
                    resp.setErrorMsg("Bạn không đủ tiền để tạo bàn chơi. Số tiền bạn có nhỏ hơn 4 lần tiền bàn");
                    // paramIResponsePackage.addMessage(resp);
                    return 1;
                }
                // long matchID = phong.isCreableTable(tableIndex);

                paramISession.setRoomID(phongId);

                /* nếu không đặt tên bàn thì tạo ngẫu nhiên */
                if (req.tableName == null || req.tableName.length() == 0) {
                    req.tableName = getRandomRoomName();
                }

                // if (checkInvalidName(req.tableName)) {
                // throw new BusinessException("Tên bàn không hợp lệ");
                // }
                req.tableName = beautyTableName(req.tableName);

                switch (req.zoneID) {
                    case ZoneID.TIENLEN: {
                        req.maxPlayers = (req.maxPlayers < 4) ? req.maxPlayers : 4;
                        Room newRoom = zone.createRoom(req.tableName, uid.longValue(), phongId);
                        newRoom.setIndex(tableIndex);
                        newRoom.join(paramISession);
                        newRoom.setPassword(null);
                        newRoom.setName(req.tableName);
                        newRoom.setPlayerSize(req.maxPlayers);
                        newRoom.setOwnerName(user.mUsername);
                        newRoom.setZoneID(req.zoneID);
                        newRoom.setPhongID(phongId);

                        TienLenPlayer owner = new TienLenPlayer(user.mUid);
                        owner.setCash(user.money);
                        owner.avatarID = user.avatarID;
                        owner.level = user.level;
                        owner.username = user.mUsername;
                        owner.currentSession = paramISession;
                        owner.moneyForBet = req.moneyBet;
                        owner.currentMatchID = newRoom.getRoomId();
                        owner.vipId = user.vipId;

                        owner.setReady(true);

                        TienLenTable table = new TienLenTable(owner, req.moneyBet, newRoom.getRoomId(), req.maxPlayers);
                        table.name = req.tableName;
                        table.setOwnerSession(paramISession);
                        table.setTableIndex(tableIndex);
                        table.setRoom(newRoom);
                        // index = req.tableIndex;
                        table.setMaximumPlayer(req.maxPlayers);
                        table.setPhongID(phongId);

                        newRoom.setAttachmentData(table);
                        paramISession.setRoom(newRoom);

                        resp.mCode = ResponseCode.SUCCESS;
                        resp.setMatchID(table.matchID);
                        resp.setMoneyBet(req.moneyBet);
                        resp.setOwnerCash(user.money);

                        // resp.isHidePoker = table.isHidePoker();
                        MatchEntity entity = new MatchEntity(newRoom.getRoomId(), req.zoneID, newRoom, phongId);
                        CacheMatch.add(entity);

                        break;
                    }

                    default:
                        break;
                }
            } catch (BusinessException be) {
                resp.mCode = ResponseCode.FAILURE;
                resp.setErrorMsg(be.getMessage());
                mLog.error("Process message " + req.getID() + " error.", be);
            } catch (Throwable t) {
                resp.mCode = ResponseCode.FAILURE;
                resp.setErrorMsg("Bị lỗi " + t.toString());
                mLog.error("Process message " + req.getID() + " error.", t);
            } finally {
                if ((resp != null)) {
                    paramIResponsePackage.addMessage(resp);
                }
            }
        } else {
            resp.mCode = ResponseCode.FAILURE;
            resp.setErrorMsg("zone ID không hợp lệ");
            paramIResponsePackage.addMessage(resp);
        }
        return 1;
    }

    private String beautyTableName(String name) {
        if (name == null) {
            return null;
        }

        for (String badWord : XEGameConstants.BLACKLIST_WORDS) {
            if (name.contains(badWord)) {
                name = name.replace(badWord, "***");
            }
        }

        return name;
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
