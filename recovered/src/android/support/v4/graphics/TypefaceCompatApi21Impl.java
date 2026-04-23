package android.support.v4.graphics;

import android.os.ParcelFileDescriptor;
import android.support.annotation.RequiresApi;
import android.support.annotation.RestrictTo;
import android.system.ErrnoException;
import android.system.Os;
import android.system.OsConstants;
import java.io.File;

@RequiresApi(21)
@RestrictTo({RestrictTo.Scope.LIBRARY_GROUP})
/* loaded from: classes.dex */
class TypefaceCompatApi21Impl extends TypefaceCompatBaseImpl {
    private static final String TAG = "TypefaceCompatApi21Impl";

    TypefaceCompatApi21Impl() {
    }

    private File getFile(ParcelFileDescriptor parcelFileDescriptor) {
        try {
            String readlink = Os.readlink("/proc/self/fd/" + parcelFileDescriptor.getFd());
            if (OsConstants.S_ISREG(Os.stat(readlink).st_mode)) {
                return new File(readlink);
            }
            return null;
        } catch (ErrnoException e) {
            return null;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:40:0x0072  */
    /* JADX WARN: Removed duplicated region for block: B:64:0x004e A[Catch: IOException -> 0x004f, TRY_ENTER, TRY_LEAVE, TryCatch #7 {IOException -> 0x004f, blocks: (B:5:0x000d, B:19:0x005f, B:21:0x0063, B:24:0x0068, B:55:0x0083, B:57:0x0087, B:60:0x008c, B:64:0x004e, B:66:0x0092, B:69:0x0096, B:73:0x009b), top: B:4:0x000d, inners: #0, #1, #8 }] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x0090  */
    @Override // android.support.v4.graphics.TypefaceCompatBaseImpl, android.support.v4.graphics.TypefaceCompat.TypefaceCompatImpl
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public android.graphics.Typeface createFromFontInfo(android.content.Context r8, android.os.CancellationSignal r9, @android.support.annotation.NonNull android.support.v4.provider.FontsContractCompat.FontInfo[] r10, int r11) {
        /*
            r7 = this;
            r2 = 0
            int r0 = r10.length
            r1 = 1
            if (r0 < r1) goto L32
            android.support.v4.provider.FontsContractCompat$FontInfo r0 = r7.findBestInfo(r10, r11)
            android.content.ContentResolver r1 = r8.getContentResolver()
            android.net.Uri r0 = r0.getUri()     // Catch: java.io.IOException -> L4f
            java.lang.String r3 = "r"
            android.os.ParcelFileDescriptor r3 = r1.openFileDescriptor(r0, r3, r9)     // Catch: java.io.IOException -> L4f
            r0 = 0
            java.io.File r1 = r7.getFile(r3)     // Catch: java.lang.Throwable -> L46 java.lang.Throwable -> L5a
            if (r1 != 0) goto L33
        L1f:
            java.io.FileInputStream r4 = new java.io.FileInputStream     // Catch: java.lang.Throwable -> L46 java.lang.Throwable -> L5a
            java.io.FileDescriptor r1 = r3.getFileDescriptor()     // Catch: java.lang.Throwable -> L46 java.lang.Throwable -> L5a
            r4.<init>(r1)     // Catch: java.lang.Throwable -> L46 java.lang.Throwable -> L5a
            r1 = 0
            android.graphics.Typeface r5 = super.createFromInputStream(r8, r4)     // Catch: java.lang.Throwable -> L6c java.lang.Throwable -> L9f
            if (r4 != 0) goto L40
        L2f:
            if (r3 != 0) goto L5d
        L31:
            return r5
        L32:
            return r2
        L33:
            boolean r4 = r1.canRead()     // Catch: java.lang.Throwable -> L46 java.lang.Throwable -> L5a
            if (r4 == 0) goto L1f
            android.graphics.Typeface r1 = android.graphics.Typeface.createFromFile(r1)     // Catch: java.lang.Throwable -> L46 java.lang.Throwable -> L5a
            if (r3 != 0) goto L81
        L3f:
            return r1
        L40:
            if (r2 != 0) goto L51
            r4.close()     // Catch: java.lang.Throwable -> L46 java.lang.Throwable -> L5a
            goto L2f
        L46:
            r0 = move-exception
            throw r0     // Catch: java.lang.Throwable -> L48
        L48:
            r1 = move-exception
            r6 = r1
            r1 = r0
            r0 = r6
        L4c:
            if (r3 != 0) goto L90
        L4e:
            throw r0     // Catch: java.io.IOException -> L4f
        L4f:
            r0 = move-exception
            return r2
        L51:
            r4.close()     // Catch: java.lang.Throwable -> L46 java.lang.Throwable -> L55 java.lang.Throwable -> L5a
            goto L2f
        L55:
            r4 = move-exception
            r1.addSuppressed(r4)     // Catch: java.lang.Throwable -> L46 java.lang.Throwable -> L5a
            goto L2f
        L5a:
            r0 = move-exception
            r1 = r2
            goto L4c
        L5d:
            if (r2 != 0) goto L63
            r3.close()     // Catch: java.io.IOException -> L4f
            goto L31
        L63:
            r3.close()     // Catch: java.io.IOException -> L4f java.lang.Throwable -> L67
            goto L31
        L67:
            r1 = move-exception
            r0.addSuppressed(r1)     // Catch: java.io.IOException -> L4f
            goto L31
        L6c:
            r1 = move-exception
            throw r1     // Catch: java.lang.Throwable -> L6e
        L6e:
            r0 = move-exception
        L6f:
            if (r4 != 0) goto L72
        L71:
            throw r0     // Catch: java.lang.Throwable -> L46 java.lang.Throwable -> L5a
        L72:
            if (r1 != 0) goto L78
            r4.close()     // Catch: java.lang.Throwable -> L46 java.lang.Throwable -> L5a
            goto L71
        L78:
            r4.close()     // Catch: java.lang.Throwable -> L46 java.lang.Throwable -> L5a java.lang.Throwable -> L7c
            goto L71
        L7c:
            r4 = move-exception
            r1.addSuppressed(r4)     // Catch: java.lang.Throwable -> L46 java.lang.Throwable -> L5a
            goto L71
        L81:
            if (r2 != 0) goto L87
            r3.close()     // Catch: java.io.IOException -> L4f
            goto L3f
        L87:
            r3.close()     // Catch: java.io.IOException -> L4f java.lang.Throwable -> L8b
            goto L3f
        L8b:
            r3 = move-exception
            r0.addSuppressed(r3)     // Catch: java.io.IOException -> L4f
            goto L3f
        L90:
            if (r1 != 0) goto L96
            r3.close()     // Catch: java.io.IOException -> L4f
            goto L4e
        L96:
            r3.close()     // Catch: java.io.IOException -> L4f java.lang.Throwable -> L9a
            goto L4e
        L9a:
            r3 = move-exception
            r1.addSuppressed(r3)     // Catch: java.io.IOException -> L4f
            goto L4e
        L9f:
            r0 = move-exception
            r1 = r2
            goto L6f
        */
        throw new UnsupportedOperationException("Method not decompiled: android.support.v4.graphics.TypefaceCompatApi21Impl.createFromFontInfo(android.content.Context, android.os.CancellationSignal, android.support.v4.provider.FontsContractCompat$FontInfo[], int):android.graphics.Typeface");
    }
}
