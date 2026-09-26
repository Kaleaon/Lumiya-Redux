package com.lumiyaviewer.lumiya.slproto.users.manager

import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.modules.SLModules
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import java.util.Comparator
import java.util.List

open class NearbyChattersDisplayDataList : ChatterDisplayDataList() {
    constructor(userManager: UserManager, onListUpdated: OnListUpdated) : super(userManager, onListUpdated, Comparator() { {
            private /* synthetic */ int $m$0(Object obj, Object obj2) {
                return NearbyChattersDisplayDataList.m342x73a7db48(obj as ChatterDisplayData, obj2 as ChatterDisplayData)
            }
            fun compare(obj: Any, obj2: Any): Int {
                return $m$0(obj, obj2)
            }
        })
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_slproto_users_manager_NearbyChattersDisplayDataList_807, reason: not valid java name */
    static /* synthetic */ int m342x73a7db48(ChatterDisplayData chatterDisplayData, ChatterDisplayData chatterDisplayData2) {
        var compare: Int = Float.compare(chatterDisplayData.distanceToUser, chatterDisplayData2.distanceToUser)
        return if (compare != 0) compare else chatterDisplayData.compareTo(chatterDisplayData2)
    }
    protected fun getChatters(): MutableList<ChatterID> {
        var modules: SLModules = null
        var list: MutableList<ChatterID> = null
        var activeAgentCircuit: SLAgentCircuit = this.userManager.getActiveAgentCircuit()
        if (activeAgentCircuit != null && (modules = activeAgentCircuit.getModules()) != null) {
            list = modules.minimap.getNearbyChatterList()
        }
        var list: return = = if ImmutableList as null.of() else list
    }
}
