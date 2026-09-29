package com.lumiyaviewer.lumiya.ui.chat

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.Rect
import android.graphics.drawable.Drawable
import androidx.core.content.ContextCompat
import android.util.AttributeSet
import android.util.TypedValue
import android.view.View
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource

class ChatterPicView @JvmOverloads constructor(
    context: Context,
    attributeSet: AttributeSet? = null,
    defStyleAttr: Int = 0,
    defStyleRes: Int = 0
) : View(context, attributeSet, defStyleAttr, defStyleRes) {

    private var attachedMessageSource: ChatMessageSource? = null
    private val bitmapDestRect: Rect = Rect()
    private val bitmapPaint: Paint = Paint()
    private val bitmapSrcRect: Rect = Rect()

    private var chatterID: ChatterID? = null

    private var chatterName: String? = null

    private var defaultIconDrawable: Drawable? = null

    private var forceIcon: Drawable? = null

    private var thumbnailData: ChatterThumbnailData? = null
    private var thumbnailDefaultIcon: Int = -1

    fun getAttachedMessageSource(): ChatMessageSource? {
        return this.attachedMessageSource
    }

    override fun onAttachedToWindow() {
        super.onAttachedToWindow()
        val chatterID = this.chatterID
        if (this.thumbnailData != null || chatterID == null) {
            return
        }
        this.thumbnailData = ChatterThumbnailData(chatterID, this)
    }

    override fun onDetachedFromWindow() {
        super.onDetachedFromWindow()
        if (this.thumbnailData != null) {
            this.thumbnailData!!.dispose()
            this.thumbnailData = null
        }
    }

    override fun onDraw(canvas: Canvas) {
        var i: Int
        var str: String?
        var i2 = 192
        var i3 = 64
        val width = width
        val height = height
        this.bitmapPaint.style = Paint.Style.STROKE
        this.bitmapPaint.setARGB(255, 255, 255, 255)
        this.bitmapPaint.textAlign = Paint.Align.CENTER
        this.bitmapPaint.textSize = height / 2.0f
        this.bitmapPaint.isAntiAlias = true
        val forceIcon = this.forceIcon
        if (forceIcon != null) {
            forceIcon.setBounds(0, 0, width, height)
            forceIcon.draw(canvas)
            return
        }
        val thumbnailData = this.thumbnailData
        if (thumbnailData == null) {
            canvas.drawRGB(64, 64, 64)
            return
        }
        val bitmapData = thumbnailData.getBitmapData()
        if (bitmapData != null) {
            this.bitmapSrcRect.left = 0
            this.bitmapSrcRect.top = 0
            this.bitmapSrcRect.right = bitmapData.width
            this.bitmapSrcRect.bottom = bitmapData.height
            this.bitmapDestRect.left = 0
            this.bitmapDestRect.top = 0
            this.bitmapDestRect.right = width
            this.bitmapDestRect.bottom = height
            canvas.drawBitmap(bitmapData, this.bitmapSrcRect, this.bitmapDestRect, this.bitmapPaint)
            return
        }
        val defaultIconDrawable = this.defaultIconDrawable
        if (defaultIconDrawable != null) {
            defaultIconDrawable.setBounds(0, 0, width, height)
            defaultIconDrawable.draw(canvas)
            return
        }
        val optionalChatterUUID = this.chatterID?.getOptionalChatterUUID()
        if (optionalChatterUUID != null) {
            val abs = Math.abs(optionalChatterUUID.hashCode()) % 6
            if (abs < 3) {
                val i4 = if (abs == 0) 192 else 32
                val i5 = if (abs == 1) 192 else 32
                if (abs == 2) {
                    i = i5
                    i3 = i4
                } else {
                    i2 = 32
                    i = i5
                    i3 = i4
                }
            } else {
                val i6 = if (abs != 3) 192 else 32
                val i7 = if (abs != 4) 192 else 32
                if (abs != 5) {
                    i = i7
                    i3 = i6
                } else {
                    i2 = 32
                    i = i7
                    i3 = i6
                }
            }
            Debug.Printf("colorize: uuid %s, hash %x, comp %d, rgb %d, %d, %d", optionalChatterUUID.toString(), optionalChatterUUID.hashCode(), abs, i3, i, i2)
        } else {
            i2 = 64
            i = 64
        }
        canvas.drawRGB(i3, i, i2)
        val chatterName = this.chatterName
        if (chatterName != null) {
            str = null
            for (i8 in chatterName.indices) {
                val charAt = chatterName[i8]
                if (Character.isLetter(charAt)) {
                    str = charAt.toString()
                    break
                }
            }
            if (str != null) {
                canvas.drawText(str.uppercase(), width / 2.0f, (height / 2.0f) - ((this.bitmapPaint.descent() + this.bitmapPaint.ascent()) / 2.0f), this.bitmapPaint)
            }
        }
    }

    fun setAttachedMessageSource(chatMessageSource: ChatMessageSource?) {
        this.attachedMessageSource = chatMessageSource
    }

    fun setChatterID(chatterID: ChatterID?, chatterName: String?) {
        var z = true
        var z2 = false
        if (this.forceIcon != null && chatterID != null) {
            this.forceIcon = null
            z2 = true
        }
        if (!Objects.equal(this.chatterID, chatterID)) {
            this.chatterID = chatterID
            if (chatterID != null) {
                this.thumbnailData = ChatterThumbnailData(chatterID, this)
            } else {
                if (this.thumbnailData != null) {
                    this.thumbnailData!!.dispose()
                }
                this.thumbnailData = null
            }
            z2 = true
        }
        if (Objects.equal(this.chatterName, chatterName)) {
            z = z2
        } else {
            this.chatterName = chatterName
        }
        if (z) {
            postInvalidate()
        }
    }

    fun setDefaultIcon(thumbnailDefaultIcon: Int, z: Boolean) {
        if (this.thumbnailDefaultIcon != thumbnailDefaultIcon) {
            this.thumbnailDefaultIcon = thumbnailDefaultIcon
            if (this.thumbnailDefaultIcon == -1) {
                this.defaultIconDrawable = null
            } else if (z) {
                this.defaultIconDrawable = ContextCompat.getDrawable(context, thumbnailDefaultIcon)
            } else {
                val typedValue = TypedValue()
                context.theme.resolveAttribute(thumbnailDefaultIcon, typedValue, true)
                this.defaultIconDrawable = ContextCompat.getDrawable(context, typedValue.resourceId)
            }
            postInvalidate()
        }
    }

    fun setForceIcon(forceIcon: Int) {
        if (forceIcon == -1) {
            this.forceIcon = null
            postInvalidate()
        } else {
            this.forceIcon = ContextCompat.getDrawable(context, forceIcon)
            setChatterID(null, null)
            postInvalidate()
        }
    }
}
