package com.google.vrtoolkit.cardboard.proto.nano;

import com.google.protobuf.nano.CodedInputByteBufferNano;
import com.google.protobuf.nano.CodedOutputByteBufferNano;
import com.google.protobuf.nano.ExtendableMessageNano;
import com.google.protobuf.nano.InternalNano;
import com.google.protobuf.nano.InvalidProtocolBufferNanoException;
import com.google.protobuf.nano.MessageNano;
import com.google.protobuf.nano.WireFormatNano;
import java.io.IOException;

public interface Phone {

    public static final class PhoneParams extends ExtendableMessageNano<PhoneParams> implements Cloneable {
        private static volatile PhoneParams[] _emptyArray;
        private int bitField0_;
        private float bottomBezelHeight_;
        public float[] dEPRECATEDGyroBias;
        private float xPpi_;
        private float yPpi_;

        public PhoneParams() {
            clear();
        }

        public static PhoneParams[] emptyArray() {
            if (_emptyArray == null) {
                synchronized (InternalNano.LAZY_INIT_LOCK) {
                    if (_emptyArray == null) {
                        _emptyArray = new PhoneParams[0];
                    }
                }
            }
            return _emptyArray;
        }

        public static PhoneParams parseFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            return new PhoneParams().mergeFrom(codedInputByteBufferNano);
        }

        public static PhoneParams parseFrom(byte[] bytes) throws InvalidProtocolBufferNanoException {
            return (PhoneParams) MessageNano.mergeFrom(new PhoneParams(), bytes);
        }

        public final PhoneParams clear() {
            this.bitField0_ = 0;
            this.xPpi_ = 0.0f;
            this.yPpi_ = 0.0f;
            this.bottomBezelHeight_ = 0.0f;
            this.dEPRECATEDGyroBias = WireFormatNano.EMPTY_FLOAT_ARRAY;
            this.unknownFieldData = null;
            this.cachedSize = -1;
            return this;
        }

        public final PhoneParams clearBottomBezelHeight() {
            this.bottomBezelHeight_ = 0.0f;
            this.bitField0_ &= -5;
            return this;
        }

        public final PhoneParams clearXPpi() {
            this.xPpi_ = 0.0f;
            this.bitField0_ &= -2;
            return this;
        }

        public final PhoneParams clearYPpi() {
            this.yPpi_ = 0.0f;
            this.bitField0_ &= -3;
            return this;
        }

        @Override
        public final PhoneParams clone() {
            try {
                PhoneParams phoneParams = (PhoneParams) super.clone();
                if (this.dEPRECATEDGyroBias != null && this.dEPRECATEDGyroBias.length > 0) {
                    phoneParams.dEPRECATEDGyroBias = (float[]) this.dEPRECATEDGyroBias.clone();
                }
                return phoneParams;
            } catch (CloneNotSupportedException e) {
                throw new AssertionError(e);
            }
        }

        @Override
        protected final int computeSerializedSize() {
            int computeSerializedSize = super.computeSerializedSize();
            if ((this.bitField0_ & 1) != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeFloatSize(1, this.xPpi_);
            }
            if ((this.bitField0_ & 2) != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeFloatSize(2, this.yPpi_);
            }
            if ((this.bitField0_ & 4) != 0) {
                computeSerializedSize += CodedOutputByteBufferNano.computeFloatSize(3, this.bottomBezelHeight_);
            }
            if (this.dEPRECATEDGyroBias == null || this.dEPRECATEDGyroBias.length <= 0) {
                return computeSerializedSize;
            }
            int length = this.dEPRECATEDGyroBias.length * 4;
            return computeSerializedSize + length + 1 + CodedOutputByteBufferNano.computeRawVarint32Size(length);
        }

        public final float getBottomBezelHeight() {
            return this.bottomBezelHeight_;
        }

        public final float getXPpi() {
            return this.xPpi_;
        }

        public final float getYPpi() {
            return this.yPpi_;
        }

        public final boolean hasBottomBezelHeight() {
            return (this.bitField0_ & 4) != 0;
        }

        public final boolean hasXPpi() {
            return (this.bitField0_ & 1) != 0;
        }

