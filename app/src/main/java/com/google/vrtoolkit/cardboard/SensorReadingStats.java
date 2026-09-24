package com.google.vrtoolkit.cardboard;

class SensorReadingStats {
   private static final String TAG = SensorReadingStats.class.getSimpleName();
   private int numAxes;
   private float[][] sampleBuf;
   private int sampleBufSize;
   private int samplesAdded;
   private int writePos;

   SensorReadingStats(int var1, int var2) {
      this.sampleBufSize = var1;
      this.numAxes = var2;
      if (var1 > 0) {
         if (var2 > 0) {
            this.sampleBuf = new float[var1][var2];
         } else {
            throw new IllegalArgumentException("numAxes is invalid.");
         }
      } else {
         throw new IllegalArgumentException("sampleBufSize is invalid.");
      }
   }

   void addSample(float[] var1) {
      if (var1.length < this.numAxes) {
         throw new IllegalArgumentException("values.length is less than # of axes.");
      } else {
         this.writePos = (this.writePos + 1) % this.sampleBufSize;

         for (int var2 = 0; var2 < this.numAxes; var2++) {
            this.sampleBuf[this.writePos][var2] = var1[var2];
         }

         this.samplesAdded++;
      }
   }

   float getAverage(int var1) {
      int var3 = 0;
      if (!this.statsAvailable()) {
         throw new IllegalStateException("Average not available. Not enough samples.");
      } else if (var1 >= 0 && var1 < this.numAxes) {
         float var2;
         for (var2 = 0.0F; var3 < this.sampleBufSize; var3++) {
            var2 += this.sampleBuf[var3][var1];
         }

         return var2 / this.sampleBufSize;
      } else {
         var1 = this.numAxes;
         throw new IllegalStateException(new StringBuilder(38).append("axis must be between 0 and ").append(var1 - 1).toString());
      }
   }

   float getMaxAbsoluteDeviation() {
      float var1 = 0.0F;

      for (int var2 = 0; var2 < this.numAxes; var2++) {
         var1 = Math.max(var1, this.getMaxAbsoluteDeviation(var2));
      }

      return var1;
   }

   float getMaxAbsoluteDeviation(int var1) {
      int var4 = 0;
      if (var1 >= 0 && var1 < this.numAxes) {
         float var3 = this.getAverage(var1);

         float var2;
         for (var2 = 0.0F; var4 < this.sampleBufSize; var4++) {
            var2 = Math.max(Math.abs(this.sampleBuf[var4][var1] - var3), var2);
         }

         return var2;
      } else {
         var1 = this.numAxes;
         throw new IllegalStateException(new StringBuilder(38).append("axis must be between 0 and ").append(var1 - 1).toString());
      }
   }

   void reset() {
      this.samplesAdded = 0;
      this.writePos = 0;
   }

   boolean statsAvailable() {
      return this.samplesAdded >= this.sampleBufSize;
   }
}
