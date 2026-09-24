package com.lumiyaviewer.lumiya.dao;

public class CachedResponse {
    private byte[] data;
    private String key;
    private boolean mustRevalidate;

    public CachedResponse() {
    }

    public CachedResponse(String key) {
        this.key = key;
    }

    public CachedResponse(String key, byte[] bytes, boolean mustRevalidate) {
        this.key = key;
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

    public void setData(byte[] bytes) {
        this.data = bytes;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public void setMustRevalidate(boolean mustRevalidate) {
        this.mustRevalidate = mustRevalidate;
    }
}
