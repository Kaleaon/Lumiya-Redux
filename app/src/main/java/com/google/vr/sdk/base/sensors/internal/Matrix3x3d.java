package com.google.vr.sdk.base.sensors.internal;

public class Matrix3x3d {
    public double[] m;

    public Matrix3x3d() {
        this.m = new double[9];
    }

    public Matrix3x3d(double d, double d2, double d3, double d4, double d5, double d6, double d7, double d8, double d9) {
        this.m = new double[9];
        this.m[0] = d;
        this.m[1] = d2;
        this.m[2] = d3;
        this.m[3] = d4;
        this.m[4] = d5;
        this.m[5] = d6;
        this.m[6] = d7;
        this.m[7] = d8;
        this.m[8] = d9;
    }

    public Matrix3x3d(Matrix3x3d matrix3x3d) {
        this.m = new double[9];
        this.m[0] = matrix3x3d.m[0];
        this.m[1] = matrix3x3d.m[1];
        this.m[2] = matrix3x3d.m[2];
        this.m[3] = matrix3x3d.m[3];
        this.m[4] = matrix3x3d.m[4];
        this.m[5] = matrix3x3d.m[5];
        this.m[6] = matrix3x3d.m[6];
        this.m[7] = matrix3x3d.m[7];
        this.m[8] = matrix3x3d.m[8];
    }

    public static void add(Matrix3x3d matrix3x3d, Matrix3x3d matrix3x3d2, Matrix3x3d matrix3x3d3) {
        matrix3x3d3.m[0] = matrix3x3d.m[0] + matrix3x3d2.m[0];
        matrix3x3d3.m[1] = matrix3x3d.m[1] + matrix3x3d2.m[1];
        matrix3x3d3.m[2] = matrix3x3d.m[2] + matrix3x3d2.m[2];
        matrix3x3d3.m[3] = matrix3x3d.m[3] + matrix3x3d2.m[3];
        matrix3x3d3.m[4] = matrix3x3d.m[4] + matrix3x3d2.m[4];
        matrix3x3d3.m[5] = matrix3x3d.m[5] + matrix3x3d2.m[5];
        matrix3x3d3.m[6] = matrix3x3d.m[6] + matrix3x3d2.m[6];
        matrix3x3d3.m[7] = matrix3x3d.m[7] + matrix3x3d2.m[7];
        matrix3x3d3.m[8] = matrix3x3d.m[8] + matrix3x3d2.m[8];
    }

    public static void mult(Matrix3x3d matrix3x3d, Matrix3x3d matrix3x3d2, Matrix3x3d matrix3x3d3) {
        matrix3x3d3.set((matrix3x3d.m[2] * matrix3x3d2.m[6]) + (matrix3x3d.m[0] * matrix3x3d2.m[0]) + (matrix3x3d.m[1] * matrix3x3d2.m[3]), (matrix3x3d.m[2] * matrix3x3d2.m[7]) + (matrix3x3d.m[0] * matrix3x3d2.m[1]) + (matrix3x3d.m[1] * matrix3x3d2.m[4]), (matrix3x3d.m[2] * matrix3x3d2.m[8]) + (matrix3x3d.m[0] * matrix3x3d2.m[2]) + (matrix3x3d.m[1] * matrix3x3d2.m[5]), (matrix3x3d.m[5] * matrix3x3d2.m[6]) + (matrix3x3d.m[3] * matrix3x3d2.m[0]) + (matrix3x3d.m[4] * matrix3x3d2.m[3]), (matrix3x3d.m[5] * matrix3x3d2.m[7]) + (matrix3x3d.m[3] * matrix3x3d2.m[1]) + (matrix3x3d.m[4] * matrix3x3d2.m[4]), (matrix3x3d.m[5] * matrix3x3d2.m[8]) + (matrix3x3d.m[3] * matrix3x3d2.m[2]) + (matrix3x3d.m[4] * matrix3x3d2.m[5]), (matrix3x3d.m[8] * matrix3x3d2.m[6]) + (matrix3x3d.m[6] * matrix3x3d2.m[0]) + (matrix3x3d.m[7] * matrix3x3d2.m[3]), (matrix3x3d.m[8] * matrix3x3d2.m[7]) + (matrix3x3d.m[6] * matrix3x3d2.m[1]) + (matrix3x3d.m[7] * matrix3x3d2.m[4]), (matrix3x3d.m[8] * matrix3x3d2.m[8]) + (matrix3x3d.m[6] * matrix3x3d2.m[2]) + (matrix3x3d.m[7] * matrix3x3d2.m[5]));
    }

