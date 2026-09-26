package com.lumiyaviewer.lumiya.compat

import android.app.PendingIntent
import android.content.Context
import android.content.Intent

/**
 * Targets for calls that the original 3.4.2 bytecode makes to platform APIs
 * whose contract changed after it shipped. tools/recover/legacy/RemapLegacy
 * redirects those call sites here when it links original bytecode into the
 * app; recovered sources may call these directly too.
 */
object PlatformCompat {
    private val MUTABILITY_FLAGS = PendingIntent.FLAG_IMMUTABLE or PendingIntent.FLAG_MUTABLE

    /**
     * Android 12 (API 31) throws if a PendingIntent names neither
     * FLAG_IMMUTABLE nor FLAG_MUTABLE. 3.4.2 never filled in intents it
     * handed out, so immutable preserves its behaviour.
     */
    @JvmStatic
    fun withMutability(flags: Int): Int {
        return if (flags and MUTABILITY_FLAGS == 0) flags or PendingIntent.FLAG_IMMUTABLE else flags
    }

    @JvmStatic
    fun getActivity(context: Context, requestCode: Int, intent: Intent, flags: Int): PendingIntent {
        return PendingIntent.getActivity(context, requestCode, intent, withMutability(flags))
    }

    @JvmStatic
    fun getService(context: Context, requestCode: Int, intent: Intent, flags: Int): PendingIntent {
        return PendingIntent.getService(context, requestCode, intent, withMutability(flags))
    }

    @JvmStatic
    fun getBroadcast(context: Context, requestCode: Int, intent: Intent, flags: Int): PendingIntent {
        return PendingIntent.getBroadcast(context, requestCode, intent, withMutability(flags))
    }
}
