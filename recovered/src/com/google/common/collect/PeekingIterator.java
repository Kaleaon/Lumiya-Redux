package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;
import java.util.Iterator;

@GwtCompatible
/* loaded from: classes.dex */
public interface PeekingIterator<E> extends Iterator<E> {
    E next();

    E peek();

    @Override // java.util.Iterator
    void remove();
}
