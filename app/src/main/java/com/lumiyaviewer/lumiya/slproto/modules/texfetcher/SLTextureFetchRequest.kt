package com.lumiyaviewer.lumiya.slproto.modules.texfetcher

import com.lumiyaviewer.lumiya.render.tex.TextureClass
import com.lumiyaviewer.lumiya.render.tex.TexturePriority
import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex
import com.lumiyaviewer.lumiya.utils.HasPriority
import java.io.File
import java.util.UUID

open class SLTextureFetchRequest : HasPriority {

    var avatarFaceIndex: AvatarTextureFaceIndex = null
    var avatarUUID: UUID = null
    var destFile: File = null
    var textureClass: TextureClass = null
    var textureID: UUID = null
    var textureLayer: Int = 0
    var onFetchComplete: TextureFetchCompleteListener = null
    var outputFile: File = null
    private var visibleRangeCategory: Int = -1

    interface TextureFetchCompleteListener {
        void OnTextureFetchComplete(SLTextureFetchRequest textureFetchRequest)
    }

    constructor(uuid: UUID, textureLayer: Int, textureClass: TextureClass, avatarTextureFaceIndex: AvatarTextureFaceIndex, avatarUUID: UUID, file: File) {
        this.textureID = uuid
        this.textureLayer = textureLayer
        this.textureClass = textureClass
        this.avatarFaceIndex = avatarTextureFaceIndex
        this.avatarUUID = avatarUUID
        this.destFile = file
    }

    fun getPriorityForClass(textureClass: TextureClass, i: Int): Int {
        when (textureClass) {
            Asset ->
                return TexturePriority.Asset.ordinal()
            Baked ->
                return TexturePriority.PrimVisibleClose.ordinal()
            Prim ->
                when (i) {
                    -1 ->
                        return TexturePriority.PrimInvisible.ordinal()
                    0 ->
                        return TexturePriority.PrimVisibleClose.ordinal()
                    1 ->
                        return TexturePriority.PrimVisibleMedium.ordinal()
                    else ->
                        return TexturePriority.PrimVisibleFar.ordinal()
                }
            Sculpt ->
                return TexturePriority.Sculpt.ordinal()
            Terrain ->
                return TexturePriority.Terrain.ordinal()
            else ->
                return TexturePriority.Lowest.ordinal()
        }
    }
    fun getPriority(): Int {
        return getPriorityForClass(this.textureClass, this.visibleRangeCategory)
    }

    fun setOnFetchComplete(textureFetchCompleteListener: TextureFetchCompleteListener) {
        this.onFetchComplete = textureFetchCompleteListener
    }
}
