package com.tv.xeeng.game.data;

import com.tv.xeeng.base.common.LoggerContext;
import com.tv.xeeng.base.common.ServerException;
import com.tv.xeeng.base.protocol.messages.XENotifyEventItemResponse;
import com.tv.xeeng.base.session.ISession;
import com.tv.xeeng.databaseDriven.DBCache;
import com.tv.xeeng.databaseDriven.EventItemsDB;
import com.tv.xeeng.memcached.data.XEDataUtils;
import com.tv.xeeng.memcached.data.XEGlobalCache;
import com.tv.xeeng.protocol.MessageFactory;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;
import org.slf4j.Logger;

public class SimplePlayer {

	private static Logger mLog = LoggerContext.getLoggerFactory().getLogger(SimplePlayer.class);
	private static final String MEMCACHE_INGAMEEVENT = "InGameEvents";

	public int level;
	public int avatarID;
	public String username;
	public boolean isStop;
	public long id;
	public long moneyForBet;   //bet money. There 2 types of money: default money and bet money
	public boolean isWin;
	public boolean isGiveUp;
	public long cash;
	public long currentMatchID;
	public ISession currentOwner;
	public ISession currentSession;
	public boolean isReady = false;
	public int index;
	public int pos;
	public boolean isOut = false;
	private int experience;
	protected long wonMoney;
	private long lastActivated;

	public boolean isMonitor = false; // like isObserve of phom
	private static final int TIMES = 4;
	private long betOther; //for bet together game 3 cay
	private long multiBetMoney;

	private boolean chan; //for game xocDia;

	private boolean confirmBetOther = false;

	protected boolean showHand = false;

	private long betChan;
	private long betLe;

	public int vipId;

	public boolean notEnoughMoney() {
		//System.out.println("cash " + cash + " moneyForBet: " + moneyForBet);
		if (cash < TIMES * moneyForBet) {
			return true;
		}

		return false;
	}

	public void write(Object obj) {
		try {
			this.currentSession.write(obj);
		} catch (ServerException e) {
			// TODO: handle exception
		}
	}

//    public void setCurrentOwner(ISession currentOwner) {
//        this.currentOwner = currentOwner;
//    }
	// event purpose - Added by ThangTD
	public void checkEvent(int zoneId, boolean isWin) throws ServerException, SimpleException {
		try {
			if (!DBCache.isLoadMonthlyEvent) {
				return;
			}

			List<EventItemEntity> itemsList;
			List<EventItemEntity> gsList = null;
			List<XEInGameEventEntity> eventList = null;
			List<String> droppedItem = new ArrayList<>();
			Object raw = XEGlobalCache.getCache(MEMCACHE_INGAMEEVENT);

			if (raw != null) {
				eventList = (List<XEInGameEventEntity>) raw;
			} else {
				try {
					eventList = XEDataUtils.getAllInGameEventsFromDB();
				} catch (SQLException ex) {
					mLog.error(ex.getMessage());
				}
				if (eventList != null) {
					XEGlobalCache.setCache(MEMCACHE_INGAMEEVENT, eventList, XEGlobalCache.TIMEOUT_30_MIN);
				}
			}
			System.out.println("[CHECKEVENT] eventList.size() = " + eventList.size());

			if (isWin) {
				itemsList = EventItemsDB.getWonListItems();
			} else {
				itemsList = EventItemsDB.getLostListItems();
			}

			if (zoneId == ZoneID.BINH) {
				gsList = EventItemsDB.getGameSpecificListItems();
			}

			if (eventList != null) {
				for (int j = 0; j < eventList.size(); j++) {
					XEInGameEventEntity event = eventList.get(j);
					if (itemsList != null) {
						// Get random item with fixed rate
						Random ran = new Random();
						float sum = 0;
						float value = ran.nextFloat() * 100;
						int idx = -1;

						for (int i = 0; i < itemsList.size(); i++) {
							EventItemEntity item = (EventItemEntity) itemsList.get(i);
							if (item.getEventId() == event.getId()) {
								if ((value >= sum) && (value < (sum + item.getRate())) && (item.getQuantity() != 0)) {
									idx = i;
									break;
								}

								sum += item.getRate();
							}
						}

						// Item found
						if (idx != -1) {
							EventItemEntity entity = (EventItemEntity) itemsList.get(idx);
							if (null != entity) {
								if (XEDataUtils.insertInventoryOfUser(this.id, entity.getCode(), entity.getEventId())) {
//                        mLog.debug("--- THANGTD EVENT ITEM --- " + this.username + " got item " + entity.getName());

									droppedItem.add(entity.getName());
//									if (this.currentSession != null && this.currentSession.getMessageFactory() != null) {
//										try {
//											MessageFactory msgFactory = this.currentSession.getMessageFactory();
//											XENotifyEventItemResponse notifyRespone = (XENotifyEventItemResponse) msgFactory.getResponseMessage(MessagesID.NOTIFY_EVENT_ITEM);
//									notifyRespone.setResult(ResponseCode.SUCCESS, "Bạn đã nhận được \"" + entity.getName() + "\"");
//											this.currentSession.write(notifyRespone);
//										} catch (Exception e) {
//											mLog.error("Error writting notify response");
//										}
//									}
								}
							}
						}
					}
				}
			}

			//////For game specific event
			if (gsList != null) {
				// Get random item with fixed rate
				Random ran = new Random();
				float sum = 0;
				float value = ran.nextFloat() * 100;
				int idx = -1;

				for (int i = 0; i < gsList.size(); i++) {
					EventItemEntity item = (EventItemEntity) gsList.get(i);
					if ((value >= sum) && (value < (sum + item.getRate())) && (item.getQuantity() != 0)) {
						idx = i;
						break;
					}

					sum += item.getRate();
				}

				// Item found
				if (idx != -1) {
					EventItemEntity entity = (EventItemEntity) gsList.get(idx);
					if (null != entity) {
						if (XEDataUtils.insertInventoryOfUser(this.id, entity.getCode(), entity.getEventId())) {
							mLog.debug("--- SONNH GAME SPECIFIC EVENT ITEM --- " + this.username + " got item " + entity.getName());
							droppedItem.add(entity.getName());

						}
					}
				}
			}
			if (this.currentSession != null && this.currentSession.getMessageFactory() != null && droppedItem.size() > 0) {
				try {
					MessageFactory msgFactory = this.currentSession.getMessageFactory();
					XENotifyEventItemResponse notifyRespone = (XENotifyEventItemResponse) msgFactory.getResponseMessage(MessagesID.NOTIFY_EVENT_ITEM);
					String res = "Bạn đã nhận được ";
					for (int i = 0; i < droppedItem.size() - 1; i++) {
						String item = droppedItem.get(i);
						res += "\"" + item + "\", ";
					}
					res += droppedItem.get(droppedItem.size() - 1);
					notifyRespone.setResult(ResponseCode.SUCCESS, res);
					this.currentSession.write(notifyRespone);
				} catch (Exception e) {
					mLog.error("MatchId: " + currentMatchID + " - ZoneId: " + zoneId + " -  Error writting notify response");
					mLog.error(e.getMessage());
				}
			}
		} catch (Exception e) {
			mLog.error("Error update game specific event items");
		}
	}
	// End added

