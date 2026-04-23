package android.support.v4.graphics;

import android.content.Context;
import android.content.res.Resources;
import android.os.Process;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.util.Log;
import java.io.Closeable;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.ByteBuffer;

@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
/* loaded from: classes.dex */
public class TypefaceCompatUtil {
    private static final String CACHE_FILE_PREFIX = ".font";
    private static final String TAG = "TypefaceCompatUtil";

    private TypefaceCompatUtil() {
    }

    public static void closeQuietly(Closeable closeable) {
        if (closeable == null) {
            return;
        }
        try {
            closeable.close();
        } catch (IOException e) {
        }
    }

    @RequiresApi(19)
    public static ByteBuffer copyToDirectBuffer(Context context, Resources resources, int i) {
        File tempFile = getTempFile(context);
        if (tempFile == null) {
            return null;
        }
        try {
            if (copyToFile(tempFile, resources, i)) {
                return mmap(tempFile);
            }
            return null;
        } finally {
            tempFile.delete();
        }
    }

    public static boolean copyToFile(File file, Resources resources, int i) {
        InputStream inputStream = null;
        try {
            inputStream = resources.openRawResource(i);
            return copyToFile(file, inputStream);
        } finally {
            closeQuietly(inputStream);
        }
    }

    public static boolean copyToFile(File file, InputStream inputStream) {
        FileOutputStream fileOutputStream;
        try {
            try {
                fileOutputStream = new FileOutputStream(file, false);
                try {
                    byte[] bArr = new byte[1024];
                    while (true) {
                        int read = inputStream.read(bArr);
                        if (read == -1) {
                            closeQuietly(fileOutputStream);
                            return true;
                        }
                        fileOutputStream.write(bArr, 0, read);
                    }
                } catch (IOException e) {
                    e = e;
                    Log.e(TAG, "Error copying resource contents to temp file: " + e.getMessage());
                    closeQuietly(fileOutputStream);
                    return false;
                }
            } catch (Throwable th) {
                th = th;
                closeQuietly(null);
                throw th;
            }
        } catch (IOException e2) {
            e = e2;
            fileOutputStream = null;
        } catch (Throwable th2) {
            th = th2;
            closeQuietly(null);
            throw th;
        }
    }

