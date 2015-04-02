/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.game.tienlen.data;

/**
 *
 */
public class Poker {

    private int num;
    private PokerType type;

    public Poker() {
    }

    public Poker(int n, PokerType t) {
        this.num = n;
        this.type = t;

    }

    public boolean isDoi(Poker other) {
        return (num == other.num);
    }

    public String toString() {
        String res = "";

        if (num == 1) {
            res += "At";
        } else if (num == 11) {
            res += "J";
        } else if (num == 12) {
            res += "Q";
        } else if (num == 13) {
            res += "K";
        } else {
            res += num;
        }

        res += " " + pokerTypeToString();
        return res;
    }

    private String pokerTypeToString() {
        if (this.type == PokerType.Hearts) {
            return "co";
        } else if (this.type == PokerType.Diamonds) {
            return "ro";
        } else if (this.type == PokerType.Spades) {
            return "pic";
        } else if (this.type == PokerType.Clubs) {
            return "tep";
        }
        return "";
    }

    public PokerType getType() {
        return type;
    }

    public int getNum() {
        return num;
    }

    private int typeToInt() {
        if (this.type == PokerType.Spades) {
            return 1;
        } else if (this.type == PokerType.Clubs) {
            return 2;
        } else if (this.type == PokerType.Diamonds) {
            return 3;
        } else if (this.type == PokerType.Hearts) {
            return 4;
        } else {
            return 0;
        }
    }

    public int toInt() {
        return num + (typeToInt() - 1) * 13;
    }

    public boolean isGreater(Poker other) {
        return (this.toInt() > other.toInt());
    }
}
