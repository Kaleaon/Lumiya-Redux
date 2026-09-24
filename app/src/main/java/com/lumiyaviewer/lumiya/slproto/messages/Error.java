package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Generic Error -- this is used for sending an error message
 * to a UDP recipient. The lowest common denominator is to at least
 * log the message. More sophisticated receivers can do something
 * smarter, for example, a money transaction failure can put up a
 * more user visible UI widget.
 *
 * <p>Template: {@code Error Low 423 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLMessageSystem::processError()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class Error extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID - will forward to agentid if coming from trusted circuit
    }

    /** Block Data, Single. */
    public static class Data {
        public int Code; // S32 - matches http status codes
        public byte[] Data; // Variable 2 - Binary serialized LLSD for extra info.
        public UUID ID; // LLUUID - the transactionid/uniqueid/sessionid whatever.
        public byte[] Message; // Variable 2 - Human readable message
        public byte[] System; // Variable 1 - The hierarchical path to the system, eg, "message/handler"
        public byte[] Token; // Variable 1 - some specific short string based message
    }

    public Error() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Data_Field.Token.length + 5 + 16 + 1 + this.Data_Field.System.length + 2 + this.Data_Field.Message.length + 2 + this.Data_Field.Data.length + 20;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleError(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 423 (Error).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0xA7);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packInt(byteBuffer, this.Data_Field.Code);
        packVariable(byteBuffer, this.Data_Field.Token, 1);
        packUUID(byteBuffer, this.Data_Field.ID);
        packVariable(byteBuffer, this.Data_Field.System, 1);
        packVariable(byteBuffer, this.Data_Field.Message, 2);
        packVariable(byteBuffer, this.Data_Field.Data, 2);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.Data_Field.Code = unpackInt(byteBuffer);
        this.Data_Field.Token = unpackVariable(byteBuffer, 1);
        this.Data_Field.ID = unpackUUID(byteBuffer);
        this.Data_Field.System = unpackVariable(byteBuffer, 1);
        this.Data_Field.Message = unpackVariable(byteBuffer, 2);
        this.Data_Field.Data = unpackVariable(byteBuffer, 2);
    }
}
