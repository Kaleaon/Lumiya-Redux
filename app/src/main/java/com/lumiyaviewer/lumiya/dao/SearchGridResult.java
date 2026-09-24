package com.lumiyaviewer.lumiya.dao;

import java.util.UUID;

public class SearchGridResult {
    private Long id;
    private String itemName;
    private int itemType;
    private UUID itemUUID;
    private int levensteinDistance;
    private Integer memberCount;
    private UUID searchUUID;

    public SearchGridResult() {
    }

    public SearchGridResult(Long id) {
        this.id = id;
    }

    public SearchGridResult(Long id, UUID uuid, int itemType, UUID itemUUID, String itemName, int levensteinDistance, Integer num) {
        this.id = id;
        this.searchUUID = uuid;
        this.itemType = itemType;
        this.itemUUID = itemUUID;
        this.itemName = itemName;
        this.levensteinDistance = levensteinDistance;
        this.memberCount = num;
    }

    public Long getId() {
        return this.id;
    }

    public String getItemName() {
        return this.itemName;
    }

    public int getItemType() {
        return this.itemType;
    }

    public UUID getItemUUID() {
        return this.itemUUID;
    }

    public int getLevensteinDistance() {
        return this.levensteinDistance;
    }

    public Integer getMemberCount() {
        return this.memberCount;
    }

    public UUID getSearchUUID() {
        return this.searchUUID;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public void setItemType(int itemType) {
        this.itemType = itemType;
    }

    public void setItemUUID(UUID uuid) {
        this.itemUUID = uuid;
    }

    public void setLevensteinDistance(int levensteinDistance) {
        this.levensteinDistance = levensteinDistance;
    }

    public void setMemberCount(Integer num) {
        this.memberCount = num;
    }

    public void setSearchUUID(UUID uuid) {
        this.searchUUID = uuid;
    }
}
