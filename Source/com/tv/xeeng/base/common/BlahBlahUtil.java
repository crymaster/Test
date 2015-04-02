package com.tv.xeeng.base.common;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.logging.Log;
import org.slf4j.Logger;

/**
 * Created by thanhnvt on 23/06/2014.
 */
public class BlahBlahUtil {
	private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(BlahBlahUtil.class);
	
	private static final Map<String, String> PARTNER_ID_MAP;

	static {
		PARTNER_ID_MAP = new HashMap<>();

		PARTNER_ID_MAP.put("92", "94");
		PARTNER_ID_MAP.put("93", "95");
		PARTNER_ID_MAP.put("99", "95"); // Google play
		PARTNER_ID_MAP.put("98", "96"); // Mobigate
	}

	public static String getLogString(String s) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		return String.format("%s: %s\n", format.format(new Date()), s);
	}

	public static boolean isEmptyString(String s) {
		return s == null || s.trim().length() == 0;
	}

	public static boolean hasEmptyString(String... ss) {
		for (String s : ss) {
			if (isEmptyString(s)) {
				return true;
			}
		}

		return false;
	}

	/**
	 * Convert CPI-tracking embedded partner id to "normal" partner id for
	 * payment [PROTOTYPE]
	 *
	 * @param partnerId
	 * @return
	 */
	public static String convertParnterId(int partnerId) {
		String partnerIdStr = Integer.toString(partnerId);
		String paymentId = partnerIdStr.substring(0, 2);

		mLog.debug("[PARTNER_ID_CONVERT] PartnerIdStr: " + partnerIdStr + ", paymentId: " + paymentId + ", convertedPartnerId: " + PARTNER_ID_MAP.get(paymentId));
		if (PARTNER_ID_MAP.get(paymentId) != null) {
			return PARTNER_ID_MAP.get(paymentId);
		}
		return paymentId;
	}
}
