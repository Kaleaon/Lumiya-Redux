package com.lumiyaviewer.lumiya.utils;

import java.nio.ByteBuffer;
import java.util.Arrays;

public class BitBuffer {
    private static final int MAX_BITS = 8;
    private ByteBuffer buf;
    private byte[] output = new byte[4];
    private int bytePos = 0;
    private int bitPos = 0;

    public BitBuffer(byte[] bytes) {
        this.buf = ByteBuffer.wrap(bytes);
    }

    public int getBits(int i) {
        int i2;
        Arrays.fill(this.output, (byte) 0);
        int i3 = 0;
        int i4 = 0;
        int i5 = i;
        while (i5 > 0) {
            if (i5 > 8) {
                i2 = i5 - 8;
                i5 = 8;
            } else {
                i2 = 0;
            }
            while (i5 > 0) {
                byte[] output = this.output;
                output[i4] = (byte) (output[i4] << 1);
                if ((this.buf.get(this.bytePos) & (128 >> this.bitPos)) != 0) {
                    byte[] output2 = this.output;
                    output2[i4] = (byte) (output2[i4] | 1);
                }
                this.bitPos++;
                i5--;
                i3++;
                if (this.bitPos >= 8) {
                    this.bitPos = 0;
                    this.bytePos++;
                }
                if (i3 >= 8) {
                    i4++;
                    i3 = 0;
                }
            }
            i5 = i2;
        }
        return (this.output[0] & 0xFF) | ((this.output[1] << 8) & 0xFF00) | ((this.output[2] << 16) & 0xFF0000) | ((this.output[3] << 24) & 0xFF000000);
    }

    public float getFloat() {
        return Float.intBitsToFloat(getBits(32));
    }

    public boolean isEOF() {
        return this.bytePos >= this.buf.limit();
    }
}
