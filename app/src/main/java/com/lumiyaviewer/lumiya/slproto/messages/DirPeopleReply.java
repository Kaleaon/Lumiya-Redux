package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * DirPeopleReply
 *
 * <p>Template: {@code DirPeopleReply Low 36 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelDirBrowser::processDirPeopleReply()} in indra/newview/llpaneldirbrowser.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class DirPeopleReply extends SLMessage {
    public AgentData AgentData_Field;
    public QueryData QueryData_Field;
    public ArrayList<QueryReplies> QueryReplies_Fields = new ArrayList<>();

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
        public UUID AgentID; // LLUUID
        public byte[] FirstName; // Variable 1
        public byte[] Group; // Variable 1
        public byte[] LastName; // Variable 1
        public boolean Online; // BOOL
        public int Reputation; // S32
    }

    public DirPeopleReply() {
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
                return i2;
            }
            QueryReplies queryReplies = (QueryReplies) it.next();
            i = queryReplies.Group.length + queryReplies.FirstName.length + 17 + 1 + queryReplies.LastName.length + 1 + 1 + 4 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleDirPeopleReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 36 (DirPeopleReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x24);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        byteBuffer.put((byte) this.QueryReplies_Fields.size());
        for (QueryReplies queryReplies : this.QueryReplies_Fields) {
            packUUID(byteBuffer, queryReplies.AgentID);
            packVariable(byteBuffer, queryReplies.FirstName, 1);
            packVariable(byteBuffer, queryReplies.LastName, 1);
            packVariable(byteBuffer, queryReplies.Group, 1);
            packBoolean(byteBuffer, queryReplies.Online);
            packInt(byteBuffer, queryReplies.Reputation);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            QueryReplies queryReplies = new QueryReplies();
            queryReplies.AgentID = unpackUUID(byteBuffer);
            queryReplies.FirstName = unpackVariable(byteBuffer, 1);
            queryReplies.LastName = unpackVariable(byteBuffer, 1);
            queryReplies.Group = unpackVariable(byteBuffer, 1);
            queryReplies.Online = unpackBoolean(byteBuffer);
            queryReplies.Reputation = unpackInt(byteBuffer);
            this.QueryReplies_Fields.add(queryReplies);
        }
    }
}
