package com.google.protobuf.nano;

import java.io.IOException;

public final class CodedInputByteBufferNano {
    private static final int DEFAULT_RECURSION_LIMIT = 64;
    private static final int DEFAULT_SIZE_LIMIT = 67108864;
    private final byte[] buffer;
    private int bufferPos;
    private int bufferSize;
    private int bufferSizeAfterLimit;
    private int bufferStart;
    private int lastTag;
    private int recursionDepth;
    private int currentLimit = Integer.MAX_VALUE;
    private int recursionLimit = 64;
    private int sizeLimit = 67108864;

    private CodedInputByteBufferNano(byte[] bytes, int i, int i2) {
        this.buffer = bytes;
        this.bufferStart = i;
        this.bufferSize = i + i2;
        this.bufferPos = i;
    }

    public static int decodeZigZag32(int i) {
        return (i >>> 1) ^ (-(i & 1));
    }

    public static long decodeZigZag64(long j) {
        return (j >>> 1) ^ (-(1 & j));
    }

    public static CodedInputByteBufferNano newInstance(byte[] bytes) {
        return newInstance(bytes, 0, bytes.length);
    }

    public static CodedInputByteBufferNano newInstance(byte[] bytes, int i, int i2) {
        return new CodedInputByteBufferNano(bytes, i, i2);
    }

    private void recomputeBufferSizeAfterLimit() {
        this.bufferSize += this.bufferSizeAfterLimit;
        int bufferSize = this.bufferSize;
        if (bufferSize <= this.currentLimit) {
            this.bufferSizeAfterLimit = 0;
        } else {
            this.bufferSizeAfterLimit = bufferSize - this.currentLimit;
            this.bufferSize -= this.bufferSizeAfterLimit;
        }
    }

    public void checkLastTagWas(int i) throws InvalidProtocolBufferNanoException {
        if (this.lastTag != i) {
            throw InvalidProtocolBufferNanoException.invalidEndTag();
        }
    }

    public int getBytesUntilLimit() {
        if (this.currentLimit == Integer.MAX_VALUE) {
            return -1;
        }
        return this.currentLimit - this.bufferPos;
    }

    public byte[] getData(int i, int i2) {
        if (i2 == 0) {
            return WireFormatNano.EMPTY_BYTES;
        }
        byte[] bytes = new byte[i2];
        System.arraycopy(this.buffer, this.bufferStart + i, bytes, 0, i2);
        return bytes;
    }

    public int getPosition() {
        return this.bufferPos - this.bufferStart;
    }

    public boolean isAtEnd() {
        return this.bufferPos == this.bufferSize;
    }

    public void popLimit(int currentLimit) {
        this.currentLimit = currentLimit;
        recomputeBufferSizeAfterLimit();
    }

    public int pushLimit(int i) throws InvalidProtocolBufferNanoException {
        if (i < 0) {
            throw InvalidProtocolBufferNanoException.negativeSize();
        }
        int i2 = this.bufferPos + i;
        int currentLimit = this.currentLimit;
        if (i2 > currentLimit) {
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        }
        this.currentLimit = i2;
        recomputeBufferSizeAfterLimit();
        return currentLimit;
    }

    public boolean readBool() throws IOException {
        return readRawVarint32() != 0;
    }

    public byte[] readBytes() throws IOException {
        int rawVarint32 = readRawVarint32();
        if (rawVarint32 > this.bufferSize - this.bufferPos || rawVarint32 <= 0) {
            return rawVarint32 != 0 ? readRawBytes(rawVarint32) : WireFormatNano.EMPTY_BYTES;
        }
        byte[] bytes = new byte[rawVarint32];
        System.arraycopy(this.buffer, this.bufferPos, bytes, 0, rawVarint32);
        this.bufferPos = rawVarint32 + this.bufferPos;
        return bytes;
    }

    public double readDouble() throws IOException {
        return Double.longBitsToDouble(readRawLittleEndian64());
    }

    public int readEnum() throws IOException {
        return readRawVarint32();
    }

    public int readFixed32() throws IOException {
        return readRawLittleEndian32();
    }

    public long readFixed64() throws IOException {
        return readRawLittleEndian64();
    }

    public float readFloat() throws IOException {
        return Float.intBitsToFloat(readRawLittleEndian32());
    }

