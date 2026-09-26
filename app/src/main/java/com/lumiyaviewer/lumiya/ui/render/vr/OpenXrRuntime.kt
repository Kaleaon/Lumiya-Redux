package com.lumiyaviewer.lumiya.ui.render.vr

import android.app.Activity
import com.lumiyaviewer.lumiya.Debug

class OpenXrRuntime : VrRuntime {

    override fun getRuntimeId(): String = ID

    override fun createSession(activity: Activity, listener: VrSession.Listener): VrSession {
        try {
            val factoryClass = Class.forName(SESSION_FACTORY_CLASS, true, activity.classLoader)
            val factory = factoryClass.getDeclaredConstructor().newInstance() as OpenXrSessionFactory
            Debug.Printf("VR runtime: native OpenXR session active")
            return factory.createSession(activity, listener)
        } catch (error: ReflectiveOperationException) {
            throw IllegalStateException(
                "OpenXR was selected without an installed native session backend", error
            )
        } catch (error: ClassCastException) {
            throw IllegalStateException(
                "OpenXR was selected without an installed native session backend", error
            )
        } catch (error: LinkageError) {
            throw IllegalStateException(
                "OpenXR was selected without an installed native session backend", error
            )
        }
    }

    companion object {
        const val ID = "openxr"
        const val SESSION_FACTORY_CLASS = "com.lumiyaviewer.lumiya.xr.OpenXrSessionFactoryImpl"

        @JvmStatic
        fun isBackendInstalled(): Boolean =
            try {
                val factoryClass = Class.forName(SESSION_FACTORY_CLASS, false, OpenXrRuntime::class.java.classLoader)
                OpenXrSessionFactory::class.java.isAssignableFrom(factoryClass)
            } catch (ignored: ClassNotFoundException) {
                false
            } catch (ignored: LinkageError) {
                false
            }
    }
}
