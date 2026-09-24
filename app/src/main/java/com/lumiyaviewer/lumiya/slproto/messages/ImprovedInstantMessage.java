package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Instant Message
 * ImprovedInstantMessage
 * This message can potentially route all over the place
 * ParentEstateID: parent estate id of the source estate
 * RegionID: region id of the source of the IM.
 * Position: position of the sender in region local coordinates
 * Dialog   see llinstantmessage.h for values
 * ID       May be used by dialog. Interpretation depends on context.
 * BinaryBucket May be used by some dialog types
 * reliable
 *
 * <p>Template: {@code ImprovedInstantMessage Low 254 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_improved_im()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ImprovedInstantMessage extends SLMessage {
    public AgentData AgentData_Field;
    public MessageBlock MessageBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block MessageBlock, Single. */
    public static class MessageBlock {
        public byte[] BinaryBucket; // Variable 2
        public int Dialog; // U8 - IM type
        public byte[] FromAgentName; // Variable 1
        public boolean FromGroup; // BOOL
        public UUID ID; // LLUUID
        public byte[] Message; // Variable 2
        public int Offline; // U8
        public int ParentEstateID; // U32
        public LLVector3 Position; // LLVector3
        public UUID RegionID; // LLUUID
        public int Timestamp; // U32
        public UUID ToAgentID; // LLUUID
    }

    public ImprovedInstantMessage() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.MessageBlock_Field = new MessageBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.MessageBlock_Field.FromAgentName.length + 72 + 2 + this.MessageBlock_Field.Message.length + 2 + this.MessageBlock_Field.BinaryBucket.length + 36;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleImprovedInstantMessage(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 254 (ImprovedInstantMessage).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xFE);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packBoolean(byteBuffer, this.MessageBlock_Field.FromGroup);
        packUUID(byteBuffer, this.MessageBlock_Field.ToAgentID);
        packInt(byteBuffer, this.MessageBlock_Field.ParentEstateID);
        packUUID(byteBuffer, this.MessageBlock_Field.RegionID);
        packLLVector3(byteBuffer, this.MessageBlock_Field.Position);
        packByte(byteBuffer, (byte) this.MessageBlock_Field.Offline);
        packByte(byteBuffer, (byte) this.MessageBlock_Field.Dialog);
        packUUID(byteBuffer, this.MessageBlock_Field.ID);
        packInt(byteBuffer, this.MessageBlock_Field.Timestamp);
        packVariable(byteBuffer, this.MessageBlock_Field.FromAgentName, 1);
        packVariable(byteBuffer, this.MessageBlock_Field.Message, 2);
        packVariable(byteBuffer, this.MessageBlock_Field.BinaryBucket, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.MessageBlock_Field.FromGroup = unpackBoolean(byteBuffer);
        this.MessageBlock_Field.ToAgentID = unpackUUID(byteBuffer);
        this.MessageBlock_Field.ParentEstateID = unpackInt(byteBuffer);
        this.MessageBlock_Field.RegionID = unpackUUID(byteBuffer);
        this.MessageBlock_Field.Position = unpackLLVector3(byteBuffer);
        this.MessageBlock_Field.Offline = unpackByte(byteBuffer) & 0xFF;
        this.MessageBlock_Field.Dialog = unpackByte(byteBuffer) & 0xFF;
        this.MessageBlock_Field.ID = unpackUUID(byteBuffer);
        this.MessageBlock_Field.Timestamp = unpackInt(byteBuffer);
        this.MessageBlock_Field.FromAgentName = unpackVariable(byteBuffer, 1);
        this.MessageBlock_Field.Message = unpackVariable(byteBuffer, 2);
        this.MessageBlock_Field.BinaryBucket = unpackVariable(byteBuffer, 2);
    }
}
