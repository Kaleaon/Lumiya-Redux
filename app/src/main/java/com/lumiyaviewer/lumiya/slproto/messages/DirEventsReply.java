package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * DirEventsReply
 *
 * <p>Template: {@code DirEventsReply Low 37 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelDirBrowser::processDirEventsReply()} in indra/newview/llpaneldirbrowser.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class DirEventsReply extends SLMessage {
    public AgentData AgentData_Field;
    public QueryData QueryData_Field;
    public ArrayList<QueryReplies> QueryReplies_Fields = new ArrayList<>();
    public ArrayList<StatusData> StatusData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block QueryData, Single. */
    public static class QueryData {
        public UUID QueryID; // LLUUID
    }

    /** Block QueryReplies, Variable. */
    public static class QueryReplies {
        public byte[] Date; // Variable 1
        public int EventFlags; // U32
        public int EventID; // U32
        public byte[] Name; // Variable 1
        public UUID OwnerID; // LLUUID
        public int UnixTime; // U32
    }

    /** Block StatusData, Variable. */
    public static class StatusData {
        public int Status; // U32
    }

    public DirEventsReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.QueryData_Field = new QueryData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 37;
        Iterator<?> it = this.QueryReplies_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2 + 1 + (this.StatusData_Fields.size() * 4);
            }
            QueryReplies queryReplies = (QueryReplies) it.next();
            i = queryReplies.Date.length + queryReplies.Name.length + 17 + 4 + 1 + 4 + 4 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleDirEventsReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 37 (DirEventsReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x25);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        byteBuffer.put((byte) this.QueryReplies_Fields.size());
        for (QueryReplies queryReplies : this.QueryReplies_Fields) {
            packUUID(byteBuffer, queryReplies.OwnerID);
            packVariable(byteBuffer, queryReplies.Name, 1);
            packInt(byteBuffer, queryReplies.EventID);
            packVariable(byteBuffer, queryReplies.Date, 1);
            packInt(byteBuffer, queryReplies.UnixTime);
            packInt(byteBuffer, queryReplies.EventFlags);
        }
        byteBuffer.put((byte) this.StatusData_Fields.size());
        Iterator<?> it = this.StatusData_Fields.iterator();
        while (it.hasNext()) {
            packInt(byteBuffer, ((StatusData) it.next()).Status);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            QueryReplies queryReplies = new QueryReplies();
            queryReplies.OwnerID = unpackUUID(byteBuffer);
            queryReplies.Name = unpackVariable(byteBuffer, 1);
            queryReplies.EventID = unpackInt(byteBuffer);
            queryReplies.Date = unpackVariable(byteBuffer, 1);
            queryReplies.UnixTime = unpackInt(byteBuffer);
            queryReplies.EventFlags = unpackInt(byteBuffer);
            this.QueryReplies_Fields.add(queryReplies);
        }
        int i3 = byteBuffer.get() & 0xFF;
        for (int i4 = 0; i4 < i3; i4++) {
            StatusData statusData = new StatusData();
            statusData.Status = unpackInt(byteBuffer);
            this.StatusData_Fields.add(statusData);
        }
    }
}
