package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ParcelPropertiesUpdate
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelPropertiesUpdate Low 198 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ParcelPropertiesUpdate extends SLMessage {
    public AgentData AgentData_Field;
    public ParcelData ParcelData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ParcelData, Single. */
    public static class ParcelData {
        public UUID AuthBuyerID; // LLUUID
        public int Category; // U8
        public byte[] Desc; // Variable 1 - string
        public int Flags; // U32
        public UUID GroupID; // LLUUID
        public int LandingType; // U8
        public int LocalID; // S32
        public int MediaAutoScale; // U8
        public UUID MediaID; // LLUUID
        public byte[] MediaURL; // Variable 1 - string
        public byte[] MusicURL; // Variable 1 - string
        public byte[] Name; // Variable 1 - string
        public int ParcelFlags; // U32
        public float PassHours; // F32
        public int PassPrice; // S32
        public int SalePrice; // S32
        public UUID SnapshotID; // LLUUID
        public LLVector3 UserLocation; // LLVector3
        public LLVector3 UserLookAt; // LLVector3
    }

    public ParcelPropertiesUpdate() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.ParcelData_Field = new ParcelData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ParcelData_Field.Name.length + 17 + 1 + this.ParcelData_Field.Desc.length + 1 + this.ParcelData_Field.MusicURL.length + 1 + this.ParcelData_Field.MediaURL.length + 16 + 1 + 16 + 4 + 4 + 1 + 16 + 16 + 12 + 12 + 1 + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleParcelPropertiesUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 198 (ParcelPropertiesUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xC6);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.ParcelData_Field.LocalID);
        packInt(byteBuffer, this.ParcelData_Field.Flags);
        packInt(byteBuffer, this.ParcelData_Field.ParcelFlags);
        packInt(byteBuffer, this.ParcelData_Field.SalePrice);
        packVariable(byteBuffer, this.ParcelData_Field.Name, 1);
        packVariable(byteBuffer, this.ParcelData_Field.Desc, 1);
        packVariable(byteBuffer, this.ParcelData_Field.MusicURL, 1);
        packVariable(byteBuffer, this.ParcelData_Field.MediaURL, 1);
        packUUID(byteBuffer, this.ParcelData_Field.MediaID);
        packByte(byteBuffer, (byte) this.ParcelData_Field.MediaAutoScale);
        packUUID(byteBuffer, this.ParcelData_Field.GroupID);
        packInt(byteBuffer, this.ParcelData_Field.PassPrice);
        packFloat(byteBuffer, this.ParcelData_Field.PassHours);
        packByte(byteBuffer, (byte) this.ParcelData_Field.Category);
        packUUID(byteBuffer, this.ParcelData_Field.AuthBuyerID);
        packUUID(byteBuffer, this.ParcelData_Field.SnapshotID);
        packLLVector3(byteBuffer, this.ParcelData_Field.UserLocation);
        packLLVector3(byteBuffer, this.ParcelData_Field.UserLookAt);
        packByte(byteBuffer, (byte) this.ParcelData_Field.LandingType);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ParcelData_Field.LocalID = unpackInt(byteBuffer);
        this.ParcelData_Field.Flags = unpackInt(byteBuffer);
        this.ParcelData_Field.ParcelFlags = unpackInt(byteBuffer);
        this.ParcelData_Field.SalePrice = unpackInt(byteBuffer);
        this.ParcelData_Field.Name = unpackVariable(byteBuffer, 1);
        this.ParcelData_Field.Desc = unpackVariable(byteBuffer, 1);
        this.ParcelData_Field.MusicURL = unpackVariable(byteBuffer, 1);
        this.ParcelData_Field.MediaURL = unpackVariable(byteBuffer, 1);
        this.ParcelData_Field.MediaID = unpackUUID(byteBuffer);
        this.ParcelData_Field.MediaAutoScale = unpackByte(byteBuffer) & 0xFF;
        this.ParcelData_Field.GroupID = unpackUUID(byteBuffer);
        this.ParcelData_Field.PassPrice = unpackInt(byteBuffer);
        this.ParcelData_Field.PassHours = unpackFloat(byteBuffer);
        this.ParcelData_Field.Category = unpackByte(byteBuffer) & 0xFF;
        this.ParcelData_Field.AuthBuyerID = unpackUUID(byteBuffer);
        this.ParcelData_Field.SnapshotID = unpackUUID(byteBuffer);
        this.ParcelData_Field.UserLocation = unpackLLVector3(byteBuffer);
        this.ParcelData_Field.UserLookAt = unpackLLVector3(byteBuffer);
        this.ParcelData_Field.LandingType = unpackByte(byteBuffer) & 0xFF;
    }
}
