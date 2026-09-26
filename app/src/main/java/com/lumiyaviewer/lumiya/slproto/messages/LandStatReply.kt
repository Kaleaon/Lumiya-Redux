package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList
import java.util.UUID

/**
 * LandStatReply
 * Sent by the simulator in response to LandStatRequest
 *
 * <p>Template: {@code LandStatReply Low 422 Trusted Unencoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLFloaterTopObjects::handle_land_reply()} in indra/newview/llfloatertopobjects.cpp
 * (secondlife/viewer @ c179f76c01).
 */
open class LandStatReply : SLMessage() {
    @JvmField val ReportData_Fields = ArrayList<ReportData>()
    @JvmField var RequestData_Field: RequestData = RequestData()

    /** Block ReportData, Variable. */
    open class ReportData {
        @JvmField var LocationX: Float = 0f
        @JvmField var LocationY: Float = 0f
        @JvmField var LocationZ: Float = 0f
        @JvmField var OwnerName: ByteArray? = null
        @JvmField var Score: Float = 0f
        @JvmField var TaskID: UUID? = null
        @JvmField var TaskLocalID: Int = 0
        @JvmField var TaskName: ByteArray? = null
    }

    /** Block RequestData, Single. */
    open class RequestData {
        @JvmField var ReportType: Int = 0
        @JvmField var RequestFlags: Int = 0
        @JvmField var TotalObjectCount: Int = 0
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        var i = 17
        val it = ReportData_Fields.iterator()
        while (true) {
            val i2 = i
            if (!it.hasNext()) {
                return i2
            }
            val reportData = it.next()
            i = reportData.OwnerName!!.size + reportData.TaskName!!.size + 37 + 1 + i2
        }
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleLandStatReply(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 422 (LandStatReply).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x01).toByte())
        byteBuffer.put((0xA6).toByte())
        packInt(byteBuffer, RequestData_Field.ReportType)
        packInt(byteBuffer, RequestData_Field.RequestFlags)
        packInt(byteBuffer, RequestData_Field.TotalObjectCount)
        byteBuffer.put((ReportData_Fields.size.toByte()))
        for (reportData in ReportData_Fields) {
            packInt(byteBuffer, reportData.TaskLocalID)
            packUUID(byteBuffer, reportData.TaskID)
            packFloat(byteBuffer, reportData.LocationX)
            packFloat(byteBuffer, reportData.LocationY)
            packFloat(byteBuffer, reportData.LocationZ)
            packFloat(byteBuffer, reportData.Score)
            packVariable(byteBuffer, reportData.TaskName, 1)
            packVariable(byteBuffer, reportData.OwnerName, 1)
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        RequestData_Field.ReportType = unpackInt(byteBuffer)
        RequestData_Field.RequestFlags = unpackInt(byteBuffer)
        RequestData_Field.TotalObjectCount = unpackInt(byteBuffer)
        var i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val reportData = ReportData()
            reportData.TaskLocalID = unpackInt(byteBuffer)
            reportData.TaskID = unpackUUID(byteBuffer)
            reportData.LocationX = unpackFloat(byteBuffer)
            reportData.LocationY = unpackFloat(byteBuffer)
            reportData.LocationZ = unpackFloat(byteBuffer)
            reportData.Score = unpackFloat(byteBuffer)
            reportData.TaskName = unpackVariable(byteBuffer, 1)
            reportData.OwnerName = unpackVariable(byteBuffer, 1)
            ReportData_Fields.add(reportData)
        }
    }
}
