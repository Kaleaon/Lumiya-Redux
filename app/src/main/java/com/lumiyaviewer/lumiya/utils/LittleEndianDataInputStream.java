package com.lumiyaviewer.lumiya.utils;

import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.io.DataInput;
import java.io.EOFException;
import java.io.IOException;
import java.io.InputStream;

public class LittleEndianDataInputStream implements DataInput {
    private byte[] buf = new byte[8];
    private InputStream inputStream;

    public LittleEndianDataInputStream(InputStream inputStream) {
        this.inputStream = inputStream;
    }

    @Override
    public boolean readBoolean() throws IOException {
        int read = this.inputStream.read();
        if (read == -1) {
            throw new EOFException("End of stream");
        }
        return read != 0;
    }

    @Override
    public byte readByte() throws IOException {
        int read = this.inputStream.read();
        if (read == -1) {
            throw new EOFException("End of stream");
        }
        return (byte) (read & 255);
    }

    @Override
    public char readChar() throws IOException {
        int read = this.inputStream.read();
        if (read == -1) {
            throw new EOFException("End of stream");
        }
        return (char) (read & 255);
    }

    @Override
    public double readDouble() throws IOException {
        return Double.longBitsToDouble(readLong());
    }

    @Override
    public float readFloat() throws IOException {
        return Float.intBitsToFloat(readInt());
    }

    @Override
    public void readFully(byte[] bArr) throws IOException {
        if (this.inputStream.read(bArr, 0, bArr.length) != bArr.length) {
            throw new EOFException("End of stream");
        }
    }

    @Override
    public void readFully(byte[] bArr, int i, int i2) throws IOException {
        if (this.inputStream.read(bArr, i, i2) != i2) {
            throw new EOFException("End of stream");
        }
    }

    @Override
    public int readInt() throws IOException {
        if (this.inputStream.read(this.buf, 0, 4) != 4) {
            throw new EOFException("End of stream");
        }
        return (this.buf[3] << 24) | ((this.buf[2] & 0xFF) << 16) | ((this.buf[1] & 0xFF) << 8) | (this.buf[0] & 0xFF);
    }

    @Override
    public String readLine() throws IOException {
        StringBuilder sb = new StringBuilder();
        while (true) {
            char readChar = readChar();
            if (readChar == '\n' || readChar == '\r') {
                break;
            }
            sb.append(readChar);
        }
        return sb.toString();
    }

    @Override
    public long readLong() throws IOException {
        if (this.inputStream.read(this.buf, 0, 8) != 8) {
            throw new EOFException("End of stream");
        }
        return (this.buf[7] << 56) | ((this.buf[6] & 0xFF) << 48) | ((this.buf[5] & 0xFF) << 40) | ((this.buf[4] & 0xFF) << 32) | ((this.buf[3] & 0xFF) << 24) | ((this.buf[2] & 0xFF) << 16) | ((this.buf[1] & 0xFF) << 8) | (this.buf[0] & 0xFF);
    }

    @Override
    public short readShort() throws IOException {
        if (this.inputStream.read(this.buf, 0, 2) != 2) {
            throw new EOFException("End of stream");
        }
        return (short) (((this.buf[1] & 0xFF) << 8) | (this.buf[0] & 0xFF));
    }

    @Override
    public String readUTF() throws IOException {
        return readLine();
    }

    @Override
    public int readUnsignedByte() throws IOException {
        int read = this.inputStream.read();
        if (read == -1) {
            throw new EOFException("End of stream");
        }
        return read & 255;
    }

    @Override
    public int readUnsignedShort() throws IOException {
        if (this.inputStream.read(this.buf, 0, 2) != 2) {
            throw new EOFException("End of stream");
        }
        return ((this.buf[1] & 0xFF) << 8) | (this.buf[0] & 0xFF);
    }

    public LLVector3 readVector3() throws IOException {
        return new LLVector3(readFloat(), readFloat(), readFloat());
    }

    public String readZeroTerminatedString() throws IOException {
        StringBuilder sb = new StringBuilder();
        while (true) {
            char readChar = readChar();
            if (readChar == 0) {
                return sb.toString();
            }
            sb.append(readChar);
        }
    }

    @Override
    public int skipBytes(int i) throws IOException {
        return (int) this.inputStream.skip(i);
    }
}
