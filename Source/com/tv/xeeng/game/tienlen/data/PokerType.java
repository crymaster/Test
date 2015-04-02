/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tv.xeeng.game.tienlen.data;

/**
 *
 */
public enum PokerType {

    Spades, Clubs, Hearts, Diamonds;

    public int toInt() {
        switch (this) {
            case Spades:
                return 1;
            case Clubs:
                return 2;
            case Diamonds:
                return 3;
            case Hearts:
                return 4;
            default:
                return 0;
        }
        /*
         if (this == PokerType.Pic) {
         return 1;
         } else if (this == PokerType.Tep) {
         return 2;
         } else if (this == PokerType.Ro) {
         return 3;
         } else if (this == PokerType.Co) {
         return 4;
         } else {
         return 0;
         }
         * */
    }
}