    public static File getTempFile(Context context) {
        String str = CACHE_FILE_PREFIX + Process.myPid() + "-" + Process.myTid() + "-";
        for (int i = 0; i < 100; i++) {
            File file = new File(context.getCacheDir(), str + i);
            if (file.createNewFile()) {
                return file;
            }
        }
        return null;
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x0060 A[Catch: Throwable -> 0x0032, all -> 0x0046, TRY_ENTER, TryCatch #11 {all -> 0x0046, Throwable -> 0x0032, blocks: (B:6:0x000d, B:22:0x002e, B:24:0x003d, B:27:0x0042, B:32:0x0060, B:34:0x0063, B:37:0x0067, B:41:0x006c), top: B:5:0x000d }] */
    /* JADX WARN: Removed duplicated region for block: B:33:0x0061  */
    /* JADX WARN: Removed duplicated region for block: B:52:0x003a A[Catch: IOException -> 0x003b, TRY_ENTER, TRY_LEAVE, TryCatch #8 {IOException -> 0x003b, blocks: (B:3:0x0005, B:15:0x004b, B:17:0x004f, B:20:0x0054, B:52:0x003a, B:54:0x0072, B:57:0x0076, B:61:0x007b), top: B:2:0x0005, inners: #1, #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0070  */
    @android.support.annotation.RequiresApi(19)
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static java.nio.ByteBuffer mmap(android.content.Context r12, android.os.CancellationSignal r13, android.net.Uri r14) {
        /*
            r6 = 0
            android.content.ContentResolver r0 = r12.getContentResolver()
            java.lang.String r1 = "r"
            android.os.ParcelFileDescriptor r7 = r0.openFileDescriptor(r14, r1, r13)     // Catch: java.io.IOException -> L3b
            r8 = 0
            java.io.FileInputStream r9 = new java.io.FileInputStream     // Catch: java.lang.Throwable -> L32 java.lang.Throwable -> L46
            java.io.FileDescriptor r0 = r7.getFileDescriptor()     // Catch: java.lang.Throwable -> L32 java.lang.Throwable -> L46
            r9.<init>(r0)     // Catch: java.lang.Throwable -> L32 java.lang.Throwable -> L46
            r10 = 0
            java.nio.channels.FileChannel r0 = r9.getChannel()     // Catch: java.lang.Throwable -> L58 java.lang.Throwable -> L7f
            long r4 = r0.size()     // Catch: java.lang.Throwable -> L58 java.lang.Throwable -> L7f
            java.nio.channels.FileChannel$MapMode r1 = java.nio.channels.FileChannel.MapMode.READ_ONLY     // Catch: java.lang.Throwable -> L58 java.lang.Throwable -> L7f
            r2 = 0
            java.nio.MappedByteBuffer r0 = r0.map(r1, r2, r4)     // Catch: java.lang.Throwable -> L58 java.lang.Throwable -> L7f
            if (r9 != 0) goto L2c
        L29:
            if (r7 != 0) goto L49
        L2b:
            return r0
        L2c:
            if (r6 != 0) goto L3d
            r9.close()     // Catch: java.lang.Throwable -> L32 java.lang.Throwable -> L46
            goto L29
        L32:
            r0 = move-exception
            throw r0     // Catch: java.lang.Throwable -> L34
        L34:
            r1 = move-exception
            r11 = r1
            r1 = r0
            r0 = r11
        L38:
            if (r7 != 0) goto L70
        L3a:
            throw r0     // Catch: java.io.IOException -> L3b
        L3b:
            r0 = move-exception
            return r6
        L3d:
            r9.close()     // Catch: java.lang.Throwable -> L32 java.lang.Throwable -> L41 java.lang.Throwable -> L46
            goto L29
        L41:
            r1 = move-exception
            r10.addSuppressed(r1)     // Catch: java.lang.Throwable -> L32 java.lang.Throwable -> L46
            goto L29
        L46:
            r0 = move-exception
            r1 = r6
            goto L38
        L49:
            if (r6 != 0) goto L4f
            r7.close()     // Catch: java.io.IOException -> L3b
            goto L2b
        L4f:
            r7.close()     // Catch: java.io.IOException -> L3b java.lang.Throwable -> L53
            goto L2b
        L53:
            r1 = move-exception
            r8.addSuppressed(r1)     // Catch: java.io.IOException -> L3b
            goto L2b
        L58:
            r0 = move-exception
            throw r0     // Catch: java.lang.Throwable -> L5a
        L5a:
            r1 = move-exception
            r11 = r1
            r1 = r0
            r0 = r11
        L5e:
            if (r9 != 0) goto L61
        L60:
            throw r0     // Catch: java.lang.Throwable -> L32 java.lang.Throwable -> L46
        L61:
            if (r1 != 0) goto L67
            r9.close()     // Catch: java.lang.Throwable -> L32 java.lang.Throwable -> L46
            goto L60
        L67:
            r9.close()     // Catch: java.lang.Throwable -> L32 java.lang.Throwable -> L46 java.lang.Throwable -> L6b
            goto L60
        L6b:
            r2 = move-exception
            r1.addSuppressed(r2)     // Catch: java.lang.Throwable -> L32 java.lang.Throwable -> L46
            goto L60
        L70:
            if (r1 != 0) goto L76
            r7.close()     // Catch: java.io.IOException -> L3b
            goto L3a
        L76:
            r7.close()     // Catch: java.io.IOException -> L3b java.lang.Throwable -> L7a
            goto L3a
        L7a:
            r2 = move-exception
            r1.addSuppressed(r2)     // Catch: java.io.IOException -> L3b
            goto L3a
        L7f:
            r0 = move-exception
            r1 = r6
            goto L5e
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.graphics.TypefaceCompatUtil.mmap(android.content.Context, android.os.CancellationSignal, android.net.Uri):java.nio.ByteBuffer");
    }

    /* JADX WARN: Removed duplicated region for block: B:25:0x0033 A[Catch: IOException -> 0x0020, TRY_ENTER, TryCatch #3 {IOException -> 0x0020, blocks: (B:3:0x0001, B:11:0x001c, B:13:0x0022, B:16:0x0027, B:25:0x0033, B:27:0x0036, B:30:0x003a, B:34:0x003f), top: B:2:0x0001, inners: #2, #5 }] */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0034  */
    @android.support.annotation.RequiresApi(19)
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private static java.nio.ByteBuffer mmap(java.io.File r10) {
        /*
            r6 = 0
            java.io.FileInputStream r7 = new java.io.FileInputStream     // Catch: java.io.IOException -> L20
            r7.<init>(r10)     // Catch: java.io.IOException -> L20
            r8 = 0
            java.nio.channels.FileChannel r0 = r7.getChannel()     // Catch: java.lang.Throwable -> L2b java.lang.Throwable -> L43
            long r4 = r0.size()     // Catch: java.lang.Throwable -> L2b java.lang.Throwable -> L43
            java.nio.channels.FileChannel$MapMode r1 = java.nio.channels.FileChannel.MapMode.READ_ONLY     // Catch: java.lang.Throwable -> L2b java.lang.Throwable -> L43
            r2 = 0
            java.nio.MappedByteBuffer r0 = r0.map(r1, r2, r4)     // Catch: java.lang.Throwable -> L2b java.lang.Throwable -> L43
            if (r7 != 0) goto L1a
        L19:
            return r0
        L1a:
            if (r6 != 0) goto L22
            r7.close()     // Catch: java.io.IOException -> L20
            goto L19
        L20:
            r0 = move-exception
            return r6
        L22:
            r7.close()     // Catch: java.io.IOException -> L20 java.lang.Throwable -> L26
            goto L19
        L26:
            r1 = move-exception
            r8.addSuppressed(r1)     // Catch: java.io.IOException -> L20
            goto L19
        L2b:
            r0 = move-exception
            throw r0     // Catch: java.lang.Throwable -> L2d
        L2d:
            r1 = move-exception
            r9 = r1
            r1 = r0
            r0 = r9
        L31:
            if (r7 != 0) goto L34
        L33:
            throw r0     // Catch: java.io.IOException -> L20
        L34:
            if (r1 != 0) goto L3a
            r7.close()     // Catch: java.io.IOException -> L20
            goto L33
        L3a:
            r7.close()     // Catch: java.io.IOException -> L20 java.lang.Throwable -> L3e
            goto L33
        L3e:
            r2 = move-exception
            r1.addSuppressed(r2)     // Catch: java.io.IOException -> L20
            goto L33
        L43:
            r0 = move-exception
            r1 = r6
            goto L31
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.graphics.TypefaceCompatUtil.mmap(java.io.File):java.nio.ByteBuffer");
    }
}
