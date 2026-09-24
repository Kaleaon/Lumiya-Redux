package com.lumiyaviewer.lumiya.ui.common.binding;

import android.os.Handler;
import android.os.Looper;
import android.view.View;

/**
 * Click listener that drops further clicks, on any view, until the main
 * looper has run once. It stops a double tap from, say, opening a screen
 * twice. Same behaviour as <code>butterknife.internal.DebouncingOnClickListener</code>
 * (10.2.3), which the <code>*_ViewBinding</code> classes used.
 */
public abstract class DebouncingOnClickListener implements View.OnClickListener {
    private static final Runnable ENABLE_AGAIN = () -> enabled = true;
    private static final Handler MAIN = new Handler(Looper.getMainLooper());

    static boolean enabled = true;

    @Override
    public final void onClick(View v) {
        if (enabled) {
            enabled = false;
            MAIN.post(ENABLE_AGAIN);
            doClick(v);
        }
    }

    public abstract void doClick(View v);
}
