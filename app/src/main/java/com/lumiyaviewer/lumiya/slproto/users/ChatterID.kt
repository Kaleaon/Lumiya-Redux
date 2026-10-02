package com.lumiyaviewer.lumiya.slproto.users

import android.os.Bundle
import android.os.Parcel
import android.os.Parcelable
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.dao.Chatter
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.GridConnectionManager
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.settings.NotificationType
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID
import java.util.concurrent.Executor

abstract class ChatterID : Parcelable, Comparable<ChatterID> {

    var agentUUID: UUID? = null

    open class ChatterIDGroup : ChatterIDWithUUID() {
        Parcelable.Creator<ChatterIDGroup> CREATOR = Parcelable.Creator<ChatterIDGroup>() {
            /* JADX WARN: Can't rename method to resolve collision */
            fun createFromParcel(parcel: Parcel): ChatterIDGroup {
                return ChatterIDGroup(parcel, null as ChatterIDGroup)
            }

            /* JADX WARN: Can't rename method to resolve collision */
            fun newArray(i: Int): Array<ChatterIDGroup> {
                return arrayOfNulls<ChatterIDGroup>(i)
            }
        }

        fun ChatterIDGroup(parcel: Parcel): private {
            super(parcel, null as ChatterIDWithUUID)
        }

        /* synthetic */ ChatterIDGroup(Parcel parcel, ChatterIDGroup chatterIDGroup) {
            this(parcel)
        }

        fun ChatterIDGroup(uuid: UUID, uuid2: UUID): private {
            super(uuid, uuid2, null)
        }

