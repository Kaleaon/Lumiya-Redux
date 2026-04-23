package com.google.common.math;

import com.google.common.annotations.GwtCompatible;
import com.google.common.annotations.GwtIncompatible;
import com.google.common.annotations.VisibleForTesting;
import com.google.common.base.Ascii;
import com.google.common.base.Preconditions;
import com.google.common.logging.nano.Vr;
import com.google.common.primitives.UnsignedLongs;
import java.math.RoundingMode;

@GwtCompatible(emulated = true)
/* loaded from: classes.dex */
public final class LongMath {

    @VisibleForTesting
    static final long FLOOR_SQRT_MAX_LONG = 3037000499L;

    @VisibleForTesting
    static final long MAX_POWER_OF_SQRT2_UNSIGNED = -5402926248376769404L;

    @VisibleForTesting
    static final byte[] maxLog10ForLeadingZeros = {19, Ascii.DC2, Ascii.DC2, Ascii.DC2, Ascii.DC2, 17, 17, 17, 16, 16, 16, 15, 15, 15, 15, Ascii.SO, Ascii.SO, Ascii.SO, Ascii.CR, Ascii.CR, Ascii.CR, Ascii.FF, Ascii.FF, Ascii.FF, Ascii.FF, Ascii.VT, Ascii.VT, Ascii.VT, 10, 10, 10, 9, 9, 9, 9, 8, 8, 8, 7, 7, 7, 6, 6, 6, 6, 5, 5, 5, 4, 4, 4, 3, 3, 3, 3, 2, 2, 2, 1, 1, 1, 0, 0, 0};

    @VisibleForTesting
    @GwtIncompatible("TODO")
    static final long[] powersOf10 = {1, 10, 100, 1000, 10000, 100000, 1000000, 10000000, 100000000, 1000000000, 10000000000L, 100000000000L, 1000000000000L, 10000000000000L, 100000000000000L, 1000000000000000L, 10000000000000000L, 100000000000000000L, 1000000000000000000L};

    @VisibleForTesting
    @GwtIncompatible("TODO")
    static final long[] halfPowersOf10 = {3, 31, 316, 3162, 31622, 316227, 3162277, 31622776, 316227766, 3162277660L, 31622776601L, 316227766016L, 3162277660168L, 31622776601683L, 316227766016837L, 3162277660168379L, 31622776601683793L, 316227766016837933L, 3162277660168379331L};
    static final long[] factorials = {1, 1, 2, 6, 24, 120, 720, 5040, 40320, 362880, 3628800, 39916800, 479001600, 6227020800L, 87178291200L, 1307674368000L, 20922789888000L, 355687428096000L, 6402373705728000L, 121645100408832000L, 2432902008176640000L};
    static final int[] biggestBinomials = {Integer.MAX_VALUE, Integer.MAX_VALUE, Integer.MAX_VALUE, 3810779, 121977, 16175, 4337, 1733, 887, 534, 361, 265, 206, 169, 143, Vr.VREvent.VrCore.ErrorCode.CONTROLLER_BATTERY_READ_FAILED, 111, 101, 94, 88, 83, 79, 76, 74, 72, 70, 69, 68, 67, 67, 66, 66, 66, 66};

    @VisibleForTesting
    static final int[] biggestSimpleBinomials = {Integer.MAX_VALUE, Integer.MAX_VALUE, Integer.MAX_VALUE, 2642246, 86251, 11724, 3218, 1313, 684, 419, 287, 214, 169, 139, Vr.VREvent.VrCore.ErrorCode.CONTROLLER_UNSUPPORTED, 105, 95, 87, 81, 76, 73, 70, 68, 66, 64, 63, 62, 62, 61, 61, 61};
    private static final long[][] millerRabinBaseSets = {new long[]{291830, 126401071349994536L}, new long[]{885594168, 725270293939359937L, 3569819667048198375L}, new long[]{273919523040L, 15, 7363882082L, 992620450144556L}, new long[]{47636622961200L, 2, 2570940, 211991001, 3749873356L}, new long[]{7999252175582850L, 2, 4130806001517L, 149795463772692060L, 186635894390467037L, 3967304179347715805L}, new long[]{585226005592931976L, 2, 123635709730000L, 9233062284813009L, 43835965440333360L, 761179012939631437L, 1263739024124850375L}, new long[]{Long.MAX_VALUE, 2, 325, 9375, 28178, 450775, 9780504, 1795265022}};

