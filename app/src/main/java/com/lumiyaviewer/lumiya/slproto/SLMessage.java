package com.lumiyaviewer.lumiya.slproto;

import android.os.Parcel;
import android.os.Parcelable;
import androidx.core.internal.view.SupportMenu;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.messages.SLMessageFactory;
import com.lumiyaviewer.lumiya.slproto.messages.SLMessageHandler;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d;
import com.lumiyaviewer.lumiya.slproto.types.LLVector4;
import com.lumiyaviewer.rawbuffers.DirectByteBuffer;
import java.io.UnsupportedEncodingException;
import java.net.Inet4Address;
import java.net.UnknownHostException;
import java.nio.BufferUnderflowException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

public abstract class SLMessage implements Parcelable {
    public static final Parcelable.Creator<SLMessage> CREATOR = new Parcelable.Creator<SLMessage>() {
        /* JADX WARN: Can't rename method to resolve collision */
        @Override
        public SLMessage createFromParcel(Parcel parcel) {
            byte[] bytes = new byte[parcel.readInt()];
            parcel.readByteArray(bytes);
            ByteBuffer order = ByteBuffer.wrap(bytes).order(ByteOrder.nativeOrder());
            SLMessage CreateByID = SLMessageFactory.CreateByID(SLMessage.DecodeMessageIDGeneric(order));
            if (CreateByID == null) {
                return null;
            }
            CreateByID.UnpackPayload(order);
            return CreateByID;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override
        public SLMessage[] newArray(int i) {
            return null;
        }
    };
    private static final byte LL_ACK_FLAG = 16;
    private static final byte LL_RELIABLE_FLAG = 64;
    private static final byte LL_RESENT_FLAG = 32;
    private static final byte LL_ZERO_CODE_FLAG = Byte.MIN_VALUE;
    public static final int MAX_MESSAGE_SIZE = 65536;
    public static final int MAX_PAYLOAD_SIZE = 1018;
    public static final int MAX_TRANSMIT_SIZE = 1024;
    public boolean isReliable;
    public boolean isResent;
    private SLMessageEventListener listener = null;
    public int retries;
    public long sentTimeMillis;
    public int seqNum;
    public boolean zeroCoded;

    public static int DecodeMessageID(ByteBuffer byteBuffer) {
        byte b = byteBuffer.get();
        if (b != -1) {
            return b;
        }
        byte b2 = byteBuffer.get();
        return b2 != -1 ? b2 | 0xFF00 : byteBuffer.getShort() | (-65536);
    }

    public static int DecodeMessageIDGeneric(ByteBuffer byteBuffer) {
        byte b = byteBuffer.get();
        if (b != -1) {
            return b;
        }
        byte b2 = byteBuffer.get();
        if (b2 != -1) {
            return b2 | 0xFF00;
        }
        return ((byteBuffer.get() << 8) & 0xFF00) | SupportMenu.CATEGORY_MASK | (byteBuffer.get() & 0xFF);
    }

    private void PackPayloadLE(ByteBuffer byteBuffer) {
        ByteOrder order = byteBuffer.order();
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN);
        PackPayload(byteBuffer);
        byteBuffer.order(order);
    }

