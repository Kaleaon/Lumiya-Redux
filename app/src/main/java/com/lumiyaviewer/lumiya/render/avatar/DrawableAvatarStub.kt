package com.lumiyaviewer.lumiya.render.avatar

import android.opengl.Matrix
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.DrawableStore
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import java.util.UUID

open class DrawableAvatarStub(
    protected val drawableStore: DrawableStore,
    uuid: UUID,
    val avatarObject: SLObjectAvatarInfo
) : ChatterNameRetriever.OnChatterNameUpdated {

    private val chatterNameRetriever =
        ChatterNameRetriever(ChatterID.getUserChatterID(uuid, avatarObject.id), this, null)

    @Volatile
    var drawableNameTag: DrawableHoverText? = null

    @Volatile
    private var nameTag: String? = null

    private fun setNameTag(nameTag: String?) {
        if (Objects.equal(this.nameTag, nameTag)) {
            return
        }
        this.nameTag = nameTag
        Debug.Printf("DrawableAvatar: setting: nameTag = %s", nameTag ?: "null")
        if (nameTag != null) {
            drawableNameTag = DrawableHoverText(drawableStore.textTextureCache, nameTag, Int.MIN_VALUE)
        }
    }

    fun DrawNameTag(renderContext: RenderContext) {
        val drawableHoverText = drawableNameTag
        val worldMatrix = getWorldMatrix(renderContext)
        if (drawableHoverText == null || worldMatrix == null) {
            return
        }
        drawableHoverText.DrawAtWorld(
            renderContext, worldMatrix[12], worldMatrix[13], 0.75f + worldMatrix[14], 0.5f,
            renderContext.projectionMatrix, false, 0
        )
    }

    open fun getWorldMatrix(renderContext: RenderContext): FloatArray? {
        if (!avatarObject.isMyAvatar || avatarObject.parentID != 0) {
            return avatarObject.worldMatrix
        }
        val matrix = FloatArray(32)
        val rotation = avatarObject.rotation
        if (rotation != null) {
            Matrix.setIdentityM(matrix, 16)
            Matrix.translateM(
                matrix, 16,
                renderContext.myAviPosition.x, renderContext.myAviPosition.y, renderContext.myAviPosition.z
            )
            Matrix.multiplyMM(matrix, 0, matrix, 16, rotation.getInverseMatrix(), 0)
        }
        return matrix
    }

    override fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
        setNameTag(chatterNameRetriever.resolvedName)
    }
}
