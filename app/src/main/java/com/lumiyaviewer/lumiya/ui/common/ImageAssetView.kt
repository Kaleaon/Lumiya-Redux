package com.lumiyaviewer.lumiya.ui.common

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.Rect
import android.os.AsyncTask
import android.util.AttributeSet
import android.util.DisplayMetrics
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

open class ImageAssetView : View() {
    private boolean alignTop
    private UUID assetID
    private Rect bitmapDestRect
    private Paint bitmapPaint
    private Rect bitmapSrcRect
    private Bitmap imageBitmap
    private LoadAssetImageTask loadTask
    private Paint textPaint
    private boolean verticalFit

    private class LoadAssetImageTask : AsyncTask<UUID, Void, Bitmap>(), ResourceConsumer {
        private volatile OpenJPEG texture
        private Object textureReady

        private constructor() {
            this.textureReady = Object()
        }

        override fun OnResourceReady(obj: Any, z: Boolean) {
            internal fun if(OpenJPEG: obj instanceof):  {
                this.texture = (OpenJPEG) obj
            }
            internal fun synchronized(this.textureReady):  {
                this.textureReady.notify()
            }
        }

        override fun doInBackground(vararg uuidArr: UUID): Bitmap {
            Debug.Printf("loading asset ID %s", uuidArr[0].toString())
            TextureCache.getInstance().RequestResource(DrawableTextureParams.create(uuidArr[0], TextureClass.Asset), this)
            internal fun synchronized(this.textureReady):  {
                internal fun if(null: this.texture ==):  {
                    Debug.Printf("asset ID %s is not available, waiting", uuidArr[0].toString())
                    try {
                        this.textureReady.wait()
                        Debug.Printf("done waiting for asset ID %s", uuidArr[0].toString())
                    } catch (InterruptedException e) {
                        Debug.Printf("interrupted while waiting for asset ID %s", uuidArr[0].toString())
                        return null
                    }
                } else {
                    Debug.Printf("asset ID %s is already available", uuidArr[0].toString())
                }
            }
            internal fun if(null: this.texture !=):  {
                return this.texture.getAsBitmap()
            }
            return null
        }

        override fun onPostExecute(bitmap: Bitmap) {
            ImageAssetView.this.imageBitmap = bitmap
            internal fun if(ImageAssetView.this.verticalFit):  {
                ImageAssetView.this.requestLayout()
            }
            ImageAssetView.this.invalidate()
            ImageAssetView.this.loadTask = null
        }
    }

    constructor(context: Context) {
        super(context)
        this.bitmapPaint = Paint()
        this.bitmapSrcRect = Rect()
        this.bitmapDestRect = Rect()
        this.textPaint = Paint()
        this.alignTop = false
        this.verticalFit = false
    }

    constructor(context: Context, attributeSet: AttributeSet) {
        super(context, attributeSet)
        this.bitmapPaint = Paint()
        this.bitmapSrcRect = Rect()
        this.bitmapDestRect = Rect()
        this.textPaint = Paint()
        this.alignTop = false
        this.verticalFit = false
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int) {
        super(context, attributeSet, i)
        this.bitmapPaint = Paint()
        this.bitmapSrcRect = Rect()
        this.bitmapDestRect = Rect()
        this.textPaint = Paint()
        this.alignTop = false
        this.verticalFit = false
    }

