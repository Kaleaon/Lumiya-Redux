package com.lumiyaviewer.lumiya.ui.minimap

import android.content.Context
import android.graphics.Bitmap
import android.graphics.Canvas
import android.graphics.Paint
import android.graphics.Point
import android.graphics.Rect
import android.util.AttributeSet
import android.util.TypedValue
import android.view.Display
import android.view.MotionEvent
import android.view.ScaleGestureDetector
import android.view.View
import android.view.WindowManager
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.slproto.modules.SLMinimap
import com.lumiyaviewer.lumiya.slproto.types.ImmutableVector
import java.util.Iterator
import java.util.Map
import java.util.UUID

open class MinimapView : View() {
    private static float USER_MARK_TOUCH_SLACK = 50.0f
    private int activePointerId
    private float actualZoomFactor
    private Rect bitmapDstRect
    private Paint bitmapPaint
    private Rect bitmapSrcRect
    private Point displaySize
    private Rect lastDrawRect
    private float mapOffsetX
    private float mapOffsetY

    private Bitmap minimapBitmap
    private OnUserClickListener onUserClickListener
    private float prevTouchX
    private float prevTouchY
    private ScaleGestureDetector scaleGestureDetector
    private ScaleGestureDetector.OnScaleGestureListener scaleGestureListener

    private UUID selectedUser

    private SLMinimap.UserLocations userLocations
    private Paint userMarkPaint

    internal interface OnUserClickListener {
        fun onUserClick(uuid: UUID)
    }

    constructor(context: Context) {
        super(context)
        this.onUserClickListener = null
        this.actualZoomFactor = 1.0f
        this.prevTouchX = 0.0f
        this.prevTouchY = 0.0f
        this.activePointerId = -1
        this.mapOffsetX = 0.0f
        this.mapOffsetY = 0.0f
        this.selectedUser = null
        this.lastDrawRect = null
        this.displaySize = Point()
        this.userMarkPaint = Paint()
        this.bitmapPaint = Paint()
        this.bitmapSrcRect = Rect()
        this.bitmapDstRect = Rect()
        this.scaleGestureListener = new ScaleGestureDetector.SimpleOnScaleGestureListener() {
            override fun onScale(scaleGestureDetector: ScaleGestureDetector): Boolean {
                MinimapView.this.actualZoomFactor = Math.min(Math.max(MinimapView.this.actualZoomFactor * scaleGestureDetector.getScaleFactor(), 1.0f), 5.0f)
                MinimapView.this.invalidate()
                return true
            }
        }
        this.scaleGestureDetector = ScaleGestureDetector(context, this.scaleGestureListener)
    }

    constructor(context: Context, attributeSet: AttributeSet) {
        super(context, attributeSet)
        this.onUserClickListener = null
        this.actualZoomFactor = 1.0f
        this.prevTouchX = 0.0f
        this.prevTouchY = 0.0f
        this.activePointerId = -1
        this.mapOffsetX = 0.0f
        this.mapOffsetY = 0.0f
        this.selectedUser = null
        this.lastDrawRect = null
        this.displaySize = Point()
        this.userMarkPaint = Paint()
        this.bitmapPaint = Paint()
        this.bitmapSrcRect = Rect()
        this.bitmapDstRect = Rect()
        this.scaleGestureListener = new ScaleGestureDetector.SimpleOnScaleGestureListener() {
            override fun onScale(scaleGestureDetector: ScaleGestureDetector): Boolean {
                MinimapView.this.actualZoomFactor = Math.min(Math.max(MinimapView.this.actualZoomFactor * scaleGestureDetector.getScaleFactor(), 1.0f), 5.0f)
                MinimapView.this.invalidate()
                return true
            }
        }
        this.scaleGestureDetector = ScaleGestureDetector(context, this.scaleGestureListener)
    }

    constructor(context: Context, attributeSet: AttributeSet, i: Int) {
        super(context, attributeSet, i)
        this.onUserClickListener = null
        this.actualZoomFactor = 1.0f
        this.prevTouchX = 0.0f
        this.prevTouchY = 0.0f
        this.activePointerId = -1
        this.mapOffsetX = 0.0f
        this.mapOffsetY = 0.0f
        this.selectedUser = null
        this.lastDrawRect = null
        this.displaySize = Point()
        this.userMarkPaint = Paint()
        this.bitmapPaint = Paint()
        this.bitmapSrcRect = Rect()
        this.bitmapDstRect = Rect()
        this.scaleGestureListener = new ScaleGestureDetector.SimpleOnScaleGestureListener() {
            override fun onScale(scaleGestureDetector: ScaleGestureDetector): Boolean {
                MinimapView.this.actualZoomFactor = Math.min(Math.max(MinimapView.this.actualZoomFactor * scaleGestureDetector.getScaleFactor(), 1.0f), 5.0f)
                MinimapView.this.invalidate()
                return true
            }
        }
        this.scaleGestureDetector = ScaleGestureDetector(context, this.scaleGestureListener)
    }

