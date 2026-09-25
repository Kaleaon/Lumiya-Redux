package com.lumiyaviewer.lumiya.ui.minimap;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Point;
import android.graphics.Rect;
import android.util.AttributeSet;
import android.util.TypedValue;
import android.view.Display;
import android.view.MotionEvent;
import android.view.ScaleGestureDetector;
import android.view.View;
import android.view.WindowManager;
import com.google.common.base.Objects;
import com.lumiyaviewer.lumiya.slproto.modules.SLMinimap;
import com.lumiyaviewer.lumiya.slproto.types.ImmutableVector;
import java.util.Iterator;
import java.util.Map;
import java.util.UUID;
import javax.annotation.Nullable;

public class MinimapView extends View {
    private static final float USER_MARK_TOUCH_SLACK = 50.0f;
    private int activePointerId;
    private float actualZoomFactor;
    private final Rect bitmapDstRect;
    private final Paint bitmapPaint;
    private final Rect bitmapSrcRect;
    private final Point displaySize;
    private Rect lastDrawRect;
    private float mapOffsetX;
    private float mapOffsetY;

    @Nullable
    private Bitmap minimapBitmap;
    private OnUserClickListener onUserClickListener;
    private float prevTouchX;
    private float prevTouchY;
    private final ScaleGestureDetector scaleGestureDetector;
    private final ScaleGestureDetector.OnScaleGestureListener scaleGestureListener;

    @Nullable
    private UUID selectedUser;

    @Nullable
    private SLMinimap.UserLocations userLocations;
    private final Paint userMarkPaint;

    interface OnUserClickListener {
        void onUserClick(UUID uuid);
    }

