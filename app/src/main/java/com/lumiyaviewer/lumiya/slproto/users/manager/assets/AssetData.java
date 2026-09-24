package com.lumiyaviewer.lumiya.slproto.users.manager.assets;

public class AssetData {
    private final byte[] data;
    private final int status;

    public AssetData(int status, byte[] bytes) {
        this.status = status;
        this.data = bytes;
    }

    public byte[] getData() {
        return this.data;
    }

    public int getStatus() {
        return this.status;
    }
}
