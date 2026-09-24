package com.lumiyaviewer.lumiya.slproto.users.manager;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.UUID;
import javax.annotation.Nonnull;

public class AvatarPickKey implements Parcelable {
    public static final Parcelable.Creator<AvatarPickKey> CREATOR = new Parcelable.Creator<AvatarPickKey>() {
        /* JADX WARN: Can't rename method to resolve collision */
        @Override
        public AvatarPickKey createFromParcel(Parcel parcel) {
            return new AvatarPickKey(parcel);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override
        public AvatarPickKey[] newArray(int i) {
            return new AvatarPickKey[i];
        }
    };

    @Nonnull
    public final UUID avatarID;

    @Nonnull
    public final UUID pickID;

    protected AvatarPickKey(Parcel parcel) {
        this.avatarID = UUID.fromString(parcel.readString());
        this.pickID = UUID.fromString(parcel.readString());
    }

    public AvatarPickKey(@Nonnull UUID uuid, @Nonnull UUID pickID) {
        this.avatarID = uuid;
        this.pickID = pickID;
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        AvatarPickKey avatarPickKey = (AvatarPickKey) obj;
        if (this.avatarID.equals(avatarPickKey.avatarID)) {
            return this.pickID.equals(avatarPickKey.pickID);
        }
        return false;
    }

    public int hashCode() {
        return (this.avatarID.hashCode() * 31) + this.pickID.hashCode();
    }

    public String toString() {
        return "AvatarPicksKey{avatarID=" + this.avatarID + ", pickID=" + this.pickID + '}';
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.avatarID.toString());
        parcel.writeString(this.pickID.toString());
    }
}
