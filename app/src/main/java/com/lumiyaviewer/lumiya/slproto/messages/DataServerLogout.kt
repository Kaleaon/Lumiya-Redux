package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.net.Inet4Address
import java.nio.ByteBuffer
import java.util.UUID

/**
 * Logout
 * userserver -> dataserver
 *
 * <p>Template: {@code DataServerLogout Low 251 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class DataServerLogout : SLMessage() {
    @JvmField var UserData_Field: UserData = UserData()

    /** Block UserData, Single. */
    open class UserData {
        @JvmField var AgentID: UUID? = null
        @JvmField var Disconnect: Boolean = false
        @JvmField var SessionID: UUID? = null
        @JvmField var ViewerIP: Inet4Address? = null
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return 41
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleDataServerLogout(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 251 (DataServerLogout).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0xFB).toByte())
        packUUID(byteBuffer, UserData_Field.AgentID)
        packIPAddress(byteBuffer, UserData_Field.ViewerIP)
        packBoolean(byteBuffer, UserData_Field.Disconnect)
        packUUID(byteBuffer, UserData_Field.SessionID)
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        UserData_Field.AgentID = unpackUUID(byteBuffer)
        UserData_Field.ViewerIP = unpackIPAddress(byteBuffer)
        UserData_Field.Disconnect = unpackBoolean(byteBuffer)
        UserData_Field.SessionID = unpackUUID(byteBuffer)
    }
}
