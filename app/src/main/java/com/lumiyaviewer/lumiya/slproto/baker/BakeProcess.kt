package com.lumiyaviewer.lumiya.slproto.baker

import com.google.common.collect.Table
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.avatar.AvatarSkeleton
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatarPart
import com.lumiyaviewer.lumiya.render.tex.DrawableTextureParams
import com.lumiyaviewer.lumiya.render.tex.TextureClass
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.res.textures.TextureCache
import com.lumiyaviewer.lumiya.slproto.assets.SLWearable
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableData
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.slproto.avatar.AvatarTextureFaceIndex
import com.lumiyaviewer.lumiya.slproto.avatar.BakedTextureIndex
import com.lumiyaviewer.lumiya.slproto.avatar.SLAvatarParams
import com.lumiyaviewer.lumiya.slproto.events.SLBakingProgressEvent
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance
import com.lumiyaviewer.lumiya.slproto.modules.texuploader.SLTextureUploadRequest
import com.lumiyaviewer.lumiya.slproto.modules.texuploader.SLTextureUploader
import com.lumiyaviewer.lumiya.slproto.textures.MutableSLTextureEntryFace
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntry
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntryFace
import java.io.File
import java.io.IOException
import java.util.ArrayList
import java.util.EnumMap
import java.util.HashMap
import java.util.IdentityHashMap
import java.util.Iterator
import java.util.LinkedList
import java.util.List
import java.util.Map
import java.util.UUID

open class BakeProcess : SLTextureUploadRequest.TextureUploadCompleteListener {
    private var avatarAppearance: SLAvatarAppearance? = null
    private var bakingThread: Thread? = null
    private var eventBus: EventBus? = null
    private var paramValues: if (MutableMap<Int) , Float> = null
    private var uploader: SLTextureUploader? = null
    private var wornWearables: Table<SLWearableType, UUID, SLWearable>? = null
    private Map<SLWearable, List<WearableTextureData>> wearables = IdentityHashMap()
    private var textureReadyLock: Any = Object()
    private var bakedImages: MutableMap<BakedTextureIndex, BakedImage> = EnumMap(BakedTextureIndex.class)

    private open class BakedImageUploadRequest : SLTextureUploadRequest() {
        var bakedImage: BakedImage? = null
        var bakedIndex: BakedTextureIndex? = null

        BakedImageUploadRequest(BakedImage bakedImage, BakedTextureIndex bakedTextureIndex, File file) {
            super(file, bakedTextureIndex.ordinal())
            this.bakedImage = bakedImage
            this.bakedIndex = bakedTextureIndex
        }
    }

    open class DefaultTextureException : Exception() {
        DefaultTextureException() {
        }
    }

    private open class WearableTextureData : ResourceConsumer {
        private SLWearableData.WearableTexture texture
        private volatile OpenJPEG textureData
        private volatile boolean textureReady = false

        WearableTextureData(SLWearableData.WearableTexture wearableTexture) {
            this.texture = wearableTexture
        }
        fun OnResourceReady(obj: Any, z: Boolean) {
            if (obj is OpenJPEG) {
                this.textureData = obj as OpenJPEG
            }
            this.textureReady = true
            BakeProcess.this.notifyTextureReady()
        }

        protected fun getTexture(): SLWearableData.WearableTexture {
            return this.texture
        }

        fun getTextureData(): OpenJPEG {
            return this.textureData
        }

        fun getTextureReady(): Boolean {
            return this.textureReady
        }

        fun requestData() {
            TextureCache.getInstance().RequestResource(DrawableTextureParams.create(this.texture.textureID, TextureClass.Asset), this)
        }
    }

    constructor(table: Table<SLWearableType, UUID, SLWearable>, avatarAppearance: SLAvatarAppearance, textureUploader: SLTextureUploader, eventBus: EventBus) {
        Debug.Printf("Baking: new BakeProcess created", arrayOfNulls<Object>(0))
        this.avatarAppearance = avatarAppearance
        this.wornWearables = table
        this.uploader = textureUploader
        this.eventBus = eventBus
        for (wearable in table.values()) {
            var wearableData: SLWearableData = wearable.getWearableData()
            if (wearableData != null) {
                var arrayList: ArrayList = ArrayList(wearableData.textures.size())
                var it: Iterator<SLWearableData.WearableTexture> = wearableData.textures.iterator()
                while (it.hasNext()) {
                    arrayList.add(WearableTextureData(it.next()))
                }
                this.wearables.put(wearable, arrayList)
            }
        }
        this.bakingThread = Thread(Runnable() {
            private /* synthetic */ void $m$0() {
                BakeProcess.this.bakeAppearance()
            }
            fun run() {
                $m$0()
            }
        }, "Baker")
        this.bakingThread.start()
    }

