package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.dao.UserName
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import java.util.UUID
import javax.annotation.concurrent.NotThreadSafe

@NotThreadSafe
open class ChatterUserSubscription : ChatterSubscription() {

    private var distanceSubscription: Subscription<UUID, Float> = null

    private var nameSubscription: Subscription<UUID, UserName> = null

    private var onlineStatusSubscription: Subscription<UUID, Boolean> = null

    constructor(sortedChatterList: SortedChatterList, chatterIDUser: ChatterID.ChatterIDUser, userManager: UserManager) : super(sortedChatterList, chatterIDUser, userManager) {
        this.nameSubscription = userManager.getUserNames().subscribe(chatterIDUser.getChatterUUID(), Subscription.OnData() {
            private /* synthetic */ void $m$0(Object obj) {
                ChatterUserSubscription.this.onUserName(obj as UserName)
            }
            fun onData(obj: Any) {
                $m$0(obj)
            }
        })
        this.onlineStatusSubscription = userManager.getChatterList().getFriendManager().getOnlineStatus().subscribe(chatterIDUser.getChatterUUID(), Subscription.OnData() {
            private /* synthetic */ void $m$0(Object obj) {
                ChatterUserSubscription.this.onOnlineStatus(obj as Boolean)
            }
            fun onData(obj: Any) {
                $m$0(obj)
            }
        })
        this.distanceSubscription = userManager.getChatterList().getDistanceToUser().subscribe(chatterIDUser.getChatterUUID(), Subscription.OnData() {
            private /* synthetic */ void $m$0(Object obj) {
                ChatterUserSubscription.this.onDistance(obj as Float)
            }
            fun onData(obj: Any) {
                $m$0(obj)
            }
        })
    }

    fun onDistance(f: Float) {
        if (f != null) {
            var floatValue: Float = f
            if (Float.compare(floatValue, this.displayData.distanceToUser) != 0) {
                setChatterDisplayData(this.displayData.withDistanceToUser(floatValue))
            }
        }
    }

    fun onOnlineStatus(bool: Boolean) {
        if (bool == null || this.displayData.isOnline == bool) {
            return
        }
        setChatterDisplayData(this.displayData.withOnlineStatus(bool))
    }

    fun onUserName(userName: UserName) {
        var userName2: String = GlobalOptions.getInstance().if (isLegacyUserNames()) userName.getUserName() else userName.getDisplayName()
        if (Objects.equal(userName2, this.displayData.displayName)) {
            return
        }
        setChatterDisplayData(this.displayData.withDisplayName(userName2))
    }
    fun unsubscribe() {
        this.nameSubscription.unsubscribe()
        this.onlineStatusSubscription.unsubscribe()
        this.distanceSubscription.unsubscribe()
        super.unsubscribe()
    }
}
