package com.lumiyaviewer.lumiya.dao;

public class MuteListCachedData {
    private int CRC;
    private byte[] data;
    private Long id;

    public MuteListCachedData() {
    }

    public MuteListCachedData(Long id) {
        this.id = id;
    }

    public MuteListCachedData(Long id, int i, byte[] bytes) {
        this.id = id;
        this.CRC = i;
        this.data = bytes;
    }

    public int getCRC() {
        return this.CRC;
    }

    public byte[] getData() {
        return this.data;
    }

    public Long getId() {
        return this.id;
    }

    public void setCRC(int crc) {
        this.CRC = crc;
    }

    public void setData(byte[] bytes) {
        this.data = bytes;
    }

    public void setId(Long id) {
        this.id = id;
    }
}
