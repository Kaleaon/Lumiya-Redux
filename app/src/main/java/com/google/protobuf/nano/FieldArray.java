package com.google.protobuf.nano;

public final class FieldArray implements Cloneable {
    private static final FieldData DELETED = new FieldData();
    private FieldData[] mData;
    private int[] mFieldNumbers;
    private boolean mGarbage;
    private int mSize;

    FieldArray() {
        this(10);
    }

    FieldArray(int i) {
        this.mGarbage = false;
        int idealIntArraySize = idealIntArraySize(i);
        this.mFieldNumbers = new int[idealIntArraySize];
        this.mData = new FieldData[idealIntArraySize];
        this.mSize = 0;
    }

    private boolean arrayEquals(int[] ints, int[] ints2, int i) {
        for (int j = 0; j < i; j++) {
            if (ints[j] != ints2[j]) {
                return false;
            }
        }
        return true;
    }

    private boolean arrayEquals(FieldData[] fieldDataArr, FieldData[] fieldDatas, int i) {
        for (int j = 0; j < i; j++) {
            if (!fieldDataArr[j].equals(fieldDatas[j])) {
                return false;
            }
        }
        return true;
    }

    private int binarySearch(int i) {
        int i2 = 0;
        int i3 = this.mSize - 1;
        while (i2 <= i3) {
            int i4 = (i2 + i3) >>> 1;
            int i5 = this.mFieldNumbers[i4];
            if (i5 < i) {
                i2 = i4 + 1;
            } else {
                if (i5 <= i) {
                    return i4;
                }
                i3 = i4 - 1;
            }
        }
        return i2 ^ (-1);
    }

    private void gc() {
        int mSize = this.mSize;
        int[] mFieldNumbers = this.mFieldNumbers;
        FieldData[] fieldDataArr = this.mData;
        int i2 = 0;
        for (int j = 0; j < mSize; j++) {
            FieldData fieldData = fieldDataArr[j];
            if (fieldData != DELETED) {
                if (j != i2) {
                    mFieldNumbers[i2] = mFieldNumbers[j];
                    fieldDataArr[i2] = fieldData;
                    fieldDataArr[j] = null;
                }
                i2++;
            }
        }
        this.mGarbage = false;
        this.mSize = i2;
    }

    private int idealByteArraySize(int i) {
        for (int j = 4; j < 32; j++) {
            if (i <= (1 << j) - 12) {
                return (1 << j) - 12;
            }
        }
        return i;
    }

    private int idealIntArraySize(int i) {
        return idealByteArraySize(i * 4) / 4;
    }

    public final FieldArray clone() {
        int size = size();
        FieldArray fieldArray = new FieldArray(size);
        System.arraycopy(this.mFieldNumbers, 0, fieldArray.mFieldNumbers, 0, size);
        for (int i = 0; i < size; i++) {
            if (this.mData[i] != null) {
                fieldArray.mData[i] = this.mData[i].clone();
            }
        }
        fieldArray.mSize = size;
        return fieldArray;
    }

    FieldData dataAt(int i) {
        if (this.mGarbage) {
            gc();
        }
        return this.mData[i];
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof FieldArray)) {
            return false;
        }
        FieldArray fieldArray = (FieldArray) obj;
        if (size() == fieldArray.size()) {
            return arrayEquals(this.mFieldNumbers, fieldArray.mFieldNumbers, this.mSize) && arrayEquals(this.mData, fieldArray.mData, this.mSize);
        }
        return false;
    }

    FieldData get(int i) {
        int binarySearch = binarySearch(i);
        if (binarySearch >= 0 && this.mData[binarySearch] != DELETED) {
            return this.mData[binarySearch];
        }
        return null;
    }

    public int hashCode() {
        if (this.mGarbage) {
            gc();
        }
        int i = 17;
        for (int j = 0; j < this.mSize; j++) {
            i = (((i * 31) + this.mFieldNumbers[j]) * 31) + this.mData[j].hashCode();
        }
        return i;
    }

    public boolean isEmpty() {
        return size() == 0;
    }

    void put(int i, FieldData fieldData) {
        int binarySearch = binarySearch(i);
        if (binarySearch >= 0) {
            this.mData[binarySearch] = fieldData;
            return;
        }
        int i2 = binarySearch ^ (-1);
        if (i2 < this.mSize && this.mData[i2] == DELETED) {
            this.mFieldNumbers[i2] = i;
            this.mData[i2] = fieldData;
            return;
        }
        if (this.mGarbage && this.mSize >= this.mFieldNumbers.length) {
            gc();
            i2 = binarySearch(i) ^ (-1);
        }
        if (this.mSize >= this.mFieldNumbers.length) {
            int idealIntArraySize = idealIntArraySize(this.mSize + 1);
            int[] ints = new int[idealIntArraySize];
            FieldData[] fieldDataArr = new FieldData[idealIntArraySize];
            System.arraycopy(this.mFieldNumbers, 0, ints, 0, this.mFieldNumbers.length);
            System.arraycopy(this.mData, 0, fieldDataArr, 0, this.mData.length);
            this.mFieldNumbers = ints;
            this.mData = fieldDataArr;
        }
        if (this.mSize - i2 != 0) {
            System.arraycopy(this.mFieldNumbers, i2, this.mFieldNumbers, i2 + 1, this.mSize - i2);
            System.arraycopy(this.mData, i2, this.mData, i2 + 1, this.mSize - i2);
        }
        this.mFieldNumbers[i2] = i;
        this.mData[i2] = fieldData;
        this.mSize++;
    }

    void remove(int i) {
        int binarySearch = binarySearch(i);
        if (binarySearch >= 0 && this.mData[binarySearch] != DELETED) {
            this.mData[binarySearch] = DELETED;
            this.mGarbage = true;
        }
    }

    int size() {
        if (this.mGarbage) {
            gc();
        }
        return this.mSize;
    }
}
