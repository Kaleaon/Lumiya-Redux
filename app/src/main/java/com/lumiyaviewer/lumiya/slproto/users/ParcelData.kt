package com.lumiyaviewer.lumiya.slproto.users

import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.io.Serializable
import java.util.UUID

open class ParcelData : Serializable {
    private var area: Int = 0
    private var description: String = ""
    private var isGroupOwned: Boolean = false
    private var mediaURL: String = ""
    private var name: String = ""
    private var ownerID: UUID = null
    private var parcelBitmap: BooleanArray = BooleanArray(4096)
    private var parcelID: Int = 0
    private var snapshotUUID: UUID = null

    public ParcelData(LLSDNode lsdNode) throws LLSDException {
        this.parcelID = lsdNode.byKey("LocalID").asInt()
        this.name = lsdNode.byKey("Name").asString()
        this.description = lsdNode.byKey("Desc").asString()
        this.mediaURL = lsdNode.byKey("MusicURL").asString()
        var asUUID: UUID = lsdNode.byKey("SnapshotID").asUUID()
        if (asUUID != null && asUUID.equals(UUIDPool.ZeroUUID)) {
            asUUID = null
        }
        this.snapshotUUID = asUUID
        this.ownerID = if (lsdNode.keyExists("OwnerID")) lsdNode.byKey("OwnerID").asUUID() else null
        this.isGroupOwned = if (lsdNode.keyExists("IsGroupOwned")) lsdNode.byKey("IsGroupOwned").asBoolean() else false
        this.area = if (lsdNode.keyExists("Area")) lsdNode.byKey("Area").asInt() else 0
        var asBinary: ByteArray = lsdNode.byKey("Bitmap").asBinary()
        for (int i = 0; i < asBinary.length && i < 512; i++) {
            var b: Byte = asBinary[i]
            for (int j = 0; j < 8; j++) {
                if ((b & 1) != 0) {
                    this.parcelBitmap[(i * 8) + j] = true
                }
                b = (byte) (b >> 1)
            }
        }
    }

    fun getArea(): Int {
        return this.area
    }

    fun getDescription(): String {
        return this.description
    }

    fun getMediaURL(): String {
        return this.mediaURL
    }

    fun getName(): String {
        return this.name
    }

    fun getOwnerID(): UUID {
        return this.ownerID
    }

    fun getParcelBitmap(): BooleanArray {
        return this.parcelBitmap
    }

    fun getParcelID(): Int {
        return this.parcelID
    }

    fun getSnapshotUUID(): UUID {
        return this.snapshotUUID
    }

    fun isGroupOwned(): Boolean {
        return this.isGroupOwned
    }
}
