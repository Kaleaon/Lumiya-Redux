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
import java.util.UUID

abstract class SLMessage : Parcelable {
    var isReliable: Boolean = false
    var isResent: Boolean = false
    private var listener: SLMessageEventListener? = null
    var retries: Int = 0
    var sentTimeMillis: Long = 0
    var seqNum: Int = 0
    var zeroCoded: Boolean = false

    private fun PackPayloadLE(byteBuffer: ByteBuffer) {
        val order = byteBuffer.order()
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN)
        PackPayload(byteBuffer)
        byteBuffer.order(order)
    }

    private fun UnpackPayloadLE(byteBuffer: ByteBuffer) {
        val order = byteBuffer.order()
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN)
        UnpackPayload(byteBuffer)
        byteBuffer.order(order)
    }

    fun AppendPendingAcks(byteBuffer: ByteBuffer, list: MutableList<Int>): Int {
        val it = list.iterator()
        var i = 0
        while (it.hasNext() && byteBuffer.position() <= 1019) {
            byteBuffer.putInt(it.next())
            i++
        }
        if (i != 0) {
            byteBuffer.put(0, (byteBuffer.get(0).toInt() or 16).toByte())
            byteBuffer.put(i.toByte())
        }
        return i
    }

    abstract fun CalcPayloadSize(): Int

    abstract fun Handle(messageHandler: SLMessageHandler)

    fun Pack(byteBuffer: ByteBuffer, byteBuffer2: ByteBuffer) {
        byteBuffer.clear()
        byteBuffer.order(ByteOrder.BIG_ENDIAN)
        var b: Byte = if (this.isReliable) 64 else 0
        if (this.isResent) {
            b = (b.toInt() or 32).toByte()
        }
        byteBuffer.put(b)
        byteBuffer.putInt(this.seqNum)
        byteBuffer.put(0.toByte())
        if (!this.zeroCoded) {
            PackPayloadLE(byteBuffer)
            return
        }
        byteBuffer2.clear()
        byteBuffer2.order(ByteOrder.BIG_ENDIAN)
        PackPayloadLE(byteBuffer2)
        byteBuffer2.flip()
        val limit = byteBuffer2.limit()
        val position = byteBuffer.position()
        ZeroEncode(byteBuffer2, byteBuffer)
        if (byteBuffer.position() - position < limit) {
            byteBuffer.put(0, (byteBuffer.get(0).toInt() or Byte.MIN_VALUE.toInt()).toByte())
            return
        }
        byteBuffer.position(position)
        byteBuffer2.rewind()
        byteBuffer.put(byteBuffer2)
    }

    abstract fun PackPayload(byteBuffer: ByteBuffer)

    abstract fun UnpackPayload(byteBuffer: ByteBuffer)

    override fun describeContents(): Int {
        return 0
    }

    fun handleMessageAcknowledged() {
        this.listener?.onMessageAcknowledged(this)
    }

    fun handleMessageTimeout() {
        this.listener?.onMessageTimeout(this)
    }

    protected fun packBoolean(byteBuffer: ByteBuffer, z: Boolean) {
        byteBuffer.put((if (z) 1 else 0).toByte())
    }

    protected fun packByte(byteBuffer: ByteBuffer, b: Byte) {
        byteBuffer.put(b)
    }

    protected fun packDouble(byteBuffer: ByteBuffer, d: Double) {
        byteBuffer.putDouble(d)
    }

    protected fun packFixed(byteBuffer: ByteBuffer, bytesIn: ByteArray?, i: Int) {
        val bytes = bytesIn!!
        if (bytes.size == i) {
            byteBuffer.put(bytes)
            return
        }
        for (j in 0 until i) {
            if (j < bytes.size) {
                byteBuffer.put(bytes[j])
            } else {
                byteBuffer.put(0.toByte())
            }
        }
    }

    protected fun packFloat(byteBuffer: ByteBuffer, f: Float) {
        byteBuffer.putFloat(f)
    }

    protected fun packIPAddress(byteBuffer: ByteBuffer, inet4Address: Inet4Address?) {
        byteBuffer.put(inet4Address!!.address)
    }

    protected fun packInt(byteBuffer: ByteBuffer, i: Int) {
        byteBuffer.putInt(i)
    }

    protected fun packLLQuaternion(byteBuffer: ByteBuffer, quaternionIn: LLQuaternion?) {
        val quaternion = quaternionIn!!
        byteBuffer.putFloat(quaternion.x)
        byteBuffer.putFloat(quaternion.y)
        byteBuffer.putFloat(quaternion.z)
    }

    protected fun packLLVector3(byteBuffer: ByteBuffer, vector3In: LLVector3?) {
        val vector3 = vector3In!!
        byteBuffer.putFloat(vector3.x)
        byteBuffer.putFloat(vector3.y)
        byteBuffer.putFloat(vector3.z)
    }

    protected fun packLLVector3d(byteBuffer: ByteBuffer, vector3dIn: LLVector3d?) {
        val vector3d = vector3dIn!!
        byteBuffer.putDouble(vector3d.x)
        byteBuffer.putDouble(vector3d.y)
        byteBuffer.putDouble(vector3d.z)
    }

    protected fun packLLVector4(byteBuffer: ByteBuffer, vector4In: LLVector4?) {
        val vector4 = vector4In!!
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

    protected fun packUUID(byteBuffer: ByteBuffer, uuidIn: UUID?) {
        val uuid = uuidIn!!
        val order = byteBuffer.order()
        byteBuffer.order(ByteOrder.BIG_ENDIAN)
        byteBuffer.putLong(uuid.mostSignificantBits)
        byteBuffer.putLong(uuid.leastSignificantBits)
        byteBuffer.order(order)
    }

    protected fun packVariable(byteBuffer: ByteBuffer, bytesIn: ByteArray?, i: Int) {
        val bytes = bytesIn!!
        if (i == 1) {
            byteBuffer.put(bytes.size.toByte())
        } else {
            byteBuffer.put((bytes.size and 255).toByte())
            byteBuffer.put(((bytes.size ushr 8) and 255).toByte())
        }
        byteBuffer.put(bytes)
    }

    fun setEventListener(messageEventListener: SLMessageEventListener?) {
        this.listener = messageEventListener
    }

    protected fun unpackBoolean(byteBuffer: ByteBuffer): Boolean {
        return byteBuffer.get().toInt() != 0
    }

    protected fun unpackByte(byteBuffer: ByteBuffer): Byte {
        return byteBuffer.get()
    }

    protected fun unpackDouble(byteBuffer: ByteBuffer): Double {
        return byteBuffer.getDouble()
    }

    protected fun unpackFixed(byteBuffer: ByteBuffer, i: Int): ByteArray {
        val bytes = ByteArray(i)
        byteBuffer.get(bytes)
        return bytes
    }

    protected fun unpackFloat(byteBuffer: ByteBuffer): Float {
        return byteBuffer.getFloat()
    }

    protected fun unpackIPAddress(byteBuffer: ByteBuffer): Inet4Address? {
        val bytes = ByteArray(4)
        byteBuffer.get(bytes)
        return try {
            Inet4Address.getByAddress(bytes) as Inet4Address
        } catch (e: UnknownHostException) {
            null
        }
    }

    protected fun unpackInt(byteBuffer: ByteBuffer): Int {
        return byteBuffer.getInt()
    }

    protected fun unpackLLQuaternion(byteBuffer: ByteBuffer): LLQuaternion {
        val quaternion = LLQuaternion()
        quaternion.x = byteBuffer.getFloat()
        quaternion.y = byteBuffer.getFloat()
        quaternion.z = byteBuffer.getFloat()
        return quaternion
    }

    protected fun unpackLLVector3(byteBuffer: ByteBuffer): LLVector3 {
        val vector3 = LLVector3()
        vector3.x = byteBuffer.getFloat()
        vector3.y = byteBuffer.getFloat()
        vector3.z = byteBuffer.getFloat()
        return vector3
    }

    protected fun unpackLLVector3d(byteBuffer: ByteBuffer): LLVector3d {
        val vector3d = LLVector3d()
        vector3d.x = byteBuffer.getDouble()
        vector3d.y = byteBuffer.getDouble()
        vector3d.z = byteBuffer.getDouble()
        return vector3d
    }

    protected fun unpackLLVector4(byteBuffer: ByteBuffer): LLVector4 {
        val vector4 = LLVector4()
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
        val order = byteBuffer.order()
        byteBuffer.order(ByteOrder.BIG_ENDIAN)
        val j = byteBuffer.getLong()
        val j2 = byteBuffer.getLong()
        byteBuffer.order(order)
        return UUID(j, j2)
    }

    protected fun unpackVariable(byteBuffer: ByteBuffer, i: Int): ByteArray {
        val bytes = ByteArray(
            if (i == 1) (byteBuffer.get().toInt() and 0xFF)
            else ((byteBuffer.get().toInt() and 0xFF) or ((byteBuffer.get().toInt() and 0xFF) shl 8))
        )
        byteBuffer.get(bytes)
        return bytes
    }

    override fun writeToParcel(parcel: Parcel, i: Int) {
        val calcPayloadSize = CalcPayloadSize()
        val bytes = ByteArray(calcPayloadSize)
        PackPayload(ByteBuffer.wrap(bytes).order(ByteOrder.nativeOrder()))
        parcel.writeInt(calcPayloadSize)
        parcel.writeByteArray(bytes)
    }

    companion object {
        @JvmField
        val CREATOR: Parcelable.Creator<SLMessage> = object : Parcelable.Creator<SLMessage> {
            override fun createFromParcel(parcel: Parcel): SLMessage? {
                val bytes = ByteArray(parcel.readInt())
                parcel.readByteArray(bytes)
                val order = ByteBuffer.wrap(bytes).order(ByteOrder.nativeOrder())
                val createByID = SLMessageFactory.CreateByID(DecodeMessageIDGeneric(order)) ?: return null
                createByID.UnpackPayload(order)
                return createByID
            }

            override fun newArray(i: Int): Array<SLMessage?> {
                return arrayOfNulls(i)
            }
        }

        private const val LL_ACK_FLAG: Byte = 16
        private const val LL_RELIABLE_FLAG: Byte = 64
        private const val LL_RESENT_FLAG: Byte = 32
        private val LL_ZERO_CODE_FLAG: Byte = Byte.MIN_VALUE
        const val MAX_MESSAGE_SIZE: Int = 65536
        const val MAX_PAYLOAD_SIZE: Int = 1018
        const val MAX_TRANSMIT_SIZE: Int = 1024

        @JvmStatic
        fun DecodeMessageID(byteBuffer: ByteBuffer): Int {
            val b = byteBuffer.get()
            if (b.toInt() != -1) {
                return b.toInt()
            }
            val b2 = byteBuffer.get()
            return if (b2.toInt() != -1) (b2.toInt() or 0xFF00) else (byteBuffer.getShort().toInt() or -65536)
        }

        @JvmStatic
        fun DecodeMessageIDGeneric(byteBuffer: ByteBuffer): Int {
            val b = byteBuffer.get()
            if (b.toInt() != -1) {
                return b.toInt()
            }
            val b2 = byteBuffer.get()
            if (b2.toInt() != -1) {
                return b2.toInt() or 0xFF00
            }
            return ((byteBuffer.get().toInt() shl 8) and 0xFF00) or SupportMenu.CATEGORY_MASK or (byteBuffer.get().toInt() and 0xFF)
        }

        @JvmStatic
        fun Unpack(byteBuffer: ByteBuffer, byteBuffer2In: ByteBuffer, list: MutableList<Int>): SLMessage? {
            var byteBuffer2 = byteBuffer2In
            val limit = byteBuffer.limit()
            val b = byteBuffer.get()
            val i = byteBuffer.getInt()
            val b2 = byteBuffer.get()
            if (b2.toInt() != 0) {
                byteBuffer.position(b2 + byteBuffer.position())
            }
            if ((b.toInt() and 16) != 0) {
                val b3 = byteBuffer.get(byteBuffer.limit() - 1)
                var limit2 = (byteBuffer.limit() - 1) - (b3 * 4)
                for (j in 0 until b3) {
                    list.add(byteBuffer.getInt(limit2))
                    limit2 += 4
                }
                byteBuffer.limit(limit2)
            }
            if ((b.toInt() and Byte.MIN_VALUE.toInt()) != 0) {
                byteBuffer2.clear()
                byteBuffer2.order(ByteOrder.BIG_ENDIAN)
                ZeroDecode(byteBuffer2, byteBuffer)
                byteBuffer2.flip()
            } else {
                byteBuffer2 = byteBuffer
            }
            var createByID = SLMessageFactory.CreateByID(DecodeMessageID(byteBuffer2))
            if (createByID == null) {
                createByID = SLDefaultMessage()
            }
            createByID.seqNum = i
            createByID.isReliable = (b.toInt() and 64) != 0
            createByID.isResent = (b.toInt() and 32) != 0
            createByID.zeroCoded = (b.toInt() and Byte.MIN_VALUE.toInt()) != 0
            try {
                createByID.UnpackPayloadLE(byteBuffer2)
            } catch (e: BufferUnderflowException) {
                Debug.Log("Message too short: " + createByID.javaClass.simpleName)
            } catch (e2: Exception) {
                Debug.Log("Failed to unpack (" + createByID.javaClass.simpleName + "), zeroCoded = " + createByID.zeroCoded)
                Debug.DumpBuffer("decodedPayload", byteBuffer2)
                Debug.DumpBuffer("origPacket w/o acks", byteBuffer)
                byteBuffer.limit(limit)
                Debug.DumpBuffer("origPacket", byteBuffer)
                e2.printStackTrace()
                return null
            }
            return createByID
        }

        private fun ZeroDecode(byteBuffer: ByteBuffer, byteBuffer2: ByteBuffer) {
            byteBuffer.position(
                DirectByteBuffer.zeroDecode(
                    byteBuffer.array(),
                    byteBuffer.arrayOffset() + byteBuffer.position(),
                    byteBuffer.capacity() - byteBuffer.position(),
                    byteBuffer2.array(),
                    byteBuffer2.arrayOffset() + byteBuffer2.position(),
                    byteBuffer2.remaining()
                ) + byteBuffer.position()
            )
        }

        private fun ZeroEncode(byteBuffer: ByteBuffer, byteBuffer2: ByteBuffer) {
            var i = 0
            var z = false
            while (byteBuffer.hasRemaining()) {
                val b = byteBuffer.get()
                if (b.toInt() != 0) {
                    if (i != 0) {
                        byteBuffer2.put(i.toByte())
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
                byteBuffer2.put(i.toByte())
            }
        }

        @JvmStatic
        fun flipBytes(i: Int): Int {
            return ((i ushr 24).toByte().toInt() and 0xFF) or
                (((i ushr 16).toByte().toInt() shl 8) and 0xFF00) or
                (((i ushr 8).toByte().toInt() shl 16) and 0xFF0000) or
                ((i.toByte().toInt() shl 24) and -0x1000000)
        }

        @JvmStatic
        fun stringFromVariableOEM(bytes: ByteArray): String {
            val str = try {
                String(bytes, charset("ISO-8859-1"))
            } catch (e: UnsupportedEncodingException) {
                ""
            }
            return if (str.endsWith("\u0000")) str.substring(0, str.length - 1) else str
        }

        @JvmStatic
        fun stringFromVariableUTF(bytes: ByteArray): String {
            val str = try {
                String(bytes, charset("UTF-8"))
            } catch (e: UnsupportedEncodingException) {
                ""
            }
            return if (str.endsWith("\u0000")) str.substring(0, str.length - 1) else str
        }

        @JvmStatic
        fun stringToVariableOEM(str: String): ByteArray {
            return try {
                (str + "\u0000").toByteArray(charset("ISO-8859-1"))
            } catch (e: UnsupportedEncodingException) {
                byteArrayOf(0)
            }
        }

        @JvmStatic
        fun stringToVariableUTF(str: String): ByteArray {
            return try {
                (str + "\u0000").toByteArray(charset("UTF-8"))
            } catch (e: UnsupportedEncodingException) {
                byteArrayOf(0)
            }
        }
    }
}
