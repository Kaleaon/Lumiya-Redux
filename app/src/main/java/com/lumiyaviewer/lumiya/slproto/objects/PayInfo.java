package com.lumiyaviewer.lumiya.slproto.objects;

import androidx.annotation.Nullable;
import com.google.common.collect.ImmutableList;
import com.google.common.primitives.Ints;
import java.util.Collection;

public abstract class PayInfo {
    public static final int MAX_PAY_PRICES = 4;

    public static PayInfo create(int i, int[] ints) {
        return new AutoValue_PayInfo(i, ints != null ? ImmutableList.copyOf((Collection) Ints.asList(ints)) : null);
    }

    public abstract int defaultPayPrice();

    @Nullable
    public abstract ImmutableList<Integer> payPrices();
}
