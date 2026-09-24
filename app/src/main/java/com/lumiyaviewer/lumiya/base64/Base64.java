package com.lumiyaviewer.lumiya.base64;

import java.util.Arrays;

public class Base64 {
    private static final char[] CA = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/".toCharArray();
    private static final int[] IA = new int[256];

    static {
        Arrays.fill(IA, -1);
        int length = CA.length;
        for (int i = 0; i < length; i++) {
            IA[CA[i]] = i;
        }
        IA[61] = 0;
    }

    public static final byte[] decode(String str) {
        int length = str == null ? 0 : str.length();
        if (length == 0) {
            return new byte[0];
        }
        int i = 0;
        for (int j = 0; j < length; j++) {
            if (IA[str.charAt(j)] < 0) {
                i++;
            }
        }
        if ((length - i) % 4 != 0) {
            return null;
        }
        int length2 = length;
        int i4 = 0;
        while (length2 > 1) {
            length2--;
            if (IA[str.charAt(length2)] > 0) {
                break;
            }
            if (str.charAt(length2) == '=') {
                i4++;
            }
        }
        int i5 = (((length - i) * 6) >> 3) - i4;
        byte[] bytes = new byte[i5];
        int i6 = 0;
        int i7 = 0;
        while (i6 < i5) {
            int i8 = 0;
            int i9 = i7;
            int i10 = 0;
            while (i10 < 4) {
                int i11 = i9 + 1;
                int i12 = IA[str.charAt(i9)];
                if (i12 < 0) {
                    i10--;
                } else {
                    i8 |= i12 << (18 - (i10 * 6));
                }
                i10++;
                i9 = i11;
            }
            int i13 = i6 + 1;
            bytes[i6] = (byte) (i8 >> 16);
            if (i13 < i5) {
                int i14 = i13 + 1;
                bytes[i13] = (byte) (i8 >> 8);
                if (i14 >= i5) {
                    i13 = i14;
                } else {
                    i13 = i14 + 1;
                    bytes[i14] = (byte) i8;
                }
            }
            i6 = i13;
            i7 = i9;
        }
        return bytes;
    }

    public static final byte[] decode(byte[] bytes2) {
        int length = bytes2.length;
        int i = 0;
        for (byte b : bytes2) {
            if (IA[b & 0xFF] < 0) {
                i++;
            }
        }
        if ((length - i) % 4 != 0) {
            return null;
        }
        int length2 = length;
        int i3 = 0;
        while (length2 > 1) {
            length2--;
            if (IA[bytes2[length2] & 0xFF] > 0) {
                break;
            }
            if (bytes2[length2] == 61) {
                i3++;
            }
        }
        int i4 = (((length - i) * 6) >> 3) - i3;
        byte[] bytes = new byte[i4];
        int i5 = 0;
        int i6 = 0;
        while (i5 < i4) {
            int i7 = 0;
            int i8 = i6;
            int i9 = 0;
            while (i9 < 4) {
                int i10 = i8 + 1;
                int i11 = IA[bytes2[i8] & 0xFF];
                if (i11 < 0) {
                    i9--;
                } else {
                    i7 |= i11 << (18 - (i9 * 6));
                }
                i9++;
                i8 = i10;
            }
            int i12 = i5 + 1;
            bytes[i5] = (byte) (i7 >> 16);
            if (i12 < i4) {
                int i13 = i12 + 1;
                bytes[i12] = (byte) (i7 >> 8);
                if (i13 >= i4) {
                    i12 = i13;
                } else {
                    i12 = i13 + 1;
                    bytes[i13] = (byte) i7;
                }
            }
            i5 = i12;
            i6 = i8;
        }
        return bytes;
    }

