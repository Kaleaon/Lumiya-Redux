package uk.co.senab.photoview.log;

import android.util.Log;

public class LoggerDefault implements Logger {
    @Override
    public int d(String str, String str2) {
        return Log.d(str, str2);
    }

    @Override
    public int d(String str, String str2, Throwable th) {
        return Log.d(str, str2, th);
    }

    @Override
    public int e(String str, String str2) {
        return Log.e(str, str2);
    }

    @Override
    public int e(String str, String str2, Throwable th) {
        return Log.e(str, str2, th);
    }

    @Override
    public int i(String str, String str2) {
        return Log.i(str, str2);
    }

    @Override
    public int i(String str, String str2, Throwable th) {
        return Log.i(str, str2, th);
    }

    @Override
    public int v(String str, String str2) {
        return Log.v(str, str2);
    }

    @Override
    public int v(String str, String str2, Throwable th) {
        return Log.v(str, str2, th);
    }

    @Override
    public int w(String str, String str2) {
        return Log.w(str, str2);
    }

    @Override
    public int w(String str, String str2, Throwable th) {
        return Log.w(str, str2, th);
    }
}