    public MinimapView(Context context) {
        super(context);
        this.onUserClickListener = null;
        this.actualZoomFactor = 1.0f;
        this.prevTouchX = 0.0f;
        this.prevTouchY = 0.0f;
        this.activePointerId = -1;
        this.mapOffsetX = 0.0f;
        this.mapOffsetY = 0.0f;
        this.selectedUser = null;
        this.lastDrawRect = null;
        this.displaySize = new Point();
        this.userMarkPaint = new Paint();
        this.bitmapPaint = new Paint();
        this.bitmapSrcRect = new Rect();
        this.bitmapDstRect = new Rect();
        this.scaleGestureListener = new ScaleGestureDetector.SimpleOnScaleGestureListener() {
            @Override
            public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
                MinimapView.this.actualZoomFactor = Math.min(Math.max(MinimapView.this.actualZoomFactor * scaleGestureDetector.getScaleFactor(), 1.0f), 5.0f);
                MinimapView.this.invalidate();
                return true;
            }
        };
        this.scaleGestureDetector = new ScaleGestureDetector(context, this.scaleGestureListener);
    }

    public MinimapView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.onUserClickListener = null;
        this.actualZoomFactor = 1.0f;
        this.prevTouchX = 0.0f;
        this.prevTouchY = 0.0f;
        this.activePointerId = -1;
        this.mapOffsetX = 0.0f;
        this.mapOffsetY = 0.0f;
        this.selectedUser = null;
        this.lastDrawRect = null;
        this.displaySize = new Point();
        this.userMarkPaint = new Paint();
        this.bitmapPaint = new Paint();
        this.bitmapSrcRect = new Rect();
        this.bitmapDstRect = new Rect();
        this.scaleGestureListener = new ScaleGestureDetector.SimpleOnScaleGestureListener() {
            @Override
            public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
                MinimapView.this.actualZoomFactor = Math.min(Math.max(MinimapView.this.actualZoomFactor * scaleGestureDetector.getScaleFactor(), 1.0f), 5.0f);
                MinimapView.this.invalidate();
                return true;
            }
        };
        this.scaleGestureDetector = new ScaleGestureDetector(context, this.scaleGestureListener);
    }

    public MinimapView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.onUserClickListener = null;
        this.actualZoomFactor = 1.0f;
        this.prevTouchX = 0.0f;
        this.prevTouchY = 0.0f;
        this.activePointerId = -1;
        this.mapOffsetX = 0.0f;
        this.mapOffsetY = 0.0f;
        this.selectedUser = null;
        this.lastDrawRect = null;
        this.displaySize = new Point();
        this.userMarkPaint = new Paint();
        this.bitmapPaint = new Paint();
        this.bitmapSrcRect = new Rect();
        this.bitmapDstRect = new Rect();
        this.scaleGestureListener = new ScaleGestureDetector.SimpleOnScaleGestureListener() {
            @Override
            public boolean onScale(ScaleGestureDetector scaleGestureDetector) {
                MinimapView.this.actualZoomFactor = Math.min(Math.max(MinimapView.this.actualZoomFactor * scaleGestureDetector.getScaleFactor(), 1.0f), 5.0f);
                MinimapView.this.invalidate();
                return true;
            }
        };
        this.scaleGestureDetector = new ScaleGestureDetector(context, this.scaleGestureListener);
    }

    private void drawUserMark(ImmutableVector immutableVector, Canvas canvas, Paint paint, Rect rect, boolean z, float f, boolean z2) {
        float x = immutableVector.getX();
        float width = rect.left + ((x / 256.0f) * rect.width());
        float y = rect.top + (((256.0f - immutableVector.getY()) / 256.0f) * rect.width());
        if (z) {
            paint.setARGB(255, 255, 255, 0);
        } else {
            paint.setARGB(255, 0, 255, 0);
        }
        paint.setStrokeWidth(0.0f);
        paint.setStyle(Paint.Style.FILL_AND_STROKE);
        canvas.drawCircle(width, y, 5.0f, paint);
        paint.setARGB(255, 128, 255, 128);
        paint.setStyle(Paint.Style.STROKE);
        canvas.drawCircle(width, y, 5.0f, paint);
        if (z && (!Float.isNaN(f))) {
            float cos = (float) (Math.cos(f) * 20.0d);
            float sin = (float) (Math.sin(f) * 20.0d);
            float cos2 = (float) ((Math.cos(f) * 15.0d) - (Math.sin(f) * (-5.0d)));
            float cos3 = (float) ((Math.cos(f) * (-5.0d)) + (Math.sin(f) * 15.0d));
            float cos4 = (float) ((Math.cos(f) * 15.0d) - (Math.sin(f) * 5.0d));
            float cos5 = (float) ((Math.cos(f) * 5.0d) + (Math.sin(f) * 15.0d));
            paint.setStrokeWidth(3.0f);
            canvas.drawLine(width, y, width + cos, y - sin, paint);
            canvas.drawLine(width + cos, y - sin, cos2 + width, y - cos3, paint);
            canvas.drawLine(width + cos, y - sin, width + cos4, y - cos5, paint);
        }
        if (z2) {
            paint.setStrokeWidth(2.0f);
            paint.setARGB(255, 255, 255, 0);
            canvas.drawCircle(width, y, 10.0f, paint);
        }
    }

    private void handleTouch(float f, float f2) {
        UUID uuid;
        UUID uuid2 = null;
        if (this.userLocations == null || this.lastDrawRect == null) {
            return;
        }
        float applyDimension = TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, USER_MARK_TOUCH_SLACK, getResources().getDisplayMetrics());
        float f3 = 0.0f;
        Iterator<?> it = this.userLocations.userPositions.entrySet().iterator();
        while (true) {
            uuid = uuid2;
            float f4 = f3;
            if (!it.hasNext()) {
                break;
            }
            Map.Entry entry = (Map.Entry) it.next();
            ImmutableVector immutableVector = ((SLMinimap.UserLocation) entry.getValue()).location;
            float x = ((immutableVector.getX() / 256.0f) * this.lastDrawRect.width()) + this.lastDrawRect.left;
            float y = (((256.0f - immutableVector.getY()) / 256.0f) * this.lastDrawRect.width()) + this.lastDrawRect.top;
            float abs = Math.abs(x - f);
            float abs2 = Math.abs(y - f2);
            f3 = (float) Math.sqrt((abs2 * abs2) + (abs * abs));
            if (f3 < applyDimension) {
                if (uuid == null) {
                    uuid2 = (UUID) entry.getKey();
                } else if (f3 < f4) {
                    uuid2 = (UUID) entry.getKey();
                }
            }
            uuid2 = uuid;
            f3 = f4;
        }
        setSelectedUser(uuid);
        if (this.onUserClickListener != null) {
            this.onUserClickListener.onUserClick(uuid);
        }
    }

    @Override
    protected void onDraw(Canvas canvas) {
        if (this.minimapBitmap != null) {
            int width = getWidth();
            int height = getHeight();
            int round = Math.round(Math.min(width, height) * this.actualZoomFactor);
            int i = width / 2;
            int i2 = height / 2;
            if (round <= width) {
                this.mapOffsetX = 0.0f;
            }
            if (round <= height) {
                this.mapOffsetY = 0.0f;
            }
            int i3 = (i - (round / 2)) + ((int) this.mapOffsetX);
            if (i3 > 0 && round > width) {
                this.mapOffsetX = (round / 2) - i;
                i3 = (i - (round / 2)) + ((int) this.mapOffsetX);
            }
            if (i3 + round <= width && round > width) {
                this.mapOffsetX = ((width - round) - i) + (round / 2);
                i3 = (i - (round / 2)) + ((int) this.mapOffsetX);
            }
            int i4 = (i2 - (round / 2)) + ((int) this.mapOffsetY);
            if (i4 > 0 && round > height) {
                this.mapOffsetY = (round / 2) - i2;
                i4 = (i2 - (round / 2)) + ((int) this.mapOffsetY);
            }
            if (i4 + round <= height && round > height) {
                this.mapOffsetY = ((height - round) - i2) + (round / 2);
                i4 = (i2 - (round / 2)) + ((int) this.mapOffsetY);
            }
            this.bitmapDstRect.set(i3, i4, i3 + round, round + i4);
            this.bitmapSrcRect.set(0, 0, this.minimapBitmap.getWidth(), this.minimapBitmap.getHeight());
            canvas.drawBitmap(this.minimapBitmap, this.bitmapSrcRect, this.bitmapDstRect, this.bitmapPaint);
            if (this.userLocations != null) {
                Iterator<?> it = this.userLocations.userPositions.entrySet().iterator();
                while (it.hasNext()) {
                    Map.Entry entry = (Map.Entry) it.next();
                    drawUserMark(((SLMinimap.UserLocation) entry.getValue()).location, canvas, this.userMarkPaint, this.bitmapDstRect, false, Float.NaN, Objects.equal(this.selectedUser, entry.getKey()));
                }
                ImmutableVector immutableVector = this.userLocations.myAvatarPosition;
                if (immutableVector != null) {
                    drawUserMark(immutableVector, canvas, this.userMarkPaint, this.bitmapDstRect, true, this.userLocations.myAvatarHeading, false);
                }
            }
            if (this.lastDrawRect == null) {
                this.lastDrawRect = new Rect(this.bitmapDstRect);
            } else {
                this.lastDrawRect.set(this.bitmapDstRect);
            }
        }
    }

    @Override
    protected void onMeasure(int i, int i2) {
        Display defaultDisplay = ((WindowManager) getContext().getSystemService("window")).getDefaultDisplay();
        defaultDisplay.getSize(this.displaySize);
        int min = Math.min(this.displaySize.x, this.displaySize.y);
        if (View.MeasureSpec.getMode(i) != 0) {
            min = Math.min(min, View.MeasureSpec.getSize(i));
        }
        if (View.MeasureSpec.getMode(i2) != 0) {
            min = Math.min(min, View.MeasureSpec.getSize(i2));
        }
        setMeasuredDimension(min, min);
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:3:0x000f, code lost:
    
        return true;
     */
    @Override
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean onTouchEvent(MotionEvent motionEvent) {
        this.scaleGestureDetector.onTouchEvent(motionEvent);
        switch (motionEvent.getActionMasked()) {
            case 0:
                this.activePointerId = motionEvent.getPointerId(0);
                this.prevTouchX = motionEvent.getX();
                this.prevTouchY = motionEvent.getY();
                handleTouch(this.prevTouchX, this.prevTouchY);
                return true;
            case 1:
                this.activePointerId = -1;
                return true;
            case 2:
                int pointerIndex = motionEvent.findPointerIndex(this.activePointerId);
                float x = motionEvent.getX(pointerIndex);
                float y = motionEvent.getY(pointerIndex);
                if (!this.scaleGestureDetector.isInProgress()) {
                    float f = x - this.prevTouchX;
                    float f2 = y - this.prevTouchY;
                    this.mapOffsetX = f + this.mapOffsetX;
                    this.mapOffsetY += f2;
                    invalidate();
                }
                this.prevTouchX = x;
                this.prevTouchY = y;
                return true;
            case 3:
                this.activePointerId = -1;
                return true;
            case 4:
            case 5:
            default:
                return true;
            case 6:
                int actionIndex = motionEvent.getActionIndex();
                if (motionEvent.getPointerId(actionIndex) == this.activePointerId) {
                    int i = actionIndex == 0 ? 1 : 0;
                    this.prevTouchX = motionEvent.getX(i);
                    this.prevTouchY = motionEvent.getY(i);
                    this.activePointerId = motionEvent.getPointerId(i);
                }
                return true;
        }
    }

    void setMinimapBitmap(@Nullable SLMinimap.MinimapBitmap minimapBitmap) {
        if (minimapBitmap == null) {
            if (this.minimapBitmap != null) {
                this.minimapBitmap.recycle();
                this.minimapBitmap = null;
            }
        } else if (this.minimapBitmap == null) {
            this.minimapBitmap = minimapBitmap.makeBitmap();
        } else {
            minimapBitmap.updateBitmap(this.minimapBitmap);
        }
        invalidate();
    }

    void setOnUserClickListener(OnUserClickListener onUserClickListener) {
        this.onUserClickListener = onUserClickListener;
    }

    void setSelectedUser(@Nullable UUID uuid) {
        if (Objects.equal(uuid, this.selectedUser)) {
            return;
        }
        this.selectedUser = uuid;
        invalidate();
    }

    void setUserLocations(@Nullable SLMinimap.UserLocations userLocations) {
        this.userLocations = userLocations;
        invalidate();
    }
}
