package com.lumiyaviewer.lumiya.ui.inventory;

import android.graphics.Bitmap;
import java.util.UUID;

public class UploadImageParams {
    public final UUID agentUUID;
    public final Bitmap bitmap;
    public final UUID folderID;
    public final String name;

    public UploadImageParams(String name, Bitmap bitmap, UUID uuid, UUID folderID) {
        this.name = name;
        this.bitmap = bitmap;
        this.agentUUID = uuid;
        this.folderID = folderID;
    }
}