    public static final byte[] decode(char[] chars) {
        int length = chars == null ? 0 : chars.length;
        if (length == 0) {
            return new byte[0];
        }
        int i = 0;
        for (int j = 0; j < length; j++) {
            if (IA[chars[j]] < 0) {
                i++;
            }
        }
        if ((length - i) % 4 != 0) {
            return null;
        }
        int length2 = length;
        int i4 = 0;
        while (length2 > 1) {
            length2--;
            if (IA[chars[length2]] > 0) {
                break;
            }
            if (chars[length2] == '=') {
                i4++;
            }
        }
        int i5 = (((length - i) * 6) >> 3) - i4;
        byte[] bytes = new byte[i5];
        int i6 = 0;
        int i7 = 0;
        while (i6 < i5) {
            int i8 = 0;
            int i9 = i7;
            int i10 = 0;
            while (i10 < 4) {
                int i11 = i9 + 1;
                int i12 = IA[chars[i9]];
                if (i12 < 0) {
                    i10--;
                } else {
                    i8 |= i12 << (18 - (i10 * 6));
                }
                i10++;
                i9 = i11;
            }
            int i13 = i6 + 1;
            bytes[i6] = (byte) (i8 >> 16);
            if (i13 < i5) {
                int i14 = i13 + 1;
                bytes[i13] = (byte) (i8 >> 8);
                if (i14 >= i5) {
                    i13 = i14;
                } else {
                    i13 = i14 + 1;
                    bytes[i14] = (byte) i8;
                }
            }
            i6 = i13;
            i7 = i9;
        }
        return bytes;
    }

    public static final byte[] decodeFast(String str) {
        int i = 0;
        int length = str.length();
        if (length == 0) {
            return new byte[0];
        }
        int i2 = length - 1;
        int i3 = 0;
        while (i3 < i2 && IA[str.charAt(i3) & 255] < 0) {
            i3++;
        }
        int i4 = i2;
        while (i4 > 0 && IA[str.charAt(i4) & 255] < 0) {
            i4--;
        }
        int i5 = str.charAt(i4) != '=' ? 0 : str.charAt(i4 + (-1)) != '=' ? 1 : 2;
        int i6 = (i4 - i3) + 1;
        int i7 = length <= 76 ? 0 : (str.charAt(76) != '\r' ? 0 : i6 / 78) << 1;
        int i8 = (((i6 - i7) * 6) >> 3) - i5;
        byte[] bytes = new byte[i8];
        int i9 = (i8 / 3) * 3;
        int i10 = 0;
        int i11 = 0;
        while (i11 < i9) {
            int i12 = i3 + 1;
            int i13 = i12 + 1;
            int i14 = (IA[str.charAt(i3)] << 18) | (IA[str.charAt(i12)] << 12);
            int i15 = i13 + 1;
            int i16 = (IA[str.charAt(i13)] << 6) | i14;
            i3 = i15 + 1;
            int i17 = i16 | IA[str.charAt(i15)];
            int i18 = i11 + 1;
            bytes[i11] = (byte) (i17 >> 16);
            int i19 = i18 + 1;
            bytes[i18] = (byte) (i17 >> 8);
            i11 = i19 + 1;
            bytes[i19] = (byte) i17;
            if (i7 > 0 && (i10 = i10 + 1) == 19) {
                i3 += 2;
                i10 = 0;
            }
        }
        if (i11 < i8) {
            int i20 = 0;
            while (true) {
                int i21 = i3;
                if (i21 > i4 - i5) {
                    break;
                }
                i3 = i21 + 1;
                int i22 = (IA[str.charAt(i21)] << (18 - (i * 6))) | i20;
                i++;
                i20 = i22;
            }
            int i23 = 16;
            for (int j = i11; j < i8; j++) {
                bytes[j] = (byte) (i20 >> i23);
                i23 -= 8;
            }
        }
        return bytes;
    }