	/**
	 * @return the experience
	 */
	public int getExperience() {
		return experience;
	}

	/**
	 * @param experience the experience to set
	 */
	public void setExperience(int experience) {
		this.experience = experience;
	}

	public long moneyLost(long money_) {
		if (this.cash <= 0) {
			return 0;
		} else if (this.cash < money_) {
			return this.cash;
		} else {
			return money_;
		}
	}

	/**
	 * @return the wonMoney
	 */
	public long getWonMoney() {
		return wonMoney;
	}

	/**
	 * @param wonMoney the wonMoney to set
	 */
	public void setWonMoney(long wonMoney) {
		this.wonMoney = wonMoney;
	}

	/**
	 * @return the lastActivated
	 */
	public long getLastActivated() {
		return lastActivated;
	}

	/**
	 * @param lastActivated the lastActivated to set
	 */
	public void setLastActivated(long lastActivated) {
		this.lastActivated = lastActivated;
	}

	public void setReady(boolean isReady) {
		this.isReady = isReady;
	}

	public SimplePlayer clone() {
		SimplePlayer player = new SimplePlayer();
		player.id = this.id;
		player.currentSession = this.currentSession;
		player.isOut = this.isOut;
		return player;
	}

	/**
	 * @return the betOther
	 */
	public long getBetOther() {
		return betOther;
	}

	/**
	 * @param betOther the betOther to set
	 */
	public void setBetOther(long betOther) {
		this.betOther = betOther;
	}

	/**
	 * @return the multiBetMoney
	 */
	public long getMultiBetMoney() {
		return multiBetMoney;
	}

	/**
	 * @param multiBetMoney the multiBetMoney to set
	 */
	public void setMultiBetMoney(long multiBetMoney) {
		this.multiBetMoney = multiBetMoney;
	}

	/**
	 * @return the showHand
	 */
	public boolean isShowHand() {
		return showHand;
	}

	/**
	 * @param showHand the showHand to set
	 */
	public void setShowHand(boolean showHand) {
		this.showHand = showHand;
	}

	/**
	 * @return the confirmBetOther
	 */
	public boolean isConfirmBetOther() {
		return confirmBetOther;
	}

	/**
	 * @param confirmBetOther the confirmBetOther to set
	 */
	public void setConfirmBetOther(boolean confirmBetOther) {
		this.confirmBetOther = confirmBetOther;
	}

	/**
	 * @return the chan
	 */
	public boolean isChan() {
		return chan;
	}

	/**
	 * @param chan the chan to set
	 */
	public void setChan(boolean chan) {
		this.chan = chan;
	}

	/**
	 * @return the betChan
	 */
	public long getBetChan() {
		return betChan;
	}

	/**
	 * @param betChan the betChan to set
	 */
	public void setBetChan(long betChan) {
		this.betChan = betChan;
	}

	/**
	 * @return the betLe
	 */
	public long getBetLe() {
		return betLe;
	}

	/**
	 * @param betLe the betLe to set
	 */
	public void setBetLe(long betLe) {
		this.betLe = betLe;
	}

	public void setAvatarID(int avatarID) {
		this.avatarID = avatarID;
	}

	public void setLevel(int level) {
		this.level = level;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public void setCash(long c) {
		this.cash = c;
	}

}
