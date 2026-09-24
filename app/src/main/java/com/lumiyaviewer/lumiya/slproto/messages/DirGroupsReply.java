package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * DirGroupsReply
 * dataserver -> userserver -> viewer
 * reliable
 *
 * <p>Template: {@code DirGroupsReply Low 38 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelDirBrowser::processDirGroupsReply()} in indra/newview/llpaneldirbrowser.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class DirGroupsReply extends SLMessage {
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
        public UUID GroupID; // LLUUID
        public byte[] GroupName; // Variable 1 - string
        public int Members; // S32
        public float SearchOrder; // F32
    }

    public DirGroupsReply() {
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
            i = ((QueryReplies) it.next()).GroupName.length + 17 + 4 + 4 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleDirGroupsReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 38 (DirGroupsReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x26);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        byteBuffer.put((byte) this.QueryReplies_Fields.size());
        for (QueryReplies queryReplies : this.QueryReplies_Fields) {
            packUUID(byteBuffer, queryReplies.GroupID);
            packVariable(byteBuffer, queryReplies.GroupName, 1);
            packInt(byteBuffer, queryReplies.Members);
            packFloat(byteBuffer, queryReplies.SearchOrder);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            QueryReplies queryReplies = new QueryReplies();
            queryReplies.GroupID = unpackUUID(byteBuffer);
            queryReplies.GroupName = unpackVariable(byteBuffer, 1);
            queryReplies.Members = unpackInt(byteBuffer);
            queryReplies.SearchOrder = unpackFloat(byteBuffer);
            this.QueryReplies_Fields.add(queryReplies);
        }
    }
}
