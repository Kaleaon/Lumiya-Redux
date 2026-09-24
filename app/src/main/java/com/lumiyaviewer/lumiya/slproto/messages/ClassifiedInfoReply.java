package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ClassifiedInfoReply
 * dataserver -> simulator
 * simulator -> viewer
 * reliable
 *
 * <p>Template: {@code ClassifiedInfoReply Low 44 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAvatarPropertiesProcessor::processClassifiedInfoReply()} in indra/newview/llavatarpropertiesprocessor.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ClassifiedInfoReply extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public int Category; // U32
        public int ClassifiedFlags; // U8
        public UUID ClassifiedID; // LLUUID
        public int CreationDate; // U32
        public UUID CreatorID; // LLUUID
        public byte[] Desc; // Variable 2
        public int ExpirationDate; // U32
        public byte[] Name; // Variable 1
        public UUID ParcelID; // LLUUID
        public byte[] ParcelName; // Variable 1
        public int ParentEstate; // U32
        public LLVector3d PosGlobal; // LLVector3d
        public int PriceForListing; // S32
        public byte[] SimName; // Variable 1
        public UUID SnapshotID; // LLUUID
    }

    public ClassifiedInfoReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Data_Field.Name.length + 45 + 2 + this.Data_Field.Desc.length + 16 + 4 + 16 + 1 + this.Data_Field.SimName.length + 24 + 1 + this.Data_Field.ParcelName.length + 1 + 4 + 20;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleClassifiedInfoReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 44 (ClassifiedInfoReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x2C);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.Data_Field.ClassifiedID);
        packUUID(byteBuffer, this.Data_Field.CreatorID);
        packInt(byteBuffer, this.Data_Field.CreationDate);
        packInt(byteBuffer, this.Data_Field.ExpirationDate);
        packInt(byteBuffer, this.Data_Field.Category);
        packVariable(byteBuffer, this.Data_Field.Name, 1);
        packVariable(byteBuffer, this.Data_Field.Desc, 2);
        packUUID(byteBuffer, this.Data_Field.ParcelID);
        packInt(byteBuffer, this.Data_Field.ParentEstate);
        packUUID(byteBuffer, this.Data_Field.SnapshotID);
        packVariable(byteBuffer, this.Data_Field.SimName, 1);
        packLLVector3d(byteBuffer, this.Data_Field.PosGlobal);
        packVariable(byteBuffer, this.Data_Field.ParcelName, 1);
        packByte(byteBuffer, (byte) this.Data_Field.ClassifiedFlags);
        packInt(byteBuffer, this.Data_Field.PriceForListing);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.Data_Field.ClassifiedID = unpackUUID(byteBuffer);
        this.Data_Field.CreatorID = unpackUUID(byteBuffer);
        this.Data_Field.CreationDate = unpackInt(byteBuffer);
        this.Data_Field.ExpirationDate = unpackInt(byteBuffer);
        this.Data_Field.Category = unpackInt(byteBuffer);
        this.Data_Field.Name = unpackVariable(byteBuffer, 1);
        this.Data_Field.Desc = unpackVariable(byteBuffer, 2);
        this.Data_Field.ParcelID = unpackUUID(byteBuffer);
        this.Data_Field.ParentEstate = unpackInt(byteBuffer);
        this.Data_Field.SnapshotID = unpackUUID(byteBuffer);
        this.Data_Field.SimName = unpackVariable(byteBuffer, 1);
        this.Data_Field.PosGlobal = unpackLLVector3d(byteBuffer);
        this.Data_Field.ParcelName = unpackVariable(byteBuffer, 1);
        this.Data_Field.ClassifiedFlags = unpackByte(byteBuffer) & 0xFF;
        this.Data_Field.PriceForListing = unpackInt(byteBuffer);
    }
}
