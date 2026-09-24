package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Postcard messages
 * reliable
 *
 * <p>Template: {@code SendPostcard Low 412 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SendPostcard extends SLMessage {
    public AgentData AgentData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public boolean AllowPublish; // BOOL - Allow publishing on the web.
        public UUID AssetID; // LLUUID
        public byte[] From; // Variable 1 - src email address(es)
        public boolean MaturePublish; // BOOL - profile is "mature"
        public byte[] Msg; // Variable 2 - message text
        public byte[] Name; // Variable 1 - src name
        public LLVector3d PosGlobal; // LLVector3d - Where snapshot was taken
        public UUID SessionID; // LLUUID
        public byte[] Subject; // Variable 1 - mail subject
        public byte[] To; // Variable 1 - dest email address(es)
    }

    public SendPostcard() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.AgentData_Field.To.length + 73 + 1 + this.AgentData_Field.From.length + 1 + this.AgentData_Field.Name.length + 1 + this.AgentData_Field.Subject.length + 2 + this.AgentData_Field.Msg.length + 1 + 1 + 4;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleSendPostcard(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 412 (SendPostcard).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x9C);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentData_Field.AssetID);
        packLLVector3d(byteBuffer, this.AgentData_Field.PosGlobal);
        packVariable(byteBuffer, this.AgentData_Field.To, 1);
        packVariable(byteBuffer, this.AgentData_Field.From, 1);
        packVariable(byteBuffer, this.AgentData_Field.Name, 1);
        packVariable(byteBuffer, this.AgentData_Field.Subject, 1);
        packVariable(byteBuffer, this.AgentData_Field.Msg, 2);
        packBoolean(byteBuffer, this.AgentData_Field.AllowPublish);
        packBoolean(byteBuffer, this.AgentData_Field.MaturePublish);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.AssetID = unpackUUID(byteBuffer);
        this.AgentData_Field.PosGlobal = unpackLLVector3d(byteBuffer);
        this.AgentData_Field.To = unpackVariable(byteBuffer, 1);
        this.AgentData_Field.From = unpackVariable(byteBuffer, 1);
        this.AgentData_Field.Name = unpackVariable(byteBuffer, 1);
        this.AgentData_Field.Subject = unpackVariable(byteBuffer, 1);
        this.AgentData_Field.Msg = unpackVariable(byteBuffer, 2);
        this.AgentData_Field.AllowPublish = unpackBoolean(byteBuffer);
        this.AgentData_Field.MaturePublish = unpackBoolean(byteBuffer);
    }
}