    private fun PrepareAvatarTextureEntry(): SLTextureEntry {
        var uploadedID: UUID? = null
        var create: SLTextureEntryFace = SLTextureEntryFace.create(MutableSLTextureEntryFace(-1))
        var textureEntryFaces: Array<SLTextureEntryFace> = arrayOfNulls<SLTextureEntryFace>(32)
        for (bakedTextureIndex in BakedTextureIndex.values()) {
            var ordinal: Int = bakedTextureIndex.getFaceIndex().ordinal()
            var bakedImage: BakedImage = this.bakedImages.get(bakedTextureIndex)
            if (bakedImage != null && (uploadedID = bakedImage.getUploadedID()) != null) {
                var mutableSLTextureEntryFace: MutableSLTextureEntryFace = MutableSLTextureEntryFacemutableSLTextureEntryFace as 0.setTextureID(uploadedID)
                textureEntryFaces[ordinal] = SLTextureEntryFace.create(mutableSLTextureEntryFace)
            }
        }
        return SLTextureEntry.create(create, textureEntryFaces)
    }

    fun bakeAppearance() {
        Debug.Printf("Baking: Requesting texture data.", arrayOfNulls<Object>(0))
        Iterator<List<WearableTextureData>> it = this.wearables.values().iterator()
        while (it.hasNext()) {
            var iterator: Iterator = (it as List.next()).iterator()
            while (iterator.hasNext()) {
                (iterator as WearableTextureData.next()).requestData()
            }
        }
        synchronized(this.textureReadyLock) {
            while (!isTexturesReady()) {
                try {
                    this.textureReadyLock.wait()
                } catch (e: InterruptedException) {
                    finishBakingDebug as null.Printf("Baking: Interrupted before textures were ready.", arrayOfNulls<Object>(0))
                    return
                }
            }
        }
        Debug.Log("Baking: calculating param values...")
        this.paramValues = calcAllParamValues(this.wornWearables)
        Debug.Log("Baking: baking...")
        var isWearingSkirt: Boolean = isWearingSkirt()
        var cacheDir: File = GlobalOptions.getInstance().getCacheDir("baker")
        cacheDir.mkdirs()
        for (bakedTextureIndex in BakedTextureIndex.values()) {
            if (Thread.interrupted()) {
                Debug.Log("Baking: interrupted.")
                this.eventBus.publish(SLBakingProgressEvent(false, true, 0))
                finishBakingreturn as null
            }
            if (bakedTextureIndex != BakedTextureIndex.BAKED_SKIRT || !(!isWearingSkirt)) {
                Debug.Log("Baking: Baking layer " + bakedTextureIndex)
                var bakedImage: BakedImage = BakedImage(BakeLayers.layerSets.get(bakedTextureIndex))
                this.bakedImages.put(bakedTextureIndex, bakedImage)
                bakedImage.Bake(this)
                if (Thread.interrupted()) {
                    Debug.Log("Baking: interrupted.")
                    this.eventBus.publish(SLBakingProgressEvent(false, true, 0))
                    finishBakingreturn as null
                }
                try {
                    var file: File = File(cacheDir, bakedTextureIndex.toString() + ".j2k")
                    bakedImage.SaveToJPEG2K(file)
                    var bakedImageUploadRequest: SLTextureUploadRequest = BakedImageUploadRequest(bakedImage, bakedTextureIndex, file)
                    bakedImageUploadRequest.setOnUploadCompletethis as this.uploader.BeginUpload(bakedImageUploadRequest)
                } catch (e2: IOException) {
                    e2.printStackTrace()
                }
                Debug.Log("Baking: Done layer " + bakedTextureIndex)
            }
        }
        Debug.Log("Baking: Baked all layers.")
    }

