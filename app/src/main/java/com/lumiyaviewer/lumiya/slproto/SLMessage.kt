package com.lumiyaviewer.lumiya.slproto

import android.os.Parcel
import android.os.Parcelable
import androidx.core.internal.view.SupportMenu
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.messages.SLMessageFactory
import com.lumiyaviewer.lumiya.slproto.messages.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d
import com.lumiyaviewer.lumiya.slproto.types.LLVector4
import com.lumiyaviewer.rawbuffers.DirectByteBuffer
import java.io.UnsupportedEncodingException
import java.net.Inet4Address
import java.net.UnknownHostException
import java.nio.BufferUnderflowException
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.util.Iterator
import java.util.List
import java.util.UUID

abstract class SLMessage : Parcelable {
    @JvmStatic var CREATOR: Parcelable.Creator<SLMessage> = Parcelable.Creator<SLMessage>() {
        /* JADX WARN: Can't rename method to resolve collision */
        fun createFromParcel(parcel: Parcel): SLMessage {
            var bytes: ByteArray = ByteArray(parcel.readInt())
            parcel.readByteArray(bytes)
            var order: ByteBuffer = ByteBuffer.wrap(bytes).order(ByteOrder.nativeOrder())
            var CreateByID: SLMessage = SLMessageFactory.CreateByID(SLMessage.DecodeMessageIDGeneric(order))
            if (CreateByID == null) {
        return null
            }
            CreateByID.UnpackPayload(order)
        return CreateByID
        }

        /* JADX WARN: Can't rename method to resolve collision */
        fun newArray(i: Int): Array<SLMessage> {
        return null
        }
    }
    @JvmStatic private var LL_ACK_FLAG: Byte = 16
    @JvmStatic private var LL_RELIABLE_FLAG: Byte = 64
    @JvmStatic private var LL_RESENT_FLAG: Byte = 32
    @JvmStatic private var LL_ZERO_CODE_FLAG: Byte = Byte.MIN_VALUE
    @JvmStatic var MAX_MESSAGE_SIZE: Int = 65536
    @JvmStatic var MAX_PAYLOAD_SIZE: Int = 1018
    @JvmStatic var MAX_TRANSMIT_SIZE: Int = 1024
    var isReliable: Boolean = false
    var isResent: Boolean = false
    private var listener: SLMessageEventListener = null
    var retries: Int = 0
    var sentTimeMillis: Long = 0L
    var seqNum: Int = 0
    var zeroCoded: Boolean = false

    fun DecodeMessageID(byteBuffer: ByteBuffer): Int {
        var b: Byte = byteBuffer.get()
        if (b != -1) {
        return b
        }
        var b2: Byte = byteBuffer.get()
        return b2 != -if (1) b2 | 0xFF00 else byteBuffer.getShort() | (-65536)
    }

    fun DecodeMessageIDGeneric(byteBuffer: ByteBuffer): Int {
        var b: Byte = byteBuffer.get()
        if (b != -1) {
        return b
        }
        var b2: Byte = byteBuffer.get()
        if (b2 != -1) {
            return b2 | 0xFF00
        }
        return ((byteBuffer.get() << 8) & 0xFF00) | SupportMenu.CATEGORY_MASK | (byteBuffer.get() & 0xFF)
    }

