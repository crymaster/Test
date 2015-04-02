package com.tv.xeeng.base.shop;

import com.tv.xeeng.game.data.AIOConstants;

public class XEShopItem {

    private int id; // id field
    private String itemId; // item gì (default is 0, means Gold)
    private int cardinality; // số lượng bao nhiêu item
    private int mulFactor; // Số lượng item thực sự = cardinality * mulFactor
    private int price; // Giá tính theo đơn vị Xeeng
    private String desc;
    private int addOn = 0;

    public XEShopItem() {
    }

    public XEShopItem(int id, String itemId, int cardinality, int mulFactor, int price, String desc, int addOn) {
        this.id = id;
        this.itemId = itemId;
        this.cardinality = cardinality;
        this.mulFactor = mulFactor;
        this.price = price;
        this.desc = desc;
        this.addOn = addOn;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getItemId() {
        return itemId;
    }

    public void setItemId(String itemId) {
        this.itemId = itemId;
    }

    public int getCardinality() {
        return cardinality;
    }

    public void setCardinality(int cardinality) {
        this.cardinality = cardinality;
    }

    public int getMulFactor() {
        return mulFactor;
    }

    public void setMulFactor(int mulFactor) {
        this.mulFactor = mulFactor;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    /**
     * @return the addOn
     */
    public int getAddOn() {
        return addOn;
    }

    /**
     * @param addOn the addOn to set
     */
    public void setAddOn(int addOn) {
        this.addOn = addOn;
    }
    
    public String toString() {
        return "" + id + AIOConstants.SEPERATOR_BYTE_1
                + itemId + AIOConstants.SEPERATOR_BYTE_1
                + cardinality + AIOConstants.SEPERATOR_BYTE_1
                + mulFactor + AIOConstants.SEPERATOR_BYTE_1
                + price + AIOConstants.SEPERATOR_BYTE_1
                + desc + AIOConstants.SEPERATOR_BYTE_1
                + addOn;
    }
}
