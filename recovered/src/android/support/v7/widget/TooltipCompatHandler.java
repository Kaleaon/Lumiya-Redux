package android.support.v7.widget;

import android.support.annotation.RestrictTo;
import android.support.v4.view.ViewCompat;
import android.text.TextUtils;
import android.util.Log;
import android.view.View;
import android.view.ViewConfiguration;

@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
/* loaded from: classes.dex */
class TooltipCompatHandler implements View.OnLongClickListener, View.OnHoverListener, View.OnAttachStateChangeListener {
    private static final long HOVER_HIDE_TIMEOUT_MS = 15000;
    private static final long HOVER_HIDE_TIMEOUT_SHORT_MS = 3000;
    private static final long LONG_CLICK_HIDE_TIMEOUT_MS = 2500;
    private static final String TAG = "TooltipCompatHandler";
    private static TooltipCompatHandler sActiveHandler;
    private final View mAnchor;
    private int mAnchorX;
    private int mAnchorY;
    private boolean mFromTouch;
    private TooltipPopup mPopup;
    private final CharSequence mTooltipText;
    private final Runnable mShowRunnable = new Runnable() { // from class: android.support.v7.widget.TooltipCompatHandler.1
        @Override // java.lang.Runnable
        public void run() {
            TooltipCompatHandler.this.show(false);
        }
    };
    private final Runnable mHideRunnable = new Runnable() { // from class: android.support.v7.widget.TooltipCompatHandler.2
        @Override // java.lang.Runnable
        public void run() {
            TooltipCompatHandler.this.hide();
        }
    };

    private TooltipCompatHandler(View view, CharSequence charSequence) {
        this.mAnchor = view;
        this.mTooltipText = charSequence;
        this.mAnchor.setOnLongClickListener(this);
        this.mAnchor.setOnHoverListener(this);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void hide() {
        if (sActiveHandler == this) {
            sActiveHandler = null;
            if (this.mPopup == null) {
                Log.e(TAG, "sActiveHandler.mPopup == null");
            } else {
                this.mPopup.hide();
                this.mPopup = null;
                this.mAnchor.removeOnAttachStateChangeListener(this);
            }
        }
        this.mAnchor.removeCallbacks(this.mShowRunnable);
        this.mAnchor.removeCallbacks(this.mHideRunnable);
    }

    public static void setTooltipText(View view, CharSequence charSequence) {
        if (!TextUtils.isEmpty(charSequence)) {
            new TooltipCompatHandler(view, charSequence);
            return;
        }
        if (sActiveHandler != null && sActiveHandler.mAnchor == view) {
            sActiveHandler.hide();
        }
        view.setOnLongClickListener(null);
        view.setLongClickable(false);
        view.setOnHoverListener(null);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void show(boolean z) {
        if (ViewCompat.isAttachedToWindow(this.mAnchor)) {
            if (sActiveHandler != null) {
                sActiveHandler.hide();
            }
            sActiveHandler = this;
            this.mFromTouch = z;
            this.mPopup = new TooltipPopup(this.mAnchor.getContext());
            this.mPopup.show(this.mAnchor, this.mAnchorX, this.mAnchorY, this.mFromTouch, this.mTooltipText);
            this.mAnchor.addOnAttachStateChangeListener(this);
            long longPressTimeout = !this.mFromTouch ? (ViewCompat.getWindowSystemUiVisibility(this.mAnchor) & 1) != 1 ? HOVER_HIDE_TIMEOUT_MS - ViewConfiguration.getLongPressTimeout() : HOVER_HIDE_TIMEOUT_SHORT_MS - ViewConfiguration.getLongPressTimeout() : LONG_CLICK_HIDE_TIMEOUT_MS;
            this.mAnchor.removeCallbacks(this.mHideRunnable);
            this.mAnchor.postDelayed(this.mHideRunnable, longPressTimeout);
        }
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    /* JADX WARN: Code restructure failed: missing block: B:7:0x0021, code lost:
    
        return false;
     */
    @Override // android.view.View.OnHoverListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean onHover(android.view.View r6, android.view.MotionEvent r7) {
        /*
            r5 = this;
            r4 = 0
            android.support.v7.widget.TooltipPopup r0 = r5.mPopup
            if (r0 != 0) goto L22
        L5:
            android.view.View r0 = r5.mAnchor
            android.content.Context r0 = r0.getContext()
            java.lang.String r1 = "accessibility"
            java.lang.Object r0 = r0.getSystemService(r1)
            android.view.accessibility.AccessibilityManager r0 = (android.view.accessibility.AccessibilityManager) r0
            boolean r1 = r0.isEnabled()
            if (r1 != 0) goto L27
        L1a:
            int r0 = r7.getAction()
            switch(r0) {
                case 7: goto L2e;
                case 8: goto L21;
                case 9: goto L21;
                case 10: goto L5c;
                default: goto L21;
            }
        L21:
            return r4
        L22:
            boolean r0 = r5.mFromTouch
            if (r0 == 0) goto L5
            return r4
        L27:
            boolean r0 = r0.isTouchExplorationEnabled()
            if (r0 == 0) goto L1a
            return r4
        L2e:
            android.view.View r0 = r5.mAnchor
            boolean r0 = r0.isEnabled()
            if (r0 == 0) goto L21
            android.support.v7.widget.TooltipPopup r0 = r5.mPopup
            if (r0 != 0) goto L21
            float r0 = r7.getX()
            int r0 = (int) r0
            r5.mAnchorX = r0
            float r0 = r7.getY()
            int r0 = (int) r0
            r5.mAnchorY = r0
            android.view.View r0 = r5.mAnchor
            java.lang.Runnable r1 = r5.mShowRunnable
            r0.removeCallbacks(r1)
            android.view.View r0 = r5.mAnchor
            java.lang.Runnable r1 = r5.mShowRunnable
            int r2 = android.view.ViewConfiguration.getLongPressTimeout()
            long r2 = (long) r2
            r0.postDelayed(r1, r2)
            goto L21
        L5c:
            r5.hide()
            goto L21
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v7.widget.TooltipCompatHandler.onHover(android.view.View, android.view.MotionEvent):boolean");
    }

    @Override // android.view.View.OnLongClickListener
    public boolean onLongClick(View view) {
        this.mAnchorX = view.getWidth() / 2;
        this.mAnchorY = view.getHeight() / 2;
        show(true);
        return true;
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public void onViewAttachedToWindow(View view) {
    }

    @Override // android.view.View.OnAttachStateChangeListener
    public void onViewDetachedFromWindow(View view) {
        hide();
    }
}
