package com.lumiyaviewer.lumiya.slproto.events;

import java.util.UUID;

public class SLInventoryNewContentsEvent {
    public int newFolderCount = 0;
    public int newItemCount = 0;
    public UUID firstParentUUID = null;
    public String firstItemName = null;
    public boolean firstIsFolder = false;

    public void AddItem(boolean firstIsFolder, UUID uuid, String firstItemName) {
        if (firstIsFolder) {
            this.newFolderCount++;
        } else {
            this.newItemCount++;
        }
        if (this.firstParentUUID == null) {
            this.firstIsFolder = firstIsFolder;
            this.firstParentUUID = uuid;
            this.firstItemName = firstItemName;
        } else if (firstIsFolder && (!this.firstIsFolder)) {
            this.firstIsFolder = firstIsFolder;
            this.firstParentUUID = uuid;
            this.firstItemName = firstItemName;
        }
    }

    public boolean isEmpty() {
        return this.newFolderCount == 0 && this.newItemCount == 0;
    }
}
