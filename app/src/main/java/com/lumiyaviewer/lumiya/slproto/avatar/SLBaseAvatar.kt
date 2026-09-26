package com.lumiyaviewer.lumiya.slproto.avatar

import android.content.res.AssetManager
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.LumiyaApp
import java.io.DataInputStream
import java.io.InputStream
import java.util.EnumMap
import java.util.Map

open class SLBaseAvatar {
    private var meshes: MutableMap<MeshIndex, MeshEntry> = null

    private open class InstanceHolder {
        private static SLBaseAvatar Instance = SLBaseAvatar(null)

        fun InstanceHolder(): private {
        }
    }

    open class MeshEntry {
        public String meshName
        public SLPolyMesh polyMesh
        public AvatarTextureFaceIndex textureFaceIndex
        public BakedTextureIndex textureIndex

        fun MeshEntry(bakedTextureIndex: BakedTextureIndex, avatarTextureFaceIndex: AvatarTextureFaceIndex, meshName: String, polyMesh: SLPolyMesh): public {
            this.textureIndex = bakedTextureIndex
            this.textureFaceIndex = avatarTextureFaceIndex
            this.meshName = meshName
            this.polyMesh = polyMesh
        }
    }

    fun SLBaseAvatar(): private {
        this.meshes = EnumMap(MeshIndex.class)
        this.meshes.put(MeshIndex.MESH_ID_HAIR, MeshEntry(BakedTextureIndex.BAKED_HAIR, AvatarTextureFaceIndex.TEX_HAIR_BAKED, "hairMesh", loadMesh("avatar_hair")))
        this.meshes.put(MeshIndex.MESH_ID_HEAD, MeshEntry(BakedTextureIndex.BAKED_HEAD, AvatarTextureFaceIndex.TEX_HEAD_BAKED, "headMesh", loadMesh("avatar_head")))
        this.meshes.put(MeshIndex.MESH_ID_EYELASH, MeshEntry(BakedTextureIndex.BAKED_HEAD, AvatarTextureFaceIndex.TEX_HEAD_BAKED, "eyelashMesh", loadMesh("avatar_eyelashes")))
        this.meshes.put(MeshIndex.MESH_ID_UPPER_BODY, MeshEntry(BakedTextureIndex.BAKED_UPPER, AvatarTextureFaceIndex.TEX_UPPER_BAKED, "upperBodyMesh", loadMesh("avatar_upper_body")))
        this.meshes.put(MeshIndex.MESH_ID_LOWER_BODY, MeshEntry(BakedTextureIndex.BAKED_LOWER, AvatarTextureFaceIndex.TEX_LOWER_BAKED, "lowerBodyMesh", loadMesh("avatar_lower_body")))
        this.meshes.put(MeshIndex.MESH_ID_EYEBALL_LEFT, MeshEntry(BakedTextureIndex.BAKED_EYES, AvatarTextureFaceIndex.TEX_EYES_BAKED, "eyeBallLeftMesh", loadMesh("avatar_eye")))
        this.meshes.put(MeshIndex.MESH_ID_EYEBALL_RIGHT, MeshEntry(BakedTextureIndex.BAKED_EYES, AvatarTextureFaceIndex.TEX_EYES_BAKED, "eyeBallRightMesh", loadMesh("avatar_eye")))
        this.meshes.put(MeshIndex.MESH_ID_SKIRT, MeshEntry(BakedTextureIndex.BAKED_SKIRT, AvatarTextureFaceIndex.TEX_SKIRT_BAKED, "skirtMesh", loadMesh("avatar_skirt")))
    }

    /* synthetic */ SLBaseAvatar(SLBaseAvatar baseAvatar) {
        this()
    }

    fun getInstance(): SLBaseAvatar {
        return InstanceHolder.Instance
    }

    private fun loadMesh(str: String): SLPolyMesh {
        var dataInputStream: DataInputStream = null
        var inputStream: InputStream = null
        Debug.Printf("BaseAvatar: loading mesh for " + str, arrayOfNulls<Object>(0))
        try {
            var assetManager: AssetManager = LumiyaApp.getAssetManager()
            var open: InputStream = assetManager.open("character/" + str + ".lbm")
            if (str.equals("avatar_head")) {
                inputStream = assetManager.open("character/" + str + ".lbm_0")
                dataInputStream = DataInputStream(inputStream)
            } else {
                dataInputStream = null
                inputStream = null
            }
            var polyMesh: SLPolyMesh = SLPolyMesh(DataInputStream(open), dataInputStream)
            open.close()
            if (inputStream != null) {
                inputStream.close()
            }
        return polyMesh
        } catch (e: Exception) {
            Debug.Warning(e)
        return null
        }
    }

    fun getMeshEntry(meshIndex: MeshIndex): MeshEntry {
        return this.meshes.get(meshIndex)
    }
}
