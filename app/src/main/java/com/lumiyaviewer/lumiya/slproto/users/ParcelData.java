package com.lumiyaviewer.lumiya.slproto.users;

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import com.lumiyaviewer.lumiya.utils.UUIDPool;
import java.io.Serializable;
import java.util.UUID;

public class ParcelData implements Serializable {
    private final int area;
    private final String description;
    private final boolean isGroupOwned;
    private final String mediaURL;
    private final String name;
    private final UUID ownerID;
    private final boolean[] parcelBitmap = new boolean[4096];
    private final int parcelID;
    private final UUID snapshotUUID;

    public ParcelData(LLSDNode lsdNode) throws LLSDException {
        this.parcelID = lsdNode.byKey("LocalID").asInt();
        this.name = lsdNode.byKey("Name").asString();
        this.description = lsdNode.byKey("Desc").asString();
        this.mediaURL = lsdNode.byKey("MusicURL").asString();
        UUID asUUID = lsdNode.byKey("SnapshotID").asUUID();
        if (asUUID != null && asUUID.equals(UUIDPool.ZeroUUID)) {
            asUUID = null;
        }
        this.snapshotUUID = asUUID;
        this.ownerID = lsdNode.keyExists("OwnerID") ? lsdNode.byKey("OwnerID").asUUID() : null;
        this.isGroupOwned = lsdNode.keyExists("IsGroupOwned") ? lsdNode.byKey("IsGroupOwned").asBoolean() : false;
        this.area = lsdNode.keyExists("Area") ? lsdNode.byKey("Area").asInt() : 0;
        byte[] asBinary = lsdNode.byKey("Bitmap").asBinary();
        for (int i = 0; i < asBinary.length && i < 512; i++) {
            byte b = asBinary[i];
            for (int j = 0; j < 8; j++) {
                if ((b & 1) != 0) {
                    this.parcelBitmap[(i * 8) + j] = true;
                }
                b = (byte) (b >> 1);
            }
        }
    }

    public int getArea() {
        return this.area;
    }

    public String getDescription() {
        return this.description;
    }

    public String getMediaURL() {
        return this.mediaURL;
    }

    public String getName() {
        return this.name;
    }

    public UUID getOwnerID() {
        return this.ownerID;
    }

    public boolean[] getParcelBitmap() {
        return this.parcelBitmap;
    }

    public int getParcelID() {
        return this.parcelID;
    }

    public UUID getSnapshotUUID() {
        return this.snapshotUUID;
    }

    public boolean isGroupOwned() {
        return this.isGroupOwned;
    }
}