    public static SLMessage Unpack(ByteBuffer byteBuffer, ByteBuffer byteBuffer2, List<Integer> list) {
        int limit = byteBuffer.limit();
        byte b = byteBuffer.get();
        int i = byteBuffer.getInt();
        byte b2 = byteBuffer.get();
        if (b2 != 0) {
            byteBuffer.position(b2 + byteBuffer.position());
        }
        if ((b & 16) != 0) {
            byte b3 = byteBuffer.get(byteBuffer.limit() - 1);
            int limit2 = (byteBuffer.limit() - 1) - (b3 * 4);
            for (int j = 0; j < b3; j++) {
                list.add(Integer.valueOf(byteBuffer.getInt(limit2)));
                limit2 += 4;
            }
            byteBuffer.limit(limit2);
        }
        if ((b & Byte.MIN_VALUE) != 0) {
            byteBuffer2.clear();
            byteBuffer2.order(ByteOrder.BIG_ENDIAN);
            ZeroDecode(byteBuffer2, byteBuffer);
            byteBuffer2.flip();
        } else {
            byteBuffer2 = byteBuffer;
        }
        SLMessage CreateByID = SLMessageFactory.CreateByID(DecodeMessageID(byteBuffer2));
        if (CreateByID == null) {
            CreateByID = new SLDefaultMessage();
        }
        CreateByID.seqNum = i;
        CreateByID.isReliable = (b & 64) != 0;
        CreateByID.isResent = (b & 32) != 0;
        CreateByID.zeroCoded = (b & Byte.MIN_VALUE) != 0;
        try {
            CreateByID.UnpackPayloadLE(byteBuffer2);
        } catch (BufferUnderflowException e) {
            Debug.Log("Message too short: " + CreateByID.getClass().getSimpleName());
        } catch (Exception e2) {
            Debug.Log("Failed to unpack (" + CreateByID.getClass().getSimpleName() + "), zeroCoded = " + CreateByID.zeroCoded);
            Debug.DumpBuffer("decodedPayload", byteBuffer2);
            Debug.DumpBuffer("origPacket w/o acks", byteBuffer);
            byteBuffer.limit(limit);
            Debug.DumpBuffer("origPacket", byteBuffer);
            e2.printStackTrace();
            return null;
        }
        return CreateByID;
    }

