package com.lumiyaviewer.lumiya.slproto.events;

import com.lumiyaviewer.lumiya.slproto.inventory.SLTaskInventory;
import java.util.UUID;

public class SLTaskInventoryReceivedEvent {
    public final UUID taskID;
    public final SLTaskInventory taskInventory;

    public SLTaskInventoryReceivedEvent(UUID uuid, SLTaskInventory taskInventory) {
        this.taskID = uuid;
        this.taskInventory = taskInventory;
    }
}
