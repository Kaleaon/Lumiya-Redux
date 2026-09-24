package com.google.vr.cardboard;

import android.content.Context;
import android.graphics.drawable.AnimationDrawable;
import android.graphics.drawable.ColorDrawable;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.view.LayoutInflater;
import android.view.MotionEvent;
import android.view.OrientationEventListener;
import android.view.View;
import android.view.ViewGroup;
import android.view.animation.AccelerateInterpolator;
import android.view.animation.AlphaAnimation;
import android.view.animation.Animation;
import android.widget.FrameLayout;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

public class TransitionView extends FrameLayout implements View.OnTouchListener {
    public static final int ALREADY_LANDSCAPE_LEFT_TRANSITION_DELAY_MS = 2000;
    private static final int LANDSCAPE_TOLERANCE_DEGREES = 5;
    private static final int PORTRAIT_TOLERANCE_DEGREES = 45;
    public static final int TRANSITION_ANIMATION_DURATION_MS = 500;
    public static final int TRANSITION_BACKGROUND_COLOR = -12232092;
    private static final int VIEW_CORRECTION_ROTATION_DEGREES = 90;
    private AnimationDrawable animationDrawable;
    private ImageButton backButton;
    private Runnable backButtonRunnable;
    private int orientation;
    private OrientationEventListener orientationEventListener;
    private boolean rotationChecked;
    private TransitionListener transitionListener;
    private boolean useCustomTransitionLayout;
    private String viewerName;

    public interface TransitionListener {
        void onSwitchViewer();

        void onTransitionDone();
    }

    public TransitionView(Context context) {
        super(context);
        this.orientation = -1;
        setOnTouchListener(this);
        setBackground(new ColorDrawable(TRANSITION_BACKGROUND_COLOR));
        inflateContentView(R.layout.transition_view);
        super.setVisibility(View.GONE);
    }

    public void fadeOutAndRemove(boolean z) {
        stopOrientationMonitor();
        Animation animation = getAnimation();
        if (animation != null) {
            if (z || animation.getStartOffset() == 0) {
                return;
            }
            animation.setAnimationListener(null);
            clearAnimation();
        }
        AlphaAnimation alphaAnimation = new AlphaAnimation(1.0f, 0.0f);
        alphaAnimation.setInterpolator(new AccelerateInterpolator());
        alphaAnimation.setRepeatCount(0);
        alphaAnimation.setDuration(500L);
        if (z) {
            alphaAnimation.setStartOffset(2000L);
        }
        alphaAnimation.setAnimationListener(new Animation.AnimationListener() {
            @Override
            public void onAnimationEnd(Animation animation2) {
                TransitionView.this.setVisibility(View.GONE);
                ((ViewGroup) TransitionView.this.getParent()).removeView(TransitionView.this);
                if (TransitionView.this.animationDrawable != null) {
                    TransitionView.this.animationDrawable.stop();
                    TransitionView.this.animationDrawable = null;
                }
                if (TransitionView.this.transitionListener == null) {
                    return;
                }
                TransitionView.this.transitionListener.onTransitionDone();
            }

            @Override
            public void onAnimationRepeat(Animation animation2) {
            }

            @Override
            public void onAnimationStart(Animation animation2) {
            }
        });
        startAnimation(alphaAnimation);
    }

