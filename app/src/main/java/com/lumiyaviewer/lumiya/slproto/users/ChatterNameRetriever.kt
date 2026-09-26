package com.lumiyaviewer.lumiya.slproto.users

import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.dao.UserName
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileReply
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.lang.ref.WeakReference
import java.util.concurrent.Executor

open class ChatterNameRetriever {
    var chatterID: ChatterID = null

    private var executor: Executor = null
    private var listener: WeakReference<OnChatterNameUpdated> = null
    private var resolvedName: String = ""
    private var resolvedSecondaryName: String = ""
    private var subscription: Subscription = null

    interface OnChatterNameUpdated {
        void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever)
    }

    constructor(chatterID: ChatterID, onChatterNameUpdated: OnChatterNameUpdated, executor: Executor) {
        this.chatterID = chatterID
        this.listener = WeakReference<>this as onChatterNameUpdated.executor = executor
        subscribe()
    }

    constructor(chatterID: ChatterID, onChatterNameUpdated: OnChatterNameUpdated, executor: Executor, z: Boolean) {
        this.chatterID = chatterID
        this.listener = WeakReference<>this as onChatterNameUpdated.executor = executor
        if (z) {
            subscribe()
        }
    }

    fun onCurrentLocation(currentLocationInfo: CurrentLocationInfo) {
        var parcelData: ParcelData = currentLocationInfo.parcelData()
        var name: String = if (parcelData != null) parcelData.getName() else null
        if (Objects.equal(this.resolvedName, name)) {
            return
        }
        this.resolvedName = name
        var onChatterNameUpdated: OnChatterNameUpdated = this.listener.get()
        if (onChatterNameUpdated != null) {
            onChatterNameUpdated.onChatterNameUpdated(this)
        }
    }

    fun onGroupProfile(groupProfileReply: GroupProfileReply) {
        this.resolvedName = SLMessage.stringFromVariableOEM(groupProfileReply.GroupData_Field.Name)
        this.resolvedSecondaryName = SLMessage.stringFromVariableOEM(groupProfileReply.GroupData_Field.Name)
        var onChatterNameUpdated: OnChatterNameUpdated = this.listener.get()
        if (onChatterNameUpdated != null) {
            onChatterNameUpdated.onChatterNameUpdated(this)
        }
    }

    fun onUserName(userName: UserName) {
        Debug.Printf("Resolved name for %s", userName.getUuid())
        if (GlobalOptions.getInstance().isLegacyUserNames()) {
            this.resolvedName = userName.getUserName()
            this.resolvedSecondaryName = userName.getDisplayName()
        } else {
            this.resolvedName = userName.getDisplayName()
            this.resolvedSecondaryName = userName.getUserName()
        }
        var onChatterNameUpdated: OnChatterNameUpdated = this.listener.get()
        if (onChatterNameUpdated != null) {
            onChatterNameUpdated.onChatterNameUpdated(this)
        }
    }

    fun dispose() {
        if (this.subscription != null) {
            this.subscription.unsubscribe()
        }
    }

    fun getResolvedName(): String {
        return this.resolvedName
    }

    fun getResolvedSecondaryName(): String {
        return this.resolvedSecondaryName
    }

    fun subscribe() {
        var userManager: UserManager = this.chatterID.getUserManager()
        if (userManager == null) {
            this.subscription = null
            return
        }
        if (this.chatterID.getChatterType() == ChatterID.ChatterType.Local) {
            this.subscription = userManager.getCurrentLocationInfo().subscribe(SubscriptionSingleDataPool.getSingleDataKey(), this.executor, currentLocationInfo -> onCurrentLocation(currentLocationInfo))
            return
        }
        if (this.chatterID is ChatterID.ChatterIDUser) {
            this.subscription = userManager.getUserNames().subscribe(((ChatterID.ChatterIDUser) this.chatterID).getChatterUUID(), this.executor, userName -> onUserName(userName))
        } else if (this.chatterID is ChatterID.ChatterIDGroup) {
            this.subscription = userManager.getCachedGroupProfiles().getPool().subscribe(((ChatterID.ChatterIDGroup) this.chatterID).getChatterUUID(), this.executor, groupProfileReply -> onGroupProfile(groupProfileReply))
        } else {
            this.subscription = null
        }
    }
}