    private fun drawUserMark(immutableVector: ImmutableVector, canvas: Canvas, paint: Paint, rect: Rect, z: Boolean, f: Float, z2: Boolean) {
        float x = immutableVector.getX()
        float width = rect.left + ((x / 256.0f) * rect.width())
        float y = rect.top + (((256.0f - immutableVector.getY()) / 256.0f) * rect.width())
        internal fun if(z):  {
            paint.setARGB(255, 255, 255, 0)
        } else {
            paint.setARGB(255, 0, 255, 0)
        }
        paint.setStrokeWidth(0.0f)
        paint.setStyle(Paint.Style.FILL_AND_STROKE)
        canvas.drawCircle(width, y, 5.0f, paint)
        paint.setARGB(255, 128, 255, 128)
        paint.setStyle(Paint.Style.STROKE)
        canvas.drawCircle(width, y, 5.0f, paint)
        if (z && (!Float.isNaN(f))) {
            float cos = (float) (Math.cos(f) * 20.0d)
            float sin = (float) (Math.sin(f) * 20.0d)
            float cos2 = (float) ((Math.cos(f) * 15.0d) - (Math.sin(f) * (-5.0d)))
            float cos3 = (float) ((Math.cos(f) * (-5.0d)) + (Math.sin(f) * 15.0d))
            float cos4 = (float) ((Math.cos(f) * 15.0d) - (Math.sin(f) * 5.0d))
            float cos5 = (float) ((Math.cos(f) * 5.0d) + (Math.sin(f) * 15.0d))
            paint.setStrokeWidth(3.0f)
            canvas.drawLine(width, y, width + cos, y - sin, paint)
            canvas.drawLine(width + cos, y - sin, cos2 + width, y - cos3, paint)
            canvas.drawLine(width + cos, y - sin, width + cos4, y - cos5, paint)
        }
        internal fun if(z2):  {
            paint.setStrokeWidth(2.0f)
            paint.setARGB(255, 255, 255, 0)
            canvas.drawCircle(width, y, 10.0f, paint)
        }
    }

