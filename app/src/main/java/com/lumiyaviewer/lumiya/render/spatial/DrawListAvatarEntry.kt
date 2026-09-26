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
            var drawableAvatarStub = this.drawableAvatarStub?.get()
            if (drawableAvatarStub == null) {
                drawableAvatarStub = drawList.drawableStore.drawableAvatarStubCache.getUnchecked(objectAvatarInfo)!!
                this.drawableAvatarStub = WeakReference(drawableAvatarStub)
            }
            drawList.avatarStubs.add(drawableAvatarStub)
            return
        }
        var drawableAvatar = this.drawableAvatar?.get()
        if (drawableAvatar == null) {
            drawableAvatar = drawList.drawableStore.drawableAvatarCache.getUnchecked(objectAvatarInfo)!!
            this.drawableAvatar = WeakReference(drawableAvatar)
        }
        drawList.avatars.add(drawableAvatar)
        if (objectAvatarInfo.isMyAvatar) {
            drawList.myAvatar = drawableAvatar
        }
    }

    fun getObjectAvatarInfo(): SLObjectAvatarInfo = objectAvatarInfo
}
