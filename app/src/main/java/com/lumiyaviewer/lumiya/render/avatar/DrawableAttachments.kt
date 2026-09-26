package com.lumiyaviewer.lumiya.render.avatar

import android.annotation.SuppressLint
import com.google.common.collect.ImmutableList
import com.google.common.collect.ImmutableMultimap
import com.google.common.collect.Multimap
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.DrawableObject
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer
import com.lumiyaviewer.lumiya.slproto.avatar.SLSkeletonBoneID
import com.lumiyaviewer.rawbuffers.DirectByteBuffer
import java.util.function.Consumer
import javax.annotation.Nonnull
import javax.annotation.Nullable
import javax.annotation.concurrent.Immutable

@Immutable
class DrawableAttachments {

    private var glAnimationDataBuffer: GLLoadableBuffer? = null

    @Nonnull
    private val nonRigged: ImmutableMultimap<Int, DrawableObject>

    @Nonnull
    private val rigged: ImmutableList<DrawableObject>

    constructor() {
        glAnimationDataBuffer = null
        nonRigged = ImmutableMultimap.of()
        rigged = ImmutableList.of()
    }

    constructor(@Nullable multimap: Multimap<Int, DrawableObject>?) {
        glAnimationDataBuffer = null
        val builder = ImmutableMultimap.builder<Int, DrawableObject>()
        val builder2 = ImmutableList.builder<DrawableObject>()
        if (multimap != null) {
            for (num in multimap.keySet()) {
                for (drawableObject in multimap[num]) {
                    if (drawableObject.isRiggedMesh) {
                        builder2.add(drawableObject)
                    } else {
                        builder.put(num, drawableObject)
                    }
                }
            }
        }
        nonRigged = builder.build()
        rigged = builder2.build()
        Debug.Printf("Created drawableAttachments: %d rigged, %d non-rigged", rigged.size, nonRigged.size())
    }

    constructor(@Nonnull drawableAttachments: DrawableAttachments) {
        glAnimationDataBuffer = null
        val builder = ImmutableMultimap.builder<Int, DrawableObject>()
        val builder2 = ImmutableList.builder<DrawableObject>()
        builder2.addAll(drawableAttachments.rigged)
        for (num in drawableAttachments.nonRigged.keySet()) {
            for (drawableObject in drawableAttachments.nonRigged[num]) {
                if (drawableObject.isRiggedMesh) {
                    builder2.add(drawableObject)
                } else {
                    builder.put(num, drawableObject)
                }
            }
        }
        nonRigged = builder.build()
        rigged = builder2.build()
        glAnimationDataBuffer = drawableAttachments.glAnimationDataBuffer
        Debug.Printf("Updated drawableAttachments: %d rigged, %d non-rigged", rigged.size, nonRigged.size())
    }

    fun forEachObject(action: Consumer<DrawableObject>) {
        for (drawableObject in rigged) {
            action.accept(drawableObject)
        }
        for (drawableObject in nonRigged.values()) {
            action.accept(drawableObject)
        }
    }

    @SuppressLint("NewApi")
    fun Draw(renderContext: RenderContext, avatarSkeleton: AvatarSkeleton, skeletonChanged: Boolean): Boolean {
        var needsRecheck: Boolean
        if (rigged.isNotEmpty()) {
            if (renderContext.hasGL30) {
                renderContext.setupRiggedMeshProgram(true)
                needsRecheck = if (glAnimationDataBuffer == null) {
                    glAnimationDataBuffer = GLLoadableBuffer(DirectByteBuffer(renderContext.currentRiggedMeshProgram.uAnimationDataBlockSize))
                    true
                } else {
                    false
                }
                if (skeletonChanged || needsRecheck) {
                    glAnimationDataBuffer!!.rawBuffer.loadFromFloatArray(0, avatarSkeleton.jointWorldMatrix, 0, (SLSkeletonBoneID.VALUES.size + 47) * 16)
                }
                val buffer = glAnimationDataBuffer!!
                if (skeletonChanged) needsRecheck = true
                buffer.BindUniformDynamic(renderContext, 1, needsRecheck)
                var drawFlags = 0
                for (obj in rigged) {
                    drawFlags = obj.DrawRigged30(renderContext, 1) or drawFlags
                }
                if ((drawFlags and 2) != 0) {
                    renderContext.setupRiggedMeshProgram(false)
                    for (obj in rigged) {
                        obj.DrawRigged30(renderContext, 2)
                    }
                }
                renderContext.clearRiggedMeshProgram()
            } else {
                for (obj in rigged) {
                    obj.DrawRigged(renderContext, avatarSkeleton, 3)
                }
            }
        }
        var hasNewRigged = false
        for (num in nonRigged.keySet()) {
            val attachmentMatrix = avatarSkeleton.getAttachmentMatrix(num)
            if (attachmentMatrix != null) {
                renderContext.glObjWorldPushAndMultMatrixf(attachmentMatrix, 0)
                for (drawableObject in nonRigged[num]) {
                    if (drawableObject.isRiggedMesh) {
                        hasNewRigged = true
                    } else {
                        drawableObject.Draw(renderContext, 3)
                    }
                }
                renderContext.glObjWorldPopMatrix()
            }
        }
        return hasNewRigged
    }
}