    private void inflateContentView(int i) {
        removeAllViews();
        LayoutInflater.from(getContext()).inflate(i, (ViewGroup) this, true);
        findViewById(R.id.transition_switch_action).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                UiUtils.launchOrInstallCardboard(TransitionView.this.getContext());
                if (TransitionView.this.transitionListener == null) {
                    return;
                }
                TransitionView.this.transitionListener.onSwitchViewer();
            }
        });
        ((ImageView) findViewById(R.id.transition_icon)).setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                TransitionView.this.fadeOutAndRemove(false);
            }
        });
        updateBackButtonVisibility();
        if (!this.useCustomTransitionLayout && getResources().getConfiguration().orientation == 2) {
            findViewById(R.id.transition_bottom_frame).setVisibility(View.GONE);
        }
    }

    public static boolean isLandscapeLeft(int i) {
        return Math.abs(i + (-270)) < 5;
    }

    public static boolean isLandscapeRight(int i) {
        return Math.abs(i + (-90)) < 5;
    }

    private static boolean isPortrait(int i) {
        return Math.abs(i + (-180)) > 135;
    }

    public void rotateViewIfNeeded() {
        if (getWidth() <= 0 || getHeight() <= 0 || this.orientation == -1 || this.orientationEventListener == null || this.rotationChecked) {
            return;
        }
        boolean z = getWidth() < getHeight();
        boolean isPortrait = isPortrait(this.orientation);
        if (z != isPortrait) {
            View findViewById = findViewById(R.id.transition_frame);
            int width = findViewById.getWidth();
            int height = findViewById.getHeight();
            if (Build.VERSION.SDK_INT >= 17 && getLayoutDirection() == 1) {
                findViewById.setPivotX(height - findViewById.getPivotX());
                findViewById.setPivotY(width - findViewById.getPivotY());
            }
            if (z) {
                findViewById.setRotation(90.0f);
            } else {
                findViewById.setRotation(-90.0f);
            }
            findViewById.setTranslationX((width - height) / 2);
            findViewById.setTranslationY((height - width) / 2);
            ViewGroup.LayoutParams layoutParams = findViewById.getLayoutParams();
            layoutParams.height = width;
            layoutParams.width = height;
            findViewById.requestLayout();
        }
        if (isPortrait) {
            findViewById(R.id.transition_bottom_frame).setVisibility(View.VISIBLE);
        } else {
            findViewById(R.id.transition_bottom_frame).setVisibility(View.GONE);
            if (this.useCustomTransitionLayout) {
                TextView textView = (TextView) findViewById(R.id.transition_text);
                if (textView != null) {
                    textView.setMaxWidth(textView.getMaxWidth() * 2);
                }
                View viewById = findViewById(R.id.transition_icon);
                if (viewById != null) {
                    RelativeLayout.LayoutParams layoutParams2 = (RelativeLayout.LayoutParams) viewById.getLayoutParams();
                    layoutParams2.setMargins(layoutParams2.topMargin * (-1), 0, 0, 0);
                    viewById.requestLayout();
                }
            }
        }
        this.rotationChecked = true;
        if (isLandscapeLeft(this.orientation)) {
            fadeOutAndRemove(true);
        }
    }

    private void startOrientationMonitor() {
        if (this.orientationEventListener == null) {
            this.orientationEventListener = new OrientationEventListener(getContext()) {
                @Override
                public void onOrientationChanged(int orientation) {
                    TransitionView.this.orientation = orientation;
                    if (!TransitionView.this.rotationChecked) {
                        TransitionView.this.rotateViewIfNeeded();
                    } else if (TransitionView.isLandscapeLeft(orientation)) {
                        TransitionView.this.fadeOutAndRemove(false);
                    } else {
                        TransitionView.isLandscapeRight(orientation);
                    }
                }
            };
            this.orientationEventListener.enable();
        }
    }

    private void stopOrientationMonitor() {
        if (this.orientationEventListener != null) {
            this.orientation = -1;
            this.orientationEventListener.disable();
            this.orientationEventListener = null;
        }
    }

    private void updateBackButtonVisibility() {
        this.backButton = (ImageButton) ((ViewGroup) findViewById(R.id.transition_frame)).findViewById(R.id.back_button);
        if (this.backButtonRunnable != null) {
            this.backButton.setTag(this.backButtonRunnable);
            this.backButton.setVisibility(View.VISIBLE);
            this.backButton.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    TransitionView.this.backButtonRunnable.run();
                }
            });
        } else {
            this.backButton.setVisibility(View.GONE);
            this.backButton.setTag(null);
            this.backButton.setOnClickListener(null);
        }
    }

    @Override
    protected void onAttachedToWindow() {
        super.onAttachedToWindow();
        if (this.orientationEventListener != null) {
            this.orientationEventListener.enable();
        }
        rotateViewIfNeeded();
    }

    @Override
    protected void onDetachedFromWindow() {
        if (this.orientationEventListener != null) {
            this.orientation = -1;
            this.orientationEventListener.disable();
        }
        super.onDetachedFromWindow();
    }

    @Override
    public boolean onTouch(View view, MotionEvent motionEvent) {
        return true;
    }

    public void setBackButtonListener(Runnable runnable) {
        this.backButtonRunnable = runnable;
        updateBackButtonVisibility();
    }

    public void setCustomTransitionLayout(int i, int i2) {
        this.useCustomTransitionLayout = true;
        inflateContentView(i);
        setBackground(new ColorDrawable(i2));
        setViewerName(this.viewerName);
        Drawable drawable = ((ImageView) findViewById(R.id.transition_icon)).getDrawable();
        if (drawable != null && (drawable instanceof AnimationDrawable)) {
            this.animationDrawable = (AnimationDrawable) drawable;
            this.animationDrawable.start();
        }
    }

    public void setTransitionListener(TransitionListener transitionListener) {
        this.transitionListener = transitionListener;
    }

    public void setViewerName(String viewerName) {
        this.viewerName = viewerName;
        TextView textView = (TextView) findViewById(R.id.transition_text);
        if (viewerName == null) {
            textView.setText(getContext().getString(R.string.place_your_phone_into_cardboard));
        } else {
            textView.setText(getContext().getString(R.string.place_your_viewer_into_viewer_format, viewerName));
        }
    }

    @Override
    public void setVisibility(int visibility2) {
        int visibility = getVisibility();
        super.setVisibility(visibility2);
        if (visibility == visibility2) {
            return;
        }
        if (visibility2 != 0) {
            stopOrientationMonitor();
        } else {
            startOrientationMonitor();
        }
    }
}
