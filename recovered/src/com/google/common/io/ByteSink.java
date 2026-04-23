package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.nio.charset.Charset;

/* loaded from: classes.dex */
public abstract class ByteSink {

    private final class AsCharSink extends CharSink {
        private final Charset charset;

        private AsCharSink(Charset charset) {
            this.charset = (Charset) Preconditions.checkNotNull(charset);
        }

        @Override // com.google.common.io.CharSink
        public Writer openStream() throws IOException {
            return new OutputStreamWriter(ByteSink.this.openStream(), this.charset);
        }

        public String toString() {
            return ByteSink.this.toString() + ".asCharSink(" + this.charset + ")";
        }
    }

    protected ByteSink() {
    }

    public CharSink asCharSink(Charset charset) {
        return new AsCharSink(charset);
    }

    public OutputStream openBufferedStream() throws IOException {
        OutputStream openStream = openStream();
        return !(openStream instanceof BufferedOutputStream) ? new BufferedOutputStream(openStream) : (BufferedOutputStream) openStream;
    }

    public abstract OutputStream openStream() throws IOException;

    public void write(byte[] bArr) throws IOException {
        RuntimeException rethrow;
        Preconditions.checkNotNull(bArr);
        Closer create = Closer.create();
        try {
            try {
                OutputStream outputStream = (OutputStream) create.register(openStream());
                outputStream.write(bArr);
                outputStream.flush();
            } finally {
            }
        } finally {
            create.close();
        }
    }

    public long writeFrom(InputStream inputStream) throws IOException {
        Preconditions.checkNotNull(inputStream);
        Closer create = Closer.create();
        try {
            try {
                OutputStream outputStream = (OutputStream) create.register(openStream());
                long copy = ByteStreams.copy(inputStream, outputStream);
                outputStream.flush();
                return copy;
            } catch (Throwable th) {
                throw create.rethrow(th);
            }
        } finally {
            create.close();
        }
    }
}
