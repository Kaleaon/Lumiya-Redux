package com.lumiyaviewer.lumiya.ui.render.vr;

import android.app.Activity;

/**
 * Boundary implemented by the native OpenXR feature.
 *
 * <p>The core APK deliberately does not pretend that the legacy GVR renderer is OpenXR. A native
 * feature can provide the implementation named by {@link OpenXrRuntime} without coupling the rest
 * of the viewer to loader-specific classes.</p>
 */
public interface OpenXrSessionFactory {
    VrSession createSession(Activity activity, VrSession.Listener listener);
}
