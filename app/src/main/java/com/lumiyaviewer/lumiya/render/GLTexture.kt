package com.lumiyaviewer.lumiya.render

import android.graphics.Bitmap
import java.nio.ByteBuffer

interface GLTexture {
    @Suppress("FunctionName") fun SetAsTexture(): Int
    fun getAsBitmap(): Bitmap
    fun getByte(index: Int): Byte
    fun getExtraComponentsBuffer(): ByteBuffer
    fun getHeight(): Int
    fun getNumComponents(): Int
    fun getRGB(index: Int): Int
    fun getWidth(): Int
}
