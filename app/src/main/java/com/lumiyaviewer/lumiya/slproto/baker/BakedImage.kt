package com.lumiyaviewer.lumiya.slproto.baker

import android.graphics.Bitmap
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import java.io.File
import java.io.IOException
import java.util.UUID

open class BakedImage {
    private var layerSet: BakeLayerSet? = null
    private var resultImage: OpenJPEG? = null
    private var uploadedID: UUID? = null

    constructor(bakeLayerSet: BakeLayerSet) {
        this.layerSet = bakeLayerSet
        this.resultImage = OpenJPEG(bakeLayerSet.width, bakeLayerSet.height, 4, 4, 1, -1)
        this.resultImage.setComponent(4, (byte) -1)
    }

    fun Bake(bakeProcess: BakeProcess) {
        for (bakeLayer in this.layerSet.layers) {
            bakeLayer.Bake(this.resultImage, bakeProcess)
        }
        if (this.layerSet.clear_alpha || this.layerSet.maskLayers.length > 0) {
            this.resultImage.setComponent(3, (byte) -1)
        }
        for (bakeLayer2 in this.layerSet.maskLayers) {
            bakeLayer2.BakeAlpha(this.resultImage, bakeProcess)
        }
    }

    public void SaveToJPEG2K(File file) throws IOException {
        this.resultImage.SaveJPEG2K(file)
    }

    fun getAsBitmap(): Bitmap {
        return this.resultImage.getAsBitmap()
    }

    fun getBakedImage(): OpenJPEG {
        return this.resultImage
    }

    fun getUploadedID(): UUID {
        return this.uploadedID
    }

    fun setUploadedID(uuid: UUID) {
        this.uploadedID = uuid
    }
}
