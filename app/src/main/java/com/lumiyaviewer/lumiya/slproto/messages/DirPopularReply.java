package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * DEPRECATED: DirPopularReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code DirPopularReply Low 53 Trusted Zerocoded Deprecated}
 * (recovered/reference/message_template.msg).
 */
public class DirPopularReply extends SLMessage {
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
        public float Dwell; // F32
        public byte[] Name; // Variable 1
        public UUID ParcelID; // LLUUID
    }

    public DirPopularReply() {
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
            i = ((QueryReplies) it.next()).Name.length + 17 + 4 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleDirPopularReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 53 (DirPopularReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x35);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        byteBuffer.put((byte) this.QueryReplies_Fields.size());
        for (QueryReplies queryReplies : this.QueryReplies_Fields) {
            packUUID(byteBuffer, queryReplies.ParcelID);
            packVariable(byteBuffer, queryReplies.Name, 1);
            packFloat(byteBuffer, queryReplies.Dwell);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            QueryReplies queryReplies = new QueryReplies();
            queryReplies.ParcelID = unpackUUID(byteBuffer);
            queryReplies.Name = unpackVariable(byteBuffer, 1);
            queryReplies.Dwell = unpackFloat(byteBuffer);
            this.QueryReplies_Fields.add(queryReplies);
        }
    }
}
