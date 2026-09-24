package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * StartLure viewer->sim
 * Sent from viewer to the local simulator to lure target id to near
 * agent id. This will generate an instant message that will be routed
 * through the space server and out to the userserver. When that IM
 * goes through the userserver and the TargetID is online, the
 * userserver will send an InitializeLure to the spaceserver. When that
 * packet is acked, the original instant message is finally forwarded to
 * TargetID.
 *
 * <p>Template: {@code StartLure Low 70 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class StartLure extends SLMessage {
    public AgentData AgentData_Field;
    public Info Info_Field;
    public ArrayList<TargetData> TargetData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Info, Single. */
    public static class Info {
        public int LureType; // U8
        public byte[] Message; // Variable 1
    }

    /** Block TargetData, Variable. */
    public static class TargetData {
        public UUID TargetID; // LLUUID
    }

    public StartLure() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Info_Field = new Info();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Info_Field.Message.length + 2 + 36 + 1 + (this.TargetData_Fields.size() * 16);
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleStartLure(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 70 (StartLure).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x46);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packByte(byteBuffer, (byte) this.Info_Field.LureType);
        packVariable(byteBuffer, this.Info_Field.Message, 1);
        byteBuffer.put((byte) this.TargetData_Fields.size());
        Iterator<?> it = this.TargetData_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((TargetData) it.next()).TargetID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Info_Field.LureType = unpackByte(byteBuffer) & 0xFF;
        this.Info_Field.Message = unpackVariable(byteBuffer, 1);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            TargetData targetData = new TargetData();
            targetData.TargetID = unpackUUID(byteBuffer);
            this.TargetData_Fields.add(targetData);
        }
    }
}
