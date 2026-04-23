package com.google.common.util.concurrent;

import com.google.common.annotations.GwtCompatible;
import javax.annotation.Nullable;

@GwtCompatible(emulated = true)
/* loaded from: classes.dex */
final class Platform {
    private Platform() {
    }

    static boolean isInstanceOfThrowableClass(@Nullable Throwable th, Class<? extends Throwable> cls) {
        return cls.isInstance(th);
    }
}