        public final boolean hasYPpi() {
            return (this.bitField0_ & 2) != 0;
        }

        @Override
        public final PhoneParams mergeFrom(CodedInputByteBufferNano codedInputByteBufferNano) throws IOException {
            while (true) {
                int readTag = codedInputByteBufferNano.readTag();
                switch (readTag) {
                    case 0:
                        return this;
                    case 13:
                        this.xPpi_ = codedInputByteBufferNano.readFloat();
                        this.bitField0_ |= 1;
                        break;
                    case 21:
                        this.yPpi_ = codedInputByteBufferNano.readFloat();
                        this.bitField0_ |= 2;
                        break;
                    case 29:
                        this.bottomBezelHeight_ = codedInputByteBufferNano.readFloat();
                        this.bitField0_ |= 4;
                        break;
                    case 34:
                        int rawVarint32 = codedInputByteBufferNano.readRawVarint32();
                        int pushLimit = codedInputByteBufferNano.pushLimit(rawVarint32);
                        int i = rawVarint32 / 4;
                        int length = this.dEPRECATEDGyroBias != null ? this.dEPRECATEDGyroBias.length : 0;
                        float[] floats = new float[i + length];
                        if (length != 0) {
                            System.arraycopy(this.dEPRECATEDGyroBias, 0, floats, 0, length);
                        }
                        while (length < floats.length) {
                            floats[length] = codedInputByteBufferNano.readFloat();
                            length++;
                        }
                        this.dEPRECATEDGyroBias = floats;
                        codedInputByteBufferNano.popLimit(pushLimit);
                        break;
                    case 37:
                        int repeatedFieldArrayLength = WireFormatNano.getRepeatedFieldArrayLength(codedInputByteBufferNano, 37);
                        int length2 = this.dEPRECATEDGyroBias != null ? this.dEPRECATEDGyroBias.length : 0;
                        float[] floats2 = new float[repeatedFieldArrayLength + length2];
                        if (length2 != 0) {
                            System.arraycopy(this.dEPRECATEDGyroBias, 0, floats2, 0, length2);
                        }
                        while (length2 < floats2.length - 1) {
                            floats2[length2] = codedInputByteBufferNano.readFloat();
                            codedInputByteBufferNano.readTag();
                            length2++;
                        }
                        floats2[length2] = codedInputByteBufferNano.readFloat();
                        this.dEPRECATEDGyroBias = floats2;
                        break;
                    default:
                        if (!super.storeUnknownField(codedInputByteBufferNano, readTag)) {
                            return this;
                        }
                        break;
                }
            }
        }

        public final PhoneParams setBottomBezelHeight(float bottomBezelHeight) {
            this.bottomBezelHeight_ = bottomBezelHeight;
            this.bitField0_ |= 4;
            return this;
        }

        public final PhoneParams setXPpi(float xPpi) {
            this.xPpi_ = xPpi;
            this.bitField0_ |= 1;
            return this;
        }

        public final PhoneParams setYPpi(float yPpi) {
            this.yPpi_ = yPpi;
            this.bitField0_ |= 2;
            return this;
        }

        @Override
        public final void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
            if ((this.bitField0_ & 1) != 0) {
                codedOutputByteBufferNano.writeFloat(1, this.xPpi_);
            }
            if ((this.bitField0_ & 2) != 0) {
                codedOutputByteBufferNano.writeFloat(2, this.yPpi_);
            }
            if ((this.bitField0_ & 4) != 0) {
                codedOutputByteBufferNano.writeFloat(3, this.bottomBezelHeight_);
            }
            if (this.dEPRECATEDGyroBias != null && this.dEPRECATEDGyroBias.length > 0) {
                int length = this.dEPRECATEDGyroBias.length * 4;
                codedOutputByteBufferNano.writeRawVarint32(34);
                codedOutputByteBufferNano.writeRawVarint32(length);
                for (int i = 0; i < this.dEPRECATEDGyroBias.length; i++) {
                    codedOutputByteBufferNano.writeFloatNoTag(this.dEPRECATEDGyroBias[i]);
                }
            }
            super.writeTo(codedOutputByteBufferNano);
        }
    }
}
