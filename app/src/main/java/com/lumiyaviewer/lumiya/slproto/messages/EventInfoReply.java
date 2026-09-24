package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3d;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * EventInfoReply
 * dataserver -> simulator
 * simulator -> viewer
 * reliable
 *
 * <p>Template: {@code EventInfoReply Low 180 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLEventNotifier::processEventInfoReply()} in indra/newview/lleventnotifier.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class EventInfoReply extends SLMessage {
    public AgentData AgentData_Field;
    public EventData EventData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block EventData, Single. */
    public static class EventData {
        public int Amount; // U32
        public byte[] Category; // Variable 1
        public int Cover; // U32
        public byte[] Creator; // Variable 1
        public byte[] Date; // Variable 1
        public int DateUTC; // U32
        public byte[] Desc; // Variable 2
        public int Duration; // U32
        public int EventFlags; // U32
        public int EventID; // U32
        public LLVector3d GlobalPos; // LLVector3d
        public byte[] Name; // Variable 1
        public byte[] SimName; // Variable 1
    }

    public EventInfoReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.EventData_Field = new EventData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.EventData_Field.Creator.length + 5 + 1 + this.EventData_Field.Name.length + 1 + this.EventData_Field.Category.length + 2 + this.EventData_Field.Desc.length + 1 + this.EventData_Field.Date.length + 4 + 4 + 4 + 4 + 1 + this.EventData_Field.SimName.length + 24 + 4 + 20;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleEventInfoReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 180 (EventInfoReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xB4);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packInt(byteBuffer, this.EventData_Field.EventID);
        packVariable(byteBuffer, this.EventData_Field.Creator, 1);
        packVariable(byteBuffer, this.EventData_Field.Name, 1);
        packVariable(byteBuffer, this.EventData_Field.Category, 1);
        packVariable(byteBuffer, this.EventData_Field.Desc, 2);
        packVariable(byteBuffer, this.EventData_Field.Date, 1);
        packInt(byteBuffer, this.EventData_Field.DateUTC);
        packInt(byteBuffer, this.EventData_Field.Duration);
        packInt(byteBuffer, this.EventData_Field.Cover);
        packInt(byteBuffer, this.EventData_Field.Amount);
        packVariable(byteBuffer, this.EventData_Field.SimName, 1);
        packLLVector3d(byteBuffer, this.EventData_Field.GlobalPos);
        packInt(byteBuffer, this.EventData_Field.EventFlags);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.EventData_Field.EventID = unpackInt(byteBuffer);
        this.EventData_Field.Creator = unpackVariable(byteBuffer, 1);
        this.EventData_Field.Name = unpackVariable(byteBuffer, 1);
        this.EventData_Field.Category = unpackVariable(byteBuffer, 1);
        this.EventData_Field.Desc = unpackVariable(byteBuffer, 2);
        this.EventData_Field.Date = unpackVariable(byteBuffer, 1);
        this.EventData_Field.DateUTC = unpackInt(byteBuffer);
        this.EventData_Field.Duration = unpackInt(byteBuffer);
        this.EventData_Field.Cover = unpackInt(byteBuffer);
        this.EventData_Field.Amount = unpackInt(byteBuffer);
        this.EventData_Field.SimName = unpackVariable(byteBuffer, 1);
        this.EventData_Field.GlobalPos = unpackLLVector3d(byteBuffer);
        this.EventData_Field.EventFlags = unpackInt(byteBuffer);
    }
}
