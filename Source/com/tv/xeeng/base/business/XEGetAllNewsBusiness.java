package com.tv.xeeng.base.business;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XEGetAllNewsRequest;
import com.tv.xeeng.base.protocol.messages.XEGetAllNewsResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.game.data.ResponseCode;
import com.tv.xeeng.game.data.XENewsEntity;
import com.tv.xeeng.memcached.data.XEDataUtils;
import static com.tv.xeeng.memcached.data.XEDataUtils.serializeList;
import com.tv.xeeng.memcached.data.XEGlobalCache;
import com.tv.xeeng.protocol.AbstractBusiness;
import com.tv.xeeng.protocol.IRequestMessage;
import com.tv.xeeng.protocol.IResponsePackage;
import com.tv.xeeng.protocol.MessageFactory;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import org.slf4j.Logger;

public class XEGetAllNewsBusiness extends AbstractBusiness {

    private static final Logger mLog = LoggerContext.getLoggerFactory().getLogger(XEGetAllNewsBusiness.class);
    private static final String MEMCACHED_NAME = "AllNews";

    @Override
    public int handleMessage(ISession aSession, IRequestMessage aReqMsg, IResponsePackage aResPkg) throws ServerException {
        mLog.debug("[GET ALL NEWS]: ");

        MessageFactory msgFactory = aSession.getMessageFactory();
        XEGetAllNewsResponse res = (XEGetAllNewsResponse) msgFactory.getResponseMessage(aReqMsg.getID());
        res.session = aSession;
        XEGetAllNewsRequest rq = (XEGetAllNewsRequest) aReqMsg;

        Object raw = XEGlobalCache.getCache(MEMCACHED_NAME);
        List<XENewsEntity> allNews = null;

        if (raw != null) {
            allNews = (List<XENewsEntity>) raw;
        }

        if (allNews == null) {
            try {
                allNews = XEDataUtils.getAllNews();
            } catch (SQLException ex) {
                mLog.error(ex.getMessage());
            }

            XEGlobalCache.setCache(MEMCACHED_NAME, allNews, XEGlobalCache.TIMEOUT_30_MIN);
        }

        if (allNews == null) {
            res.mCode = ResponseCode.FAILURE;
            res.setSerializedString("Không lấy được tin tức.");
        } else {
            res.mCode = ResponseCode.SUCCESS;
            res.setSerializedString(serializeList(allNews));
        }

        aResPkg.addMessage(res);

        return 1;
    }
}
