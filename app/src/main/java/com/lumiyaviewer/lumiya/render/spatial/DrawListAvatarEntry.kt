package com.lumiyaviewer.lumiya.render.spatial

import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatar
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatarStub
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo
import java.lang.ref.WeakReference

class DrawListAvatarEntry(private val objectAvatarInfo: SLObjectAvatarInfo) : DrawListObjectEntry(objectAvatarInfo) {
    private var drawableAvatar: WeakReference<DrawableAvatar>? = null
    private var drawableAvatarStub: WeakReference<DrawableAvatarStub>? = null

    override fun addToDrawList(drawList: DrawList) {
        if (drawList.avatars.size >= drawList.avatarCountLimit && !objectAvatarInfo.isMyAvatar) {
            val drawableAvatarStub = this.drawableAvatarStub?.get()
                ?: drawList.drawableStore.drawableAvatarStubCache.getUnchecked(objectAvatarInfo).also {
                    this.drawableAvatarStub = WeakReference(it)
                }
            drawList.avatarStubs.add(drawableAvatarStub)
            return
        }
        val drawableAvatar = this.drawableAvatar?.get()
            ?: drawList.drawableStore.drawableAvatarCache.getUnchecked(objectAvatarInfo).also {
                this.drawableAvatar = WeakReference(it)
            }
        drawList.avatars.add(drawableAvatar)
        if (objectAvatarInfo.isMyAvatar) {
            drawList.myAvatar = drawableAvatar
        }
    }

    fun getObjectAvatarInfo(): SLObjectAvatarInfo = objectAvatarInfo
}