    private void UnpackPayloadLE(ByteBuffer byteBuffer) {
        ByteOrder order = byteBuffer.order();
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN);
        UnpackPayload(byteBuffer);
        byteBuffer.order(order);
    }

    private static void ZeroDecode(ByteBuffer byteBuffer, ByteBuffer byteBuffer2) {
        byteBuffer.position(DirectByteBuffer.zeroDecode(byteBuffer.array(), byteBuffer.arrayOffset() + byteBuffer.position(), byteBuffer.capacity() - byteBuffer.position(), byteBuffer2.array(), byteBuffer2.arrayOffset() + byteBuffer2.position(), byteBuffer2.remaining()) + byteBuffer.position());
    }

    private static void ZeroEncode(ByteBuffer byteBuffer, ByteBuffer byteBuffer2) {
        int i = 0;
        boolean z = false;
        while (byteBuffer.hasRemaining()) {
            byte b = byteBuffer.get();
            if (b != 0) {
                if (i != 0) {
                    byteBuffer2.put((byte) i);
                    i = 0;
                    z = false;
                }
                byteBuffer2.put(b);
            } else {
                if (!z) {
                    byteBuffer2.put(b);
                    z = true;
                }
                i++;
            }
        }
        if (i != 0) {
            byteBuffer2.put((byte) i);
        }
    }

    public static int flipBytes(int i) {
        return (((byte) (i >>> 24)) & 0xFF) | ((((byte) (i >>> 16)) << 8) & 0xFF00) | ((((byte) (i >>> 8)) << 16) & 0xFF0000) | ((((byte) (i >>> 0)) << 24) & 0xFF000000);
    }

    public static String stringFromVariableOEM(byte[] bytes) {
        String str;
        try {
            str = new String(bytes, "ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            str = "";
        }
        return str.endsWith("\u0000") ? str.substring(0, str.length() - 1) : str;
    }

    public static String stringFromVariableUTF(byte[] bytes) {
        String str;
        try {
            str = new String(bytes, "UTF-8");
        } catch (UnsupportedEncodingException e) {
            str = "";
        }
        return str.endsWith("\u0000") ? str.substring(0, str.length() - 1) : str;
    }

    public static byte[] stringToVariableOEM(String str) {
        try {
            return (str + "\u0000").getBytes("ISO-8859-1");
        } catch (UnsupportedEncodingException e) {
            return new byte[]{0};
        }
    }

    public static byte[] stringToVariableUTF(String str) {
        try {
            return (str + "\u0000").getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            return new byte[]{0};
        }
    }

    public int AppendPendingAcks(ByteBuffer byteBuffer, List<Integer> list) {
        Iterator<Integer> it = list.iterator();
        int i = 0;
        while (it.hasNext() && byteBuffer.position() <= 1019) {
            byteBuffer.putInt(it.next().intValue());
            i++;
        }
        if (i != 0) {
            byteBuffer.put(0, (byte) (byteBuffer.get(0) | 16));
            byteBuffer.put((byte) i);
        }
        return i;
    }

    public abstract int CalcPayloadSize();

    public abstract void Handle(SLMessageHandler messageHandler);

    public void Pack(ByteBuffer byteBuffer, ByteBuffer byteBuffer2) {
        byteBuffer.clear();
        byteBuffer.order(ByteOrder.BIG_ENDIAN);
        byte b = this.isReliable ? (byte) 64 : (byte) 0;
        if (this.isResent) {
            b = (byte) (b | 32);
        }
        byteBuffer.put(b);
        byteBuffer.putInt(this.seqNum);
        byteBuffer.put((byte) 0);
        if (!this.zeroCoded) {
            PackPayloadLE(byteBuffer);
            return;
        }
        byteBuffer2.clear();
        byteBuffer2.order(ByteOrder.BIG_ENDIAN);
        PackPayloadLE(byteBuffer2);
        byteBuffer2.flip();
        int limit = byteBuffer2.limit();
        int position = byteBuffer.position();
        ZeroEncode(byteBuffer2, byteBuffer);
        if (byteBuffer.position() - position < limit) {
            byteBuffer.put(0, (byte) (byteBuffer.get(0) | Byte.MIN_VALUE));
            return;
        }
        byteBuffer.position(position);
        byteBuffer2.rewind();
        byteBuffer.put(byteBuffer2);
    }

    public abstract void PackPayload(ByteBuffer byteBuffer);

    public abstract void UnpackPayload(ByteBuffer byteBuffer);

    @Override
    public int describeContents() {
        return 0;
    }

    public void handleMessageAcknowledged() {
        if (this.listener != null) {
            this.listener.onMessageAcknowledged(this);
        }
    }

    public void handleMessageTimeout() {
        if (this.listener != null) {
            this.listener.onMessageTimeout(this);
        }
    }

    protected void packBoolean(ByteBuffer byteBuffer, boolean z) {
        byteBuffer.put((byte) (z ? 1 : 0));
    }

    protected void packByte(ByteBuffer byteBuffer, byte b) {
        byteBuffer.put(b);
    }

    protected void packDouble(ByteBuffer byteBuffer, double d) {
        byteBuffer.putDouble(d);
    }

    protected void packFixed(ByteBuffer byteBuffer, byte[] bytes, int i) {
        if (bytes.length == i) {
            byteBuffer.put(bytes);
            return;
        }
        for (int j = 0; j < i; j++) {
            if (j < bytes.length) {
                byteBuffer.put(bytes[j]);
            } else {
                byteBuffer.put((byte) 0);
            }
        }
    }

    protected void packFloat(ByteBuffer byteBuffer, float f) {
        byteBuffer.putFloat(f);
    }

    protected void packIPAddress(ByteBuffer byteBuffer, Inet4Address inet4Address) {
        byteBuffer.put(inet4Address.getAddress());
    }

    protected void packInt(ByteBuffer byteBuffer, int i) {
        byteBuffer.putInt(i);
    }

    protected void packLLQuaternion(ByteBuffer byteBuffer, LLQuaternion quaternion) {
        byteBuffer.putFloat(quaternion.x);
        byteBuffer.putFloat(quaternion.y);
        byteBuffer.putFloat(quaternion.z);
    }

    protected void packLLVector3(ByteBuffer byteBuffer, LLVector3 vector3) {
        byteBuffer.putFloat(vector3.x);
        byteBuffer.putFloat(vector3.y);
        byteBuffer.putFloat(vector3.z);
    }

    protected void packLLVector3d(ByteBuffer byteBuffer, LLVector3d vector3d) {
        byteBuffer.putDouble(vector3d.x);
        byteBuffer.putDouble(vector3d.y);
        byteBuffer.putDouble(vector3d.z);
    }

    protected void packLLVector4(ByteBuffer byteBuffer, LLVector4 vector4) {
        byteBuffer.putFloat(vector4.x);
        byteBuffer.putFloat(vector4.y);
        byteBuffer.putFloat(vector4.z);
        byteBuffer.putFloat(vector4.w);
    }

    protected void packLong(ByteBuffer byteBuffer, long j) {
        byteBuffer.putLong(j);
    }

    protected void packShort(ByteBuffer byteBuffer, short s) {
        byteBuffer.putShort(s);
    }

    protected void packUUID(ByteBuffer byteBuffer, UUID uuid) {
        ByteOrder order = byteBuffer.order();
        byteBuffer.order(ByteOrder.BIG_ENDIAN);
        byteBuffer.putLong(uuid.getMostSignificantBits());
        byteBuffer.putLong(uuid.getLeastSignificantBits());
        byteBuffer.order(order);
    }

    protected void packVariable(ByteBuffer byteBuffer, byte[] bytes, int i) {
        if (i == 1) {
            byteBuffer.put((byte) bytes.length);
        } else {
            byteBuffer.put((byte) (bytes.length & 255));
            byteBuffer.put((byte) ((bytes.length >>> 8) & 255));
        }
        byteBuffer.put(bytes);
    }

    public void setEventListener(SLMessageEventListener messageEventListener) {
        this.listener = messageEventListener;
    }

    protected boolean unpackBoolean(ByteBuffer byteBuffer) {
        return byteBuffer.get() != 0;
    }

    protected byte unpackByte(ByteBuffer byteBuffer) {
        return byteBuffer.get();
    }

    protected double unpackDouble(ByteBuffer byteBuffer) {
        return byteBuffer.getDouble();
    }

    protected byte[] unpackFixed(ByteBuffer byteBuffer, int i) {
        byte[] bytes = new byte[i];
        byteBuffer.get(bytes);
        return bytes;
    }

    protected float unpackFloat(ByteBuffer byteBuffer) {
        return byteBuffer.getFloat();
    }

    protected Inet4Address unpackIPAddress(ByteBuffer byteBuffer) {
        byte[] bytes = new byte[4];
        byteBuffer.get(bytes);
        try {
            return (Inet4Address) Inet4Address.getByAddress(bytes);
        } catch (UnknownHostException e) {
            return null;
        }
    }

    protected int unpackInt(ByteBuffer byteBuffer) {
        return byteBuffer.getInt();
    }

    protected LLQuaternion unpackLLQuaternion(ByteBuffer byteBuffer) {
        LLQuaternion quaternion = new LLQuaternion();
        quaternion.x = byteBuffer.getFloat();
        quaternion.y = byteBuffer.getFloat();
        quaternion.z = byteBuffer.getFloat();
        return quaternion;
    }

    protected LLVector3 unpackLLVector3(ByteBuffer byteBuffer) {
        LLVector3 vector3 = new LLVector3();
        vector3.x = byteBuffer.getFloat();
        vector3.y = byteBuffer.getFloat();
        vector3.z = byteBuffer.getFloat();
        return vector3;
    }

    protected LLVector3d unpackLLVector3d(ByteBuffer byteBuffer) {
        LLVector3d vector3d = new LLVector3d();
        vector3d.x = byteBuffer.getDouble();
        vector3d.y = byteBuffer.getDouble();
        vector3d.z = byteBuffer.getDouble();
        return vector3d;
    }

    protected LLVector4 unpackLLVector4(ByteBuffer byteBuffer) {
        LLVector4 vector4 = new LLVector4();
        vector4.x = byteBuffer.getFloat();
        vector4.y = byteBuffer.getFloat();
        vector4.z = byteBuffer.getFloat();
        vector4.w = byteBuffer.getFloat();
        return vector4;
    }

    protected long unpackLong(ByteBuffer byteBuffer) {
        return byteBuffer.getLong();
    }

    protected short unpackShort(ByteBuffer byteBuffer) {
        return byteBuffer.getShort();
    }

    protected UUID unpackUUID(ByteBuffer byteBuffer) {
        ByteOrder order = byteBuffer.order();
        byteBuffer.order(ByteOrder.BIG_ENDIAN);
        long j = byteBuffer.getLong();
        long j2 = byteBuffer.getLong();
        byteBuffer.order(order);
        return new UUID(j, j2);
    }

    protected byte[] unpackVariable(ByteBuffer byteBuffer, int i) {
        byte[] bytes = new byte[i == 1 ? byteBuffer.get() & 0xFF : (byteBuffer.get() & 0xFF) | ((byteBuffer.get() & 0xFF) << 8)];
        byteBuffer.get(bytes);
        return bytes;
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        int CalcPayloadSize = CalcPayloadSize();
        byte[] bytes = new byte[CalcPayloadSize];
        PackPayload(ByteBuffer.wrap(bytes).order(ByteOrder.nativeOrder()));
        parcel.writeInt(CalcPayloadSize);
        parcel.writeByteArray(bytes);
    }
}
