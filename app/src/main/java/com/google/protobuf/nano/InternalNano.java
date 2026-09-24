package com.google.protobuf.nano;

import com.google.protobuf.nano.MapFactories;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Map;

public final class InternalNano {
    public static final int TYPE_BOOL = 8;
    public static final int TYPE_BYTES = 12;
    public static final int TYPE_DOUBLE = 1;
    public static final int TYPE_ENUM = 14;
    public static final int TYPE_FIXED32 = 7;
    public static final int TYPE_FIXED64 = 6;
    public static final int TYPE_FLOAT = 2;
    public static final int TYPE_GROUP = 10;
    public static final int TYPE_INT32 = 5;
    public static final int TYPE_INT64 = 3;
    public static final int TYPE_MESSAGE = 11;
    public static final int TYPE_SFIXED32 = 15;
    public static final int TYPE_SFIXED64 = 16;
    public static final int TYPE_SINT32 = 17;
    public static final int TYPE_SINT64 = 18;
    public static final int TYPE_STRING = 9;
    public static final int TYPE_UINT32 = 13;
    public static final int TYPE_UINT64 = 4;
    protected static final Charset UTF_8 = Charset.forName("UTF-8");
    protected static final Charset ISO_8859_1 = Charset.forName("ISO-8859-1");
    public static final Object LAZY_INIT_LOCK = new Object();

    private InternalNano() {
    }

    public static byte[] bytesDefaultValue(String str) {
        return str.getBytes(ISO_8859_1);
    }

    public static void cloneUnknownFieldData(ExtendableMessageNano extendableMessageNano, ExtendableMessageNano extendableMessageNano2) {
        if (extendableMessageNano.unknownFieldData == null) {
            return;
        }
        extendableMessageNano2.unknownFieldData = extendableMessageNano.unknownFieldData.clone();
    }

    public static <K, V> int computeMapFieldSize(Map<K, V> map, int i, int i2, int i3) {
        int i4 = 0;
        int computeTagSize = CodedOutputByteBufferNano.computeTagSize(i);
        Iterator<Map.Entry<K, V>> it = map.entrySet().iterator();
        while (true) {
            int i5 = i4;
            if (!it.hasNext()) {
                return i5;
            }
            Map.Entry<K, V> next = it.next();
            K key = next.getKey();
            V value = next.getValue();
            if (key != null && value != null) {
                int computeFieldSize = CodedOutputByteBufferNano.computeFieldSize(2, i3, value) + CodedOutputByteBufferNano.computeFieldSize(1, i2, key);
                i4 = CodedOutputByteBufferNano.computeRawVarint32Size(computeFieldSize) + computeTagSize + computeFieldSize + i5;
            } else {
                throw new IllegalStateException("keys and values in maps cannot be null");
            }
        }
    }

    public static byte[] copyFromUtf8(String str) {
        return str.getBytes(UTF_8);
    }

    public static <K, V> boolean equals(Map<K, V> map, Map<K, V> map2) {
        if (map == map2) {
            return true;
        }
        if (map == null) {
            return map2.size() == 0;
        }
        if (map2 == null) {
            return map.size() == 0;
        }
        if (map.size() != map2.size()) {
            return false;
        }
        for (Map.Entry<K, V> entry : map.entrySet()) {
            if (!map2.containsKey(entry.getKey()) || !equalsMapValue(entry.getValue(), map2.get(entry.getKey()))) {
                return false;
            }
        }
        return true;
    }

    public static boolean equals(double[] dArr, double[] dArr2) {
        return (dArr == null || dArr.length == 0) ? dArr2 == null || dArr2.length == 0 : Arrays.equals(dArr, dArr2);
    }

    public static boolean equals(float[] floats, float[] floats2) {
        return (floats == null || floats.length == 0) ? floats2 == null || floats2.length == 0 : Arrays.equals(floats, floats2);
    }

    public static boolean equals(int[] ints, int[] ints2) {
        return (ints == null || ints.length == 0) ? ints2 == null || ints2.length == 0 : Arrays.equals(ints, ints2);
    }

    public static boolean equals(long[] longs, long[] longs2) {
        return (longs == null || longs.length == 0) ? longs2 == null || longs2.length == 0 : Arrays.equals(longs, longs2);
    }

    public static boolean equals(Object[] objArr, Object[] objArr2) {
        int length = objArr != null ? objArr.length : 0;
        int length2 = objArr2 != null ? objArr2.length : 0;
        int i = 0;
        int i2 = 0;
        while (true) {
            if (i2 < length && objArr[i2] == null) {
                i2++;
            } else {
                int i3 = i;
                while (i3 < length2 && objArr2[i3] == null) {
                    i3++;
                }
                boolean z = i2 >= length;
                boolean z2 = i3 >= length2;
                if (z && z2) {
                    return true;
                }
                if (z != z2 || !objArr[i2].equals(objArr2[i3])) {
                    return false;
                }
                i = i3 + 1;
                i2++;
            }
        }
    }

    public static boolean equals(boolean[] zArr, boolean[] zArr2) {
        return (zArr == null || zArr.length == 0) ? zArr2 == null || zArr2.length == 0 : Arrays.equals(zArr, zArr2);
    }

    public static boolean equals(byte[][] bytesList, byte[][] bytesList2) {
        int length = bytesList != null ? bytesList.length : 0;
        int length2 = bytesList2 != null ? bytesList2.length : 0;
        int i = 0;
        int i2 = 0;
        while (true) {
            if (i2 < length && bytesList[i2] == null) {
                i2++;
            } else {
                int i3 = i;
                while (i3 < length2 && bytesList2[i3] == null) {
                    i3++;
                }
                boolean z = i2 >= length;
                boolean z2 = i3 >= length2;
                if (z && z2) {
                    return true;
                }
                if (z != z2 || !Arrays.equals(bytesList[i2], bytesList2[i3])) {
                    return false;
                }
                i = i3 + 1;
                i2++;
            }
        }
    }

