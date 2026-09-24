package com.lumiyaviewer.lumiya.utils;

public class LevensteinDistance {
   public static int computeLevensteinDistance(CharSequence charSequence, CharSequence charSequence2) {
      int[][] intsList = new int[charSequence.length() + 1][charSequence2.length() + 1];
      int var2 = 0;

      while (var2 <= charSequence.length()) {
         intsList[var2][0] = var2++;
      }

      var2 = 1;

      while (var2 <= charSequence2.length()) {
         intsList[0][var2] = var2++;
      }

      for (int var11 = 1; var11 <= charSequence.length(); var11++) {
         for (int var3 = 1; var3 <= charSequence2.length(); var3++) {
            int[] ints = intsList[var11];
            int var7 = intsList[var11 - 1][var3];
            int var5 = intsList[var11][var3 - 1];
            int var6 = intsList[var11 - 1][var3 - 1];
            byte var4;
            if (charSequence.charAt(var11 - 1) == charSequence2.charAt(var3 - 1)) {
               var4 = 0;
            } else {
               var4 = 1;
            }

            ints[var3] = minimum(var7 + 1, var5 + 1, var4 + var6);
         }
      }

      return intsList[charSequence.length()][charSequence2.length()];
   }

   private static int minimum(int var0, int var1, int var2) {
      return Math.min(Math.min(var0, var1), var2);
   }
}
