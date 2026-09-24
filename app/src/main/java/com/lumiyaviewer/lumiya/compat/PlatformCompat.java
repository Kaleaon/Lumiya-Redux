package com.lumiyaviewer.lumiya.compat;

import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;

/**
 * Targets for calls that the original 3.4.2 bytecode makes to platform APIs
 * whose contract changed after it shipped. tools/recover/legacy/RemapLegacy
 * redirects those call sites here when it links original bytecode into the
 * app; recovered sources may call these directly too.
 */
public final class PlatformCompat {
    private static final int MUTABILITY_FLAGS = PendingIntent.FLAG_IMMUTABLE | PendingIntent.FLAG_MUTABLE;

    private PlatformCompat() {
    }

    /**
     * Android 12 (API 31) throws if a PendingIntent names neither
     * FLAG_IMMUTABLE nor FLAG_MUTABLE. 3.4.2 never filled in intents it
     * handed out, so immutable preserves its behaviour.
     */
    static int withMutability(int flags) {
        return (flags & MUTABILITY_FLAGS) == 0 ? flags | PendingIntent.FLAG_IMMUTABLE : flags;
    }

    public static PendingIntent getActivity(Context context, int requestCode, Intent intent, int flags) {
        return PendingIntent.getActivity(context, requestCode, intent, withMutability(flags));
    }

    public static PendingIntent getService(Context context, int requestCode, Intent intent, int flags) {
        return PendingIntent.getService(context, requestCode, intent, withMutability(flags));
    }

    public static PendingIntent getBroadcast(Context context, int requestCode, Intent intent, int flags) {
        return PendingIntent.getBroadcast(context, requestCode, intent, withMutability(flags));
    }
}
