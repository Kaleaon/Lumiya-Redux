package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * end uuid to name lookup
 * Simulator to Simulator Messages
 * ChatPass
 * Chat message transmission to neighbors
 * Chat is region local to receiving simulator.
 * Type is one of CHAT_TYPE_NORMAL, _WHISPER, _SHOUT
 *
 * <p>Template: {@code ChatPass Low 239 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ChatPass extends SLMessage {
    public ChatData ChatData_Field;

    /** Block ChatData, Single. */
    public static class ChatData {
        public int Channel; // S32
        public UUID ID; // LLUUID
        public byte[] Message; // Variable 2
        public byte[] Name; // Variable 1
        public UUID OwnerID; // LLUUID
        public LLVector3 Position; // LLVector3
        public float Radius; // F32
        public int SimAccess; // U8
        public int SourceType; // U8
        public int Type; // U8
    }

    public ChatPass() {
        this.zeroCoded = true;
        this.ChatData_Field = new ChatData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ChatData_Field.Name.length + 49 + 1 + 1 + 4 + 1 + 2 + this.ChatData_Field.Message.length + 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleChatPass(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 239 (ChatPass).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xEF);
        packInt(byteBuffer, this.ChatData_Field.Channel);
        packLLVector3(byteBuffer, this.ChatData_Field.Position);
        packUUID(byteBuffer, this.ChatData_Field.ID);
        packUUID(byteBuffer, this.ChatData_Field.OwnerID);
        packVariable(byteBuffer, this.ChatData_Field.Name, 1);
        packByte(byteBuffer, (byte) this.ChatData_Field.SourceType);
        packByte(byteBuffer, (byte) this.ChatData_Field.Type);
        packFloat(byteBuffer, this.ChatData_Field.Radius);
        packByte(byteBuffer, (byte) this.ChatData_Field.SimAccess);
        packVariable(byteBuffer, this.ChatData_Field.Message, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ChatData_Field.Channel = unpackInt(byteBuffer);
        this.ChatData_Field.Position = unpackLLVector3(byteBuffer);
        this.ChatData_Field.ID = unpackUUID(byteBuffer);
        this.ChatData_Field.OwnerID = unpackUUID(byteBuffer);
        this.ChatData_Field.Name = unpackVariable(byteBuffer, 1);
        this.ChatData_Field.SourceType = unpackByte(byteBuffer) & 0xFF;
        this.ChatData_Field.Type = unpackByte(byteBuffer) & 0xFF;
        this.ChatData_Field.Radius = unpackFloat(byteBuffer);
        this.ChatData_Field.SimAccess = unpackByte(byteBuffer) & 0xFF;
        this.ChatData_Field.Message = unpackVariable(byteBuffer, 2);
    }
}
