/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.tv.xeeng.game.data;

/**
 *
 * @author thangtd
 */
public class XERouletteItemEntity {
    private int round;
    private String lastItem;
    private String nextItem;
    private float rate;
    private float price;
    private boolean stop;
    private int level;

    /**
     * @return the round
     */
    public int getRound() {
        return round;
    }

    /**
     * @param round the round to set
     */
    public void setRound(int round) {
        this.round = round;
    }

    /**
     * @return the lastItem
     */
    public String getLastItem() {
        return lastItem;
    }

    /**
     * @param lastItem the lastItem to set
     */
    public void setLastItem(String lastItem) {
        this.lastItem = lastItem;
    }

    /**
     * @return the nextItem
     */
    public String getNextItem() {
        return nextItem;
    }

    /**
     * @param nextItem the nextItem to set
     */
    public void setNextItem(String nextItem) {
        this.nextItem = nextItem;
    }

    /**
     * @return the rate
     */
    public float getRate() {
        return rate;
    }

    /**
     * @param rate the rate to set
     */
    public void setRate(float rate) {
        this.rate = rate;
    }

    /**
     * @return the price
     */
    public float getPrice() {
        return price;
    }

    /**
     * @param price the price to set
     */
    public void setPrice(float price) {
        this.price = price;
    }

    /**
     * @return the stop
     */
    public boolean isStop() {
        return stop;
    }

    /**
     * @param stop the stop to set
     */
    public void setStop(boolean stop) {
        this.stop = stop;
    }

    /**
     * @return the level
     */
    public int getLevel() {
        return level;
    }

    /**
     * @param level the level to set
     */
    public void setLevel(int level) {
        this.level = level;
    }
}
