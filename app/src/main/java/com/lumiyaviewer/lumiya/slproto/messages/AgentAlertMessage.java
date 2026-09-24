package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Send an AlertMessage to the named agent.
 * usually dataserver->simulator
 *
 * <p>Template: {@code AgentAlertMessage Low 135 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_agent_alert_message()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AgentAlertMessage extends SLMessage {
    public AgentData AgentData_Field;
    public AlertData AlertData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block AlertData, Single. */
    public static class AlertData {
        public byte[] Message; // Variable 1
        public boolean Modal; // BOOL
    }

    public AgentAlertMessage() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.AlertData_Field = new AlertData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.AlertData_Field.Message.length + 2 + 20;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAgentAlertMessage(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 135 (AgentAlertMessage).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x87);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packBoolean(byteBuffer, this.AlertData_Field.Modal);
        packVariable(byteBuffer, this.AlertData_Field.Message, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AlertData_Field.Modal = unpackBoolean(byteBuffer);
        this.AlertData_Field.Message = unpackVariable(byteBuffer, 1);
    }
}
