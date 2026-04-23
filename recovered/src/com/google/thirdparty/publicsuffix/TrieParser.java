package com.google.thirdparty.publicsuffix;

import com.google.common.annotations.GwtCompatible;
import com.google.common.base.Joiner;
import com.google.common.collect.ImmutableMap;
import com.google.common.collect.Lists;
import java.util.List;

@GwtCompatible
/* loaded from: classes.dex */
class TrieParser {
    private static final Joiner PREFIX_JOINER = Joiner.on("");

    TrieParser() {
    }

    private static int doParseTrieToBuilder(List<CharSequence> list, CharSequence charSequence, ImmutableMap.Builder<String, PublicSuffixType> builder) {
        int i;
        int length = charSequence.length();
        char c = 0;
        int i2 = 0;
        while (i2 < length) {
            c = charSequence.charAt(i2);
            if (c == '&' || c == '?' || c == '!' || c == ':' || c == ',') {
                break;
            }
            i2++;
        }
        list.add(0, reverse(charSequence.subSequence(0, i2)));
        if (c == '!' || c == '?' || c == ':' || c == ',') {
            String join = PREFIX_JOINER.join(list);
            if (join.length() > 0) {
                builder.put(join, PublicSuffixType.fromCode(c));
            }
        }
        int i3 = i2 + 1;
        if (c != '?' && c != ',') {
            i = i3;
            while (i < length) {
                i += doParseTrieToBuilder(list, charSequence.subSequence(i, length), builder);
                if (charSequence.charAt(i) == '?' || charSequence.charAt(i) == ',') {
                    i++;
                    break;
                }
            }
        } else {
            i = i3;
        }
        list.remove(0);
        return i;
    }

    static ImmutableMap<String, PublicSuffixType> parseTrie(CharSequence charSequence) {
        ImmutableMap.Builder builder = ImmutableMap.builder();
        int length = charSequence.length();
        int i = 0;
        while (i < length) {
            i += doParseTrieToBuilder(Lists.newLinkedList(), charSequence.subSequence(i, length), builder);
        }
        return builder.build();
    }

    private static CharSequence reverse(CharSequence charSequence) {
        int length = charSequence.length();
        if (length <= 1) {
            return charSequence;
        }
        char[] cArr = new char[length];
        cArr[0] = charSequence.charAt(length - 1);
        for (int i = 1; i < length; i++) {
            cArr[i] = charSequence.charAt((length - 1) - i);
            if (Character.isSurrogatePair(cArr[i], cArr[i - 1])) {
                swap(cArr, i - 1, i);
            }
        }
        return new String(cArr);
    }

    private static void swap(char[] cArr, int i, int i2) {
        char c = cArr[i];
        cArr[i] = cArr[i2];
        cArr[i2] = c;
    }
}