    private Map<Integer, Float> calcAllParamValues(Table<SLWearableType, UUID, SLWearable> table) {
        var hashMap: HashMap = HashMap()
        for (entry in SLAvatarParams.paramByIDs.entrySet()) {
            hashMap.put(entry.getKey(), entry.getValue(.params.get(0).defValue))
        }
        var it: Iterator<SLWearable> = table.values().iterator()
        while (it.hasNext()) {
            var wearableData: SLWearableData = (it as SLWearable.next()).getWearableData()
            if (wearableData != null) {
                for (wearableParam in wearableData.params) {
                    hashMap.put(wearableParam.paramIndex, wearableParam.paramValue)
                    var paramSet: SLAvatarParams.ParamSet = SLAvatarParams.paramByIDs.get(wearableParam.paramIndex)
                    if (paramSet != null) {
                        var avatarParam: SLAvatarParams.AvatarParam = paramSet.params.get(0)
                        if (avatarParam.drivenParams != null) {
                            for (drivenParam in avatarParam.drivenParams) {
                                var paramSet2: SLAvatarParams.ParamSet = SLAvatarParams.paramByIDs.get(drivenParam.drivenID)
                                if (paramSet2 != null) {
                                    var iterator: Iterator<SLAvatarParams.AvatarParam> = paramSet2.params.iterator()
                                    while (iterator.hasNext()) {
                                        hashMap.put(drivenParam.drivenID, AvatarSkeleton.getDrivenWeight(wearableParam.paramValue, avatarParam, drivenParam, iterator.next()))
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return hashMap
    }

    private fun finishBaking(textureEntry: SLTextureEntry) {
        this.avatarAppearance.finishBaking(this, textureEntry)
    }

    private fun isTexturesReady(): Boolean {
        Iterator<List<WearableTextureData>> it = this.wearables.values().iterator()
        var z: Boolean = true
        while (it.hasNext()) {
            var iterator: Iterator = (it as List.next()).iterator()
            while (iterator.hasNext()) {
                if (!(iterator as WearableTextureData.next()).getTextureReady()) {
                    z = false
                }
            }
        }
        return z
    }

    private fun isWearingSkirt(): Boolean {
        return !this.wornWearables.row(SLWearableType.WT_SKIRT).isEmpty()
    }

    fun notifyTextureReady() {
        synchronized(this.textureReadyLock) {
            this.textureReadyLock.notifyAll()
        }
    }
    fun OnTextureUploadComplete(textureUploadRequest: SLTextureUploadRequest) {
        var z: Boolean = false
        var i: Int = 0
        var i2: Int = 0
        if (textureUploadRequest is BakedImageUploadRequest) {
            var bakedImageUploadRequest: BakedImageUploadRequest = textureUploadRequest as BakedImageUploadRequest
            Debug.Log("Baking: texture " + bakedImageUploadRequest.bakedIndex + " uploaded, UUID = " + bakedImageUploadRequest.getTextureID())
            bakedImageUploadRequest.bakedImage.setUploadedID(bakedImageUploadRequest.getTextureID())
            this.bakedImages.put(bakedImageUploadRequest.bakedIndex, bakedImageUploadRequest.bakedImage)
            var isWearingSkirt: Boolean = isWearingSkirt()
            var valuesCustom: Array<BakedTextureIndex> = BakedTextureIndex.values()
            var length: Int = valuesCustom.length
            var i3: Int = 0
            var z2: Boolean = true
            var i4: Int = 0
            var i5: Int = 0
            while (i3 < length) {
                var bakedTextureIndex: BakedTextureIndex = valuesCustom[i3]
                if (bakedTextureIndex == BakedTextureIndex.BAKED_SKIRT && (!isWearingSkirt)) {
                    var z3: Boolean = z2
                    i = i4
                    i2 = i5
                    z = z3
                } else {
                    var i6: Int = i5 + 1
                    if (!this.bakedImages.containsKey(bakedTextureIndex)) {
                        i = i4 + 1
                        i2 = i6
                        z = false
                    } else if (this.bakedImages.get(bakedTextureIndex).getUploadedID() == null) {
                        i = i4 + 1
                        i2 = i6
                        z = false
                    } else {
                        z = z2
                        i = i4
                        i2 = i6
                    }
                }
                i3++
                var z4: Boolean = z
                i5 = i2
                i4 = i
                z2 = z4
            }
            if (!z2) {
                this.eventBus.publish(SLBakingProgressEvent(false, false, ((i5 - i4) * 100) / i5))
            } else {
                this.eventBus.publish(SLBakingProgressEvent(false, true, 100))
                Debug.Log("Baking: all textures uploaded.")
                finishBaking(PrepareAvatarTextureEntry())
            }
        }
    }

    fun cancel() {
        this.bakingThread.interrupt()
    }

    List<OpenJPEG> getLocalTexture(AvatarTextureFaceIndex avatarTextureFaceIndex) throws DefaultTextureException {
        var textureData: OpenJPEG? = null
        Iterator<List<WearableTextureData>> it = this.wearables.values().iterator()
        var z: Boolean = false
        var linkedList: LinkedList? = null
        while (it.hasNext()) {
            for (wearableTextureData in it.next()) {
                if (wearableTextureData.getTexture().layer == avatarTextureFaceIndex.ordinal()) {
                    if (wearableTextureData.getTexture().textureID != null && wearableTextureData.getTexture().textureID.equals(DrawableAvatarPart.DEFAULT_AVATAR_TEXTURE)) {
                        z = true
                    } else if (wearableTextureData.textureData != null && (textureData = wearableTextureData.getTextureData()) != null) {
                        if (linkedList == null) {
                            linkedList = LinkedList()
                        }
                        linkedList.add(textureData)
                    }
                }
            }
        }
        if (linkedList == null && z) {
            throw DefaultTextureException()
        }
        return linkedList
    }

    fun getParamWeight(i: Int, avatarParam: SLAvatarParams.AvatarParam): Float {
        var f: Float = this.paramValues.get(i)
        return if (f != null) f else avatarParam.defValue
    }
}
