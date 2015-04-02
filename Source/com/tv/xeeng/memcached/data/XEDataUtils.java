package com.tv.xeeng.memcached.data;

import com.tv.xeeng.base.common.FileHelper;
import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.level.XELevelItem;
import com.tv.xeeng.base.shop.XEShopItem;
import com.tv.xeeng.databaseDriven.DBPoolConnection;
import com.tv.xeeng.game.data.*;
import com.tv.xeeng.game.room.Room;
import com.tv.xeeng.game.room.Zone;
import com.tv.xeeng.game.room.ZoneManager;
import com.tv.xeeng.memcached.IMemcacheClient;
import com.tv.xeeng.memcached.MemcacheClientPool;
import com.tv.xeeng.server.Server;
import org.slf4j.Logger;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;

public class XEDataUtils {

	public static final int XE_CACHE_TIMEOUT = 5 * 60; // 5 mins
	public static final int XE_CACHE_TIMEOUT_4LEVELS = 60 * 60; // 60 mins
	public static final int XE_CACHE_TIMEOUT_4TABLELIST = 30; // 30 secs
	public static String XE_CACHE_NAMESPACE = "XECache";
	private static boolean isUseCache = true;
	private static Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEDataUtils.class);

	private static List<XEShopItem> getAllShopItemsFromDB() throws SQLException {
		String query = "{ call uspXEGetAllShopItems() }";
		Connection con = DBPoolConnection.getConnection();
		List<XEShopItem> retList = null;

		try {
			CallableStatement cs = con.prepareCall(query);
			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				retList = new ArrayList<XEShopItem>();
				while (rs.next()) {
					retList.add(new XEShopItem(
						rs.getInt("id"),
						rs.getString("item_id"),
						rs.getInt("cardinality"),
						rs.getInt("mul_factor"),
						rs.getInt("price"),
						rs.getString("description"),
						rs.getInt("value")));
				}

				rs.close();
			}

			cs.clearParameters();
			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage(), ex);
		} finally {
			con.close();
		}
		return retList;
	}

