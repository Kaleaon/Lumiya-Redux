package com.google.common.io;

import com.google.common.base.Preconditions;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.Iterator;

/* loaded from: classes.dex */
public abstract class CharSink {
    protected CharSink() {
    }

    public Writer openBufferedStream() throws IOException {
        Writer openStream = openStream();
        return !(openStream instanceof BufferedWriter) ? new BufferedWriter(openStream) : (BufferedWriter) openStream;
    }

    public abstract Writer openStream() throws IOException;

    public void write(CharSequence charSequence) throws IOException {
        RuntimeException rethrow;
        Preconditions.checkNotNull(charSequence);
        Closer create = Closer.create();
        try {
            try {
                Writer writer = (Writer) create.register(openStream());
                writer.append(charSequence);
                writer.flush();
            } finally {
            }
        } finally {
            create.close();
        }
    }

    public long writeFrom(Readable readable) throws IOException {
        Preconditions.checkNotNull(readable);
        Closer create = Closer.create();
        try {
            try {
                Writer writer = (Writer) create.register(openStream());
                long copy = CharStreams.copy(readable, writer);
                writer.flush();
                return copy;
            } catch (Throwable th) {
                throw create.rethrow(th);
            }
        } finally {
            create.close();
        }
    }

    public void writeLines(Iterable<? extends CharSequence> iterable) throws IOException {
        writeLines(iterable, System.getProperty("line.separator"));
    }

    public void writeLines(Iterable<? extends CharSequence> iterable, String str) throws IOException {
        RuntimeException rethrow;
        Preconditions.checkNotNull(iterable);
        Preconditions.checkNotNull(str);
        Closer create = Closer.create();
        try {
            try {
                Writer writer = (Writer) create.register(openBufferedStream());
                Iterator<? extends CharSequence> it = iterable.iterator();
                while (it.hasNext()) {
                    writer.append(it.next()).append((CharSequence) str);
                }
                writer.flush();
            } finally {
            }
        } finally {
            create.close();
        }
    }
}
