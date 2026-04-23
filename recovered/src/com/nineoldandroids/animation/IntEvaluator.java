package com.nineoldandroids.animation;

/* loaded from: classes.dex */
public class IntEvaluator implements TypeEvaluator<Integer> {
    @Override // com.nineoldandroids.animation.TypeEvaluator
    public Integer evaluate(float f, Integer num, Integer num2) {
        return Integer.valueOf((int) (((num2.intValue() - r0) * f) + num.intValue()));
    }
}
