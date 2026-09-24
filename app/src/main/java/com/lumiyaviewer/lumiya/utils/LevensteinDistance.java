package com.lumiyaviewer.lumiya.utils;

public class LevensteinDistance {
   public static int computeLevensteinDistance(CharSequence var0, CharSequence var1) {
      int[][] var8 = new int[var0.length() + 1][var1.length() + 1];
      int var2 = 0;

      while (var2 <= var0.length()) {
         var8[var2][0] = var2++;
      }

      var2 = 1;

      while (var2 <= var1.length()) {
         var8[0][var2] = var2++;
      }

      for (int var11 = 1; var11 <= var0.length(); var11++) {
         for (int var3 = 1; var3 <= var1.length(); var3++) {
            int[] var9 = var8[var11];
            int var7 = var8[var11 - 1][var3];
            int var5 = var8[var11][var3 - 1];
            int var6 = var8[var11 - 1][var3 - 1];
            byte var4;
            if (var0.charAt(var11 - 1) == var1.charAt(var3 - 1)) {
               var4 = 0;
            } else {
               var4 = 1;
            }

            var9[var3] = minimum(var7 + 1, var5 + 1, var4 + var6);
         }
      }

      return var8[var0.length()][var1.length()];
   }

   private static int minimum(int var0, int var1, int var2) {
      return Math.min(Math.min(var0, var1), var2);
   }
}