    public static final byte[] decodeFast(byte[] bytes2) {
        int i = 0;
        int length = bytes2.length;
        if (length == 0) {
            return new byte[0];
        }
        int i2 = length - 1;
        int i3 = 0;
        while (i3 < i2 && IA[bytes2[i3] & 0xFF] < 0) {
            i3++;
        }
        int i4 = i2;
        while (i4 > 0 && IA[bytes2[i4] & 0xFF] < 0) {
            i4--;
        }
        int i5 = bytes2[i4] != 61 ? 0 : bytes2[i4 + (-1)] != 61 ? 1 : 2;
        int i6 = (i4 - i3) + 1;
        int i7 = length <= 76 ? 0 : (bytes2[76] != 13 ? 0 : i6 / 78) << 1;
        int i8 = (((i6 - i7) * 6) >> 3) - i5;
        byte[] bytes = new byte[i8];
        int i9 = (i8 / 3) * 3;
        int i10 = 0;
        int i11 = 0;
        while (i11 < i9) {
            int i12 = i3 + 1;
            int i13 = i12 + 1;
            int i14 = (IA[bytes2[i3]] << 18) | (IA[bytes2[i12]] << 12);
            int i15 = i13 + 1;
            int i16 = (IA[bytes2[i13]] << 6) | i14;
            i3 = i15 + 1;
            int i17 = i16 | IA[bytes2[i15]];
            int i18 = i11 + 1;
            bytes[i11] = (byte) (i17 >> 16);
            int i19 = i18 + 1;
            bytes[i18] = (byte) (i17 >> 8);
            i11 = i19 + 1;
            bytes[i19] = (byte) i17;
            if (i7 > 0 && (i10 = i10 + 1) == 19) {
                i3 += 2;
                i10 = 0;
            }
        }
        if (i11 < i8) {
            int i20 = 0;
            while (true) {
                int i21 = i3;
                if (i21 > i4 - i5) {
                    break;
                }
                i3 = i21 + 1;
                int i22 = (IA[bytes2[i21]] << (18 - (i * 6))) | i20;
                i++;
                i20 = i22;
            }
            int i23 = 16;
            for (int j = i11; j < i8; j++) {
                bytes[j] = (byte) (i20 >> i23);
                i23 -= 8;
            }
        }
        return bytes;
    }

    public static final byte[] decodeFast(char[] chars) {
        int i = 0;
        int length = chars.length;
        if (length == 0) {
            return new byte[0];
        }
        int i2 = length - 1;
        int i3 = 0;
        while (i3 < i2 && IA[chars[i3]] < 0) {
            i3++;
        }
        int i4 = i2;
        while (i4 > 0 && IA[chars[i4]] < 0) {
            i4--;
        }
        int i5 = chars[i4] != '=' ? 0 : chars[i4 + (-1)] != '=' ? 1 : 2;
        int i6 = (i4 - i3) + 1;
        int i7 = length <= 76 ? 0 : (chars[76] != '\r' ? 0 : i6 / 78) << 1;
        int i8 = (((i6 - i7) * 6) >> 3) - i5;
        byte[] bytes = new byte[i8];
        int i9 = (i8 / 3) * 3;
        int i10 = 0;
        int i11 = 0;
        while (i11 < i9) {
            int i12 = i3 + 1;
            int i13 = i12 + 1;
            int i14 = (IA[chars[i3]] << 18) | (IA[chars[i12]] << 12);
            int i15 = i13 + 1;
            int i16 = (IA[chars[i13]] << 6) | i14;
            i3 = i15 + 1;
            int i17 = i16 | IA[chars[i15]];
            int i18 = i11 + 1;
            bytes[i11] = (byte) (i17 >> 16);
            int i19 = i18 + 1;
            bytes[i18] = (byte) (i17 >> 8);
            i11 = i19 + 1;
            bytes[i19] = (byte) i17;
            if (i7 > 0 && (i10 = i10 + 1) == 19) {
                i3 += 2;
                i10 = 0;
            }
        }
        if (i11 < i8) {
            int i20 = 0;
            while (true) {
                int i21 = i3;
                if (i21 > i4 - i5) {
                    break;
                }
                i3 = i21 + 1;
                int i22 = (IA[chars[i21]] << (18 - (i * 6))) | i20;
                i++;
                i20 = i22;
            }
            int i23 = 16;
            for (int j = i11; j < i8; j++) {
                bytes[j] = (byte) (i20 >> i23);
                i23 -= 8;
            }
        }
        return bytes;
    }

