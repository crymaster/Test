package com.tv.xeeng.game.room;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.memcached.data.XEDataUtils;
import java.sql.SQLException;

import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;

public class XEGameConstants {

    public static final List<String> BLACKLIST_WORDS = XEDataUtils.loadBlacklistWords();

    public static List<String> TABLE_NAMES = null;
    private static Random rangen = new Random();
    
    private static org.slf4j.Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEGameConstants.class);

    static {
        try {
            TABLE_NAMES = XEDataUtils.loadPredefinedTableNames();
        } catch (SQLException ex) {
            mLog.error(ex.getMessage());
        }
    }

    public int getRandom(int max) {
        return rangen.nextInt(max);
    }

    public static String getRandomName() {
        return TABLE_NAMES.get(rangen.nextInt(TABLE_NAMES.size()));
    }
}
