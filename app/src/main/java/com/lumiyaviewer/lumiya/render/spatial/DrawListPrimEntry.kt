package com.lumiyaviewer.lumiya.render.spatial

import com.lumiyaviewer.lumiya.render.DrawableObject
import com.lumiyaviewer.lumiya.render.DrawableStore
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatar
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import java.lang.ref.WeakReference

open class DrawListPrimEntry(objectInfo: SLObjectInfo) : DrawListObjectEntry(objectInfo) {
    @Volatile
    private var drawableObject: WeakReference<DrawableObject>? = null

    override fun addToDrawList(drawList: DrawList) {
        var drawableObject = this.drawableObject?.get()
        if (drawableObject == null) {
            drawableObject = DrawableObject(drawList.drawableStore, objectInfo, null)
            this.drawableObject = WeakReference(drawableObject)
        }
        drawList.objects.add(drawableObject)
    }

    fun getDrawableAttachment(drawableStore: DrawableStore, drawableAvatar: DrawableAvatar?): DrawableObject {
        val existing = drawableObject?.get()
        if (existing != null) {
            return existing
        }
        val created = DrawableObject(drawableStore, objectInfo, drawableAvatar)
        drawableObject = WeakReference(created)
        return created
    }

    fun getDrawableObject(): DrawableObject? = drawableObject?.get()
}
