package com.google.common.collect;

import com.google.common.annotations.GwtCompatible;

@GwtCompatible
/* loaded from: classes.dex */
interface Constraint<E> {
    E checkElement(E e);

    String toString();
}