    /* renamed from: com.google.common.math.LongMath$1, reason: invalid class name */
    static /* synthetic */ class AnonymousClass1 {
        static final /* synthetic */ int[] $SwitchMap$java$math$RoundingMode = new int[RoundingMode.values().length];

        static {
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.UNNECESSARY.ordinal()] = 1;
            } catch (NoSuchFieldError e) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.DOWN.ordinal()] = 2;
            } catch (NoSuchFieldError e2) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.FLOOR.ordinal()] = 3;
            } catch (NoSuchFieldError e3) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.UP.ordinal()] = 4;
            } catch (NoSuchFieldError e4) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.CEILING.ordinal()] = 5;
            } catch (NoSuchFieldError e5) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_DOWN.ordinal()] = 6;
            } catch (NoSuchFieldError e6) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_UP.ordinal()] = 7;
            } catch (NoSuchFieldError e7) {
            }
            try {
                $SwitchMap$java$math$RoundingMode[RoundingMode.HALF_EVEN.ordinal()] = 8;
            } catch (NoSuchFieldError e8) {
            }
        }
    }

    private enum MillerRabinTester {
        SMALL { // from class: com.google.common.math.LongMath.MillerRabinTester.1
            @Override // com.google.common.math.LongMath.MillerRabinTester
            long mulMod(long j, long j2, long j3) {
                return (j * j2) % j3;
            }

            @Override // com.google.common.math.LongMath.MillerRabinTester
            long squareMod(long j, long j2) {
                return (j * j) % j2;
            }
        },
        LARGE { // from class: com.google.common.math.LongMath.MillerRabinTester.2
            private long plusMod(long j, long j2, long j3) {
                return !((j > (j3 - j2) ? 1 : (j == (j3 - j2) ? 0 : -1)) < 0) ? (j + j2) - j3 : j + j2;
            }

            private long times2ToThe32Mod(long j, long j2) {
                int i = 32;
                do {
                    int min = Math.min(i, Long.numberOfLeadingZeros(j));
                    j = UnsignedLongs.remainder(j << min, j2);
                    i -= min;
                } while (i > 0);
                return j;
            }

            @Override // com.google.common.math.LongMath.MillerRabinTester
            long mulMod(long j, long j2, long j3) {
                long j4 = j >>> 32;
                long j5 = j2 >>> 32;
                long j6 = j & 4294967295L;
                long j7 = j2 & 4294967295L;
                long times2ToThe32Mod = (j4 * j7) + times2ToThe32Mod(j4 * j5, j3);
                if (!(times2ToThe32Mod >= 0)) {
                    times2ToThe32Mod = UnsignedLongs.remainder(times2ToThe32Mod, j3);
                }
                return plusMod(times2ToThe32Mod(times2ToThe32Mod + (j6 * j5), j3), UnsignedLongs.remainder(j6 * j7, j3), j3);
            }

            @Override // com.google.common.math.LongMath.MillerRabinTester
            long squareMod(long j, long j2) {
                long j3 = j >>> 32;
                long j4 = j & 4294967295L;
                long times2ToThe32Mod = times2ToThe32Mod(j3 * j3, j2);
                long j5 = j3 * j4 * 2;
                if (!(j5 >= 0)) {
                    j5 = UnsignedLongs.remainder(j5, j2);
                }
                return plusMod(times2ToThe32Mod(j5 + times2ToThe32Mod, j2), UnsignedLongs.remainder(j4 * j4, j2), j2);
            }
        };

        /* synthetic */ MillerRabinTester(AnonymousClass1 anonymousClass1) {
            this();
        }

        private long powMod(long j, long j2, long j3) {
            long j4 = 1;
            long j5 = j;
            while (j2 != 0) {
                if ((1 & j2) != 0) {
                    j4 = mulMod(j4, j5, j3);
                }
                j5 = squareMod(j5, j3);
                j2 >>= 1;
            }
            return j4;
        }

        static boolean test(long j, long j2) {
            return (!((j2 > LongMath.FLOOR_SQRT_MAX_LONG ? 1 : (j2 == LongMath.FLOOR_SQRT_MAX_LONG ? 0 : -1)) > 0) ? SMALL : LARGE).testWitness(j, j2);
        }

        private boolean testWitness(long j, long j2) {
            int numberOfTrailingZeros = Long.numberOfTrailingZeros(j2 - 1);
            long j3 = (j2 - 1) >> numberOfTrailingZeros;
            long j4 = j % j2;
            if (j4 == 0) {
                return true;
            }
            long powMod = powMod(j4, j3, j2);
            if (powMod == 1) {
                return true;
            }
            int i = 0;
            while (powMod != j2 - 1) {
                i++;
                if (i == numberOfTrailingZeros) {
                    return false;
                }
                powMod = squareMod(powMod, j2);
            }
            return true;
        }

        abstract long mulMod(long j, long j2, long j3);

        abstract long squareMod(long j, long j2);
    }

    private LongMath() {
    }

    public static long binomial(int i, int i2) {
        long j;
        long j2;
        long j3;
        int i3;
        long j4 = 1;
        MathPreconditions.checkNonNegative("n", i);
        MathPreconditions.checkNonNegative("k", i2);
        Preconditions.checkArgument(i2 <= i, "k (%s) > n (%s)", Integer.valueOf(i2), Integer.valueOf(i));
        if (i2 > (i >> 1)) {
            i2 = i - i2;
        }
        switch (i2) {
            case 0:
                return 1L;
            case 1:
                return i;
            default:
                if (i < factorials.length) {
                    return factorials[i] / (factorials[i2] * factorials[i - i2]);
                }
                if (i2 >= biggestBinomials.length || i > biggestBinomials[i2]) {
                    return Long.MAX_VALUE;
                }
                if (i2 < biggestSimpleBinomials.length && i <= biggestSimpleBinomials[i2]) {
                    int i4 = i - 1;
                    long j5 = i;
                    for (int i5 = 2; i5 <= i2; i5++) {
                        j5 = (j5 * i4) / i5;
                        i4--;
                    }
                    return j5;
                }
                int log2 = log2(i, RoundingMode.CEILING);
                int i6 = 2;
                int i7 = log2;
                int i8 = i - 1;
                long j6 = i;
                long j7 = 1;
                while (i6 <= i2) {
                    if (i7 + log2 >= 63) {
                        j3 = multiplyFraction(j7, j6, j4);
                        j2 = i8;
                        j = i6;
                        i3 = log2;
                    } else {
                        long j8 = i8 * j6;
                        j = j4 * i6;
                        j2 = j8;
                        j3 = j7;
                        i3 = i7 + log2;
                    }
                    i7 = i3;
                    i8--;
                    i6++;
                    j7 = j3;
                    long j9 = j2;
                    j4 = j;
                    j6 = j9;
                }
                return multiplyFraction(j7, j6, j4);
        }
    }

    @GwtIncompatible("TODO")
    public static long checkedAdd(long j, long j2) {
        long j3 = j + j2;
        MathPreconditions.checkNoOverflow((((j ^ j3) > 0L ? 1 : ((j ^ j3) == 0L ? 0 : -1)) < 0 ? false : true) | (!(((j ^ j2) > 0L ? 1 : ((j ^ j2) == 0L ? 0 : -1)) >= 0)));
        return j3;
    }

    @GwtIncompatible("TODO")
    public static long checkedMultiply(long j, long j2) {
        int numberOfLeadingZeros = Long.numberOfLeadingZeros(j) + Long.numberOfLeadingZeros(j ^ (-1)) + Long.numberOfLeadingZeros(j2) + Long.numberOfLeadingZeros(j2 ^ (-1));
        if (numberOfLeadingZeros > 65) {
            return j * j2;
        }
        MathPreconditions.checkNoOverflow(numberOfLeadingZeros >= 64);
        MathPreconditions.checkNoOverflow((j2 != Long.MIN_VALUE) | (!((j > 0L ? 1 : (j == 0L ? 0 : -1)) < 0)));
        long j3 = j * j2;
        MathPreconditions.checkNoOverflow(j == 0 || j3 / j == j2);
        return j3;
    }

    @GwtIncompatible("TODO")
    public static long checkedPow(long j, int i) {
        boolean z;
        long j2 = 1;
        MathPreconditions.checkNonNegative("exponent", i);
        if ((!((j > 2L ? 1 : (j == 2L ? 0 : -1)) > 0)) && (!((j > (-2L) ? 1 : (j == (-2L) ? 0 : -1)) < 0))) {
            switch ((int) j) {
                case -2:
                    MathPreconditions.checkNoOverflow(i < 64);
                    return (i & 1) != 0 ? (-1) << i : 1 << i;
                case -1:
                    return (i & 1) != 0 ? -1L : 1L;
                case 0:
                    return i != 0 ? 0L : 1L;
                case 1:
                    return 1L;
                case 2:
                    MathPreconditions.checkNoOverflow(i < 63);
                    return 1 << i;
                default:
                    throw new AssertionError();
            }
        }
        while (true) {
            switch (i) {
                case 0:
                    return j2;
                case 1:
                    return checkedMultiply(j2, j);
                default:
                    if ((i & 1) != 0) {
                        j2 = checkedMultiply(j2, j);
                    }
                    i >>= 1;
                    if (i > 0) {
                        if (!(-3037000499L > j)) {
                            if (!(j > FLOOR_SQRT_MAX_LONG)) {
                                z = true;
                                MathPreconditions.checkNoOverflow(z);
                                j *= j;
                            }
                        }
                        z = false;
                        MathPreconditions.checkNoOverflow(z);
                        j *= j;
                    }
            }
        }
    }

    @GwtIncompatible("TODO")
    public static long checkedSubtract(long j, long j2) {
        long j3 = j - j2;
        MathPreconditions.checkNoOverflow((((j ^ j3) > 0L ? 1 : ((j ^ j3) == 0L ? 0 : -1)) < 0 ? false : true) | (!(((j ^ j2) > 0L ? 1 : ((j ^ j2) == 0L ? 0 : -1)) < 0)));
        return j3;
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x0036  */
    /* JADX WARN: Removed duplicated region for block: B:18:0x0086  */
    @com.google.common.annotations.GwtIncompatible("TODO")
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static long divide(long r10, long r12, java.math.RoundingMode r14) {
        /*
            com.google.common.base.Preconditions.checkNotNull(r14)
            long r2 = r10 / r12
            long r0 = r12 * r2
            long r0 = r10 - r0
            r4 = 0
            int r4 = (r0 > r4 ? 1 : (r0 == r4 ? 0 : -1))
            if (r4 != 0) goto L10
            return r2
        L10:
            long r4 = r10 ^ r12
            r6 = 63
            long r4 = r4 >> r6
            int r4 = (int) r4
            r5 = r4 | 1
            int[] r4 = com.google.common.math.LongMath.AnonymousClass1.$SwitchMap$java$math$RoundingMode
            int r6 = r14.ordinal()
            r4 = r4[r6]
            switch(r4) {
                case 1: goto L29;
                case 2: goto L33;
                case 3: goto L42;
                case 4: goto L3a;
                case 5: goto L3c;
                case 6: goto L48;
                case 7: goto L48;
                case 8: goto L48;
                default: goto L23;
            }
        L23:
            java.lang.AssertionError r0 = new java.lang.AssertionError
            r0.<init>()
            throw r0
        L29:
            r6 = 0
            int r0 = (r0 > r6 ? 1 : (r0 == r6 ? 0 : -1))
            if (r0 != 0) goto L38
            r0 = 1
        L30:
            com.google.common.math.MathPreconditions.checkRoundingUnnecessary(r0)
        L33:
            r0 = 0
        L34:
            if (r0 != 0) goto L86
            r0 = r2
        L37:
            return r0
        L38:
            r0 = 0
            goto L30
        L3a:
            r0 = 1
            goto L34
        L3c:
            if (r5 > 0) goto L40
            r0 = 0
            goto L34
        L40:
            r0 = 1
            goto L34
        L42:
            if (r5 < 0) goto L46
            r0 = 0
            goto L34
        L46:
            r0 = 1
            goto L34
        L48:
            long r0 = java.lang.Math.abs(r0)
            long r6 = java.lang.Math.abs(r12)
            long r6 = r6 - r0
            long r0 = r0 - r6
            r6 = 0
            int r4 = (r0 > r6 ? 1 : (r0 == r6 ? 0 : -1))
            if (r4 != 0) goto L77
            java.math.RoundingMode r0 = java.math.RoundingMode.HALF_UP
            if (r14 == r0) goto L70
            r0 = 0
        L5d:
            java.math.RoundingMode r1 = java.math.RoundingMode.HALF_EVEN
            if (r14 == r1) goto L72
            r1 = 0
            r4 = r1
        L63:
            r6 = 1
            long r6 = r6 & r2
            r8 = 0
            int r1 = (r6 > r8 ? 1 : (r6 == r8 ? 0 : -1))
            if (r1 == 0) goto L75
            r1 = 1
        L6d:
            r1 = r1 & r4
            r0 = r0 | r1
            goto L34
        L70:
            r0 = 1
            goto L5d
        L72:
            r1 = 1
            r4 = r1
            goto L63
        L75:
            r1 = 0
            goto L6d
        L77:
            r6 = 0
            int r0 = (r0 > r6 ? 1 : (r0 == r6 ? 0 : -1))
            if (r0 > 0) goto L82
            r0 = 1
        L7e:
            if (r0 != 0) goto L84
            r0 = 1
            goto L34
        L82:
            r0 = 0
            goto L7e
        L84:
            r0 = 0
            goto L34
        L86:
            long r0 = (long) r5
            long r0 = r0 + r2
            goto L37
        */
        throw new UnsupportedOperationException("Method not decompiled: com.google.common.math.LongMath.divide(long, long, java.math.RoundingMode):long");
    }

    @GwtIncompatible("TODO")
    public static long factorial(int i) {
        MathPreconditions.checkNonNegative("n", i);
        if (i >= factorials.length) {
            return Long.MAX_VALUE;
        }
        return factorials[i];
    }

    static boolean fitsInInt(long j) {
        return ((long) ((int) j)) == j;
    }

    public static long gcd(long j, long j2) {
        MathPreconditions.checkNonNegative("a", j);
        MathPreconditions.checkNonNegative("b", j2);
        if (j == 0) {
            return j2;
        }
        if (j2 == 0) {
            return j;
        }
        int numberOfTrailingZeros = Long.numberOfTrailingZeros(j);
        long j3 = j >> numberOfTrailingZeros;
        int numberOfTrailingZeros2 = Long.numberOfTrailingZeros(j2);
        long j4 = j2 >> numberOfTrailingZeros2;
        while (j3 != j4) {
            long j5 = j3 - j4;
            long j6 = (j5 >> 63) & j5;
            long j7 = (j5 - j6) - j6;
            j4 += j6;
            j3 = j7 >> Long.numberOfTrailingZeros(j7);
        }
        return j3 << Math.min(numberOfTrailingZeros, numberOfTrailingZeros2);
    }

    public static boolean isPowerOfTwo(long j) {
        return (((j - 1) & j) == 0) & (!((j > 0L ? 1 : (j == 0L ? 0 : -1)) <= 0));
    }

    @VisibleForTesting
    static int lessThanBranchFree(long j, long j2) {
        return (int) ((((j - j2) ^ (-1)) ^ (-1)) >>> 63);
    }

    @GwtIncompatible("TODO")
    public static int log10(long j, RoundingMode roundingMode) {
        MathPreconditions.checkPositive("x", j);
        int log10Floor = log10Floor(j);
        long j2 = powersOf10[log10Floor];
        switch (AnonymousClass1.$SwitchMap$java$math$RoundingMode[roundingMode.ordinal()]) {
            case 1:
                MathPreconditions.checkRoundingUnnecessary(j == j2);
            case 2:
            case 3:
                return log10Floor;
            case 4:
            case 5:
                return lessThanBranchFree(j2, j) + log10Floor;
            case 6:
            case 7:
            case 8:
                return lessThanBranchFree(halfPowersOf10[log10Floor], j) + log10Floor;
            default:
                throw new AssertionError();
        }
    }

    @GwtIncompatible("TODO")
    static int log10Floor(long j) {
        byte b = maxLog10ForLeadingZeros[Long.numberOfLeadingZeros(j)];
        return b - lessThanBranchFree(j, powersOf10[b]);
    }

    public static int log2(long j, RoundingMode roundingMode) {
        MathPreconditions.checkPositive("x", j);
        switch (AnonymousClass1.$SwitchMap$java$math$RoundingMode[roundingMode.ordinal()]) {
            case 1:
                MathPreconditions.checkRoundingUnnecessary(isPowerOfTwo(j));
                break;
            case 2:
            case 3:
                break;
            case 4:
            case 5:
                return 64 - Long.numberOfLeadingZeros(j - 1);
            case 6:
            case 7:
            case 8:
                int numberOfLeadingZeros = Long.numberOfLeadingZeros(j);
                return (63 - numberOfLeadingZeros) + lessThanBranchFree(MAX_POWER_OF_SQRT2_UNSIGNED >>> numberOfLeadingZeros, j);
            default:
                throw new AssertionError("impossible");
        }
        return 63 - Long.numberOfLeadingZeros(j);
    }

    public static long mean(long j, long j2) {
        return (j & j2) + ((j ^ j2) >> 1);
    }

    @GwtIncompatible("TODO")
    public static int mod(long j, int i) {
        return (int) mod(j, i);
    }

    @GwtIncompatible("TODO")
    public static long mod(long j, long j2) {
        if (!(j2 > 0)) {
            throw new ArithmeticException("Modulus must be positive");
        }
        long j3 = j % j2;
        return !(j3 < 0) ? j3 : j3 + j2;
    }

    static long multiplyFraction(long j, long j2, long j3) {
        if (j == 1) {
            return j2 / j3;
        }
        long gcd = gcd(j, j3);
        return (j2 / (j3 / gcd)) * (j / gcd);
    }

    @GwtIncompatible("TODO")
    public static long pow(long j, int i) {
        MathPreconditions.checkNonNegative("exponent", i);
        if (!(-2 > j)) {
            if (!(j > 2)) {
                switch ((int) j) {
                    case -2:
                        if (i >= 64) {
                            return 0L;
                        }
                        return (i & 1) != 0 ? -(1 << i) : 1 << i;
                    case -1:
                        return (i & 1) != 0 ? -1L : 1L;
                    case 0:
                        return i != 0 ? 0L : 1L;
                    case 1:
                        return 1L;
                    case 2:
                        if (i >= 64) {
                            return 0L;
                        }
                        return 1 << i;
                    default:
                        throw new AssertionError();
                }
            }
        }
        long j2 = 1;
        long j3 = j;
        while (true) {
            switch (i) {
                case 0:
                    return j2;
                case 1:
                    return j2 * j3;
                default:
                    long j4 = (i & 1) != 0 ? j3 : 1L;
                    j3 *= j3;
                    i >>= 1;
                    j2 = j4 * j2;
            }
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @GwtIncompatible("TODO")
    public static long sqrt(long j, RoundingMode roundingMode) {
        MathPreconditions.checkNonNegative("x", j);
        if (fitsInInt(j)) {
            return IntMath.sqrt((int) j, roundingMode);
        }
        long sqrt = (long) Math.sqrt(j);
        long j2 = sqrt * sqrt;
        switch (AnonymousClass1.$SwitchMap$java$math$RoundingMode[roundingMode.ordinal()]) {
            case 1:
                MathPreconditions.checkRoundingUnnecessary(j2 == j);
                return sqrt;
            case 2:
            case 3:
                return (j < j2 ? (char) 0 : (char) 1) == 0 ? sqrt - 1 : sqrt;
            case 4:
            case 5:
                return (j > j2 ? (char) 0 : (char) 1) == 0 ? sqrt + 1 : sqrt;
            case 6:
            case 7:
            case 8:
                return (sqrt - (((j > j2 ? 1 : (j == j2 ? 0 : -1)) >= 0) == true ? 0 : 1)) + lessThanBranchFree((r0 * r0) + r0, j);
            default:
                throw new AssertionError();
        }
    }
}
