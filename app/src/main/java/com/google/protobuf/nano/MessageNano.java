package com.google.protobuf.nano;

import java.io.IOException;
import java.util.Arrays;

public abstract class MessageNano {
    protected volatile int cachedSize = -1;

    public static final <T extends MessageNano> T mergeFrom(T t, byte[] bytes) throws InvalidProtocolBufferNanoException {
        return (T) mergeFrom(t, bytes, 0, bytes.length);
    }

    public static final <T extends MessageNano> T mergeFrom(T t, byte[] bytes, int i, int i2) throws InvalidProtocolBufferNanoException {
        try {
            CodedInputByteBufferNano newInstance = CodedInputByteBufferNano.newInstance(bytes, i, i2);
            t.mergeFrom(newInstance);
            newInstance.checkLastTagWas(0);
            return t;
        } catch (InvalidProtocolBufferNanoException e) {
            throw e;
        } catch (IOException e2) {
            throw new RuntimeException("Reading from a byte array threw an IOException (should never happen).");
        }
    }

    public static final boolean messageNanoEquals(MessageNano messageNano, MessageNano messageNano2) {
        int serializedSize;
        if (messageNano == messageNano2) {
            return true;
        }
        if (messageNano == null || messageNano2 == null || messageNano.getClass() != messageNano2.getClass() || messageNano2.getSerializedSize() != (serializedSize = messageNano.getSerializedSize())) {
            return false;
        }
        byte[] bytes = new byte[serializedSize];
        byte[] bytes2 = new byte[serializedSize];
        toByteArray(messageNano, bytes, 0, serializedSize);
        toByteArray(messageNano2, bytes2, 0, serializedSize);
        return Arrays.equals(bytes, bytes2);
    }

    public static final void toByteArray(MessageNano messageNano, byte[] bytes, int i, int i2) {
        try {
            CodedOutputByteBufferNano newInstance = CodedOutputByteBufferNano.newInstance(bytes, i, i2);
            messageNano.writeTo(newInstance);
            newInstance.checkNoSpaceLeft();
        } catch (IOException e) {
            throw new RuntimeException("Serializing to a byte array threw an IOException (should never happen).", e);
        }
    }

    public static final byte[] toByteArray(MessageNano messageNano) {
        byte[] bytes = new byte[messageNano.getSerializedSize()];
        toByteArray(messageNano, bytes, 0, bytes.length);
        return bytes;
    }

    public MessageNano clone() throws CloneNotSupportedException {
        return (MessageNano) super.clone();
    }

    protected int computeSerializedSize() {
        return 0;
    }

    public int getCachedSize() {
        if (this.cachedSize < 0) {
            getSerializedSize();
        }
        return this.cachedSize;
    }

    public int getSerializedSize() {
        int computeSerializedSize = computeSerializedSize();
        this.cachedSize = computeSerializedSize;
        return computeSerializedSize;
    }

    public abstract MessageNano mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException;

    public String toString() {
        return MessageNanoPrinter.print(this);
    }

    public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
    }
}