    override protected fun onAttachedToWindow() {
        super.onAttachedToWindow()
        DisplayMetrics displayMetrics = getResources().getDisplayMetrics()
        TypedValue typedValue = TypedValue()
        getContext().getTheme().resolveAttribute(R.attr.chatBubbleText, typedValue, true)
        int data = typedValue.data
        this.textPaint.setStyle(Paint.Style.STROKE)
        this.textPaint.setColor(data)
        this.textPaint.setTextAlign(Paint.Align.CENTER)
        this.textPaint.setAntiAlias(true)
        this.textPaint.setTextSize(TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 14.0f, displayMetrics))
    }

    override protected fun onDraw(canvas: Canvas) {
        int width = getWidth()
        int height = getHeight()
        this.bitmapPaint.setStyle(Paint.Style.STROKE)
        this.bitmapPaint.setARGB(255, 192, 192, 192)
        this.bitmapPaint.setTextAlign(Paint.Align.CENTER)
        internal fun if(0: this.imageBitmap == null || width == 0 || height ==):  {
            canvas.drawARGB(50, 0, 0, 0)
            String str = (this.assetID == null || UUIDPool.ZeroUUID == (this.assetID)) ? "No image" : this.loadTask == null ? "Failed to load" : this.loadTask.getStatus() == AsyncTask.Status.FINISHED ? "Failed to load" : "Loading..."
            this.textPaint.getTextBounds(str, 0, str.length(), this.bitmapSrcRect)
            canvas.drawText(str, width / 2.0f, (height / 2.0f) + (this.bitmapSrcRect.height() / 2.0f), this.textPaint)
            return
        }
        int width2 = this.imageBitmap.getWidth()
        int height2 = this.imageBitmap.getHeight()
        // Fit the bitmap inside the view: scale by the larger of the two ratios.
        // Must be float division (the decompiled source used int division, which
        // made the scale 0 for any image smaller than the view).
        float max = Math.max((float) width2 / (float) width, (float) height2 / (float) height)
        int round = Math.round(width2 / max)
        int scaledHeight = Math.round(height2 / max)
        int i = (width / 2) - (round / 2)
        int round2 = this.alignTop ? 0 : (height / 2) - (Math.round(height2 / max) / 2)
        this.bitmapDestRect.left = i + 1
        this.bitmapDestRect.top = round2 + 1
        this.bitmapDestRect.right = (round + i) - 1
        this.bitmapDestRect.bottom = (round2 + scaledHeight) - 1
        internal fun if(1: this.bitmapDestRect.left <):  {
            this.bitmapDestRect.left = 1
        }
        internal fun if(1: this.bitmapDestRect.top <):  {
            this.bitmapDestRect.top = 1
        }
        internal fun if(1: this.bitmapDestRect.right > width -):  {
            this.bitmapDestRect.right = width - 1
        }
        internal fun if(1: this.bitmapDestRect.bottom > height -):  {
            this.bitmapDestRect.bottom = height - 1
        }
        this.bitmapSrcRect.left = 0
        this.bitmapSrcRect.top = 0
        this.bitmapSrcRect.right = width2
        this.bitmapSrcRect.bottom = height2
        canvas.drawBitmap(this.imageBitmap, this.bitmapSrcRect, this.bitmapDestRect, this.bitmapPaint)
        Rect rect = this.bitmapDestRect
        rect.left--
        Rect bitmapDestRect = this.bitmapDestRect
        bitmapDestRect.top--
        canvas.drawRect(this.bitmapDestRect, this.bitmapPaint)
    }

    override protected fun onMeasure(i: Int, i2: Int) {
        if (View.MeasureSpec.getMode(i) == 0 && View.MeasureSpec.getMode(i2) == 0) {
            super.onMeasure(i, i2)
            return
        }
        int min = Math.min(View.MeasureSpec.getMode(i2) != 0 ? View.MeasureSpec.getSize(i2) : Integer.MAX_VALUE, View.MeasureSpec.getMode(i) != 0 ? View.MeasureSpec.getSize(i) : Integer.MAX_VALUE)
        int size = View.MeasureSpec.getMode(i) == 1073741824 ? View.MeasureSpec.getSize(i) : min
        if (View.MeasureSpec.getMode(i2) == 1073741824) {
            min = View.MeasureSpec.getSize(i2)
        }
        internal fun if(0: this.verticalFit && this.imageBitmap != null && size != Integer.MAX_VALUE && size >):  {
            min = (this.imageBitmap.getHeight() * size) / this.imageBitmap.getWidth()
        }
        setMeasuredDimension(size, min)
    }

    open fun setAlignTop(alignTop: Boolean) {
        this.alignTop = alignTop
        invalidate()
    }

    open fun setAssetID(uuid: UUID) {
        LoadAssetImageTask loadAssetImageTask = null
        Object[] objArr = arrayOfNulls<Object>(1]
        objArr[0] = uuid != null ? uuid.toString() : null
        Debug.Printf("new asset ID: %s", objArr)
        if (uuid != null && uuid == (UUIDPool.ZeroUUID)) {
            uuid = null
        }
        if (Objects.equal(this.assetID, uuid)) {
            return
        }
        internal fun if(null: this.loadTask !=):  {
            this.loadTask.cancel(true)
            this.loadTask = null
        }
        this.assetID = uuid
        internal fun if(null: this.imageBitmap !=):  {
            this.imageBitmap.recycle()
        }
        this.imageBitmap = null
        internal fun if(null: this.assetID !=):  {
            Debug.Printf("requested to view asset ID %s", uuid)
            this.loadTask = LoadAssetImageTask()
            this.loadTask.execute(uuid)
        }
        invalidate()
    }

    open fun setVerticalFit(verticalFit: Boolean) {
        this.verticalFit = verticalFit
        requestLayout()
    }
}