    public static void mult(Matrix3x3d matrix3x3d, Vector3d vector3d, Vector3d vector3d2) {
        double d = (matrix3x3d.m[0] * vector3d.x) + (matrix3x3d.m[1] * vector3d.y) + (matrix3x3d.m[2] * vector3d.z);
        double d2 = (matrix3x3d.m[3] * vector3d.x) + (matrix3x3d.m[4] * vector3d.y) + (matrix3x3d.m[5] * vector3d.z);
        double d3 = (matrix3x3d.m[6] * vector3d.x) + (matrix3x3d.m[7] * vector3d.y) + (matrix3x3d.m[8] * vector3d.z);
        vector3d2.x = d;
        vector3d2.y = d2;
        vector3d2.z = d3;
    }

    public double determinant() {
        return ((get(0, 0) * ((get(1, 1) * get(2, 2)) - (get(2, 1) * get(1, 2)))) - (get(0, 1) * ((get(1, 0) * get(2, 2)) - (get(1, 2) * get(2, 0))))) + (get(0, 2) * ((get(1, 0) * get(2, 1)) - (get(1, 1) * get(2, 0))));
    }

    public double get(int i, int i2) {
        return this.m[(i * 3) + i2];
    }

    public void getColumn(int i, Vector3d vector3d) {
        vector3d.x = this.m[i];
        vector3d.y = this.m[i + 3];
        vector3d.z = this.m[i + 6];
    }

    public boolean invert(Matrix3x3d matrix3x3d) {
        double determinant = determinant();
        if (determinant == 0.0d) {
            return false;
        }
        double d = 1.0d / determinant;
        matrix3x3d.set(((this.m[4] * this.m[8]) - (this.m[7] * this.m[5])) * d, (-((this.m[1] * this.m[8]) - (this.m[2] * this.m[7]))) * d, ((this.m[1] * this.m[5]) - (this.m[2] * this.m[4])) * d, (-((this.m[3] * this.m[8]) - (this.m[5] * this.m[6]))) * d, ((this.m[0] * this.m[8]) - (this.m[2] * this.m[6])) * d, (-((this.m[0] * this.m[5]) - (this.m[3] * this.m[2]))) * d, ((this.m[3] * this.m[7]) - (this.m[6] * this.m[4])) * d, (-((this.m[0] * this.m[7]) - (this.m[6] * this.m[1]))) * d, ((this.m[0] * this.m[4]) - (this.m[3] * this.m[1])) * d);
        return true;
    }

    public double maxNorm() {
        double abs = Math.abs(this.m[0]);
        for (int i = 1; i < this.m.length; i++) {
            abs = Math.max(abs, Math.abs(this.m[i]));
        }
        return abs;
    }

    public void minusEquals(Matrix3x3d matrix3x3d) {
        double[] m = this.m;
        m[0] = m[0] - matrix3x3d.m[0];
        double[] m2 = this.m;
        m2[1] = m2[1] - matrix3x3d.m[1];
        double[] m3 = this.m;
        m3[2] = m3[2] - matrix3x3d.m[2];
        double[] m4 = this.m;
        m4[3] = m4[3] - matrix3x3d.m[3];
        double[] m5 = this.m;
        m5[4] = m5[4] - matrix3x3d.m[4];
        double[] m6 = this.m;
        m6[5] = m6[5] - matrix3x3d.m[5];
        double[] m7 = this.m;
        m7[6] = m7[6] - matrix3x3d.m[6];
        double[] m8 = this.m;
        m8[7] = m8[7] - matrix3x3d.m[7];
        double[] m9 = this.m;
        m9[8] = m9[8] - matrix3x3d.m[8];
    }

    public void plusEquals(Matrix3x3d matrix3x3d) {
        double[] m = this.m;
        m[0] = m[0] + matrix3x3d.m[0];
        double[] m2 = this.m;
        m2[1] = m2[1] + matrix3x3d.m[1];
        double[] m3 = this.m;
        m3[2] = m3[2] + matrix3x3d.m[2];
        double[] m4 = this.m;
        m4[3] = m4[3] + matrix3x3d.m[3];
        double[] m5 = this.m;
        m5[4] = m5[4] + matrix3x3d.m[4];
        double[] m6 = this.m;
        m6[5] = m6[5] + matrix3x3d.m[5];
        double[] m7 = this.m;
        m7[6] = m7[6] + matrix3x3d.m[6];
        double[] m8 = this.m;
        m8[7] = m8[7] + matrix3x3d.m[7];
        double[] m9 = this.m;
        m9[8] = m9[8] + matrix3x3d.m[8];
    }

