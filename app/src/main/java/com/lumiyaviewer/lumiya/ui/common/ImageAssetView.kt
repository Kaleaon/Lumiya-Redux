package com.lumiyaviewer.lumiya.ui.common

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.Rect
import android.os.AsyncTask
import android.util.AttributeSet
import android.util.TypedValue
import android.view.View
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.tex.DrawableTextureParams
import com.lumiyaviewer.lumiya.render.tex.TextureClass
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.res.textures.TextureCache
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

class ImageAssetView @JvmOverloads constructor(context: Context, attributeSet: AttributeSet? = null, defStyleAttr: Int = 0) :
    View(context, attributeSet, defStyleAttr) {

    private var alignTop: Boolean = false
    private var assetID: UUID? = null
    private val bitmapDestRect: Rect = Rect()
    private val bitmapPaint: Paint = Paint()
    private val bitmapSrcRect: Rect = Rect()
    private var imageBitmap: Bitmap? = null
    private var loadTask: LoadAssetImageTask? = null
    private val textPaint: Paint = Paint()
    private var verticalFit: Boolean = false

    private inner class LoadAssetImageTask : AsyncTask<UUID, Void, Bitmap?>(), ResourceConsumer {
        @Volatile
        private var texture: OpenJPEG? = null
        private val textureReady = Object()

        override fun OnResourceReady(obj: Any?, z: Boolean) {
            if (obj is OpenJPEG) {
                this.texture = obj
            }
            synchronized(this.textureReady) {
                (this.textureReady as Object).notify()
            }
        }

        override fun doInBackground(vararg uuidArr: UUID): Bitmap? {
            Debug.Printf("loading asset ID %s", uuidArr[0].toString())
            TextureCache.getInstance().RequestResource(DrawableTextureParams.create(uuidArr[0], TextureClass.Asset), this)
            synchronized(this.textureReady) {
                if (this.texture == null) {
                    Debug.Printf("asset ID %s is not available, waiting", uuidArr[0].toString())
                    try {
                        (this.textureReady as Object).wait()
                        Debug.Printf("done waiting for asset ID %s", uuidArr[0].toString())
                    } catch (e: InterruptedException) {
                        Debug.Printf("interrupted while waiting for asset ID %s", uuidArr[0].toString())
                        return null
                    }
                } else {
                    Debug.Printf("asset ID %s is already available", uuidArr[0].toString())
                }
            }
            val texture = this.texture
            if (texture != null) {
                return texture.getAsBitmap()
            }
            return null
        }

        override fun onPostExecute(bitmap: Bitmap?) {
            this@ImageAssetView.imageBitmap = bitmap
            if (this@ImageAssetView.verticalFit) {
                this@ImageAssetView.requestLayout()
            }
            this@ImageAssetView.invalidate()
            this@ImageAssetView.loadTask = null
        }
    }

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        val displayMetrics = resources.displayMetrics
        val typedValue = TypedValue()
        context.theme.resolveAttribute(R.attr.chatBubbleText, typedValue, true)
        val data = typedValue.data
        this.textPaint.style = Paint.Style.STROKE
        this.textPaint.color = data
        this.textPaint.textAlign = Paint.Align.CENTER
        this.textPaint.isAntiAlias = true
        this.textPaint.textSize = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 14.0f, displayMetrics)
    }

    override fun onDraw(canvas: Canvas) {
        val width = width
        val height = height
        this.bitmapPaint.style = Paint.Style.STROKE
        this.bitmapPaint.setARGB(255, 192, 192, 192)
        this.bitmapPaint.textAlign = Paint.Align.CENTER
        val imageBitmap = this.imageBitmap
        if (imageBitmap == null || width == 0 || height == 0) {
            canvas.drawARGB(50, 0, 0, 0)
            val str = if (this.assetID == null || UUIDPool.ZeroUUID == this.assetID) "No image" else if (this.loadTask == null) "Failed to load" else if (this.loadTask!!.status == AsyncTask.Status.FINISHED) "Failed to load" else "Loading..."
            this.textPaint.getTextBounds(str, 0, str.length, this.bitmapSrcRect)
            canvas.drawText(str, width / 2.0f, (height / 2.0f) + (this.bitmapSrcRect.height() / 2.0f), this.textPaint)
            return
        }
        val width2 = imageBitmap.width
        val height2 = imageBitmap.height
        // Fit the bitmap inside the view: scale by the larger of the two ratios.
        // Must be float division (the decompiled source used int division, which
        // made the scale 0 for any image smaller than the view).
        val max = Math.max(width2.toFloat() / width.toFloat(), height2.toFloat() / height.toFloat())
        val round = Math.round(width2 / max)
        val scaledHeight = Math.round(height2 / max)
        val i = (width / 2) - (round / 2)
        val round2 = if (this.alignTop) 0 else (height / 2) - (Math.round(height2 / max) / 2)
        this.bitmapDestRect.left = i + 1
        this.bitmapDestRect.top = round2 + 1
        this.bitmapDestRect.right = (round + i) - 1
        this.bitmapDestRect.bottom = (round2 + scaledHeight) - 1
        if (this.bitmapDestRect.left < 1) {
            this.bitmapDestRect.left = 1
        }
        if (this.bitmapDestRect.top < 1) {
            this.bitmapDestRect.top = 1
        }
        if (this.bitmapDestRect.right > width - 1) {
            this.bitmapDestRect.right = width - 1
        }
        if (this.bitmapDestRect.bottom > height - 1) {
            this.bitmapDestRect.bottom = height - 1
        }
        this.bitmapSrcRect.left = 0
        this.bitmapSrcRect.top = 0
        this.bitmapSrcRect.right = width2
        this.bitmapSrcRect.bottom = height2
        canvas.drawBitmap(imageBitmap, this.bitmapSrcRect, this.bitmapDestRect, this.bitmapPaint)
        this.bitmapDestRect.left--
        this.bitmapDestRect.top--
        canvas.drawRect(this.bitmapDestRect, this.bitmapPaint)
    }

    override fun onMeasure(i: Int, i2: Int) {
        if (View.MeasureSpec.getMode(i) == 0 && View.MeasureSpec.getMode(i2) == 0) {
            super.onMeasure(i, i2)
            return
        }
        var min = Math.min(
            if (View.MeasureSpec.getMode(i2) != 0) View.MeasureSpec.getSize(i2) else Integer.MAX_VALUE,
            if (View.MeasureSpec.getMode(i) != 0) View.MeasureSpec.getSize(i) else Integer.MAX_VALUE
        )
        val size = if (View.MeasureSpec.getMode(i) == 1073741824) View.MeasureSpec.getSize(i) else min
        if (View.MeasureSpec.getMode(i2) == 1073741824) {
            min = View.MeasureSpec.getSize(i2)
        }
        val imageBitmap = this.imageBitmap
        if (this.verticalFit && imageBitmap != null && size != Integer.MAX_VALUE && size > 0) {
            min = (imageBitmap.height * size) / imageBitmap.width
        }
        setMeasuredDimension(size, min)
    }

    fun setAlignTop(alignTop: Boolean) {
        this.alignTop = alignTop
        invalidate()
    }

    fun setAssetID(assetID: UUID?) {
        var uuid = assetID
        Debug.Printf("new asset ID: %s", uuid?.toString())
        if (uuid != null && uuid == UUIDPool.ZeroUUID) {
            uuid = null
        }
        if (Objects.equal(this.assetID, uuid)) {
            return
        }
        if (this.loadTask != null) {
            this.loadTask!!.cancel(true)
            this.loadTask = null
        }
        this.assetID = uuid
        if (this.imageBitmap != null) {
            this.imageBitmap!!.recycle()
        }
        this.imageBitmap = null
        if (this.assetID != null) {
            Debug.Printf("requested to view asset ID %s", uuid)
            val loadTask = LoadAssetImageTask()
            this.loadTask = loadTask
            loadTask.execute(uuid)
        }
        invalidate()
    }

    fun setVerticalFit(verticalFit: Boolean) {
        this.verticalFit = verticalFit
        requestLayout()
    }
}
