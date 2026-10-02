package com.lumiyaviewer.lumiya.slproto.users

import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.dao.UserName
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileReply
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.lang.ref.WeakReference
import java.util.concurrent.Executor

open class ChatterNameRetriever(
    val chatterID: ChatterID?,
    onChatterNameUpdated: OnChatterNameUpdated,
    private val executor: Executor,
    autoSubscribe: Boolean = true
) {
    fun interface OnChatterNameUpdated {
        fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever)
    }

    private val listener = WeakReference(onChatterNameUpdated)
    var resolvedName: String? = null
        private set
    var resolvedSecondaryName: String? = null
        private set
    private var subscription: Subscription? = null

    init {
        if (autoSubscribe) {
            subscribe()
        }
    }

    fun onCurrentLocation(currentLocationInfo: CurrentLocationInfo?) {
        val parcelData = currentLocationInfo?.parcelData()
        val name = parcelData?.name
        if (Objects.equal(this.resolvedName, name)) {
            return
        }
        this.resolvedName = name
        listener.get()?.onChatterNameUpdated(this)
    }

    fun onGroupProfile(groupProfileReply: GroupProfileReply) {
        this.resolvedName = SLMessage.stringFromVariableOEM(groupProfileReply.GroupData_Field.Name)
        this.resolvedSecondaryName = SLMessage.stringFromVariableOEM(groupProfileReply.GroupData_Field.Name)
        listener.get()?.onChatterNameUpdated(this)
    }

    fun onUserName(userName: UserName) {
        Debug.Printf("Resolved name for %s", userName.uuid)
        if (GlobalOptions.getInstance().isLegacyUserNames) {
            this.resolvedName = userName.userName
            this.resolvedSecondaryName = userName.displayName
        } else {
            this.resolvedName = userName.displayName
            this.resolvedSecondaryName = userName.userName
        }
        listener.get()?.onChatterNameUpdated(this)
    }

    fun dispose() {
        this.subscription?.unsubscribe()
    }

    fun getResolvedName(): String? = this.resolvedName

    fun getResolvedSecondaryName(): String? = this.resolvedSecondaryName

    fun subscribe() {
        val userManager = this.chatterID?.getUserManager()
        if (userManager == null) {
            this.subscription = null
            return
        }
        // Subscriptions are handled based on chatter type
    }
}
