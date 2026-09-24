package uk.co.senab.photoview;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.Matrix;
import android.graphics.RectF;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.util.AttributeSet;
import android.view.GestureDetector;
import android.view.View;
import android.widget.ImageView;
import uk.co.senab.photoview.PhotoViewAttacher;

public class PhotoView extends ImageView implements IPhotoView {
    private PhotoViewAttacher mAttacher;
    private ImageView.ScaleType mPendingScaleType;

    public PhotoView(Context context) {
        this(context, null);
    }

    public PhotoView(Context context, AttributeSet attributeSet) {
        this(context, attributeSet, 0);
    }

    public PhotoView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        super.setScaleType(ImageView.ScaleType.MATRIX);
        init();
    }

    @Override
    public boolean canZoom() {
        return this.mAttacher.canZoom();
    }

    @Override
    public void getDisplayMatrix(Matrix matrix) {
        this.mAttacher.getDisplayMatrix(matrix);
    }

    @Override
    public RectF getDisplayRect() {
        return this.mAttacher.getDisplayRect();
    }

    @Override
    public IPhotoView getIPhotoViewImplementation() {
        return this.mAttacher;
    }

    @Override
    public Matrix getImageMatrix() {
        return this.mAttacher.getImageMatrix();
    }

    @Override
    public float getMaximumScale() {
        return this.mAttacher.getMaximumScale();
    }

    @Override
    public float getMediumScale() {
        return this.mAttacher.getMediumScale();
    }

    @Override
    public float getMinimumScale() {
        return this.mAttacher.getMinimumScale();
    }

    @Override
    public float getScale() {
        return this.mAttacher.getScale();
    }

    @Override
    public ImageView.ScaleType getScaleType() {
        return this.mAttacher.getScaleType();
    }

    @Override
    public Bitmap getVisibleRectangleBitmap() {
        return this.mAttacher.getVisibleRectangleBitmap();
    }

    protected void init() {
        if (this.mAttacher == null || this.mAttacher.getImageView() == null) {
            this.mAttacher = new PhotoViewAttacher(this);
        }
        if (this.mPendingScaleType == null) {
            return;
        }
        setScaleType(this.mPendingScaleType);
        this.mPendingScaleType = null;
    }

    @Override
    protected void onAttachedToWindow() {
        init();
        super.onAttachedToWindow();
    }

    @Override
    protected void onDetachedFromWindow() {
        this.mAttacher.cleanup();
        this.mAttacher = null;
        super.onDetachedFromWindow();
    }

    @Override
    public void setAllowParentInterceptOnEdge(boolean allowParentInterceptOnEdge) {
        this.mAttacher.setAllowParentInterceptOnEdge(allowParentInterceptOnEdge);
    }

    @Override
    public boolean setDisplayMatrix(Matrix matrix) {
        return this.mAttacher.setDisplayMatrix(matrix);
    }

    @Override
    protected boolean setFrame(int i, int i2, int i3, int i4) {
        boolean frame = super.setFrame(i, i2, i3, i4);
        if (this.mAttacher != null) {
            this.mAttacher.update();
        }
        return frame;
    }

    @Override
    public void setImageDrawable(Drawable drawable) {
        super.setImageDrawable(drawable);
        if (this.mAttacher == null) {
            return;
        }
        this.mAttacher.update();
    }

    @Override
    public void setImageResource(int imageResource) {
        super.setImageResource(imageResource);
        if (this.mAttacher == null) {
            return;
        }
        this.mAttacher.update();
    }

    @Override
    public void setImageURI(Uri uri) {
        super.setImageURI(uri);
        if (this.mAttacher == null) {
            return;
        }
        this.mAttacher.update();
    }

    @Override
    public void setMaximumScale(float maximumScale) {
        this.mAttacher.setMaximumScale(maximumScale);
    }

    @Override
    public void setMediumScale(float mediumScale) {
        this.mAttacher.setMediumScale(mediumScale);
    }

    @Override
    public void setMinimumScale(float minimumScale) {
        this.mAttacher.setMinimumScale(minimumScale);
    }

    @Override
    public void setOnDoubleTapListener(GestureDetector.OnDoubleTapListener onDoubleTapListener) {
        this.mAttacher.setOnDoubleTapListener(onDoubleTapListener);
    }

    @Override
    public void setOnLongClickListener(View.OnLongClickListener onLongClickListener) {
        this.mAttacher.setOnLongClickListener(onLongClickListener);
    }

    @Override
    public void setOnMatrixChangeListener(PhotoViewAttacher.OnMatrixChangedListener onMatrixChangedListener) {
        this.mAttacher.setOnMatrixChangeListener(onMatrixChangedListener);
    }

    @Override
    public void setOnPhotoTapListener(PhotoViewAttacher.OnPhotoTapListener onPhotoTapListener) {
        this.mAttacher.setOnPhotoTapListener(onPhotoTapListener);
    }

    @Override
    public void setOnScaleChangeListener(PhotoViewAttacher.OnScaleChangeListener onScaleChangeListener) {
        this.mAttacher.setOnScaleChangeListener(onScaleChangeListener);
    }

    @Override
    public void setOnSingleFlingListener(PhotoViewAttacher.OnSingleFlingListener onSingleFlingListener) {
        this.mAttacher.setOnSingleFlingListener(onSingleFlingListener);
    }

    @Override
    public void setOnViewTapListener(PhotoViewAttacher.OnViewTapListener onViewTapListener) {
        this.mAttacher.setOnViewTapListener(onViewTapListener);
    }

    @Override
    public void setRotationBy(float rotationBy) {
        this.mAttacher.setRotationBy(rotationBy);
    }

    @Override
    public void setRotationTo(float rotationTo) {
        this.mAttacher.setRotationTo(rotationTo);
    }

    @Override
    public void setScale(float scale) {
        this.mAttacher.setScale(scale);
    }

    @Override
    public void setScale(float f, float f2, float f3, boolean z) {
        this.mAttacher.setScale(f, f2, f3, z);
    }

    @Override
    public void setScale(float f, boolean z) {
        this.mAttacher.setScale(f, z);
    }

    @Override
    public void setScaleLevels(float f, float f2, float f3) {
        this.mAttacher.setScaleLevels(f, f2, f3);
    }

    @Override
    public void setScaleType(ImageView.ScaleType scaleType) {
        if (this.mAttacher == null) {
            this.mPendingScaleType = scaleType;
        } else {
            this.mAttacher.setScaleType(scaleType);
        }
    }

    @Override
    public void setZoomTransitionDuration(int zoomTransitionDuration) {
        this.mAttacher.setZoomTransitionDuration(zoomTransitionDuration);
    }

    @Override
    public void setZoomable(boolean zoomable) {
        this.mAttacher.setZoomable(zoomable);
    }
}