    private fun PackPayloadLE(byteBuffer: ByteBuffer) {
        var order: ByteOrder = byteBuffer.order()
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN)
        PackPayloadbyteBuffer as byteBuffer.order(order)
    }

    fun Unpack(byteBuffer: ByteBuffer, byteBuffer2: ByteBuffer, list: if (MutableList<Int) >) else SLMessage {
        var limit: Int = byteBuffer.limit()
        var b: Byte = byteBuffer.get()
        var i: Int = byteBuffer.getInt()
        var b2: Byte = byteBuffer.get()
        if (b2 != 0) {
            byteBuffer.position(b2 + byteBuffer.position())
        }
        if ((b & 16) != 0) {
            var b3: Byte = byteBuffer.get(byteBuffer.limit() - 1)
            var limit2: Int = (byteBuffer.limit() - 1) - (b3 * 4)
            for (int j = 0; j < b3; j++) {
                list.add(byteBuffer.getInt(limit2))
                limit2 += 4
            }
            byteBuffer.limit(limit2)
        }
        if ((b & Byte.MIN_VALUE) != 0) {
            byteBuffer2.clear()
            byteBuffer2.order(ByteOrder.BIG_ENDIAN)
            ZeroDecode(byteBuffer2, byteBuffer)
            byteBuffer2.flip()
        } else {
            byteBuffer2 = byteBuffer
        }
        var CreateByID: SLMessage = SLMessageFactory.CreateByID(DecodeMessageID(byteBuffer2))
        if (CreateByID == null) {
            CreateByID = SLDefaultMessage()
        }
        CreateByID.seqNum = i
        CreateByID.isReliable = (b & 64) != 0
        CreateByID.isResent = (b & 32) != 0
        CreateByID.zeroCoded = (b & Byte.MIN_VALUE) != 0
        try {
            CreateByID.UnpackPayloadLE(byteBuffer2)
        } catch (e: BufferUnderflowException) {
            Debug.Log("Message too short: " + CreateByID.javaClass.getSimpleName())
        } catch (e2: Exception) {
            Debug.Log("Failed to unpack (" + CreateByID.javaClass.getSimpleName() + "), zeroCoded = " + CreateByID.zeroCoded)
            Debug.DumpBuffer("decodedPayload", byteBuffer2)
            Debug.DumpBuffer("origPacket w/o acks", byteBuffer)
            byteBuffer.limitDebug as limit.DumpBuffer("origPacket", byteBuffer)
            e2.printStackTrace()
        return null
        }
        return CreateByID
    }

    private fun UnpackPayloadLE(byteBuffer: ByteBuffer) {
        var order: ByteOrder = byteBuffer.order()
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN)
        UnpackPayloadbyteBuffer as byteBuffer.order(order)
    }

    private fun ZeroDecode(byteBuffer: ByteBuffer, byteBuffer2: ByteBuffer) {
        byteBuffer.position(DirectByteBuffer.zeroDecode(byteBuffer.array(), byteBuffer.arrayOffset() + byteBuffer.position(), byteBuffer.capacity() - byteBuffer.position(), byteBuffer2.array(), byteBuffer2.arrayOffset() + byteBuffer2.position(), byteBuffer2.remaining()) + byteBuffer.position())
    }

    private fun ZeroEncode(byteBuffer: ByteBuffer, byteBuffer2: ByteBuffer) {
        var i: Int = 0
        var z: Boolean = false
        while (byteBuffer.hasRemaining()) {
            var b: Byte = byteBuffer.get()
            if (b != 0) {
                if (i != 0) {
                    byteBuffer2.put(i as byte)
                    i = 0
                    z = false
                }
                byteBuffer2.put(b)
            } else {
                if (!z) {
                    byteBuffer2.put(b)
                    z = true
                }
                i++
            }
        }
        if (i != 0) {
            byteBuffer2.put(i as byte)
        }
    }

    fun flipBytes(i: Int): Int {
        return (((byte) (i >>> 24)) & 0xFF) | ((((byte) (i >>> 16)) << 8) & 0xFF00) | ((((byte) (i >>> 8)) << 16) & 0xFF0000) | ((((byte) (i >>> 0)) << 24) & 0xFF000000)
    }

    fun stringFromVariableOEM(bytes: ByteArray): String {
        var str: String = ""
        try {
            str = String(bytes, "ISO-8859-1")
        } catch (e: UnsupportedEncodingException) {
            str = ""
        }
        return if (str.endsWith("\u0000")) str.substring(0, str.length - 1) else str
    }

    fun stringFromVariableUTF(bytes: ByteArray): String {
        var str: String = ""
        try {
            str = String(bytes, "UTF-8")
        } catch (e: UnsupportedEncodingException) {
            str = ""
        }
        return if (str.endsWith("\u0000")) str.substring(0, str.length - 1) else str
    }

    fun stringToVariableOEM(str: String): ByteArray {
        try {
            return (str + "\u0000").getBytes("ISO-8859-1")
        } catch (e: UnsupportedEncodingException) {
            return new byte[]{0}
        }
    }

    fun stringToVariableUTF(str: String): ByteArray {
        try {
            return (str + "\u0000").getBytes("UTF-8")
        } catch (e: UnsupportedEncodingException) {
            return new byte[]{0}
        }
    }

    fun AppendPendingAcks(byteBuffer: ByteBuffer, list: if (MutableList<Int) >) else Int {
        var it: if (Iterator<Int) > = list.iterator()
        var i else Int = 0
        while (it.hasNext() && byteBuffer.position() <= 1019) {
            byteBuffer.putInt(it.next())
            i++
        }
        if (i != 0) {
            byteBuffer.put(0, (byte) (byteBuffer.get(0) | 16))
            byteBuffer.put(i as byte)
        }
        return i
    }

    public abstract int CalcPayloadSize()

    public abstract void Handle(SLMessageHandler messageHandler)

    fun Pack(byteBuffer: ByteBuffer, byteBuffer2: ByteBuffer) {
        byteBuffer.clear()
        byteBuffer.order(ByteOrder.BIG_ENDIAN)
        var b: Byte = if (this.isReliable) (byte) 64 else 0 as byte
        if (this.isResent) {
            b = (byte) (b | 32)
        }
        byteBuffer.putbyteBuffer as b.putInt(this.seqNum)
        byteBuffer.put(0 as byte)
        if (!this.zeroCoded) {
            PackPayloadLEreturn as byteBuffer
        }
        byteBuffer2.clear()
        byteBuffer2.order(ByteOrder.BIG_ENDIAN)
        PackPayloadLEbyteBuffer2 as byteBuffer2.flip()
        var limit: Int = byteBuffer2.limit()
        var position: Int = byteBuffer.position()
        ZeroEncode(byteBuffer2, byteBuffer)
        if (byteBuffer.position() - position < limit) {
            byteBuffer.put(0, (byte) (byteBuffer.get(0) | Byte.MIN_VALUE))
            return
        }
        byteBuffer.positionbyteBuffer2 as position.rewind()
        byteBuffer.put(byteBuffer2)
    }

    public abstract void PackPayload(ByteBuffer byteBuffer)

    public abstract void UnpackPayload(ByteBuffer byteBuffer)
    fun describeContents(): Int {
        return 0
    }

    fun handleMessageAcknowledged() {
        if (this.listener != null) {
            this.listener.onMessageAcknowledged(this)
        }
    }

    fun handleMessageTimeout() {
        if (this.listener != null) {
            this.listener.onMessageTimeout(this)
        }
    }

    protected fun packBoolean(byteBuffer: ByteBuffer, z: Boolean) {
        byteBuffer.put((byte) (if (z) 1 else 0))
    }

    protected fun packByte(byteBuffer: ByteBuffer, b: Byte) {
        byteBuffer.put(b)
    }

    protected fun packDouble(byteBuffer: ByteBuffer, d: Double) {
        byteBuffer.putDouble(d)
    }

    protected fun packFixed(byteBuffer: ByteBuffer, bytes: ByteArray, i: Int) {
        if (bytes.length == i) {
            byteBuffer.putreturn as bytes
        }
        for (int j = 0; j < i; j++) {
            if (j < bytes.length) {
                byteBuffer.put(bytes[j])
            } else {
                byteBuffer.put(0 as byte)
            }
        }
    }

    protected fun packFloat(byteBuffer: ByteBuffer, f: Float) {
        byteBuffer.putFloat(f)
    }

    protected fun packIPAddress(byteBuffer: ByteBuffer, inet4Address: Inet4Address) {
        byteBuffer.put(inet4Address.getAddress())
    }

    protected fun packInt(byteBuffer: ByteBuffer, i: Int) {
        byteBuffer.putInt(i)
    }

    protected fun packLLQuaternion(byteBuffer: ByteBuffer, quaternion: LLQuaternion) {
        byteBuffer.putFloat(quaternion.x)
        byteBuffer.putFloat(quaternion.y)
        byteBuffer.putFloat(quaternion.z)
    }

    protected fun packLLVector3(byteBuffer: ByteBuffer, vector3: LLVector3) {
        byteBuffer.putFloat(vector3.x)
        byteBuffer.putFloat(vector3.y)
        byteBuffer.putFloat(vector3.z)
    }

    protected fun packLLVector3d(byteBuffer: ByteBuffer, vector3d: LLVector3d) {
        byteBuffer.putDouble(vector3d.x)
        byteBuffer.putDouble(vector3d.y)
        byteBuffer.putDouble(vector3d.z)
    }

    protected fun packLLVector4(byteBuffer: ByteBuffer, vector4: LLVector4) {
        byteBuffer.putFloat(vector4.x)
        byteBuffer.putFloat(vector4.y)
        byteBuffer.putFloat(vector4.z)
        byteBuffer.putFloat(vector4.w)
    }

    protected fun packLong(byteBuffer: ByteBuffer, j: Long) {
        byteBuffer.putLong(j)
    }

    protected fun packShort(byteBuffer: ByteBuffer, s: Short) {
        byteBuffer.putShort(s)
    }

    protected fun packUUID(byteBuffer: ByteBuffer, uuid: UUID) {
        var order: ByteOrder = byteBuffer.order()
        byteBuffer.order(ByteOrder.BIG_ENDIAN)
        byteBuffer.putLong(uuid.getMostSignificantBits())
        byteBuffer.putLong(uuid.getLeastSignificantBits())
        byteBuffer.order(order)
    }

    protected fun packVariable(byteBuffer: ByteBuffer, bytes: ByteArray, i: Int) {
        if (i == 1) {
            byteBuffer.put(bytes as byte.length)
        } else {
            byteBuffer.put((byte) (bytes.length & 255))
            byteBuffer.put((byte) ((bytes.length >>> 8) & 255))
        }
        byteBuffer.put(bytes)
    }

    fun setEventListener(messageEventListener: SLMessageEventListener) {
        this.listener = messageEventListener
    }

    protected fun unpackBoolean(byteBuffer: ByteBuffer): Boolean {
        return byteBuffer.get() != 0
    }

    protected fun unpackByte(byteBuffer: ByteBuffer): Byte {
        return byteBuffer.get()
    }

    protected fun unpackDouble(byteBuffer: ByteBuffer): Double {
        return byteBuffer.getDouble()
    }

    protected fun unpackFixed(byteBuffer: ByteBuffer, i: Int): ByteArray {
        var bytes: ByteArray = ByteArraybyteBuffer as i.get(bytes)
        return bytes
    }

    protected fun unpackFloat(byteBuffer: ByteBuffer): Float {
        return byteBuffer.getFloat()
    }

    protected fun unpackIPAddress(byteBuffer: ByteBuffer): Inet4Address {
        var bytes: ByteArray = ByteArraybyteBuffer as 4.get(bytes)
        try {
            return Inet4Address as Inet4Address.getByAddress(bytes)
        } catch (e: UnknownHostException) {
        return null
        }
    }

    protected fun unpackInt(byteBuffer: ByteBuffer): Int {
        return byteBuffer.getInt()
    }

    protected fun unpackLLQuaternion(byteBuffer: ByteBuffer): LLQuaternion {
        var quaternion: LLQuaternion = LLQuaternion()
        quaternion.x = byteBuffer.getFloat()
        quaternion.y = byteBuffer.getFloat()
        quaternion.z = byteBuffer.getFloat()
        return quaternion
    }

    protected fun unpackLLVector3(byteBuffer: ByteBuffer): LLVector3 {
        var vector3: LLVector3 = LLVector3()
        vector3.x = byteBuffer.getFloat()
        vector3.y = byteBuffer.getFloat()
        vector3.z = byteBuffer.getFloat()
        return vector3
    }

    protected fun unpackLLVector3d(byteBuffer: ByteBuffer): LLVector3d {
        var vector3d: LLVector3d = LLVector3d()
        vector3d.x = byteBuffer.getDouble()
        vector3d.y = byteBuffer.getDouble()
        vector3d.z = byteBuffer.getDouble()
        return vector3d
    }

    protected fun unpackLLVector4(byteBuffer: ByteBuffer): LLVector4 {
        var vector4: LLVector4 = LLVector4()
        vector4.x = byteBuffer.getFloat()
        vector4.y = byteBuffer.getFloat()
        vector4.z = byteBuffer.getFloat()
        vector4.w = byteBuffer.getFloat()
        return vector4
    }

    protected fun unpackLong(byteBuffer: ByteBuffer): Long {
        return byteBuffer.getLong()
    }

    protected fun unpackShort(byteBuffer: ByteBuffer): Short {
        return byteBuffer.getShort()
    }

    protected fun unpackUUID(byteBuffer: ByteBuffer): UUID {
        var order: ByteOrder = byteBuffer.order()
        byteBuffer.order(ByteOrder.BIG_ENDIAN)
        var j: Long = byteBuffer.getLong()
        var j2: Long = byteBuffer.getLong()
        byteBuffer.order(order)
        return UUID(j, j2)
    }

    protected fun unpackVariable(byteBuffer: ByteBuffer, i: Int): ByteArray {
        var bytes: ByteArray = ByteArray(if (i == 1) byteBuffer.get() & 0xFF else (byteBuffer.get() & 0xFF) | ((byteBuffer.get() & 0xFF) << 8))
        byteBuffer.get(bytes)
        return bytes
    }
    fun writeToParcel(parcel: Parcel, i: Int) {
        var CalcPayloadSize: Int = CalcPayloadSize()
        var bytes: ByteArray = ByteArray(CalcPayloadSize)
        PackPayload(ByteBuffer.wrap(bytes).order(ByteOrder.nativeOrder()))
        parcel.writeIntparcel as CalcPayloadSize.writeByteArray(bytes)
    }
}