    private static boolean equalsMapValue(Object obj, Object obj2) {
        if (obj == null || obj2 == null) {
            throw new IllegalStateException("keys and values in maps cannot be null");
        }
        return ((obj instanceof byte[]) && (obj2 instanceof byte[])) ? Arrays.equals((byte[]) obj, (byte[]) obj2) : obj.equals(obj2);
    }

    public static <K, V> int hashCode(Map<K, V> map) {
        int i = 0;
        if (map == null) {
            return 0;
        }
        Iterator<Map.Entry<K, V>> it = map.entrySet().iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            Map.Entry<K, V> next = it.next();
            i = (hashCodeForMap(next.getValue()) ^ hashCodeForMap(next.getKey())) + i2;
        }
    }

    public static int hashCode(double[] dArr) {
        if (dArr == null || dArr.length == 0) {
            return 0;
        }
        return Arrays.hashCode(dArr);
    }

    public static int hashCode(float[] floats) {
        if (floats == null || floats.length == 0) {
            return 0;
        }
        return Arrays.hashCode(floats);
    }

    public static int hashCode(int[] ints) {
        if (ints == null || ints.length == 0) {
            return 0;
        }
        return Arrays.hashCode(ints);
    }

    public static int hashCode(long[] longs) {
        if (longs == null || longs.length == 0) {
            return 0;
        }
        return Arrays.hashCode(longs);
    }

    public static int hashCode(Object[] objArr) {
        int i = 0;
        int length = objArr != null ? objArr.length : 0;
        for (int j = 0; j < length; j++) {
            Object obj = objArr[j];
            if (obj != null) {
                i = (i * 31) + obj.hashCode();
            }
        }
        return i;
    }

    public static int hashCode(boolean[] zArr) {
        if (zArr == null || zArr.length == 0) {
            return 0;
        }
        return Arrays.hashCode(zArr);
    }

    public static int hashCode(byte[][] bytesList) {
        int i = 0;
        int length = bytesList != null ? bytesList.length : 0;
        for (int j = 0; j < length; j++) {
            byte[] bytes = bytesList[j];
            if (bytes != null) {
                i = (i * 31) + Arrays.hashCode(bytes);
            }
        }
        return i;
    }

    private static int hashCodeForMap(Object obj) {
        return !(obj instanceof byte[]) ? obj.hashCode() : Arrays.hashCode((byte[]) obj);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static final <K, V> Map<K, V> mergeMapEntry(CodedInputByteBufferNano codedInputByteBufferNano, Map<K, V> map, MapFactories.MapFactory mapFactory, int i, int i2, V v, int i3, int i4) throws IOException {
        Map<K, V> forMap = mapFactory.forMap(map);
        int pushLimit = codedInputByteBufferNano.pushLimit(codedInputByteBufferNano.readRawVarint32());
        Object obj = null;
        Object v2 = v;
        while (true) {
            int readTag = codedInputByteBufferNano.readTag();
            if (readTag == 0) {
                break;
            }
            if (readTag == i3) {
                obj = codedInputByteBufferNano.readPrimitiveField(i);
            } else if (readTag != i4) {
                if (!codedInputByteBufferNano.skipField(readTag)) {
                    break;
                }
            } else if (i2 != 11) {
                v2 = codedInputByteBufferNano.readPrimitiveField(i2);
            } else {
                codedInputByteBufferNano.readMessage((MessageNano) v2);
            }
        }
        codedInputByteBufferNano.checkLastTagWas(0);
        codedInputByteBufferNano.popLimit(pushLimit);
        if (obj == null) {
            obj = primitiveDefaultValue(i);
        }
        if (v2 == null) {
            v2 = primitiveDefaultValue(i2);
        }
        forMap.put((K) obj, (V) v2);
        return forMap;
    }

    private static Object primitiveDefaultValue(int i) {
        switch (i) {
            case 1:
                return Double.valueOf(0.0d);
            case 2:
                return Float.valueOf(0.0f);
            case 3:
            case 4:
            case 6:
            case 16:
            case 18:
                return 0L;
            case 5:
            case 7:
            case 13:
            case 14:
            case 15:
            case 17:
                return 0;
            case 8:
                return Boolean.FALSE;
            case 9:
                return "";
            case 10:
            case 11:
            default:
                throw new IllegalArgumentException("Type: " + i + " is not a primitive type.");
            case 12:
                return WireFormatNano.EMPTY_BYTES;
        }
    }

    public static <K, V> void serializeMapField(CodedOutputByteBufferNano codedOutputByteBufferNano, Map<K, V> map, int i, int i2, int i3) throws IOException {
        for (Map.Entry<K, V> entry : map.entrySet()) {
            K key = entry.getKey();
            V value = entry.getValue();
            if (key == null || value == null) {
                throw new IllegalStateException("keys and values in maps cannot be null");
            }
            int computeFieldSize = CodedOutputByteBufferNano.computeFieldSize(1, i2, key) + CodedOutputByteBufferNano.computeFieldSize(2, i3, value);
            codedOutputByteBufferNano.writeTag(i, 2);
            codedOutputByteBufferNano.writeRawVarint32(computeFieldSize);
            codedOutputByteBufferNano.writeField(1, i2, key);
            codedOutputByteBufferNano.writeField(2, i3, value);
        }
    }

    public static String stringDefaultValue(String str) {
        return new String(str.getBytes(ISO_8859_1), UTF_8);
    }
}
