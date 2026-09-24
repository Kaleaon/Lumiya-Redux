package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ClassifiedInfoUpdate
 * Update a classified.  ParcelID and EstateID are set
 * on the simulator as the message passes through.
 * viewer -> simulator -> dataserver
 * reliable
 *
 * <p>Template: {@code ClassifiedInfoUpdate Low 45 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class ClassifiedInfoUpdate extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public int Category; // U32
        public int ClassifiedFlags; // U8
        public UUID ClassifiedID; // LLUUID
        public byte[] Desc; // Variable 2
        public byte[] Name; // Variable 1
        public UUID ParcelID; // LLUUID
        public int ParentEstate; // U32
        public LLVector3d PosGlobal; // LLVector3d
        public int PriceForListing; // S32
        public UUID SnapshotID; // LLUUID
    }

    public ClassifiedInfoUpdate() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Data_Field.Name.length + 21 + 2 + this.Data_Field.Desc.length + 16 + 4 + 16 + 24 + 1 + 4 + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleClassifiedInfoUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 45 (ClassifiedInfoUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x2D);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.Data_Field.ClassifiedID);
        packInt(byteBuffer, this.Data_Field.Category);
        packVariable(byteBuffer, this.Data_Field.Name, 1);
        packVariable(byteBuffer, this.Data_Field.Desc, 2);
        packUUID(byteBuffer, this.Data_Field.ParcelID);
        packInt(byteBuffer, this.Data_Field.ParentEstate);
        packUUID(byteBuffer, this.Data_Field.SnapshotID);
        packLLVector3d(byteBuffer, this.Data_Field.PosGlobal);
        packByte(byteBuffer, (byte) this.Data_Field.ClassifiedFlags);
        packInt(byteBuffer, this.Data_Field.PriceForListing);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Data_Field.ClassifiedID = unpackUUID(byteBuffer);
        this.Data_Field.Category = unpackInt(byteBuffer);
        this.Data_Field.Name = unpackVariable(byteBuffer, 1);
        this.Data_Field.Desc = unpackVariable(byteBuffer, 2);
        this.Data_Field.ParcelID = unpackUUID(byteBuffer);
        this.Data_Field.ParentEstate = unpackInt(byteBuffer);
        this.Data_Field.SnapshotID = unpackUUID(byteBuffer);
        this.Data_Field.PosGlobal = unpackLLVector3d(byteBuffer);
        this.Data_Field.ClassifiedFlags = unpackByte(byteBuffer) & 0xFF;
        this.Data_Field.PriceForListing = unpackInt(byteBuffer);
    }
}
