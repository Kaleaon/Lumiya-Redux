package com.lumiyaviewer.lumiya.render.spatial

import com.lumiyaviewer.lumiya.render.DrawableObject
import com.lumiyaviewer.lumiya.render.DrawableStore
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatar
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatarStub
import com.lumiyaviewer.lumiya.render.terrain.DrawableTerrainPatch

class DrawList private constructor(
    @JvmField val drawableStore: DrawableStore,
    @JvmField val objects: ArrayList<DrawableObject>,
    @JvmField val avatars: ArrayList<DrawableAvatar>,
    @JvmField val avatarStubs: ArrayList<DrawableAvatarStub>,
    @JvmField val terrain: ArrayList<DrawableTerrainPatch>,
    @JvmField val avatarCountLimit: Int
) {
    @JvmField
    var myAvatar: DrawableAvatar? = null

    @JvmField
    var renderPasses: IntArray? = null

    fun initRenderPasses() {
        renderPasses = IntArray(objects.size)
    }

    companion object {
        @JvmStatic
        fun create(drawableStore: DrawableStore, previous: DrawList?, avatarCountLimit: Int): DrawList {
            return if (previous == null) {
                DrawList(drawableStore, ArrayList(), ArrayList(), ArrayList(), ArrayList(), avatarCountLimit)
            } else {
                DrawList(
                    drawableStore,
                    ArrayList(previous.objects.size * 4 / 3),
                    ArrayList(previous.avatars.size * 4 / 3),
                    ArrayList(previous.avatarStubs.size * 4 / 3),
                    ArrayList(previous.terrain.size * 4 / 3),
                    avatarCountLimit
                )
            }
        }
    }
}
