package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * AgentWearablesUpdate
 * (a.k.a. "Here's what your avatar should be wearing now.")
 * dataserver -> userserver -> viewer
 * reliable
 * NEVER from viewer to sim
 *
 * <p>Template: {@code AgentWearablesUpdate Low 382 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class AgentWearablesUpdate extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<WearableData> WearableData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int SerialNum; // U32 - Increases every time the wearables change for a given agent.  Used to avoid processing out of order packets.
        public UUID SessionID; // LLUUID
    }

    /** Block WearableData, Variable. */
    public static class WearableData {
        public UUID AssetID; // LLUUID
        public UUID ItemID; // LLUUID
        public int WearableType; // U8 - LLWearable::EWearType
    }

    public AgentWearablesUpdate() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.WearableData_Fields.size() * 33) + 41;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAgentWearablesUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 382 (AgentWearablesUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x7E);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.AgentData_Field.SerialNum);
        byteBuffer.put((byte) this.WearableData_Fields.size());
        for (WearableData wearableData : this.WearableData_Fields) {
            packUUID(byteBuffer, wearableData.ItemID);
            packUUID(byteBuffer, wearableData.AssetID);
            packByte(byteBuffer, (byte) wearableData.WearableType);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.SerialNum = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            WearableData wearableData = new WearableData();
            wearableData.ItemID = unpackUUID(byteBuffer);
            wearableData.AssetID = unpackUUID(byteBuffer);
            wearableData.WearableType = unpackByte(byteBuffer) & 0xFF;
            this.WearableData_Fields.add(wearableData);
        }
    }
}
