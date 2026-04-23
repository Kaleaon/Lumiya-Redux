package android.support.v7.app;

/* loaded from: classes.dex */
class TwilightCalculator {
    private static final float ALTIDUTE_CORRECTION_CIVIL_TWILIGHT = -0.10471976f;
    private static final float C1 = 0.0334196f;
    private static final float C2 = 3.49066E-4f;
    private static final float C3 = 5.236E-6f;
    public static final int DAY = 0;
    private static final float DEGREES_TO_RADIANS = 0.017453292f;
    private static final float J0 = 9.0E-4f;
    public static final int NIGHT = 1;
    private static final float OBLIQUITY = 0.4092797f;
    private static final long UTC_2000 = 946728000000L;
    private static TwilightCalculator sInstance;
    public int state;
    public long sunrise;
    public long sunset;

    TwilightCalculator() {
    }

    static TwilightCalculator getInstance() {
        if (sInstance == null) {
            sInstance = new TwilightCalculator();
        }
        return sInstance;
    }

    public void calculateTwilight(long j, double d, double d2) {
        float f = (0.01720197f * ((j - UTC_2000) / 8.64E7f)) + 6.24006f;
        double sin = f + (Math.sin(f) * 0.03341960161924362d) + (Math.sin(2.0f * f) * 3.4906598739326E-4d) + (Math.sin(3.0f * f) * 5.236000106378924E-6d) + 1.796593063d + 3.141592653589793d;
        double sin2 = (Math.sin(f) * 0.0053d) + ((-d2) / 360.0d) + Math.round((r2 - J0) - r6) + J0 + (Math.sin(2.0d * sin) * (-0.0069d));
        double asin = Math.asin(Math.sin(sin) * Math.sin(0.4092797040939331d));
        double d3 = 0.01745329238474369d * d;
        double sin3 = (Math.sin(-0.10471975803375244d) - (Math.sin(d3) * Math.sin(asin))) / (Math.cos(asin) * Math.cos(d3));
        if (sin3 >= 1.0d) {
            this.state = 1;
            this.sunset = -1L;
            this.sunrise = -1L;
        } else {
            if (sin3 <= -1.0d) {
                this.state = 0;
                this.sunset = -1L;
                this.sunrise = -1L;
                return;
            }
            float acos = (float) (Math.acos(sin3) / 6.283185307179586d);
            this.sunset = Math.round((acos + sin2) * 8.64E7d) + UTC_2000;
            this.sunrise = Math.round((sin2 - acos) * 8.64E7d) + UTC_2000;
            if (!(this.sunrise >= j)) {
                if (!(this.sunset <= j)) {
                    this.state = 0;
                    return;
                }
            }
            this.state = 1;
        }
    }
}
