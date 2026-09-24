package com.lumiyaviewer.lumiya.slproto.events;

public class SLBalanceChangedEvent {
    public final int newBalance;
    public final int oldBalance;
    public final boolean oldBalanceValid;

    public SLBalanceChangedEvent(boolean oldBalanceValid, int oldBalance, int newBalance) {
        this.oldBalanceValid = oldBalanceValid;
        this.oldBalance = oldBalance;
        this.newBalance = newBalance;
    }
}
