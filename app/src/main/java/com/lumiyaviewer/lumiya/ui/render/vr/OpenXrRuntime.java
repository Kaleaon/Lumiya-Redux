package com.lumiyaviewer.lumiya.ui.render.vr;

import android.app.Activity;
import com.lumiyaviewer.lumiya.Debug;

public class OpenXrRuntime implements VrRuntime {
    public static final String ID = "openxr";
    static final String SESSION_FACTORY_CLASS =
            "com.lumiyaviewer.lumiya.xr.OpenXrSessionFactoryImpl";

    static boolean isBackendInstalled() {
        try {
            Class<?> factoryClass = Class.forName(SESSION_FACTORY_CLASS, false,
                    OpenXrRuntime.class.getClassLoader());
            return OpenXrSessionFactory.class.isAssignableFrom(factoryClass);
        } catch (ClassNotFoundException | LinkageError ignored) {
            return false;
        }
    }

    @Override
    public String getRuntimeId() {
        return ID;
    }

    @Override
    public VrSession createSession(Activity activity, VrSession.Listener listener) {
        try {
            Class<?> factoryClass = Class.forName(SESSION_FACTORY_CLASS, true,
                    activity.getClassLoader());
            OpenXrSessionFactory factory =
                    (OpenXrSessionFactory) factoryClass.getDeclaredConstructor().newInstance();
            Debug.Printf("VR runtime: native OpenXR session active", new Object[0]);
            return factory.createSession(activity, listener);
        } catch (ReflectiveOperationException | ClassCastException | LinkageError error) {
            throw new IllegalStateException(
                    "OpenXR was selected without an installed native session backend", error);
        }
    }
}
