package okhttp3.internal.cache2;

import java.io.EOFException;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import okio.Buffer;

/* loaded from: classes.dex */
final class FileOperator {
    private static final int BUFFER_SIZE = 8192;
    private final byte[] byteArray = new byte[8192];
    private final ByteBuffer byteBuffer = ByteBuffer.wrap(this.byteArray);
    private final FileChannel fileChannel;

    public FileOperator(FileChannel fileChannel) {
        this.fileChannel = fileChannel;
    }

    public void read(long j, Buffer buffer, long j2) throws IOException {
        if (!(j2 >= 0)) {
            throw new IndexOutOfBoundsException();
        }
        while (true) {
            if (j2 <= 0) {
                return;
            }
            try {
                this.byteBuffer.limit((int) Math.min(8192L, j2));
                if (this.fileChannel.read(this.byteBuffer, j) == -1) {
                    throw new EOFException();
                }
                int position = this.byteBuffer.position();
                buffer.write(this.byteArray, 0, position);
                j += position;
                j2 -= position;
            } finally {
                this.byteBuffer.clear();
            }
        }
    }

    public void write(long j, Buffer buffer, long j2) throws IOException {
        if (!(j2 < 0)) {
            if (j2 <= buffer.size()) {
                long j3 = j;
                while (true) {
                    if (j2 <= 0) {
                        return;
                    }
                    try {
                        int min = (int) Math.min(8192L, j2);
                        buffer.read(this.byteArray, 0, min);
                        this.byteBuffer.limit(min);
                        do {
                            j3 += this.fileChannel.write(this.byteBuffer, j3);
                        } while (this.byteBuffer.hasRemaining());
                        j2 -= min;
                    } finally {
                        this.byteBuffer.clear();
                    }
                }
            }
        }
        throw new IndexOutOfBoundsException();
    }
}
