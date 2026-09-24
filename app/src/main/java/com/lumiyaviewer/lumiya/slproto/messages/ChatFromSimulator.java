package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ChatFromSimulator
 * Chat text to appear on a user's screen
 * Position is region local.
 * Viewer can optionally use position to animate
 * If audible is CHAT_NOT_AUDIBLE, message will not be valid
 *
 * <p>Template: {@code ChatFromSimulator Low 139 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_chat_from_simulator()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ChatFromSimulator extends SLMessage {
    public ChatData ChatData_Field;

    /** Block ChatData, Single. */
    public static class ChatData {
        public int Audible; // U8
        public int ChatType; // U8
        public byte[] FromName; // Variable 1
        public byte[] Message; // Variable 2 - UTF-8 text
        public UUID OwnerID; // LLUUID - object's owner
        public LLVector3 Position; // LLVector3
        public UUID SourceID; // LLUUID - agent id or object id
        public int SourceType; // U8
    }

    public ChatFromSimulator() {
        this.zeroCoded = false;
        this.ChatData_Field = new ChatData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ChatData_Field.FromName.length + 1 + 16 + 16 + 1 + 1 + 1 + 12 + 2 + this.ChatData_Field.Message.length + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleChatFromSimulator(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 139 (ChatFromSimulator).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x8B);
        packVariable(byteBuffer, this.ChatData_Field.FromName, 1);
        packUUID(byteBuffer, this.ChatData_Field.SourceID);
        packUUID(byteBuffer, this.ChatData_Field.OwnerID);
        packByte(byteBuffer, (byte) this.ChatData_Field.SourceType);
        packByte(byteBuffer, (byte) this.ChatData_Field.ChatType);
        packByte(byteBuffer, (byte) this.ChatData_Field.Audible);
        packLLVector3(byteBuffer, this.ChatData_Field.Position);
        packVariable(byteBuffer, this.ChatData_Field.Message, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ChatData_Field.FromName = unpackVariable(byteBuffer, 1);
        this.ChatData_Field.SourceID = unpackUUID(byteBuffer);
        this.ChatData_Field.OwnerID = unpackUUID(byteBuffer);
        this.ChatData_Field.SourceType = unpackByte(byteBuffer) & 0xFF;
        this.ChatData_Field.ChatType = unpackByte(byteBuffer) & 0xFF;
        this.ChatData_Field.Audible = unpackByte(byteBuffer) & 0xFF;
        this.ChatData_Field.Position = unpackLLVector3(byteBuffer);
        this.ChatData_Field.Message = unpackVariable(byteBuffer, 2);
    }
}
