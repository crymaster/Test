/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.databaseDriven;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.game.data.XELogRouletteEntity;
import com.tv.xeeng.game.data.XERouletteInfoEntity;
import com.tv.xeeng.game.data.XERouletteItemEntity;
import com.tv.xeeng.memcached.data.XEGlobalCache;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.slf4j.Logger;

/**
 *
 * @author thangtd
 */
public class RouletteDB {

    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(RouletteDB.class);

    private static List<XERouletteInfoEntity> listInfos = new ArrayList<XERouletteInfoEntity>();
    private static List<XERouletteItemEntity> listItems = new ArrayList<XERouletteItemEntity>();
    private static HashMap<String, XELogRouletteEntity> logCached = new HashMap<String, XELogRouletteEntity>();

    private static final String MEMCACHED_NAME = "RouletteStatus";
    
    public static final int MAX_ROULETTE_ROUND = 3;

    public static void reload() {
        try {
            listInfos = getRouletteInfoFromDB();
            mLog.debug("[ROULETTE INFOS] : " + listInfos.size() + " infos");

            listItems = getRouletteItemFromDB();
            mLog.debug("[ROULETTE ITEMS] : " + getListItems().size() + " items");
        } catch (SQLException ex) {
            mLog.error(ex.getMessage(), ex);
        }
    }

    private static List<XERouletteInfoEntity> getRouletteInfoFromDB() throws SQLException {
        List<XERouletteInfoEntity> res = new ArrayList<XERouletteInfoEntity>();
        String query = "{ call uspXEGetRouletteInfo() }";
        Connection conn = DBPoolConnection.getConnection();
        try {
            CallableStatement cs = conn.prepareCall(query);

            ResultSet rs = cs.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    long value = rs.getLong("value");
                    String type = rs.getString("type");
                    int level = rs.getInt("level");

                    XERouletteInfoEntity entity = new XERouletteInfoEntity();
                    entity.setValue(value);
                    entity.setType(type);
                    entity.setLevel(level);
                    res.add(entity);
                }

                rs.close();
            }

            cs.close();
        } catch (SQLException ex) {
            conn.close();
            mLog.error(ex.getMessage(), ex);
        } finally {
            conn.close();
        }
        return res;
    }

    private static List<XERouletteItemEntity> getRouletteItemFromDB() throws SQLException {
        List<XERouletteItemEntity> res = new ArrayList<XERouletteItemEntity>();
        String query = "{ call uspXEGetAllRouletteItems() }";
        Connection conn = DBPoolConnection.getConnection();
        try {
            CallableStatement cs = conn.prepareCall(query);

            ResultSet rs = cs.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    int round = rs.getInt("round");
                    String lastItem = rs.getString("lastItem");
                    String nextItem = rs.getString("nextItem");
                    float rate = rs.getFloat("rate");
                    float price = rs.getFloat("price");
                    boolean isStop = rs.getBoolean("isStop");
                    int level = rs.getInt("level");

                    XERouletteItemEntity entity = new XERouletteItemEntity();
                    entity.setRound(round);
                    entity.setLastItem(lastItem);
                    entity.setNextItem(nextItem);
                    entity.setRate(rate);
                    entity.setPrice(price);
                    entity.setStop(isStop);
                    entity.setLevel(level);
                    res.add(entity);
                }

                rs.close();
            }

            cs.close();
        } catch (SQLException ex) {
            conn.close();
            mLog.error(ex.getMessage(), ex);
        } finally {
            conn.close();
        }
        return res;
    }
    
    public static List<XELogRouletteEntity> getRouletteHistoryFromDB() throws SQLException {
        List<XELogRouletteEntity> res = new ArrayList<XELogRouletteEntity>();
        String query = "{ call uspXEGetRouletteLog() }";
        Connection conn = DBPoolConnection.getConnection();
        try {
            CallableStatement cs = conn.prepareCall(query);

            ResultSet rs = cs.executeQuery();
            if (rs != null) {
                while (rs.next()) {
                    String userName = rs.getString("name");
                    int round = rs.getInt("round");
                    long value = rs.getLong("value");
                    String priceType = rs.getString("priceType");
                    Timestamp date = rs.getTimestamp("date");

                    XELogRouletteEntity entity = new XELogRouletteEntity();
                    entity.setUserName(userName);
                    entity.setRound(round);
                    entity.setValue(value);
                    entity.setPriceType(priceType);
                    entity.setDate(date);
                    res.add(entity);
                }

                rs.close();
            }

            cs.close();
        } catch (SQLException ex) {
            conn.close();
            mLog.error(ex.getMessage(), ex);
        } finally {
            conn.close();
        }
        return res;
    }

    public static void startRoulette(long uid, long fee, String type) throws SQLException {
        String query = "{ call uspXEStartRoulette(?, ?, ?) }";
        Connection con = DBPoolConnection.getConnection();

        try {
            CallableStatement cs = con.prepareCall(query);
            cs.setLong(1, uid);
            cs.setLong(2, fee);
            cs.setString(3, type);

            cs.execute();

            cs.clearParameters();
            cs.close();
        } catch (SQLException ex) {
            con.close();
            mLog.error(ex.getMessage());
        } finally {
            con.close();
        }
    }
    
    public static void endRoulette(XELogRouletteEntity entity) throws SQLException {
        String query = "{ call uspXEEndRoulette(?, ?, ?, ?, ?, ?) }";
        Connection con = DBPoolConnection.getConnection();

        try {
            CallableStatement cs = con.prepareCall(query);
            cs.setLong(1, entity.getUserId());
            cs.setInt(2, entity.getRound());
            cs.setString(3, entity.getItem());
            cs.setLong(4, entity.getFee());
            cs.setString(5, entity.getFeeType());
            cs.setFloat(6, entity.getPrice());

            cs.execute();

            cs.clearParameters();
            cs.close();
        } catch (SQLException ex) {
            con.close();
            mLog.error(ex.getMessage());
        } finally {
            con.close();
        }
    }

    public static void setCacheUserRouletteStatus(XELogRouletteEntity entity) {
        String key = MEMCACHED_NAME + "-" + entity.getUserId();
//        XEGlobalCache.setCache(key, entity, XEGlobalCache.TIMEOUT_30_MIN);
        
        logCached.put(key, entity);
    }

    public static XELogRouletteEntity getCacheUserRouletteStatus(long uid) {
        String key = MEMCACHED_NAME + "-" + uid;
//        return (XELogRouletteEntity) XEGlobalCache.getCache(key);
        
        return logCached.get(key);
    }

    public static void deleteCacheUserRouletteStatus(long uid) {
        String key = MEMCACHED_NAME + "-" + uid;
//        XEGlobalCache.deleteCache(key);
        
        logCached.remove(key);
    }

    /**
     * @return the listInfos
     */
    public static List<XERouletteInfoEntity> getListInfos() {
        return listInfos;
    }

    /**
     * @return the listItems
     */
    public static List<XERouletteItemEntity> getListItems() {
        return listItems;
    }
}