    public void readGroup(MessageNano messageNano, int i) throws IOException {
        if (this.recursionDepth >= this.recursionLimit) {
            throw InvalidProtocolBufferNanoException.recursionLimitExceeded();
        }
        this.recursionDepth++;
        messageNano.mergeFrom(this);
        checkLastTagWas(WireFormatNano.makeTag(i, 4));
        this.recursionDepth--;
    }

    public int readInt32() throws IOException {
        return readRawVarint32();
    }

    public long readInt64() throws IOException {
        return readRawVarint64();
    }

    public void readMessage(MessageNano messageNano) throws IOException {
        int rawVarint32 = readRawVarint32();
        if (this.recursionDepth >= this.recursionLimit) {
            throw InvalidProtocolBufferNanoException.recursionLimitExceeded();
        }
        int pushLimit = pushLimit(rawVarint32);
        this.recursionDepth++;
        messageNano.mergeFrom(this);
        checkLastTagWas(0);
        this.recursionDepth--;
        popLimit(pushLimit);
    }

    Object readPrimitiveField(int i) throws IOException {
        switch (i) {
            case 1:
                return Double.valueOf(readDouble());
            case 2:
                return Float.valueOf(readFloat());
            case 3:
                return Long.valueOf(readInt64());
            case 4:
                return Long.valueOf(readUInt64());
            case 5:
                return Integer.valueOf(readInt32());
            case 6:
                return Long.valueOf(readFixed64());
            case 7:
                return Integer.valueOf(readFixed32());
            case 8:
                return Boolean.valueOf(readBool());
            case 9:
                return readString();
            case 10:
            case 11:
            default:
                throw new IllegalArgumentException("Unknown type " + i);
            case 12:
                return readBytes();
            case 13:
                return Integer.valueOf(readUInt32());
            case 14:
                return Integer.valueOf(readEnum());
            case 15:
                return Integer.valueOf(readSFixed32());
            case 16:
                return Long.valueOf(readSFixed64());
            case 17:
                return Integer.valueOf(readSInt32());
            case 18:
                return Long.valueOf(readSInt64());
        }
    }

    public byte readRawByte() throws IOException {
        if (this.bufferPos == this.bufferSize) {
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        }
        byte[] buffer = this.buffer;
        int bufferPos = this.bufferPos;
        this.bufferPos = bufferPos + 1;
        return buffer[bufferPos];
    }

    public byte[] readRawBytes(int i) throws IOException {
        if (i < 0) {
            throw InvalidProtocolBufferNanoException.negativeSize();
        }
        if (this.bufferPos + i > this.currentLimit) {
            skipRawBytes(this.currentLimit - this.bufferPos);
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        }
        if (i > this.bufferSize - this.bufferPos) {
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        }
        byte[] bytes = new byte[i];
        System.arraycopy(this.buffer, this.bufferPos, bytes, 0, i);
        this.bufferPos += i;
        return bytes;
    }

    public int readRawLittleEndian32() throws IOException {
        return (readRawByte() & 0xFF) | ((readRawByte() & 0xFF) << 8) | ((readRawByte() & 0xFF) << 16) | ((readRawByte() & 0xFF) << 24);
    }

    public long readRawLittleEndian64() throws IOException {
        return ((readRawByte() & 255) << 8) | (readRawByte() & 255) | ((readRawByte() & 255) << 16) | ((readRawByte() & 255) << 24) | ((readRawByte() & 255) << 32) | ((readRawByte() & 255) << 40) | ((readRawByte() & 255) << 48) | ((readRawByte() & 255) << 56);
    }

    public int readRawVarint32() throws IOException {
        byte readRawByte = readRawByte();
        if (readRawByte >= 0) {
            return readRawByte;
        }
        int i = readRawByte & 0x7F;
        byte rawByte = readRawByte();
        if (rawByte >= 0) {
            return i | (rawByte << 7);
        }
        int i2 = i | ((rawByte & 0x7F) << 7);
        byte rawByte2 = readRawByte();
        if (rawByte2 >= 0) {
            return i2 | (rawByte2 << 14);
        }
        int i3 = i2 | ((rawByte2 & 0x7F) << 14);
        byte rawByte3 = readRawByte();
        if (rawByte3 >= 0) {
            return i3 | (rawByte3 << 21);
        }
        int i4 = i3 | ((rawByte3 & 0x7F) << 21);
        byte rawByte4 = readRawByte();
        int i5 = i4 | (rawByte4 << 28);
        if (rawByte4 >= 0) {
            return i5;
        }
        for (int j = 0; j < 5; j++) {
            if (readRawByte() >= 0) {
                return i5;
            }
        }
        throw InvalidProtocolBufferNanoException.malformedVarint();
    }

