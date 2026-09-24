package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ChatFromViewer
 * Specifies the text to be said and the "type",
 * normal speech, shout, whisper.
 * with the specified radius
 *
 * <p>Template: {@code ChatFromViewer Low 80 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ChatFromViewer extends SLMessage {
    public AgentData AgentData_Field;
    public ChatData ChatData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ChatData, Single. */
    public static class ChatData {
        public int Channel; // S32
        public byte[] Message; // Variable 2
        public int Type; // U8
    }

    public ChatFromViewer() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.ChatData_Field = new ChatData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ChatData_Field.Message.length + 2 + 1 + 4 + 36;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleChatFromViewer(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 80 (ChatFromViewer).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x50);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packVariable(byteBuffer, this.ChatData_Field.Message, 2);
        packByte(byteBuffer, (byte) this.ChatData_Field.Type);
        packInt(byteBuffer, this.ChatData_Field.Channel);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ChatData_Field.Message = unpackVariable(byteBuffer, 2);
        this.ChatData_Field.Type = unpackByte(byteBuffer) & 0xFF;
        this.ChatData_Field.Channel = unpackInt(byteBuffer);
    }
}
