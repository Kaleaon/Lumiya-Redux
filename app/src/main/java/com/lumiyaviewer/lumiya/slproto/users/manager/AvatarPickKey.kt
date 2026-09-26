package com.lumiyaviewer.lumiya.slproto.users.manager

import android.os.Parcel
import android.os.Parcelable
import java.util.UUID

open class AvatarPickKey : Parcelable {
    @JvmStatic var CREATOR: Parcelable.Creator<AvatarPickKey> = Parcelable.Creator<AvatarPickKey>() {
        /* JADX WARN: Can't rename method to resolve collision */
        fun createFromParcel(parcel: Parcel): AvatarPickKey {
            return AvatarPickKey(parcel)
        }

        /* JADX WARN: Can't rename method to resolve collision */
        fun newArray(i: Int): Array<AvatarPickKey> {
            return arrayOfNulls<AvatarPickKey>(i)
        }
    }

    var avatarID: UUID = null

    var pickID: UUID = null

    fun AvatarPickKey(parcel: Parcel): protected {
        this.avatarID = UUID.fromString(parcel.readString())
        this.pickID = UUID.fromString(parcel.readString())
    }

    constructor(uuid: UUID, pickID: UUID) {
        this.avatarID = uuid
        this.pickID = pickID
    }
    fun describeContents(): Int {
        return 0
    }

    fun equals(obj: Any): Boolean {
        if (this == obj) {
        return true
        }
        if (obj == null || getClass() != obj.javaClass) {
        return false
        }
        var avatarPickKey: AvatarPickKey = obj as AvatarPickKey
        if (this.avatarID.equals(avatarPickKey.avatarID)) {
            return this.pickID.equals(avatarPickKey.pickID)
        }
        return false
    }

    fun hashCode(): Int {
        return (this.avatarID.hashCode() * 31) + this.pickID.hashCode()
    }

    fun toString(): String {
        return "AvatarPicksKey{avatarID=" + this.avatarID + ", pickID=" + this.pickID + '}'
    }
    fun writeToParcel(parcel: Parcel, i: Int) {
        parcel.writeString(this.avatarID.toString())
        parcel.writeString(this.pickID.toString())
    }
}
