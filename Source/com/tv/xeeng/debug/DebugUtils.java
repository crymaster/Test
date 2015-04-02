package com.tv.xeeng.debug;

import org.slf4j.Logger;
import com.tv.xeeng.base.common.LoggerContext;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.tv.xeeng.game.room.Phong;
import java.lang.reflect.Modifier;
import java.util.Enumeration;
import java.util.concurrent.ConcurrentHashMap;

public class DebugUtils {
    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(DebugUtils.class);
    public static void dump(Object obj) {
        try {
            GsonBuilder builder = new GsonBuilder();
            Gson gson = builder.excludeFieldsWithModifiers(Modifier.TRANSIENT).setPrettyPrinting().create();
            mLog.debug(gson.toJson(obj));
        } catch (Exception e) {
            e.printStackTrace();
            mLog.error("Exception on dump (gson error)");
        }
    }
    private static void dumpAPhong(StringBuilder sb, Phong phongObj) {
        sb.append("{");
        sb.append("id:").append("" + phongObj.id).
                append(", level:").append(phongObj.level).
                append(", zoneid:").append(phongObj.zoneID);
        sb.append("},\n");
    }
    public static void dumpPhongs(ConcurrentHashMap<Integer, Phong> phongs) {
        Enumeration <Integer> it = phongs.keys();
        StringBuilder sb = new StringBuilder();
        while( it.hasMoreElements() ) {
            Phong phongObj = phongs.get(it.nextElement());
            dumpAPhong(sb, phongObj);
        }
        mLog.debug("[DEBUGUTILS]" + sb.toString());
    }
}
