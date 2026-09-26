package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.GroupProfileReply
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import java.util.UUID
import javax.annotation.concurrent.NotThreadSafe

@NotThreadSafe
open class ChatterGroupSubscription : ChatterSubscription() {

    private var groupProfileSubscription: Subscription<UUID, GroupProfileReply> = null

    constructor(sortedChatterList: SortedChatterList, chatterIDGroup: ChatterID.ChatterIDGroup, userManager: UserManager) : super(sortedChatterList, chatterIDGroup, userManager) {
        this.groupProfileSubscription = userManager.getCachedGroupProfiles().getPool().subscribe(chatterIDGroup.getChatterUUID(), Subscription.OnData() {
            private /* synthetic */ void $m$0(Object obj) {
                ChatterGroupSubscription.this.onGroupProfile(obj as GroupProfileReply)
            }
            fun onData(obj: Any) {
                $m$0(obj)
            }
        })
    }

    fun onGroupProfile(groupProfileReply: GroupProfileReply) {
        var stringFromVariableOEM: String = SLMessage.stringFromVariableOEM(groupProfileReply.GroupData_Field.Name)
        if (Objects.equal(stringFromVariableOEM, this.displayData.displayName)) {
            return
        }
        setChatterDisplayData(this.displayData.withDisplayName(stringFromVariableOEM))
    }
    fun unsubscribe() {
        this.groupProfileSubscription.unsubscribe()
        super.unsubscribe()
    }
}