    public long readRawVarint64() throws IOException {
        long j = 0;
        for (int i = 0; i < 64; i += 7) {
            byte readRawByte = readRawByte();
            j |= (long) ((readRawByte & 0x7F) << i);
            if ((readRawByte & 128) == 0) {
                return j;
            }
        }
        throw InvalidProtocolBufferNanoException.malformedVarint();
    }

    public int readSFixed32() throws IOException {
        return readRawLittleEndian32();
    }

    public long readSFixed64() throws IOException {
        return readRawLittleEndian64();
    }

    public int readSInt32() throws IOException {
        return decodeZigZag32(readRawVarint32());
    }

    public long readSInt64() throws IOException {
        return decodeZigZag64(readRawVarint64());
    }

    public String readString() throws IOException {
        int rawVarint32 = readRawVarint32();
        if (rawVarint32 > this.bufferSize - this.bufferPos || rawVarint32 <= 0) {
            return new String(readRawBytes(rawVarint32), InternalNano.UTF_8);
        }
        String str = new String(this.buffer, this.bufferPos, rawVarint32, InternalNano.UTF_8);
        this.bufferPos = rawVarint32 + this.bufferPos;
        return str;
    }

    public int readTag() throws IOException {
        if (isAtEnd()) {
            this.lastTag = 0;
            return 0;
        }
        this.lastTag = readRawVarint32();
        if (this.lastTag != 0) {
            return this.lastTag;
        }
        throw InvalidProtocolBufferNanoException.invalidTag();
    }

    public int readUInt32() throws IOException {
        return readRawVarint32();
    }

    public long readUInt64() throws IOException {
        return readRawVarint64();
    }

    public void resetSizeCounter() {
    }

    public void rewindToPosition(int i) {
        if (i > this.bufferPos - this.bufferStart) {
            throw new IllegalArgumentException("Position " + i + " is beyond current " + (this.bufferPos - this.bufferStart));
        }
        if (i < 0) {
            throw new IllegalArgumentException("Bad position " + i);
        }
        this.bufferPos = this.bufferStart + i;
    }

    public int setRecursionLimit(int recursionLimit2) {
        if (recursionLimit2 < 0) {
            throw new IllegalArgumentException("Recursion limit cannot be negative: " + recursionLimit2);
        }
        int recursionLimit = this.recursionLimit;
        this.recursionLimit = recursionLimit2;
        return recursionLimit;
    }

    public int setSizeLimit(int sizeLimit2) {
        if (sizeLimit2 < 0) {
            throw new IllegalArgumentException("Size limit cannot be negative: " + sizeLimit2);
        }
        int sizeLimit = this.sizeLimit;
        this.sizeLimit = sizeLimit2;
        return sizeLimit;
    }

    public boolean skipField(int i) throws IOException {
        switch (WireFormatNano.getTagWireType(i)) {
            case 0:
                readInt32();
                return true;
            case 1:
                readRawLittleEndian64();
                return true;
            case 2:
                skipRawBytes(readRawVarint32());
                return true;
            case 3:
                skipMessage();
                checkLastTagWas(WireFormatNano.makeTag(WireFormatNano.getTagFieldNumber(i), 4));
                return true;
            case 4:
                return false;
            case 5:
                readRawLittleEndian32();
                return true;
            default:
                throw InvalidProtocolBufferNanoException.invalidWireType();
        }
    }

    public void skipMessage() throws IOException {
        int readTag;
        do {
            readTag = readTag();
            if (readTag == 0) {
                return;
            }
        } while (skipField(readTag));
    }

    public void skipRawBytes(int i) throws IOException {
        if (i < 0) {
            throw InvalidProtocolBufferNanoException.negativeSize();
        }
        if (this.bufferPos + i > this.currentLimit) {
            skipRawBytes(this.currentLimit - this.bufferPos);
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        }
        if (i > this.bufferSize - this.bufferPos) {
            throw InvalidProtocolBufferNanoException.truncatedMessage();
        }
        this.bufferPos += i;
    }
}
