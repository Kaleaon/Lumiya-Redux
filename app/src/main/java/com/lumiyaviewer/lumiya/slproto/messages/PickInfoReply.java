package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * PickInfoReply
 * dataserver -> simulator
 * simulator -> viewer
 * reliable
 *
 * <p>Template: {@code PickInfoReply Low 184 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAvatarPropertiesProcessor::processPickInfoReply()} in indra/newview/llavatarpropertiesprocessor.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class PickInfoReply extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public UUID CreatorID; // LLUUID
        public byte[] Desc; // Variable 2
        public boolean Enabled; // BOOL
        public byte[] Name; // Variable 1
        public byte[] OriginalName; // Variable 1
        public UUID ParcelID; // LLUUID
        public UUID PickID; // LLUUID
        public LLVector3d PosGlobal; // LLVector3d
        public byte[] SimName; // Variable 1
        public UUID SnapshotID; // LLUUID
        public int SortOrder; // S32
        public boolean TopPick; // BOOL
        public byte[] User; // Variable 1
    }

    public PickInfoReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Data_Field.Name.length + 50 + 2 + this.Data_Field.Desc.length + 16 + 1 + this.Data_Field.User.length + 1 + this.Data_Field.OriginalName.length + 1 + this.Data_Field.SimName.length + 24 + 4 + 1 + 20;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandlePickInfoReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 184 (PickInfoReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xB8);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.Data_Field.PickID);
        packUUID(byteBuffer, this.Data_Field.CreatorID);
        packBoolean(byteBuffer, this.Data_Field.TopPick);
        packUUID(byteBuffer, this.Data_Field.ParcelID);
        packVariable(byteBuffer, this.Data_Field.Name, 1);
        packVariable(byteBuffer, this.Data_Field.Desc, 2);
        packUUID(byteBuffer, this.Data_Field.SnapshotID);
        packVariable(byteBuffer, this.Data_Field.User, 1);
        packVariable(byteBuffer, this.Data_Field.OriginalName, 1);
        packVariable(byteBuffer, this.Data_Field.SimName, 1);
        packLLVector3d(byteBuffer, this.Data_Field.PosGlobal);
        packInt(byteBuffer, this.Data_Field.SortOrder);
        packBoolean(byteBuffer, this.Data_Field.Enabled);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.Data_Field.PickID = unpackUUID(byteBuffer);
        this.Data_Field.CreatorID = unpackUUID(byteBuffer);
        this.Data_Field.TopPick = unpackBoolean(byteBuffer);
        this.Data_Field.ParcelID = unpackUUID(byteBuffer);
        this.Data_Field.Name = unpackVariable(byteBuffer, 1);
        this.Data_Field.Desc = unpackVariable(byteBuffer, 2);
        this.Data_Field.SnapshotID = unpackUUID(byteBuffer);
        this.Data_Field.User = unpackVariable(byteBuffer, 1);
        this.Data_Field.OriginalName = unpackVariable(byteBuffer, 1);
        this.Data_Field.SimName = unpackVariable(byteBuffer, 1);
        this.Data_Field.PosGlobal = unpackLLVector3d(byteBuffer);
        this.Data_Field.SortOrder = unpackInt(byteBuffer);
        this.Data_Field.Enabled = unpackBoolean(byteBuffer);
    }
}
