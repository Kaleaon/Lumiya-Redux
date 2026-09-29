package com.lumiyaviewer.lumiya.render.avatar

import com.google.common.collect.ImmutableSet
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.DrawableStore
import com.lumiyaviewer.lumiya.render.spatial.SpatialIndex
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAnimation
import com.lumiyaviewer.lumiya.slproto.messages.AvatarAppearance
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntry
import java.util.Collections
import java.util.UUID
import java.util.concurrent.ConcurrentHashMap

class AvatarVisualState(
    private val agentUUID: UUID,
    private val avatarObject: SLObjectAvatarInfo,
    private val avatarUUID: UUID
) {
    @Volatile
    private var avatarShapeParams: AvatarShapeParams? = null

    private val textures = AvatarTextures()
    private val animations: MutableMap<UUID, AnimationSequenceInfo> = ConcurrentHashMap()

    private fun startAnimation(uuid: UUID, sequenceID: Int, currentTime: Long, drawableAvatar: DrawableAvatar?) {
        val existing = animations[uuid]
        val animationSequenceInfo: AnimationSequenceInfo
        val changed: Boolean
        if (existing == null) {
            Debug.Printf("Anim: Starting new animation %s seqID %d", uuid.toString(), sequenceID)
            val newSequence = AnimationSequenceInfo.newSequence(uuid, currentTime, sequenceID)
            animations[uuid] = newSequence
            animationSequenceInfo = newSequence
            changed = true
        } else if (sequenceID != existing.sequenceID) {
            val restartSequence = AnimationSequenceInfo.restartSequence(currentTime, sequenceID, existing)
            animations[uuid] = restartSequence
            animationSequenceInfo = restartSequence
            changed = true
        } else {
            animationSequenceInfo = existing
            changed = false
        }
        if (changed && drawableAvatar != null) {
            drawableAvatar.AnimationUpdate(animationSequenceInfo)
        }
    }

    @Synchronized
    private fun updateAvatarShape() {
        val drawableAvatar = SpatialIndex.getInstance().getDrawableAvatar(avatarObject)
        val shapeParams = avatarShapeParams
        if (drawableAvatar != null && shapeParams != null) {
            drawableAvatar.UpdateShapeParams(shapeParams)
        }
    }

    @Synchronized
    private fun updateTextures() {
        val drawableAvatar = SpatialIndex.getInstance().getDrawableAvatar(avatarObject)
        drawableAvatar?.UpdateTextures(textures)
    }

    @Synchronized
    fun ApplyAvatarAnimation(avatarAnimation: AvatarAnimation) {
        val currentTimeMillis = System.currentTimeMillis()
        val activeSet = HashSet<UUID>()
        val toStop = HashSet<UUID>(animations.keys)
        val drawableAvatar = SpatialIndex.getInstance().getDrawableAvatar(avatarObject)

        for (animationList in avatarAnimation.AnimationList_Fields) {
            val uuid = animationList.AnimID ?: continue
            activeSet.add(uuid)
            toStop.remove(uuid)
            startAnimation(uuid, animationList.AnimSequenceID, currentTimeMillis, drawableAvatar)
        }

        if (Collections.disjoint(activeSet, basicAnimations)) {
            toStop.remove(defaultStandingAnimation)
            startAnimation(defaultStandingAnimation, 1, currentTimeMillis, drawableAvatar)
        }

        for (uuid2 in toStop) {
            val animationSequenceInfo2 = animations[uuid2] ?: continue
            val changed: Boolean
            val animationSequenceInfo: AnimationSequenceInfo?
            var shouldRemove = false

            if (animationSequenceInfo2.sequenceID != 0) {
                val stopSequence = AnimationSequenceInfo.stopSequence(currentTimeMillis, animationSequenceInfo2)
                if (stopSequence != null) {
                    animations[uuid2] = stopSequence
                    changed = true
                    animationSequenceInfo = stopSequence
                } else {
                    changed = true
                    animationSequenceInfo = stopSequence
                    shouldRemove = true
                }
            } else {
                changed = false
                animationSequenceInfo = animationSequenceInfo2
            }

            if (animationSequenceInfo != null) {
                shouldRemove = shouldRemove || animationSequenceInfo.hasStopped(currentTimeMillis)
            }

            if (drawableAvatar != null) {
                if (changed && !shouldRemove && animationSequenceInfo != null) {
                    drawableAvatar.AnimationUpdate(animationSequenceInfo)
                }
                shouldRemove = shouldRemove || drawableAvatar.IsAnimationStopped(uuid2)
            }

            if (shouldRemove) {
                Debug.Printf("Anim: Stopping animation %s", uuid2.toString())
                animations.remove(uuid2)
                drawableAvatar?.AnimationRemove(uuid2)
            }
        }
    }

    @Synchronized
    fun ApplyAvatarAppearance(avatarAppearance: AvatarAppearance) {
        val oldParams = avatarShapeParams
        avatarShapeParams = AvatarShapeParams.create(oldParams, avatarAppearance)
        if (avatarShapeParams != oldParams) {
            updateAvatarShape()
        }
        if (textures.ApplyAvatarAppearance(avatarAppearance)) {
            updateTextures()
        }
    }

    @Synchronized
    fun ApplyTextures(textureEntry: SLTextureEntry, z: Boolean) {
        if (textures.ApplyTextures(textureEntry, z)) {
            updateTextures()
        }
    }

    @Synchronized
    fun ApplyVisualParams(ints: IntArray) {
        val oldParams = avatarShapeParams
        avatarShapeParams = AvatarShapeParams.create(oldParams, ints)
        if (avatarShapeParams != oldParams) {
            updateAvatarShape()
        }
    }

    @Synchronized
    fun createDrawableAvatar(drawableStore: DrawableStore): DrawableAvatar {
        val drawableAvatar = DrawableAvatar(drawableStore, agentUUID, avatarObject, avatarUUID, animations)
        val shapeParams = avatarShapeParams
        if (shapeParams != null) {
            drawableAvatar.UpdateShapeParams(shapeParams)
        }
        drawableAvatar.UpdateTextures(textures)
        return drawableAvatar
    }

    @Synchronized
    fun createDrawableAvatarStub(drawableStore: DrawableStore): DrawableAvatarStub {
        return DrawableAvatarStub(drawableStore, agentUUID, avatarObject)
    }

    @Synchronized
    fun getRunningAnimations(): Set<UUID> = animations.keys

    companion object {
        private val defaultStandingAnimation: UUID = UUID.fromString("2408fe9e-df1d-1d7d-f4ff-1384fa7b350f")

        @JvmStatic
        val basicAnimations: ImmutableSet<UUID> = ImmutableSet.Builder<UUID>()
            .add(UUID.fromString("2408fe9e-df1d-1d7d-f4ff-1384fa7b350f")) // ANIM_AGENT_STAND
            .add(UUID.fromString("15468e00-3400-bb66-cecc-646d7c14458e")) // ANIM_AGENT_STAND_1
            .add(UUID.fromString("370f3a20-6ca6-9971-848c-9a01bc42ae3c")) // ANIM_AGENT_STAND_2
            .add(UUID.fromString("42b46214-4b44-79ae-deb8-0df61424ff4b")) // ANIM_AGENT_STAND_3
            .add(UUID.fromString("f22fed8b-a5ed-2c93-64d5-bdd8b93c889f")) // ANIM_AGENT_STAND_4
            .add(UUID.fromString("201f3fdf-cb1f-dbec-201f-7333e328ae7c")) // ANIM_AGENT_CROUCH
            .add(UUID.fromString("47f5f6fb-22e5-ae44-f871-73aaaf4a6022")) // ANIM_AGENT_CROUCHWALK
            .add(UUID.fromString("aec4610c-757f-bc4e-c092-c6e9caf18daf")) // ANIM_AGENT_FLY
            .add(UUID.fromString("2b5a38b2-5e00-3a97-a495-4c826bc443e6")) // ANIM_AGENT_FLYSLOW
            .add(UUID.fromString("4ae8016b-31b9-03bb-c401-b1ea941db41d")) // ANIM_AGENT_HOVER
            .add(UUID.fromString("20f063ea-8306-2562-0b07-5c853b37b31e")) // ANIM_AGENT_HOVER_DOWN
            .add(UUID.fromString("62c5de58-cb33-5743-3d07-9e4cd4352864")) // ANIM_AGENT_HOVER_UP
            .add(UUID.fromString("05ddbff8-aaa9-92a1-2b74-8fe77a29b445")) // ANIM_AGENT_RUN
            .add(UUID.fromString("6ed24bd8-91aa-4b12-ccc7-c97c857ab4e0")) // ANIM_AGENT_WALK
            .add(UUID.fromString("f5fc7433-043d-e819-8298-f519a119b688")) // ANIM_AGENT_FEMALE_WALK
            .build()
    }
}