    public static final byte[] encodeToByte(byte[] bytes2, boolean z) {
        int length = bytes2 == null ? 0 : bytes2.length;
        if (length == 0) {
            return new byte[0];
        }
        int i = (length / 3) * 3;
        int i2 = (((length - 1) / 3) + 1) << 2;
        int i3 = i2 + (!z ? 0 : ((i2 - 1) / 76) << 1);
        byte[] bytes = new byte[i3];
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        while (i6 < i) {
            int i7 = i6 + 1;
            int i8 = i7 + 1;
            int i9 = ((bytes2[i7] & 0xFF) << 8) | ((bytes2[i6] & 0xFF) << 16);
            i6 = i8 + 1;
            int i10 = i9 | (bytes2[i8] & 0xFF);
            int i11 = i5 + 1;
            bytes[i5] = (byte) CA[(i10 >>> 18) & 63];
            int i12 = i11 + 1;
            bytes[i11] = (byte) CA[(i10 >>> 12) & 63];
            int i13 = i12 + 1;
            bytes[i12] = (byte) CA[(i10 >>> 6) & 63];
            i5 = i13 + 1;
            bytes[i13] = (byte) CA[i10 & 63];
            if (z && (i4 = i4 + 1) == 19 && i5 < i3 - 2) {
                int i14 = i5 + 1;
                bytes[i5] = (byte) '\r';
                bytes[i14] = 10;
                i5 = i14 + 1;
                i4 = 0;
            }
        }
        int i15 = length - i;
        if (i15 > 0) {
            int i16 = ((bytes2[i] & 0xFF) << 10) | (i15 == 2 ? (bytes2[length - 1] & 0xFF) << 2 : 0);
            bytes[i3 - 4] = (byte) CA[i16 >> 12];
            bytes[i3 - 3] = (byte) CA[(i16 >>> 6) & 63];
            bytes[i3 - 2] = i15 != 2 ? (byte) 61 : (byte) CA[i16 & 63];
            bytes[i3 - 1] = 61;
        }
        return bytes;
    }

    public static final char[] encodeToChar(byte[] bytes, boolean z) {
        int length = bytes == null ? 0 : bytes.length;
        if (length == 0) {
            return new char[0];
        }
        int i = (length / 3) * 3;
        int i2 = (((length - 1) / 3) + 1) << 2;
        int i3 = i2 + (!z ? 0 : ((i2 - 1) / 76) << 1);
        char[] chars = new char[i3];
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        while (i6 < i) {
            int i7 = i6 + 1;
            int i8 = i7 + 1;
            int i9 = ((bytes[i7] & 0xFF) << 8) | ((bytes[i6] & 0xFF) << 16);
            i6 = i8 + 1;
            int i10 = i9 | (bytes[i8] & 0xFF);
            int i11 = i5 + 1;
            chars[i5] = CA[(i10 >>> 18) & 63];
            int i12 = i11 + 1;
            chars[i11] = CA[(i10 >>> 12) & 63];
            int i13 = i12 + 1;
            chars[i12] = CA[(i10 >>> 6) & 63];
            i5 = i13 + 1;
            chars[i13] = CA[i10 & 63];
            if (z && (i4 = i4 + 1) == 19 && i5 < i3 - 2) {
                int i14 = i5 + 1;
                chars[i5] = '\r';
                chars[i14] = '\n';
                i5 = i14 + 1;
                i4 = 0;
            }
        }
        int i15 = length - i;
        if (i15 > 0) {
            int i16 = ((bytes[i] & 0xFF) << 10) | (i15 == 2 ? (bytes[length - 1] & 0xFF) << 2 : 0);
            chars[i3 - 4] = CA[i16 >> 12];
            chars[i3 - 3] = CA[(i16 >>> 6) & 63];
            chars[i3 - 2] = i15 != 2 ? '=' : CA[i16 & 63];
            chars[i3 - 1] = '=';
        }
        return chars;
    }

    public static final String encodeToString(byte[] bytes, boolean z) {
        return new String(encodeToChar(bytes, z));
    }
}
