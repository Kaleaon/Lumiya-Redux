package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * GroupNoticesListReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code GroupNoticesListReply Low 59 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelGroupNotices::processGroupNoticesListReply()} in indra/newview/llpanelgroupnotices.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class GroupNoticesListReply extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<Data> Data_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID GroupID; // LLUUID
    }

    /** Block Data, Variable. */
    public static class Data {
        public int AssetType; // U8
        public byte[] FromName; // Variable 2
        public boolean HasAttachment; // BOOL
        public UUID NoticeID; // LLUUID
        public byte[] Subject; // Variable 2
        public int Timestamp; // U32
    }

    public GroupNoticesListReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 37;
        Iterator<?> it = this.Data_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            Data data = (Data) it.next();
            i = data.Subject.length + data.FromName.length + 22 + 2 + 1 + 1 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleGroupNoticesListReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 59 (GroupNoticesListReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x3B);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.GroupID);
        byteBuffer.put((byte) this.Data_Fields.size());
        for (Data data : this.Data_Fields) {
            packUUID(byteBuffer, data.NoticeID);
            packInt(byteBuffer, data.Timestamp);
            packVariable(byteBuffer, data.FromName, 2);
            packVariable(byteBuffer, data.Subject, 2);
            packBoolean(byteBuffer, data.HasAttachment);
            packByte(byteBuffer, (byte) data.AssetType);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.GroupID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            Data data = new Data();
            data.NoticeID = unpackUUID(byteBuffer);
            data.Timestamp = unpackInt(byteBuffer);
            data.FromName = unpackVariable(byteBuffer, 2);
            data.Subject = unpackVariable(byteBuffer, 2);
            data.HasAttachment = unpackBoolean(byteBuffer);
            data.AssetType = unpackByte(byteBuffer) & 0xFF;
            this.Data_Fields.add(data);
        }
    }
}
