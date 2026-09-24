package com.lumiyaviewer.lumiya.dao;

public class UserPic {
    private byte[] bitmap;
    private Long id;
    private String uuid;

    public UserPic() {
    }

    public UserPic(Long id) {
        this.id = id;
    }

    public UserPic(Long id, String uuid, byte[] bytes) {
        this.id = id;
        this.uuid = uuid;
        this.bitmap = bytes;
    }

    public byte[] getBitmap() {
        return this.bitmap;
    }

    public Long getId() {
        return this.id;
    }

    public String getUuid() {
        return this.uuid;
    }

    public void setBitmap(byte[] bytes) {
        this.bitmap = bytes;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
