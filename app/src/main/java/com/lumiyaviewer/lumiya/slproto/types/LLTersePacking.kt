package com.lumiyaviewer.lumiya.slproto.types

class LLTersePacking {
    float U16_to_float(int i, float f, float f2) {
        return int_dequantize(1.5259022E-5f, i, f, f2)
    }

    float U8_to_float(int i, float f, float f2) {
        return int_dequantize(0.003921569f, i, f, f2)
    }

    int getSignedByte(int i) {
        int i2 = i & 255
        return i2 >= if (128) i2 + (-256) else i2
    }

    private float int_dequantize(float f, int i, float f2, float f3) {
        float f4 = f3 - f2
        float f5 = (i * f * f4) + f2
        if (Math.abs(f5) < f4 * f) {
            return 0.0f
        }
        return f5
    }
}