//    public static 
	public static List<XEShopItem> getAllShopItems() {
		try {
			return getAllShopItemsFromDB();
		} catch (SQLException ex) {
			return null;
		}
	}

	public static List<XELogEventGiftEntity> getEventGiftLogOfUser(long uid, long eventId) throws SQLException {
		String query = "{ call uspXEGetEventGiftLog(?) }";
		Connection con = DBPoolConnection.getConnection();
		List<XELogEventGiftEntity> retList = null;

		try {
			CallableStatement cs = con.prepareCall(query);
			cs.setLong(1, eventId);
			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				retList = new ArrayList<XELogEventGiftEntity>();
				while (rs.next()) {
					XELogEventGiftEntity entity = new XELogEventGiftEntity();
					entity.setMessage(rs.getString("name") + " " + rs.getString("message"));
					entity.setUseDate(rs.getTimestamp("useDate"));

					retList.add(entity);
				}

				rs.close();
			}

			cs.clearParameters();
			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return retList;
	}

	public static List<XEAdsEntity> getAllAds() {
		List<XEAdsEntity> allAds = null;
		String key = "AdvertisingNew";
		Object raw = XEGlobalCache.getCache(key);
		if (raw != null) {
			allAds = (List<XEAdsEntity>) raw;
		}

		if (allAds == null) {
			try {
				allAds = getAllAdsFromDB();
			} catch (SQLException ex) {
				mLog.error(ex.getMessage());
			}
		}

		if (allAds != null) {
			XEGlobalCache.setCache(key, allAds, XEGlobalCache.TIMEOUT_30_MIN);

			return allAds;
		}

		return null;
	}

	public static List<XEAdsEntity> getAllAdsFromDB() throws SQLException {
		String query = "{ call uspXEGetAllAds() }";
		Connection con = DBPoolConnection.getConnection();
		List<XEAdsEntity> retList = null;

		try {
			CallableStatement cs = con.prepareCall(query);
			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				retList = new ArrayList<XEAdsEntity>();
				while (rs.next()) {
					XEAdsEntity entity = new XEAdsEntity();
					entity.setContent(rs.getString("content"));
					entity.setType(rs.getInt("type"));

					retList.add(entity);
				}

				rs.close();
			}

			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return retList;
	}

	public static List<XEInGameEventEntity> getAllInGameEventsFromDB() throws SQLException {
		String query = "{call uspXEGetAllInGameEvents() }";
		Connection con = DBPoolConnection.getConnection();
		List<XEInGameEventEntity> retList = null;

		try {
			CallableStatement cs = con.prepareCall(query);
			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				retList = new ArrayList<XEInGameEventEntity>();
				while (rs.next()) {
					XEInGameEventEntity entity = new XEInGameEventEntity();
					entity.setId(rs.getLong("id"));
					entity.setName(rs.getString("name"));
					entity.setContent(rs.getString("content"));
					entity.setDescription(rs.getString("description"));
					entity.setComponents(rs.getString("components"));
					entity.setType(rs.getString("type"));

					retList.add(entity);
				}

				rs.close();
			}

			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return retList;
	}

	public static HashMap<Long, XEBadUserEntity> getAllBadUsers() throws SQLException {
//    public static List<XEBadUserEntity> getAllBadUsers() {
		String key = "XEBadUsersList";
		Object raw = XEGlobalCache.getCache(key);
		HashMap<Long, XEBadUserEntity> badUsersMap = null;

		if (raw != null) {
			badUsersMap = (HashMap<Long, XEBadUserEntity>) raw;
		}

		if (badUsersMap == null) {
			badUsersMap = getAllBadUsersFromDB();

			if (badUsersMap != null) {
				XEGlobalCache.setCache(key, badUsersMap, XEGlobalCache.TIMEOUT_30_MIN);
			}
		}

		return badUsersMap;
	}

	private static HashMap<Long, XEBadUserEntity> getAllBadUsersFromDB() throws SQLException {
		String query = "{ call uspXEGetAllBadUsers() }";
		Connection con = DBPoolConnection.getConnection();
		HashMap<Long, XEBadUserEntity> retMap = null;

		try {
			CallableStatement cs = con.prepareCall(query);
			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				retMap = new HashMap<Long, XEBadUserEntity>();
				while (rs.next()) {
					XEBadUserEntity entity = new XEBadUserEntity();
					entity.setId(rs.getLong("userId"));
					entity.setRate(rs.getFloat("rate"));

					retMap.put(entity.getId(), entity);
				}

				rs.close();
			}

			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return retMap;
	}

	public static List<XECashShopEntity> getAllCashShopItemsFromDB() throws SQLException {
		String query = "{call uspXEGetAllCashShopItems() }";
		Connection con = DBPoolConnection.getConnection();
		List<XECashShopEntity> retList = null;

		try {
			CallableStatement cs = con.prepareCall(query);
			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				retList = new ArrayList<XECashShopEntity>();
				while (rs.next()) {
					XECashShopEntity entity = new XECashShopEntity();
					entity.setCode(rs.getString("code"));
					entity.setName(rs.getString("name"));
					entity.setDescription(rs.getString("description"));
					entity.setPrice(rs.getLong("price"));
					entity.setType(rs.getString("type"));

					retList.add(entity);
				}

				rs.close();
			}

			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return retList;
	}

	public static int useInventoryItem(long uid, String itemCode, String giftCode, int itemLimit, long eventId) throws SQLException {
		int res = -3;
		String query = "{ call uspXEUseInventoryItem(?, ?, ?, ?, ?) }";
		Connection con = DBPoolConnection.getConnection();

		try {
			CallableStatement cs = con.prepareCall(query);
			cs.setLong(1, uid);
			cs.setString(2, itemCode);
			cs.setString(3, giftCode);
			cs.setInt(4, itemLimit);
			cs.setLong(5, eventId);

			ResultSet rs = cs.executeQuery();
			if (rs != null && rs.next()) {
				res = rs.getInt("result");
				rs.close();
			}

			cs.clearParameters();
			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return res;
	}

	public static int openEventCard(long uid, String itemCode, String giftCode, int itemLimit, long eventId, long fee, String feeType) throws SQLException {
		int res = -3;
		String query = "{ call uspXEOpenEventCard(?, ?, ?, ?, ?, ?, ?) }";
		Connection con = DBPoolConnection.getConnection();

		try {
			CallableStatement cs = con.prepareCall(query);
			cs.setLong(1, uid);
			cs.setString(2, itemCode);
			cs.setString(3, giftCode);
			cs.setInt(4, itemLimit);
			cs.setLong(5, eventId);
			cs.setLong(6, fee);
			cs.setString(7, feeType);

			ResultSet rs = cs.executeQuery();
			if (rs != null && rs.next()) {
				res = rs.getInt("result");
				rs.close();
			}

			cs.clearParameters();
			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return res;
	}

	public static int buyCashShopItem(long uid, String itemCode) throws SQLException {
		int res = -3;
		String query = "{ call uspXEBuyCashShopItem(?,?) }";
		Connection con = DBPoolConnection.getConnection();

		try {
			CallableStatement cs = con.prepareCall(query);
			cs.setLong(1, uid);
			cs.setString(2, itemCode);

			ResultSet rs = cs.executeQuery();
			if (rs != null && rs.next()) {
				res = rs.getInt("result");
				rs.close();
			}

			cs.clearParameters();
			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return res;
	}

	public static boolean joinEventItems(long uid, String code, String name, String description, long fee, long eventId) throws SQLException {
		int result = -1;
		String query = "{ call uspXEJoinEventItems(?, ?, ?, ?, ?, ?) }";
		Connection con = DBPoolConnection.getConnection();

		try {
			CallableStatement cs = con.prepareCall(query);
			cs.setLong(1, uid);
			cs.setString(2, code);
			cs.setString(3, name);
			cs.setString(4, description);
			cs.setLong(5, fee);
			cs.setLong(6, eventId);

			ResultSet rs = cs.executeQuery();
			if (rs != null && rs.next()) {
				result = rs.getInt("result");
				rs.close();
			}

			cs.clearParameters();
			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return result == 1;
	}

	public static boolean insertInventoryOfUser(long uid, String code, long eventId) throws SQLException {
		int result = -1;
		String query = "{ call uspXEInsertInventoryOfUser(?, ?, ?) }";
		Connection con = DBPoolConnection.getConnection();

		try {
			CallableStatement cs = con.prepareCall(query);
			cs.setLong(1, uid);
			cs.setString(2, code);
			cs.setLong(3, eventId);

			ResultSet rs = cs.executeQuery();
			if (rs != null && rs.next()) {
				result = rs.getInt("result");
				rs.close();
			}

			cs.clearParameters();
			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error("Player " + uid + " -----"+ex.getMessage());
		} finally {
			con.close();
		}

		return result == 1;
	}

	public static boolean updateUserMoney(long uid, long numOfXeeng, long numOfGold, long boughtGold) throws SQLException {
		boolean success = false;
		String query = "{call uspXEUpdateUserMoney(?, ?, ?, ?) }";
		Connection con = DBPoolConnection.getConnection();

		try {
			CallableStatement cs = con.prepareCall(query);
			cs.setLong(1, uid);
			cs.setLong(2, numOfXeeng);
			cs.setLong(3, numOfGold);
			cs.setLong(4, boughtGold);
			cs.execute();

			cs.clearParameters();
			cs.close();

			success = true;
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return success;
	}

	public static boolean insertExchangeLog(XEExchangeLogEntity exchangeLog) throws SQLException {
		boolean success = false;
		String query = "{call uspXEInsertExchangeLog(?, ?, ?, ?, ?, ?, ?, ?, ?, ?) }";
		Connection con = DBPoolConnection.getConnection();

		try {
			CallableStatement cs = con.prepareCall(query);
			cs.setLong(1, exchangeLog.getUserId());

			cs.setLong(2, exchangeLog.getFromValue());
			cs.setObject(3, exchangeLog.getFromType());
			cs.setLong(4, exchangeLog.getToValue());
			cs.setObject(5, exchangeLog.getToType());

			cs.setObject(6, exchangeLog.getMessage());

			cs.setLong(7, exchangeLog.getFromValueBefore());
			cs.setLong(8, exchangeLog.getFromValueAfter());
			cs.setLong(9, exchangeLog.getToValueBefore());
			cs.setLong(10, exchangeLog.getToValueAfter());

			cs.execute();

			cs.clearParameters();
			cs.close();

			success = true;
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return success;
	}

	public static boolean insertPrivateMessage(XEPrivateMessageEntity pm) throws SQLException {
		boolean success = false;
		String query = "{call uspXEInsertPrivateMessage(?, ?, ?, ?) }";
		Connection con = DBPoolConnection.getConnection();

		try {
			CallableStatement cs = con.prepareCall(query);
			cs.setLong(1, pm.getFromUserId());
			cs.setLong(2, pm.getToUserId());
			cs.setObject(3, pm.getTitle());
			cs.setObject(4, pm.getContent());

			cs.execute();

			cs.clearParameters();
			cs.close();

			success = true;
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return success;
	}

	public static List<XEPrivateMessageEntity> getAllPrivateMessages(long userId, int numOfDay) throws SQLException {
		String query = "{call uspXEGetAllPrivateMessages(?, ?) }";
		Connection con = DBPoolConnection.getConnection();
		List<XEPrivateMessageEntity> pms = null;

		try {
			CallableStatement cs = con.prepareCall(query);
			cs.setLong(1, userId);
			cs.setInt(2, numOfDay);

			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				pms = new ArrayList<XEPrivateMessageEntity>();

				while (rs.next()) {
					XEPrivateMessageEntity pm = new XEPrivateMessageEntity();

					pm.setId(rs.getInt("id"));
					pm.setFromUserId(rs.getLong("fromUserId"));
					pm.setToUserId(rs.getLong("toUserId"));
					pm.setTitle(rs.getObject("title").toString());
					pm.setContent(rs.getObject("content").toString());
					pm.setDateSent(rs.getTimestamp("dateSent"));

					pms.add(pm);
				}

				rs.close();
			}

			cs.clearParameters();
			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return pms;
	}

	public static List<XEPrivateMessageEntity> getChatMessages(long sentId, long receivedId, int offset, int limit) throws SQLException {
		String query = "{call uspXEGetChatMessages(?, ?, ?, ?) }";
		Connection con = DBPoolConnection.getConnection();
		List<XEPrivateMessageEntity> pms = null;

		try {
			CallableStatement cs = con.prepareCall(query);
			cs.setLong(1, sentId);
			cs.setLong(2, receivedId);
			cs.setInt(3, offset);
			cs.setInt(4, limit);
			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				pms = new ArrayList<XEPrivateMessageEntity>();

				while (rs.next()) {
					XEPrivateMessageEntity pm = new XEPrivateMessageEntity();

					pm.setId(rs.getInt("id"));
					pm.setFromUserId(rs.getLong("fromUserId"));
					pm.setToUserId(rs.getLong("toUserId"));
					pm.setTitle(rs.getObject("title").toString());
					pm.setContent(rs.getObject("content").toString());
					pm.setDateSent(rs.getTimestamp("dateSent"));
					pm.setDetail(true);

					pms.add(pm);
				}

				rs.close();
			}

			cs.clearParameters();
			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return pms;
	}

	public static XEPrivateMessageEntity getPrivateMessage(long id) throws SQLException {
		String query = "{call uspXEGetPrivateMessage(?) }";
		Connection con = DBPoolConnection.getConnection();
		XEPrivateMessageEntity pm = null;

		try {
			CallableStatement cs = con.prepareCall(query);
			cs.setLong(1, id);
			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				if (rs.next()) {
					pm = new XEPrivateMessageEntity();
					pm.setId(rs.getInt("id"));
					pm.setFromUserId(rs.getLong("fromUserId"));
					pm.setToUserId(rs.getLong("toUserId"));
					pm.setTitle(rs.getObject("title").toString());
					pm.setContent(rs.getObject("content").toString());
					pm.setDateSent(rs.getTimestamp("dateSent"));
				}

				rs.close();
			}

			cs.clearParameters();
			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return pm;
	}

	/**
	 * Encode một tập các param.
	 *
	 * @param params
	 * @return
	 */
	public static String serializeParams(Object... params) {
		StringBuilder sBuilder = new StringBuilder();
		if (params.length > 0) {
			int i;
			for (i = 0; i < params.length - 1; i++) {
				sBuilder.append(String.valueOf(params[i]));
				sBuilder.append(AIOConstants.SEPERATOR_BYTE_1);
			}
			sBuilder.append(String.valueOf(params[i]));
		}
		return sBuilder.toString();
	}

	public static String serializeList(List objs) {
		return serializeList(objs, AIOConstants.SEPERATOR_BYTE_2);
	}

	public static String serializeList(List objs, final String seperator) {
		StringBuilder sBuilder = new StringBuilder();
		if (objs.size() > 0) {
			int i;
			for (i = 0; i < objs.size() - 1; i++) {
				sBuilder.append(objs.get(i).toString());
				sBuilder.append(seperator);
			}
			sBuilder.append(objs.get(i).toString());
		}
		return sBuilder.toString();
	}

	public static String getAndEncodeAllShopItems() {
		try {
			String entity;
			if (isUseCache) {
				MemcacheClientPool pool = CacheUserInfo.getCachedPool();
				IMemcacheClient client = pool.borrowClient();
				String key = XE_CACHE_NAMESPACE + "_ShopItems";
				entity = (String) client.get(key);
				mLog.debug("Get from cache: " + entity);
				if (entity == null) {
					entity = serializeList(getAllShopItemsFromDB(), AIOConstants.SEPERATOR_BYTE_2);
					mLog.debug("Get from DB: " + entity + "_");
					client.set(key, XE_CACHE_TIMEOUT, entity);
				}
				pool.returnClient(client);
			} else {
				entity = serializeList(getAllShopItemsFromDB(), AIOConstants.SEPERATOR_BYTE_2);
			}
			return entity;
		} catch (SQLException ex) {
			mLog.error(ex.getMessage(), ex);
			return null;
		}
	}

	public static ArrayList<String> loadPredefinedTableNames() throws SQLException {
		String query = "{call uspXEGetPredefinedTableNames() }";
		Connection con = DBPoolConnection.getConnection();
		ArrayList<String> retList = null;

		try {
			CallableStatement cs = con.prepareCall(query);
			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				retList = new ArrayList<String>();
				while (rs.next()) {
					retList.add(rs.getString("table_name"));
				}

				rs.close();
			}

			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return retList;
	}

	public static List<XELevelItem> getAllLevelItemsFromDB(int zoneId) throws SQLException {
		String query = "{call uspXEGetAllLevels(?) }";
		Connection con = DBPoolConnection.getConnection();
		List<XELevelItem> retList = null;

		try {
			CallableStatement cs = con.prepareCall(query);
			cs.setInt(1, zoneId);
			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				retList = new ArrayList<XELevelItem>();
				while (rs.next()) {
					retList.add(new XELevelItem(rs.getInt("levelId"), rs.getString("level"), rs.getInt("minCash"), rs.getString("cashList"), rs.getInt("isVip")));
				}

				rs.close();
			}

			cs.clearParameters();
			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return retList;
	}

	public static String getAndEncodeAllLevelItems(int zoneId) {
		try {
			String entity = null;
			if (isUseCache) {
				MemcacheClientPool pool = CacheUserInfo.getCachedPool();
				IMemcacheClient client = pool.borrowClient();
				String key = XE_CACHE_NAMESPACE + "_LevelItems" + zoneId;
				entity = (String) client.get(key);
				mLog.debug("Get from cache: " + entity);
				if (entity == null) {
					entity = serializeList(getAllLevelItemsFromDB(zoneId), AIOConstants.SEPERATOR_BYTE_2);
					mLog.debug("Get from DB: " + entity);
					client.set(key, XE_CACHE_TIMEOUT_4LEVELS, entity);
				}
				pool.returnClient(client);
			} else {
				entity = serializeList(getAllLevelItemsFromDB(zoneId), AIOConstants.SEPERATOR_BYTE_2);
			}
			return entity;
		} catch (Exception ex) {
			mLog.error(ex.getMessage(), ex);
			return null;
		}
	}

	public static List<Room> getTablesByLevelFromZone(Zone zone, int levelID) {
		return zone.xeGetTablesByLevel(levelID);
	}

	public static String getAndEncodeTablesInZone(Zone zone, int levelID) {
		try {
			/* Note (thanhnvt): 
			 * Em bỏ cache do gặp lỗi người chơi khác không thấy những bàn vừa được tạo (API FastPlay).
			 * Danh sách bàn chơi available em nghĩ thay đổi liên tục nên có thể tạm bỏ cache cũng được 
			 */
			String entity = null;
//            if (isUseCache) {
//                MemcacheClientPool pool = CacheUserInfo.getCachedPool();
//                IMemcacheClient client = pool.borrowClient();
//                String key = XE_CACHE_NAMESPACE + "_Zone" + zone.getZoneId() + "Level" + levelID + "Tables";
//                entity = (String) client.get(key);
//                mLog.debug("Get from cache: " + entity);
//                if (entity == null) {
//                    entity = serializeList(getTablesByLevelFromZone(zone, levelID), AIOConstants.SEPERATOR_BYTE_2);
//                    mLog.debug("Get from DB: " + entity);
//                    client.set(key, XE_CACHE_TIMEOUT_4TABLELIST, entity);
//                }
//                pool.returnClient(client);
//            } else {
			entity = serializeList(getTablesByLevelFromZone(zone, levelID), AIOConstants.SEPERATOR_BYTE_2);
//            }
			return entity;
		} catch (Exception ex) {
			mLog.error(ex.getMessage(), ex);
			return null;
		}
	}

	public static List<Room> getTablesByLevel(int levelID) {
		ZoneManager zManager = Server.getWorker().getZoneManager();
		ArrayList<Room> tableList = new ArrayList<Room>();
		for (Zone zone : zManager.getZoneList()) {
			tableList.addAll(getTablesByLevelFromZone(zone, levelID));
		}
		return tableList;
	}

	public static String getAndEncodeTables(int levelID) {
		try {
			/* Note (thanhnvt): 
			 * Em bỏ cache do gặp lỗi người chơi khác không thấy những bàn vừa được tạo (API FastPlay).
			 * Danh sách bàn chơi available em nghĩ thay đổi liên tục nên có thể tạm bỏ cache cũng được 
			 */

			String entity = null;
//            if (isUseCache) {
//                MemcacheClientPool pool = CacheUserInfo.getCachedPool();
//                IMemcacheClient client = pool.borrowClient();
//                String key = XE_CACHE_NAMESPACE + "_Level" + levelID + "Tables";
//                entity = (String) client.get(key);
//                mLog.debug("Get from cache: " + entity);
//                if (entity == null) {
//                    entity = serializeList(getTablesByLevel(levelID), AIOConstants.SEPERATOR_BYTE_2);
//                    mLog.debug("Get from DB: " + entity + "_");
//                    client.set(key, XE_CACHE_TIMEOUT_4TABLELIST, entity);
//                }
//                pool.returnClient(client);
//            } else {
			entity = serializeList(getTablesByLevel(levelID), AIOConstants.SEPERATOR_BYTE_2);
//            }
			return entity;
		} catch (Exception ex) {
			mLog.error(ex.getMessage(), ex);
			return null;
		}
	}

	/**
	 * Lấy toàn bộ tin tức.
	 */
	public static List<XENewsEntity> getAllNews() throws SQLException {
		String query = "{call uspXEGetAllNews() }";
		Connection con = DBPoolConnection.getConnection();
		List<XENewsEntity> allNews = null;

		try {
			CallableStatement cs = con.prepareCall(query);
			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				allNews = new ArrayList<XENewsEntity>();

				while (rs.next()) {
					XENewsEntity news = new XENewsEntity();

					news.setId(rs.getInt("id"));
					news.setTitle(rs.getObject("title").toString());
					news.setHtmlContent(rs.getObject("htmlContent").toString());
					news.setDateCreated(rs.getDate("dateCreated"));
					news.setDateModified(rs.getDate("dateModified"));
					news.setUserCreated(rs.getLong("userCreated"));
					news.setUserModified(rs.getLong("userModified"));

					allNews.add(news);
				}

				rs.close();
			}

			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return allNews;
	}

	/**
	 * Lấy toàn bộ sự kiện.
	 */
	public static List<EventEntity> getEventFromDB() throws SQLException {
		List<EventEntity> res = null;
		String query = "{ call uspGetEvent() }";
		Connection conn = DBPoolConnection.getConnection();

		try {
			CallableStatement cs = conn.prepareCall(query);
			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				res = new ArrayList<EventEntity>();

				while (rs.next()) {
					String title = rs.getString("Name");
					String content = rs.getString("content");
					int eventId = rs.getInt("GameEventId");
					int partnerId = rs.getInt("partnerId");
					int gameId = rs.getInt("gameID");
					boolean isConcurrent = rs.getBoolean("isConcurrent");

					EventEntity entity = new EventEntity(title, content, null, eventId, gameId);
					entity.setPartnerId(partnerId);
					entity.setConcurrent(isConcurrent);
					//entity.setEventType(rs.getInt("EventType"));
					res.add(entity);
				}

				rs.close();
			}

			cs.close();
		} catch (SQLException ex) {
			conn.close();
			mLog.error(ex.getMessage());
		} finally {
			conn.close();
		}

		return res;
	}

	/**
	 * Lấy toàn bộ cấp độ người chơi.
	 */
	public static List<XEUserLevelEntity> getAllUserLevels() throws SQLException {
		List<XEUserLevelEntity> levels = null;
		String query = "{call uspXEGetUserLevels() }";
		Connection con = DBPoolConnection.getConnection();

		try {
			CallableStatement cs = con.prepareCall(query);
			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				levels = new ArrayList<XEUserLevelEntity>();
				while (rs.next()) {
					XEUserLevelEntity level = new XEUserLevelEntity();

					level.setId(rs.getInt("id"));
					level.setName(rs.getObject("name").toString());
					level.setMinGold(rs.getLong("minGold"));
					level.setMaxGold(rs.getLong("maxGold"));

					levels.add(level);
				}

				rs.close();
			}

			cs.close();

		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return levels;
	}

	/**
	 * Lấy tin tức theo id.
	 */
	public static XENewsEntity getNewsById(int id) throws SQLException {
		String query = "{call uspXEGetNewsById(?) }";
		Connection con = DBPoolConnection.getConnection();
		XENewsEntity news = null;

		try {
			CallableStatement cs = con.prepareCall(query);
			cs.setInt(1, id);

			ResultSet rs = cs.executeQuery();
			if (rs != null && rs.next()) {
				news = new XENewsEntity();
				news.setId(rs.getInt("id"));
				news.setTitle(rs.getObject("title").toString());
				news.setHtmlContent(rs.getObject("htmlContent").toString());
				news.setDateCreated(rs.getDate("dateCreated"));
				news.setDateModified(rs.getDate("dateModified"));
				news.setUserCreated(rs.getLong("userCreated"));
				news.setUserModified(rs.getLong("userModified"));

				rs.close();
			}

			cs.clearParameters();
			cs.close();
		} catch (SQLException ex) {
			con.close();
			mLog.error(ex.getMessage());
		} finally {
			con.close();
		}

		return news;
	}

	public static Room getTable(int matchID) {
		ZoneManager zManager = Server.getWorker().getZoneManager();
		for (Zone zone : zManager.getZoneList()) {
			Room r = zone.findRoom(matchID);
			if (r != null) {
				return r;
			}
		}
		return null;
	}

	public static String getAndEncodeTable(int matchID) {
		Room r = getTable(matchID);
		if (r != null) {
			return r.toString();
		}
		return null;
	}

	public static List<String> loadBlacklistWords() {
		List<String> blacklist = new ArrayList<String>();

		String blacklistContent = FileHelper.readFileUTF8("conf/blacklist_words.txt");
		for (String word : blacklistContent.split("\n")) {
			word = word.trim();
			if (!word.isEmpty()) {
				blacklist.add(word);
			}
		}

		System.out.println("[+] Loading blacklist words...");
		System.out.println(String.format("[+] Done (%d words).", blacklist.size()));

		return blacklist;
	}

	public static float getBonusPercent(long uid) {
		String query = "SELECT bonusPercent FROM workinguser, vip WHERE userId = " + uid + " AND workinguser.vipId = vip.vipId;";
		Connection conn = DBPoolConnection.getConnection();
		Statement stm;
		try {
			stm = conn.createStatement();
			ResultSet rs = stm.executeQuery(query);
			float bonus = 0;
			while(rs.next()){
				bonus = rs.getFloat(1);
			}
			return bonus;
		} catch (SQLException ex) {
			java.util.logging.Logger.getLogger(XEDataUtils.class.getName()).log(Level.SEVERE, null, ex);
		}
		return 0;
	}
}
