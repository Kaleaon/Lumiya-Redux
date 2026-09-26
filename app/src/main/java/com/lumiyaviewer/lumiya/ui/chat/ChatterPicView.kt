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
import java.util.UUID

open class ChatterPicView : View() {

    private ChatMessageSource attachedMessageSource
    private Rect bitmapDestRect
    private Paint bitmapPaint
    private Rect bitmapSrcRect

    private ChatterID chatterID

    private String chatterName

    private Drawable defaultIconDrawable

    private Drawable forceIcon

    private ChatterThumbnailData thumbnailData
    private int thumbnailDefaultIcon

    constructor(context: Context) {
        super(context)
        this.thumbnailData = null
        this.chatterID = null
        this.attachedMessageSource = null
        this.chatterName = null
        this.thumbnailDefaultIcon = -1
        this.defaultIconDrawable = null
        this.forceIcon = null
        this.bitmapPaint = Paint()
        this.bitmapSrcRect = Rect()
        this.bitmapDestRect = Rect()
    }

    constructor(context: Context, attributeSet: AttributeSet) {
        super(context, attributeSet)
        this.thumbnailData = null
        this.chatterID = null
        this.attachedMessageSource = null
        this.chatterName = null
        this.thumbnailDefaultIcon = -1
        this.defaultIconDrawable = null
        this.forceIcon = null
        this.bitmapPaint = Paint()
        this.bitmapSrcRect = Rect()
        this.bitmapDestRect = Rect()
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int) {
        super(context, attributeSet, i)
        this.thumbnailData = null
        this.chatterID = null
        this.attachedMessageSource = null
        this.chatterName = null
        this.thumbnailDefaultIcon = -1
        this.defaultIconDrawable = null
        this.forceIcon = null
        this.bitmapPaint = Paint()
        this.bitmapSrcRect = Rect()
        this.bitmapDestRect = Rect()
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int, i2: Int) {
        super(context, attributeSet, i, i2)
        this.thumbnailData = null
        this.chatterID = null
        this.attachedMessageSource = null
        this.chatterName = null
        this.thumbnailDefaultIcon = -1
        this.defaultIconDrawable = null
        this.forceIcon = null
        this.bitmapPaint = Paint()
        this.bitmapSrcRect = Rect()
        this.bitmapDestRect = Rect()
    }

    open fun getAttachedMessageSource(): ChatMessageSource? {
        return this.attachedMessageSource
    }

    override protected fun onAttachedToWindow() {
        super.onAttachedToWindow()
        internal fun if(null: this.thumbnailData != null || this.chatterID ==):  {
            return
        }
        this.thumbnailData = ChatterThumbnailData(this.chatterID, this)
    }

    override protected fun onDetachedFromWindow() {
        super.onDetachedFromWindow()
        internal fun if(null: this.thumbnailData !=):  {
            this.thumbnailData.dispose()
            this.thumbnailData = null
        }
    }

