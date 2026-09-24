package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * DirPlacesReply dataserver->sim->viewer
 * If the user has specified a location, use that to compute
 * global x,y,z.  Otherwise, use center of the AABB.
 * reliable
 *
 * <p>Template: {@code DirPlacesReply Low 35 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelDirBrowser::processDirPlacesReply()} in indra/newview/llpaneldirbrowser.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class DirPlacesReply extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<QueryData> QueryData_Fields = new ArrayList<>();
    public ArrayList<QueryReplies> QueryReplies_Fields = new ArrayList<>();
    public ArrayList<StatusData> StatusData_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block QueryData, Variable. */
    public static class QueryData {
        public UUID QueryID; // LLUUID
    }

    /** Block QueryReplies, Variable. */
    public static class QueryReplies {
        public boolean Auction; // BOOL
        public float Dwell; // F32
        public boolean ForSale; // BOOL
        public byte[] Name; // Variable 1
        public UUID ParcelID; // LLUUID
    }

    /** Block StatusData, Variable. */
    public static class StatusData {
        public int Status; // U32
    }

    public DirPlacesReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int size = (this.QueryData_Fields.size() * 16) + 21 + 1;
        Iterator<?> it = this.QueryReplies_Fields.iterator();
        while (true) {
            int i = size;
            if (!it.hasNext()) {
                return i + 1 + (this.StatusData_Fields.size() * 4);
            }
            size = ((QueryReplies) it.next()).Name.length + 17 + 1 + 1 + 4 + i;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleDirPlacesReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 35 (DirPlacesReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x23);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        byteBuffer.put((byte) this.QueryData_Fields.size());
        Iterator<?> it = this.QueryData_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((QueryData) it.next()).QueryID);
        }
        byteBuffer.put((byte) this.QueryReplies_Fields.size());
        for (QueryReplies queryReplies : this.QueryReplies_Fields) {
            packUUID(byteBuffer, queryReplies.ParcelID);
            packVariable(byteBuffer, queryReplies.Name, 1);
            packBoolean(byteBuffer, queryReplies.ForSale);
            packBoolean(byteBuffer, queryReplies.Auction);
            packFloat(byteBuffer, queryReplies.Dwell);
        }
        byteBuffer.put((byte) this.StatusData_Fields.size());
        Iterator<?> it2 = this.StatusData_Fields.iterator();
        while (it2.hasNext()) {
            packInt(byteBuffer, ((StatusData) it2.next()).Status);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            QueryData queryData = new QueryData();
            queryData.QueryID = unpackUUID(byteBuffer);
            this.QueryData_Fields.add(queryData);
        }
        int i3 = byteBuffer.get() & 0xFF;
        for (int i4 = 0; i4 < i3; i4++) {
            QueryReplies queryReplies = new QueryReplies();
            queryReplies.ParcelID = unpackUUID(byteBuffer);
            queryReplies.Name = unpackVariable(byteBuffer, 1);
            queryReplies.ForSale = unpackBoolean(byteBuffer);
            queryReplies.Auction = unpackBoolean(byteBuffer);
            queryReplies.Dwell = unpackFloat(byteBuffer);
            this.QueryReplies_Fields.add(queryReplies);
        }
        int i5 = byteBuffer.get() & 0xFF;
        for (int i6 = 0; i6 < i5; i6++) {
            StatusData statusData = new StatusData();
            statusData.Status = unpackInt(byteBuffer);
            this.StatusData_Fields.add(statusData);
        }
    }
}
