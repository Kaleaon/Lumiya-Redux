package com.google.vr.sdk.base;

import java.lang.reflect.Array;
import java.util.Arrays;

public class Distortion {
    private float[] coefficients;
    private static final float[] CARDBOARD_V2_2_COEFFICIENTS = {0.34f, 0.55f};
    private static final float[] CARDBOARD_V1_COEFFICIENTS = {0.441f, 0.156f};

    public Distortion() {
        this.coefficients = (float[]) CARDBOARD_V2_2_COEFFICIENTS.clone();
    }

    public Distortion(Distortion distortion) {
        setCoefficients(distortion.coefficients);
    }

    public static Distortion cardboardV1Distortion() {
        Distortion distortion = new Distortion();
        distortion.coefficients = (float[]) CARDBOARD_V1_COEFFICIENTS.clone();
        return distortion;
    }

    public static Distortion parseFromProtobuf(float[] floats) {
        Distortion distortion = new Distortion();
        distortion.setCoefficients(floats);
        return distortion;
    }

    private static double[] solveLeastSquares(double[][] dArr, double[] dArr2) {
        int length = dArr.length;
        int length2 = dArr[0].length;
        double[][] dArr3 = (double[][]) Array.newInstance((Class<?>) Double.TYPE, length2, length2);
        for (int i = 0; i < length2; i++) {
            for (int j = 0; j < length2; j++) {
                double d = 0.0d;
                for (int k = 0; k < length; k++) {
                    d += dArr[k][j] * dArr[k][i];
                }
                dArr3[j][i] = d;
            }
        }
        double[] dArr4 = new double[length2];
        for (int m = 0; m < length2; m++) {
            double d2 = 0.0d;
            for (int n = 0; n < length; n++) {
                d2 += dArr[n][m] * dArr2[n];
            }
            dArr4[m] = d2;
        }
        return solveLinear(dArr3, dArr4);
    }

    private static double[] solveLinear(double[][] dArr, double[] dArr2) {
        int i = 0;
        int length = dArr[0].length;
        while (true) {
            int i2 = i;
            if (i2 >= length - 1) {
                break;
            }
            for (int j = i2 + 1; j < length; j++) {
                double d = dArr[j][i2] / dArr[i2][i2];
                for (int k = i2 + 1; k < length; k++) {
                    double[] dArr3 = dArr[j];
                    dArr3[k] = dArr3[k] - (dArr[i2][k] * d);
                }
                dArr2[j] = dArr2[j] - (d * dArr2[i2]);
            }
            i = i2 + 1;
        }
        double[] dArr4 = new double[length];
        for (int m = length - 1; m >= 0; m--) {
            double d2 = dArr2[m];
            for (int n = m + 1; n < length; n++) {
                d2 -= dArr[m][n] * dArr4[n];
            }
            dArr4[m] = d2 / dArr[m][m];
        }
        return dArr4;
    }

    public float distort(float f) {
        return distortionFactor(f) * f;
    }

    public float distortInverse(float f) {
        float f2 = f / 0.9f;
        float distort = f - distort(f2);
        float f3 = f2;
        float f4 = f * 0.9f;
        while (Math.abs(f4 - f3) > 1.0E-4d) {
            float distort2 = f - distort(f4);
            float f5 = f4 - (((f4 - f3) / (distort2 - distort)) * distort2);
            f3 = f4;
            f4 = f5;
            distort = distort2;
        }
        return f4;
    }

    public float distortionFactor(float f) {
        float f2 = 1.0f;
        float f3 = f * f;
        float f4 = 1.0f;
        for (float coefficient : this.coefficients) {
            f2 *= f3;
            f4 += coefficient * f2;
        }
        return f4;
    }

    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (obj == this) {
            return true;
        }
        if (obj instanceof Distortion) {
            return Arrays.equals(this.coefficients, ((Distortion) obj).coefficients);
        }
        return false;
    }

    @Deprecated
    public Distortion getApproximateInverseDistortion(float f) {
        return getApproximateInverseDistortion(f, 2);
    }

    public Distortion getApproximateInverseDistortion(float f, int i) {
        double[][] dArr = (double[][]) Array.newInstance((Class<?>) Double.TYPE, 100, i);
        double[] dArr2 = new double[100];
        for (int j = 0; j < 100; j++) {
            float f2 = ((j + 1) * f) / 100.0f;
            double distort = distort(f2);
            double distort2 = distort;
            for (int k = 0; k < i; k++) {
                distort2 *= distort * distort;
                dArr[j][k] = distort2;
            }
            dArr2[j] = f2 - distort;
        }
        double[] solveLeastSquares = solveLeastSquares(dArr, dArr2);
        float[] floats = new float[solveLeastSquares.length];
        for (int m = 0; m < solveLeastSquares.length; m++) {
            floats[m] = (float) solveLeastSquares[m];
        }
        Distortion distortion = new Distortion();
        distortion.setCoefficients(floats);
        return distortion;
    }

    public float[] getCoefficients() {
        return this.coefficients;
    }

    public void setCoefficients(float[] floats) {
        this.coefficients = floats == null ? new float[0] : (float[]) floats.clone();
    }

    public float[] toProtobuf() {
        return (float[]) this.coefficients.clone();
    }

    public String toString() {
        StringBuilder append = new StringBuilder().append("{\n").append("  coefficients: [");
        for (int i = 0; i < this.coefficients.length; i++) {
            append.append(Float.toString(this.coefficients[i]));
            if (i < this.coefficients.length - 1) {
                append.append(", ");
            }
        }
        append.append("],\n}");
        return append.toString();
    }
}