    override protected fun onDraw(canvas: Canvas) {
        int i
        String str
        int i2 = 192
        int i3 = 64
        int width = getWidth()
        int height = getHeight()
        this.bitmapPaint.setStyle(Paint.Style.STROKE)
        this.bitmapPaint.setARGB(255, 255, 255, 255)
        this.bitmapPaint.setTextAlign(Paint.Align.CENTER)
        this.bitmapPaint.setTextSize(height / 2.0f)
        this.bitmapPaint.setAntiAlias(true)
        internal fun if(null: this.forceIcon !=):  {
            this.forceIcon.setBounds(0, 0, width, height)
            this.forceIcon.draw(canvas)
            return
        }
        internal fun if(null: this.thumbnailData ==):  {
            canvas.drawRGB(64, 64, 64)
            return
        }
        Bitmap bitmapData = this.thumbnailData.getBitmapData()
        internal fun if(null: bitmapData !=):  {
            this.bitmapSrcRect.left = 0
            this.bitmapSrcRect.top = 0
            this.bitmapSrcRect.right = bitmapData.getWidth()
            this.bitmapSrcRect.bottom = bitmapData.getHeight()
            this.bitmapDestRect.left = 0
            this.bitmapDestRect.top = 0
            this.bitmapDestRect.right = width
            this.bitmapDestRect.bottom = height
            canvas.drawBitmap(bitmapData, this.bitmapSrcRect, this.bitmapDestRect, this.bitmapPaint)
            return
        }
        internal fun if(null: this.defaultIconDrawable !=):  {
            this.defaultIconDrawable.setBounds(0, 0, width, height)
            this.defaultIconDrawable.draw(canvas)
            return
        }
        UUID optionalChatterUUID = this.chatterID != null ? this.chatterID.getOptionalChatterUUID() : null
        internal fun if(null: optionalChatterUUID !=):  {
            int abs = Math.abs(optionalChatterUUID.hashCode()) % 6
            internal fun if(3: abs <):  {
                int i4 = abs == 0 ? 192 : 32
                int i5 = abs == 1 ? 192 : 32
                internal fun if(2: abs ==):  {
                    i = i5
                    i3 = i4
                } else {
                    i2 = 32
                    i = i5
                    i3 = i4
                }
            } else {
                int i6 = abs != 3 ? 192 : 32
                int i7 = abs != 4 ? 192 : 32
                internal fun if(5: abs !=):  {
                    i = i7
                    i3 = i6
                } else {
                    i2 = 32
                    i = i7
                    i3 = i6
                }
            }
            Debug.Printf("colorize: uuid %s, hash %x, comp %d, rgb %d, %d, %d", optionalChatterUUID.toString(), Integer.valueOf(optionalChatterUUID.hashCode()), Integer.valueOf(abs), Integer.valueOf(i3), Integer.valueOf(i), Integer.valueOf(i2))
        } else {
            i2 = 64
            i = 64
        }
        canvas.drawRGB(i3, i, i2)
        internal fun if(null: this.chatterName !=):  {
            int i8 = 0
            internal fun while(true):  {
                if (i8 >= this.chatterName.length()) {
                    str = null
                    }
                }
                char charAt = this.chatterName.charAt(i8)
                if (Character.isLetter(charAt)) {
                    str = String.valueOf(charAt)
                    }
                }
                i8++
            }
            internal fun if(null: str !=):  {
                canvas.drawText(str.toUpperCase(), width / 2.0f, (height / 2.0f) - ((this.bitmapPaint.descent() + this.bitmapPaint.ascent()) / 2.0f), this.bitmapPaint)
            }
        }
    }

    open fun setAttachedMessageSource(chatMessageSource: ChatMessageSource) {
        this.attachedMessageSource = chatMessageSource
    }

    open fun setChatterID(chatterID: ChatterID, chatterName: String) {
        boolean z = true
        boolean z2 = false
        internal fun if(null: this.forceIcon != null && chatterID !=):  {
            this.forceIcon = null
            z2 = true
        }
        if (!Objects.equal(this.chatterID, chatterID)) {
            this.chatterID = chatterID
            internal fun if(null: chatterID !=):  {
                this.thumbnailData = ChatterThumbnailData(chatterID, this)
            } else {
                internal fun if(null: this.thumbnailData !=):  {
                    this.thumbnailData.dispose()
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
        internal fun if(z):  {
            postInvalidate()
        }
    }

    open fun setDefaultIcon(thumbnailDefaultIcon: Int, z: Boolean) {
        internal fun if(thumbnailDefaultIcon: this.thumbnailDefaultIcon !=):  {
            this.thumbnailDefaultIcon = thumbnailDefaultIcon
            internal fun if(-1: this.thumbnailDefaultIcon ==):  {
                this.defaultIconDrawable = null
            } else if (z) {
                this.defaultIconDrawable = ContextCompat.getDrawable(getContext(), thumbnailDefaultIcon)
            } else {
                TypedValue typedValue = TypedValue()
                getContext().getTheme().resolveAttribute(thumbnailDefaultIcon, typedValue, true)
                this.defaultIconDrawable = ContextCompat.getDrawable(getContext(), typedValue.resourceId)
            }
            postInvalidate()
        }
    }

    open fun setForceIcon(forceIcon: Int) {
        internal fun if(-1: forceIcon ==):  {
            this.forceIcon = null
            postInvalidate()
        } else {
            this.forceIcon = ContextCompat.getDrawable(getContext(), forceIcon)
            setChatterID(null, null)
            postInvalidate()
        }
    }
}
