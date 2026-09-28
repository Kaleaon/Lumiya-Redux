package com.lumiyaviewer.lumiya.dao

import android.content.Context
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatterDisplayInfo
import com.lumiyaviewer.lumiya.ui.chat.contacts.ChatterItemViewBuilder
import java.util.UUID

class User : ChatterDisplayInfo {

    var id: Long? = null
    var uuid: UUID? = null
    var userName: String? = null
    private var displayName: String? = null
    var badUUID: Boolean = false
    var isFriend: Boolean = false
    var rightsGiven: Int = 0
    var rightsHas: Int = 0

    constructor()

    constructor(id: Long?) {
        this.id = id
    }

    constructor(
        id: Long?,
        uuid: UUID?,
        userName: String?,
        displayName: String?,
        badUUID: Boolean,
        isFriend: Boolean,
        rightsGiven: Int,
        rightsHas: Int
    ) {
        this.id = id
        this.uuid = uuid
        this.userName = userName
        this.displayName = displayName
        this.badUUID = badUUID
        this.isFriend = isFriend
        this.rightsGiven = rightsGiven
        this.rightsHas = rightsHas
    }

    override fun buildView(context: Context, chatterItemViewBuilder: ChatterItemViewBuilder, userManager: UserManager) {
        chatterItemViewBuilder.setLabel(displayName ?: "")
        chatterItemViewBuilder.setThumbnailChatterID(getChatterID(userManager), displayName ?: "")
    }

    fun getBadUUID(): Boolean = badUUID

    override fun getChatterID(userManager: UserManager): ChatterID {
        return ChatterID.getUserChatterID(userManager.getUserID(), uuid)
    }

    override fun getDisplayName(): String? = displayName

    fun setDisplayName(displayName: String?) {
        this.displayName = displayName
    }

    fun getIsFriend(): Boolean = isFriend

    fun nameNeedsFetching(): Boolean {
        return if (userName == null || displayName == null) {
            !badUUID
        } else {
            false
        }
    }
}
