package com.google.protobuf.nano;

import com.google.protobuf.nano.ExtendableMessageNano;
import java.io.IOException;

public abstract class ExtendableMessageNano<M extends ExtendableMessageNano<M>> extends MessageNano {
    protected FieldArray unknownFieldData;

    @Override
    public M clone() throws CloneNotSupportedException {
        M m = (M) super.clone();
        InternalNano.cloneUnknownFieldData(this, m);
        return m;
    }

    @Override
    protected int computeSerializedSize() {
        if (this.unknownFieldData == null) {
            return 0;
        }
        int i = 0;
        for (int j = 0; j < this.unknownFieldData.size(); j++) {
            i += this.unknownFieldData.dataAt(j).computeSerializedSize();
        }
        return i;
    }

    public final <T> T getExtension(Extension<M, T> extension) {
        FieldData fieldData;
        if (this.unknownFieldData == null || (fieldData = this.unknownFieldData.get(WireFormatNano.getTagFieldNumber(extension.tag))) == null) {
            return null;
        }
        return (T) fieldData.getValue(extension);
    }

    public final boolean hasExtension(Extension<M, ?> extension) {
        return (this.unknownFieldData == null || this.unknownFieldData.get(WireFormatNano.getTagFieldNumber(extension.tag)) == null) ? false : true;
    }

    public final <T> M setExtension(Extension<M, T> extension, T t) {
        FieldData fieldData = null;
        int tagFieldNumber = WireFormatNano.getTagFieldNumber(extension.tag);
        if (t != null) {
            if (this.unknownFieldData != null) {
                fieldData = this.unknownFieldData.get(tagFieldNumber);
            } else {
                this.unknownFieldData = new FieldArray();
            }
            if (fieldData != null) {
                fieldData.setValue(extension, t);
            } else {
                this.unknownFieldData.put(tagFieldNumber, new FieldData(extension, t));
            }
        } else if (this.unknownFieldData != null) {
            this.unknownFieldData.remove(tagFieldNumber);
            if (this.unknownFieldData.isEmpty()) {
                this.unknownFieldData = null;
            }
        }
        return (M) this;
    }

    protected final boolean storeUnknownField(CodedInputByteBufferNano codedInputByteBufferNano, int i) throws IOException {
        FieldData fieldData = null;
        int position = codedInputByteBufferNano.getPosition();
        if (!codedInputByteBufferNano.skipField(i)) {
            return false;
        }
        int tagFieldNumber = WireFormatNano.getTagFieldNumber(i);
        UnknownFieldData unknownFieldData = new UnknownFieldData(i, codedInputByteBufferNano.getData(position, codedInputByteBufferNano.getPosition() - position));
        if (this.unknownFieldData != null) {
            fieldData = this.unknownFieldData.get(tagFieldNumber);
        } else {
            this.unknownFieldData = new FieldArray();
        }
        if (fieldData == null) {
            fieldData = new FieldData();
            this.unknownFieldData.put(tagFieldNumber, fieldData);
        }
        fieldData.addUnknownField(unknownFieldData);
        return true;
    }

    @Override
    public void writeTo(CodedOutputByteBufferNano codedOutputByteBufferNano) throws IOException {
        if (this.unknownFieldData != null) {
            for (int i = 0; i < this.unknownFieldData.size(); i++) {
                this.unknownFieldData.dataAt(i).writeTo(codedOutputByteBufferNano);
            }
        }
    }
}