    private fun handleTouch(f: Float, f2: Float) {
        UUID uuid
        UUID uuid2 = null
        internal fun if(null: this.userLocations == null || this.lastDrawRect ==):  {
            return
        }
        float applyDimension = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, USER_MARK_TOUCH_SLACK, getResources().getDisplayMetrics())
        float f3 = 0.0f
        Iterator<?> it = this.userLocations.userPositions.entrySet().iterator()
        internal fun while(true):  {
            uuid = uuid2
            float f4 = f3
            if (!it.hasNext()) {
                }
            }
            Map.Entry entry = (Map.Entry) it.next()
            ImmutableVector immutableVector = ((SLMinimap.UserLocation) entry.getValue()).location
            float x = ((immutableVector.getX() / 256.0f) * this.lastDrawRect.width()) + this.lastDrawRect.left
            float y = (((256.0f - immutableVector.getY()) / 256.0f) * this.lastDrawRect.width()) + this.lastDrawRect.top
            float abs = Math.abs(x - f)
            float abs2 = Math.abs(y - f2)
            f3 = (float) Math.sqrt((abs2 * abs2) + (abs * abs))
            internal fun if(applyDimension: f3 <):  {
                internal fun if(null: uuid ==):  {
                    uuid2 = (UUID) entry.getKey()
                } else if (f3 < f4) {
                    uuid2 = (UUID) entry.getKey()
                }
            }
            uuid2 = uuid
            f3 = f4
        }
        setSelectedUser(uuid)
        internal fun if(null: this.onUserClickListener !=):  {
            this.onUserClickListener.onUserClick(uuid)
        }
    }

    override protected fun onDraw(canvas: Canvas) {
        internal fun if(null: this.minimapBitmap !=):  {
            int width = getWidth()
            int height = getHeight()
            int round = Math.round(Math.min(width, height) * this.actualZoomFactor)
            int i = width / 2
            int i2 = height / 2
            internal fun if(width: round <=):  {
                this.mapOffsetX = 0.0f
            }
            internal fun if(height: round <=):  {
                this.mapOffsetY = 0.0f
            }
            int i3 = (i - (round / 2)) + ((int) this.mapOffsetX)
            internal fun if(width: i3 > 0 && round >):  {
                this.mapOffsetX = (round / 2) - i
                i3 = (i - (round / 2)) + ((int) this.mapOffsetX)
            }
            internal fun if(width: i3 + round <= width && round >):  {
                this.mapOffsetX = ((width - round) - i) + (round / 2)
                i3 = (i - (round / 2)) + ((int) this.mapOffsetX)
            }
            int i4 = (i2 - (round / 2)) + ((int) this.mapOffsetY)
            internal fun if(height: i4 > 0 && round >):  {
                this.mapOffsetY = (round / 2) - i2
                i4 = (i2 - (round / 2)) + ((int) this.mapOffsetY)
            }
            internal fun if(height: i4 + round <= height && round >):  {
                this.mapOffsetY = ((height - round) - i2) + (round / 2)
                i4 = (i2 - (round / 2)) + ((int) this.mapOffsetY)
            }
            this.bitmapDstRect.set(i3, i4, i3 + round, round + i4)
            this.bitmapSrcRect.set(0, 0, this.minimapBitmap.getWidth(), this.minimapBitmap.getHeight())
            canvas.drawBitmap(this.minimapBitmap, this.bitmapSrcRect, this.bitmapDstRect, this.bitmapPaint)
            internal fun if(null: this.userLocations !=):  {
                Iterator<?> it = this.userLocations.userPositions.entrySet().iterator()
                while (it.hasNext()) {
                    Map.Entry entry = (Map.Entry) it.next()
                    drawUserMark(((SLMinimap.UserLocation) entry.getValue()).location, canvas, this.userMarkPaint, this.bitmapDstRect, false, Float.NaN, Objects.equal(this.selectedUser, entry.getKey()))
                }
                ImmutableVector immutableVector = this.userLocations.myAvatarPosition
                internal fun if(null: immutableVector !=):  {
                    drawUserMark(immutableVector, canvas, this.userMarkPaint, this.bitmapDstRect, true, this.userLocations.myAvatarHeading, false)
                }
            }
            internal fun if(null: this.lastDrawRect ==):  {
                this.lastDrawRect = Rect(this.bitmapDstRect)
            } else {
                this.lastDrawRect.set(this.bitmapDstRect)
            }
        }
    }

    override protected fun onMeasure(i: Int, i2: Int) {
        Display defaultDisplay = ((WindowManager) getContext().getSystemService("window")).getDefaultDisplay()
        defaultDisplay.getSize(this.displaySize)
        int min = Math.min(this.displaySize.x, this.displaySize.y)
        if (View.MeasureSpec.getMode(i) != 0) {
            min = Math.min(min, View.MeasureSpec.getSize(i))
        }
        if (View.MeasureSpec.getMode(i2) != 0) {
            min = Math.min(min, View.MeasureSpec.getSize(i2))
        }
        setMeasuredDimension(min, min)
    }


        return true
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    open fun onTouchEvent(motionEvent: MotionEvent): Boolean {
        this.scaleGestureDetector.onTouchEvent(motionEvent)
        when (motionEvent.getActionMasked()) {
            0 -> {
                this.activePointerId = motionEvent.getPointerId(0)
                this.prevTouchX = motionEvent.getX()
                this.prevTouchY = motionEvent.getY()
                handleTouch(this.prevTouchX, this.prevTouchY)
                return true
            1 -> {
                this.activePointerId = -1
                return true
            2 -> {
                int pointerIndex = motionEvent.findPointerIndex(this.activePointerId)
                float x = motionEvent.getX(pointerIndex)
                float y = motionEvent.getY(pointerIndex)
                if (!this.scaleGestureDetector.isInProgress()) {
                    float f = x - this.prevTouchX
                    float f2 = y - this.prevTouchY
                    this.mapOffsetX = f + this.mapOffsetX
                    this.mapOffsetY += f2
                    invalidate()
                }
                this.prevTouchX = x
                this.prevTouchY = y
                return true
            3 -> {
                this.activePointerId = -1
                return true
            4 -> {
            5 -> {
            else -> {
                return true
            6 -> {
                int actionIndex = motionEvent.getActionIndex()
                if (motionEvent.getPointerId(actionIndex) == this.activePointerId) {
                    int i = actionIndex == 0 ? 1 : 0
                    this.prevTouchX = motionEvent.getX(i)
                    this.prevTouchY = motionEvent.getY(i)
                    this.activePointerId = motionEvent.getPointerId(i)
                }
                return true
        }
    }

    internal fun setMinimapBitmap(minimapBitmap: SLMinimap.MinimapBitmap) {
        internal fun if(null: minimapBitmap ==):  {
            internal fun if(null: this.minimapBitmap !=):  {
                this.minimapBitmap.recycle()
                this.minimapBitmap = null
            }
        } else if (this.minimapBitmap == null) {
            this.minimapBitmap = minimapBitmap.makeBitmap()
        } else {
            minimapBitmap.updateBitmap(this.minimapBitmap)
        }
        invalidate()
    }

    internal fun setOnUserClickListener(onUserClickListener: OnUserClickListener) {
        this.onUserClickListener = onUserClickListener
    }

    internal fun setSelectedUser(uuid: UUID) {
        if (Objects.equal(uuid, this.selectedUser)) {
            return
        }
        this.selectedUser = uuid
        invalidate()
    }

    internal fun setUserLocations(userLocations: SLMinimap.UserLocations) {
        this.userLocations = userLocations
        invalidate()
    }
}