        /* synthetic */ ChatterIDGroup(UUID uuid, UUID uuid2, ChatterIDGroup chatterIDGroup) {
            this(uuid, uuid2)
        }
        public /* bridge */ /* synthetic */ int compareTo(ChatterID chatterID) {
            return super.compareTo(chatterID)
        }
        fun equals(obj: Any): Boolean {
            if (obj is ChatterIDGroup) {
                return super.equals(obj)
            }
        return false
        }
        fun getChatterType(): ChatterType {
            return ChatterType.Group
        }
        public /* bridge */ /* synthetic */ UUID getChatterUUID() {
            return super.getChatterUUID()
        }
        public /* bridge */ /* synthetic */ UUID getOptionalChatterUUID() {
            return super.getOptionalChatterUUID()
        }
        fun getPictureID(userManager: UserManager, executor: Executor, onChatterPictureIDListener: OnChatterPictureIDListener): Subscription {
            return userManager.getCachedGroupProfiles().getPool().subscribe(this.uuid, UIThreadExecutor.getInstance(), groupProfileReply -> onChatterPictureIDListener.onChatterPictureID(groupProfileReply.GroupData_Field.InsigniaID))
        }
        public /* bridge */ /* synthetic */ int hashCode() {
            return super.hashCode()
        }
        public /* bridge */ /* synthetic */ boolean isValidUUID() {
            return super.isValidUUID()
        }
        public /* bridge */ /* synthetic */ Bundle toBundle() {
            return super.toBundle()
        }
        public /* bridge */ /* synthetic */ String toString() {
            return super.toString()
        }
        public /* bridge */ /* synthetic */ void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i)
        }
    }

    open class ChatterIDLocal : ChatterID() {
        Parcelable.Creator<ChatterIDLocal> CREATOR = Parcelable.Creator<ChatterIDLocal>() {
            /* JADX WARN: Can't rename method to resolve collision */
            fun createFromParcel(parcel: Parcel): ChatterIDLocal {
                return ChatterIDLocal(parcel, null as ChatterIDLocal)
            }

            /* JADX WARN: Can't rename method to resolve collision */
            fun newArray(i: Int): Array<ChatterIDLocal> {
                return arrayOfNulls<ChatterIDLocal>(i)
            }
        }

        fun ChatterIDLocal(parcel: Parcel): private {
            super(parcel, null as ChatterID)
        }

        /* synthetic */ ChatterIDLocal(Parcel parcel, ChatterIDLocal chatterIDLocal) {
            this(parcel)
        }

        fun ChatterIDLocal(uuid: UUID): private {
            super(uuid, null as ChatterID)
        }

        /* synthetic */ ChatterIDLocal(UUID uuid, ChatterIDLocal chatterIDLocal) {
            this(uuid)
        }
        fun equals(obj: Any): Boolean {
            if (obj is ChatterIDLocal) {
                return super.equals(obj)
            }
        return false
        }
        fun getChatterType(): ChatterType {
            return ChatterType.Local
        }
    }

    open class ChatterIDUser : ChatterIDWithUUID() {
        Parcelable.Creator<ChatterIDUser> CREATOR = Parcelable.Creator<ChatterIDUser>() {
            /* JADX WARN: Can't rename method to resolve collision */
            fun createFromParcel(parcel: Parcel): ChatterIDUser {
                return ChatterIDUser(parcel, null as ChatterIDUser)
            }

            /* JADX WARN: Can't rename method to resolve collision */
            fun newArray(i: Int): Array<ChatterIDUser> {
                return arrayOfNulls<ChatterIDUser>(i)
            }
        }

        fun ChatterIDUser(parcel: Parcel): private {
            super(parcel, null as ChatterIDWithUUID)
        }

        /* synthetic */ ChatterIDUser(Parcel parcel, ChatterIDUser chatterIDUser) {
            this(parcel)
        }

        fun ChatterIDUser(uuid: UUID, uuid2: UUID): private {
            super(uuid, uuid2, null)
        }

        /* synthetic */ ChatterIDUser(UUID uuid, UUID uuid2, ChatterIDUser chatterIDUser) {
            this(uuid, uuid2)
        }
        public /* bridge */ /* synthetic */ int compareTo(ChatterID chatterID) {
            return super.compareTo(chatterID)
        }
        fun equals(obj: Any): Boolean {
            if (obj is ChatterIDUser) {
                return super.equals(obj)
            }
        return false
        }
        fun getChatterType(): ChatterType {
            return ChatterType.User
        }
        public /* bridge */ /* synthetic */ UUID getChatterUUID() {
            return super.getChatterUUID()
        }
        public /* bridge */ /* synthetic */ UUID getOptionalChatterUUID() {
            return super.getOptionalChatterUUID()
        }
        fun getPictureID(userManager: UserManager, executor: Executor, onChatterPictureIDListener: OnChatterPictureIDListener): Subscription {
            return userManager.getAvatarProperties().getPool().subscribe(this.uuid, executor, avatarPropertiesReply -> onChatterPictureIDListener.onChatterPictureID(avatarPropertiesReply.PropertiesData_Field.ImageID))
        }
        public /* bridge */ /* synthetic */ int hashCode() {
            return super.hashCode()
        }
        public /* bridge */ /* synthetic */ boolean isValidUUID() {
            return super.isValidUUID()
        }
        public /* bridge */ /* synthetic */ Bundle toBundle() {
            return super.toBundle()
        }
        public /* bridge */ /* synthetic */ String toString() {
            return super.toString()
        }
        public /* bridge */ /* synthetic */ void writeToParcel(Parcel parcel, int i) {
            super.writeToParcel(parcel, i)
        }
    }

    private abstract class ChatterIDWithUUID : ChatterID() {

        protected UUID uuid

        fun ChatterIDWithUUID(parcel: Parcel): private {
            super(parcel, null as ChatterID)
            this.uuid = UUIDPool.getUUID(parcel.readLong(), parcel.readLong())
        }

        /* synthetic */ ChatterIDWithUUID(Parcel parcel, ChatterIDWithUUID chatterIDWithUUID) {
            this(parcel)
        }

        fun ChatterIDWithUUID(uuid: UUID, uuid2: UUID): private {
            super(uuid, null as ChatterID)
            this.uuid = if (uuid2 == null) UUIDPool.ZeroUUID else uuid2
        }

        /* synthetic */ ChatterIDWithUUID(UUID uuid, UUID uuid2, ChatterIDWithUUID chatterIDWithUUID) {
            this(uuid, uuid2)
        }
        fun compareTo(chatterID: ChatterID): Int {
            var compareTo: Int = super.compareTo(chatterID)
            if (compareTo != 0) {
        return compareTo
            }
            if (chatterID is ChatterIDWithUUID) {
                return this.uuid.compareTo((chatterID as ChatterIDWithUUID).uuid)
            }
        return 0
        }
        fun equals(obj: Any): Boolean {
            if (super.equals(obj) && (obj is ChatterIDWithUUID)) {
                return Objects.equal(this.uuid, (obj as ChatterIDWithUUID).uuid)
            }
        return false
        }

        fun getChatterUUID(): UUID {
            return this.uuid
        }
        fun getOptionalChatterUUID(): UUID {
            return this.uuid
        }
        fun hashCode(): Int {
            return (if (this.uuid != null) this.uuid.hashCode() else 0) + super.hashCode()
        }
        fun isValidUUID(): Boolean {
            if (this.uuid != null) {
                return !UUIDPool.ZeroUUID.equals(this.uuid)
            }
        return false
        }
        fun toBundle(): Bundle {
            var bundle: Bundle = super.toBundle()
            bundle.putString("chatterUUID", if (this.uuid != null) this.uuid.toString() else UUIDPool.ZeroUUID.toString())
        return bundle
        }
        fun toString(): String {
            return super.toString() + ":" + (if (this.uuid != null) this.uuid.toString() else "null")
        }
        fun writeToParcel(parcel: Parcel, i: Int) {
            super.writeToParcel(parcel, i)
            if (this.uuid != null) {
                parcel.writeLong(this.uuid.getMostSignificantBits())
                parcel.writeLong(this.uuid.getLeastSignificantBits())
            } else {
                parcel.writeLongparcel as 0L.writeLong(0L)
            }
        }
    }

    enum class ChatterType {
        Local(NotificationType.LocalChat),
        User(NotificationType.Private),
        Group(NotificationType.Group)

        Array<ChatterType> VALUES = valuesCustom()

        private NotificationType notificationType

        ChatterType(NotificationType notificationType) {
            this.notificationType = notificationType
        }

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<ChatterType> {
            return values()
        }

        fun getNotificationType(): NotificationType {
            return this.notificationType
        }
    }

    interface OnChatterPictureIDListener {
        void onChatterPictureID(UUID uuid)
    }

    fun ChatterID(parcel: Parcel): private {
        this.agentUUID = UUIDPool.getUUID(parcel.readLong(), parcel.readLong())
    }

    /* synthetic */ ChatterID(Parcel parcel, ChatterID chatterID) {
        this(parcel)
    }

    fun ChatterID(uuid: UUID): private {
        this.agentUUID = uuid
    }

    /* synthetic */ ChatterID(UUID uuid, ChatterID chatterID) {
        this(uuid)
    }

    fun fromBundle(bundle: Bundle): ChatterID {
        var fromString: UUID = UUID.fromString(bundle.getString("chatterAgentUUID"))
        switch (ChatterType.VALUES[bundle.getInt("chatterType", 0)]) {
            Group ->
                return getGroupChatterID(fromString, UUID.fromString(bundle.getString("chatterUUID")))
            Local ->
                return getLocalChatterID(fromString)
            User ->
                return getUserChatterID(fromString, UUID.fromString(bundle.getString("chatterUUID")))
            else ->
        return null
        }
    }

    fun fromDatabaseObject(uuid: UUID, chatter: Chatter): ChatterID {
        switch (ChatterType.VALUES[chatter.getType()]) {
            Group ->
                return getGroupChatterID(uuid, chatter.getUuid())
            Local ->
                return getLocalChatterID(uuid)
            User ->
                return getUserChatterID(uuid, chatter.getUuid())
            else ->
        return null
        }
    }

    companion object {
        @JvmStatic
        fun getGroupChatterID(uuid: UUID, uuid2: UUID): ChatterIDGroup {
            return ChatterIDGroup(uuid, uuid2, null)
        }

        @JvmStatic
        fun getLocalChatterID(uuid: UUID): ChatterIDLocal {
            return ChatterIDLocal(uuid, null)
        }

        @JvmStatic
        fun getUserChatterID(uuid: UUID, uuid2: UUID): ChatterIDUser {
            return ChatterIDUser(uuid, uuid2, null)
        }
    }
    fun compareTo(chatterID: ChatterID): Int {
        var compareTo: Int = this.agentUUID.compareTo(chatterID.agentUUID)
        return if (compareTo != 0) compareTo else getChatterType().compareTo(chatterID.getChatterType())
    }
    fun describeContents(): Int {
        return 0
    }

    fun equals(obj: Any): Boolean {
        if (obj is ChatterID) {
            return (obj as ChatterID).agentUUID.equals(this.agentUUID)
        }
        return false
    }

    public abstract ChatterType getChatterType()

    fun getConnection(): SLGridConnection {
        return GridConnectionManager.getConnection(this.agentUUID)
    }

    fun getOptionalChatterUUID(): UUID {
        return null
    }

    fun getPictureID(userManager: UserManager, executor: Executor, onChatterPictureIDListener: OnChatterPictureIDListener): Subscription {
        return null
    }

    fun getUserManager(): UserManager {
        return UserManager.getUserManager(this.agentUUID)
    }

    fun hashCode(): Int {
        return this.agentUUID.hashCode() + 1 + getChatterType().ordinal()
    }

    fun isValidUUID(): Boolean {
        return false
    }

    fun toBundle(): Bundle {
        var bundle: Bundle = Bundle()
        bundle.putInt("chatterType", getChatterType().ordinal())
        bundle.putString("chatterAgentUUID", this.agentUUID.toString())
        return bundle
    }

    fun toDatabaseObject(chatter: Chatter) {
        chatter.setType(getChatterType().ordinal())
        chatter.setUuid(getOptionalChatterUUID())
    }

    fun toString(): String {
        return "Chatter:" + getChatterType().toString()
    }
    fun writeToParcel(parcel: Parcel, i: Int) {
        parcel.writeLong(this.agentUUID.getMostSignificantBits())
        parcel.writeLong(this.agentUUID.getLeastSignificantBits())
    }
}
