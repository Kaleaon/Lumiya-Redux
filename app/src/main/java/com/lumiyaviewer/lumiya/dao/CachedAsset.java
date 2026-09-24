package com.lumiyaviewer.lumiya.dao;

public class CachedAsset {
    private byte[] data;
    private String key;
    private boolean mustRevalidate;
    private int status;

    public CachedAsset() {
    }

    public CachedAsset(String key) {
        this.key = key;
    }

    public CachedAsset(String key, int status, byte[] bytes, boolean mustRevalidate) {
        this.key = key;
        this.status = status;
        this.data = bytes;
        this.mustRevalidate = mustRevalidate;
    }

    public byte[] getData() {
        return this.data;
    }

    public String getKey() {
        return this.key;
    }

    public boolean getMustRevalidate() {
        return this.mustRevalidate;
    }

    public int getStatus() {
        return this.status;
    }

    public void setData(byte[] bytes) {
        this.data = bytes;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public void setMustRevalidate(boolean mustRevalidate) {
        this.mustRevalidate = mustRevalidate;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
