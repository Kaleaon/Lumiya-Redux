package com.lumiyaviewer.lumiya.slproto.messages

import com.lumiyaviewer.lumiya.slproto.SLMessage
import java.nio.ByteBuffer
import java.util.ArrayList

/**
 * SimulatorLoad
 * simulator -> spaceserver
 * reliable
 *
 * <p>Template: {@code SimulatorLoad Low 12 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
open class SimulatorLoad : SLMessage() {
    @JvmField val AgentList_Fields = ArrayList<AgentList>()
    @JvmField var SimulatorLoadData_Field: SimulatorLoadData = SimulatorLoadData()

    /** Block AgentList, Variable. */
    open class AgentList {
        @JvmField var CircuitCode: Int = 0
        @JvmField var X: Int = 0
        @JvmField var Y: Int = 0
    }

    open class SimulatorLoadData {
        @JvmField var AgentCount: Int = 0
        @JvmField var CanAcceptAgents: Boolean = false
        @JvmField var TimeDilation: Float = 0f
    }

    init {
        zeroCoded = false
    }

    override fun CalcPayloadSize(): Int {
        return (AgentList_Fields.size * 6) + 14
    }

    override fun Handle(messageHandler: SLMessageHandler) {
        messageHandler.HandleSimulatorLoad(this)
    }

    override fun PackPayload(byteBuffer: ByteBuffer) {
        // Message number: Low 12 (SimulatorLoad).
        byteBuffer.putShort(0xFFFF.toShort())
        byteBuffer.put((0x00).toByte())
        byteBuffer.put((0x0C).toByte())
        packFloat(byteBuffer, SimulatorLoadData_Field.TimeDilation)
        packInt(byteBuffer, SimulatorLoadData_Field.AgentCount)
        packBoolean(byteBuffer, SimulatorLoadData_Field.CanAcceptAgents)
        byteBuffer.put((AgentList_Fields.size.toByte()))
        for (agentList in AgentList_Fields) {
            packInt(byteBuffer, agentList.CircuitCode)
            packByte(byteBuffer, (agentList.X).toByte())
            packByte(byteBuffer, (agentList.Y).toByte())
        }
    }

    override fun UnpackPayload(byteBuffer: ByteBuffer) {
        SimulatorLoadData_Field.TimeDilation = unpackFloat(byteBuffer)
        SimulatorLoadData_Field.AgentCount = unpackInt(byteBuffer)
        SimulatorLoadData_Field.CanAcceptAgents = unpackBoolean(byteBuffer)
        val i = (byteBuffer.get().toInt() and 0xFF)
        repeat(i) {
            val agentList = AgentList()
            agentList.CircuitCode = unpackInt(byteBuffer)
            agentList.X = unpackByte(byteBuffer).toInt() and 0xFF
            agentList.Y = unpackByte(byteBuffer).toInt() and 0xFF
            AgentList_Fields.add(agentList)
        }
    }
}