    public void scale(double d) {
        double[] m = this.m;
        m[0] = m[0] * d;
        double[] m2 = this.m;
        m2[1] = m2[1] * d;
        double[] m3 = this.m;
        m3[2] = m3[2] * d;
        double[] m4 = this.m;
        m4[3] = m4[3] * d;
        double[] m5 = this.m;
        m5[4] = m5[4] * d;
        double[] m6 = this.m;
        m6[5] = m6[5] * d;
        double[] m7 = this.m;
        m7[6] = m7[6] * d;
        double[] m8 = this.m;
        m8[7] = m8[7] * d;
        double[] m9 = this.m;
        m9[8] = m9[8] * d;
    }

    public void set(double d, double d2, double d3, double d4, double d5, double d6, double d7, double d8, double d9) {
        this.m[0] = d;
        this.m[1] = d2;
        this.m[2] = d3;
        this.m[3] = d4;
        this.m[4] = d5;
        this.m[5] = d6;
        this.m[6] = d7;
        this.m[7] = d8;
        this.m[8] = d9;
    }

    public void set(int i, int i2, double d) {
        this.m[(i * 3) + i2] = d;
    }

    public void set(Matrix3x3d matrix3x3d) {
        this.m[0] = matrix3x3d.m[0];
        this.m[1] = matrix3x3d.m[1];
        this.m[2] = matrix3x3d.m[2];
        this.m[3] = matrix3x3d.m[3];
        this.m[4] = matrix3x3d.m[4];
        this.m[5] = matrix3x3d.m[5];
        this.m[6] = matrix3x3d.m[6];
        this.m[7] = matrix3x3d.m[7];
        this.m[8] = matrix3x3d.m[8];
    }

    public void setColumn(int i, Vector3d vector3d) {
        this.m[i] = vector3d.x;
        this.m[i + 3] = vector3d.y;
        this.m[i + 6] = vector3d.z;
    }

    public void setIdentity() {
        double[] m = this.m;
        double[] m2 = this.m;
        double[] m3 = this.m;
        double[] m4 = this.m;
        double[] m5 = this.m;
        this.m[7] = 0.0d;
        m5[6] = 0.0d;
        m4[5] = 0.0d;
        m3[3] = 0.0d;
        m2[2] = 0.0d;
        m[1] = 0.0d;
        double[] m6 = this.m;
        double[] m7 = this.m;
        this.m[8] = 1.0d;
        m7[4] = 1.0d;
        m6[0] = 1.0d;
    }

    public void setSameDiagonal(double sameDiagonal) {
        double[] m = this.m;
        double[] m2 = this.m;
        this.m[8] = sameDiagonal;
        m2[4] = sameDiagonal;
        m[0] = sameDiagonal;
    }

    public void setZero() {
        double[] m = this.m;
        double[] m2 = this.m;
        double[] m3 = this.m;
        double[] m4 = this.m;
        double[] m5 = this.m;
        double[] m6 = this.m;
        double[] m7 = this.m;
        double[] m8 = this.m;
        this.m[8] = 0.0d;
        m8[7] = 0.0d;
        m7[6] = 0.0d;
        m6[5] = 0.0d;
        m5[4] = 0.0d;
        m4[3] = 0.0d;
        m3[2] = 0.0d;
        m2[1] = 0.0d;
        m[0] = 0.0d;
    }

    public void transpose() {
        double d = this.m[1];
        this.m[1] = this.m[3];
        this.m[3] = d;
        double d2 = this.m[2];
        this.m[2] = this.m[6];
        this.m[6] = d2;
        double d3 = this.m[5];
        this.m[5] = this.m[7];
        this.m[7] = d3;
    }

    public void transpose(Matrix3x3d matrix3x3d) {
        double d = this.m[1];
        double d2 = this.m[2];
        double d3 = this.m[5];
        matrix3x3d.m[0] = this.m[0];
        matrix3x3d.m[1] = this.m[3];
        matrix3x3d.m[2] = this.m[6];
        matrix3x3d.m[3] = d;
        matrix3x3d.m[4] = this.m[4];
        matrix3x3d.m[5] = this.m[7];
        matrix3x3d.m[6] = d2;
        matrix3x3d.m[7] = d3;
        matrix3x3d.m[8] = this.m[8];
    }
}
