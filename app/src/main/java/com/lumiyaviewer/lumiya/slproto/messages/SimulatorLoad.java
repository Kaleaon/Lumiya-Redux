package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;

/**
 * SimulatorLoad
 * simulator -> spaceserver
 * reliable
 *
 * <p>Template: {@code SimulatorLoad Low 12 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SimulatorLoad extends SLMessage {
    public ArrayList<AgentList> AgentList_Fields = new ArrayList<>();
    public SimulatorLoadData SimulatorLoadData_Field;

    /** Block AgentList, Variable. */
    public static class AgentList {
        public int CircuitCode; // U32
        public int X; // U8
        public int Y; // U8
    }

    public static class SimulatorLoadData {
        public int AgentCount; // S32
        public boolean CanAcceptAgents; // BOOL
        public float TimeDilation; // F32
    }

    public SimulatorLoad() {
        this.zeroCoded = false;
        this.SimulatorLoadData_Field = new SimulatorLoadData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.AgentList_Fields.size() * 6) + 14;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleSimulatorLoad(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 12 (SimulatorLoad).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x0C);
        packFloat(byteBuffer, this.SimulatorLoadData_Field.TimeDilation);
        packInt(byteBuffer, this.SimulatorLoadData_Field.AgentCount);
        packBoolean(byteBuffer, this.SimulatorLoadData_Field.CanAcceptAgents);
        byteBuffer.put((byte) this.AgentList_Fields.size());
        for (AgentList agentList : this.AgentList_Fields) {
            packInt(byteBuffer, agentList.CircuitCode);
            packByte(byteBuffer, (byte) agentList.X);
            packByte(byteBuffer, (byte) agentList.Y);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.SimulatorLoadData_Field.TimeDilation = unpackFloat(byteBuffer);
        this.SimulatorLoadData_Field.AgentCount = unpackInt(byteBuffer);
        this.SimulatorLoadData_Field.CanAcceptAgents = unpackBoolean(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            AgentList agentList = new AgentList();
            agentList.CircuitCode = unpackInt(byteBuffer);
            agentList.X = unpackByte(byteBuffer) & 0xFF;
            agentList.Y = unpackByte(byteBuffer) & 0xFF;
            this.AgentList_Fields.add(agentList);
        }
    }
}
