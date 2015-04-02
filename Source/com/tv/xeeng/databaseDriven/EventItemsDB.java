/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.databaseDriven;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.game.data.EventItemEntity;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;

/**
 *
 * @author thangtd
 */
public class EventItemsDB {

	private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(EventItemsDB.class);

	private static List<EventItemEntity> openLstItems = new ArrayList<EventItemEntity>();
	private static List<EventItemEntity> joinLstItems = new ArrayList<EventItemEntity>();
	private static List<EventItemEntity> lostLstItems = new ArrayList<EventItemEntity>();
	private static List<EventItemEntity> wonLstItems = new ArrayList<EventItemEntity>();
	private static List<EventItemEntity> gameSpecificLstItems = new ArrayList<EventItemEntity>();

	public static void reload() {
		try {
			List<EventItemEntity> lstItems = getEventItemsFromDB();

			int wonType = 1;
			int lostType = 2;
			int joinType = 3;
			int openType = 4;

			for (EventItemEntity item : lstItems) {
				if (item.getType() == lostType) {
					lostLstItems.add(item);
				} else if (item.getType() == wonType) {
					wonLstItems.add(item);
				} else if (item.getType() == openType) {
					openLstItems.add(item);
				}
				if (item.isIsUsable() == true) {
					joinLstItems.add(item);
				}
			}

			mLog.debug("[EVENT ITEMS] : " + lstItems.size() + " items");

			gameSpecificLstItems = getGameSpecificEventItemsFromDB();

			mLog.debug("[GAME SPECIFIC EVENT ITEMS] : " + gameSpecificLstItems.size() + " items");
		} catch (SQLException ex) {
			mLog.error(ex.getMessage(), ex);
		}
	}

	private static List<EventItemEntity> getEventItemsFromDB() throws SQLException {
		List<EventItemEntity> res = new ArrayList<EventItemEntity>();
		String query = "{ call uspXEGetAllEventItems() }";
		Connection conn = DBPoolConnection.getConnection();
		try {
			CallableStatement cs = conn.prepareCall(query);

			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					long eventId = rs.getLong("eventId");
					String code = rs.getString("code");
					String name = rs.getString("name");
					String description = rs.getString("description");
					float rate = rs.getFloat("rate");
					int type = rs.getInt("type");
					int quantity = rs.getInt("quantity");
					boolean isUsable = rs.getBoolean("isUsable");
					String components = rs.getString("components");
					long fee = rs.getLong("fee");
					int limit = rs.getInt("limit");
					String feeType = rs.getString("feeType");

					EventItemEntity entity = new EventItemEntity(eventId, code, name, description, rate, type,
						quantity, isUsable, components, fee, limit, feeType);
					res.add(entity);
				}

				rs.close();
			}

			cs.close();
		} catch (Throwable ex) {
			conn.close();
			mLog.error(ex.getMessage(), ex);
		} finally {
			conn.close();
		}
		return res;
	}

	private static List<EventItemEntity> getGameSpecificEventItemsFromDB() throws SQLException {
		List<EventItemEntity> res = new ArrayList<EventItemEntity>();
		String query = "{ call uspXEGetGameSpecificEventItems() }";
		Connection conn = DBPoolConnection.getConnection();
		try {
			CallableStatement cs = conn.prepareCall(query);

			ResultSet rs = cs.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					long eventId = rs.getLong("eventId");
					String code = rs.getString("code");
					String name = rs.getString("name");
					String description = rs.getString("description");
					float rate = rs.getFloat("rate");
					int type = rs.getInt("type");
					int quantity = rs.getInt("quantity");
					boolean isUsable = rs.getBoolean("isUsable");
					String components = rs.getString("components");
					long fee = rs.getLong("fee");
					int limit = rs.getInt("limit");
					String feeType = rs.getString("feeType");

					EventItemEntity entity = new EventItemEntity(eventId, code, name, description, rate, type,
						quantity, isUsable, components, fee, limit, feeType);
					res.add(entity);
				}

				rs.close();
			}

			cs.close();
		} catch (Throwable ex) {
			conn.close();
			mLog.error(ex.getMessage(), ex);
		} finally {
			conn.close();
		}
		return res;
	}

	public static List<EventItemEntity> getLostListItems() {
		return lostLstItems;
	}

	public static List<EventItemEntity> getWonListItems() {
		return wonLstItems;
	}

	public static List<EventItemEntity> getJoinListItems() {
		return joinLstItems;
	}

	public static List<EventItemEntity> getOpenListItems() {
		return openLstItems;
	}

	public static List<EventItemEntity> getGameSpecificListItems() {
		return gameSpecificLstItems;
	}
}
