package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * DirLandReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code DirLandReply Low 50 Trusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLPanelDirBrowser::processDirLandReply()} in indra/newview/llpaneldirbrowser.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class DirLandReply extends SLMessage {
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
        public int ActualArea; // S32
        public boolean Auction; // BOOL
        public boolean ForSale; // BOOL
        public byte[] Name; // Variable 1
        public UUID ParcelID; // LLUUID
        public int SalePrice; // S32
    }

    public DirLandReply() {
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
            i = ((QueryReplies) it.next()).Name.length + 17 + 1 + 1 + 4 + 4 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleDirLandReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 50 (DirLandReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x32);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.QueryData_Field.QueryID);
        byteBuffer.put((byte) this.QueryReplies_Fields.size());
        for (QueryReplies queryReplies : this.QueryReplies_Fields) {
            packUUID(byteBuffer, queryReplies.ParcelID);
            packVariable(byteBuffer, queryReplies.Name, 1);
            packBoolean(byteBuffer, queryReplies.Auction);
            packBoolean(byteBuffer, queryReplies.ForSale);
            packInt(byteBuffer, queryReplies.SalePrice);
            packInt(byteBuffer, queryReplies.ActualArea);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            QueryReplies queryReplies = new QueryReplies();
            queryReplies.ParcelID = unpackUUID(byteBuffer);
            queryReplies.Name = unpackVariable(byteBuffer, 1);
            queryReplies.Auction = unpackBoolean(byteBuffer);
            queryReplies.ForSale = unpackBoolean(byteBuffer);
            queryReplies.SalePrice = unpackInt(byteBuffer);
            queryReplies.ActualArea = unpackInt(byteBuffer);
            this.QueryReplies_Fields.add(queryReplies);
        }
    }
}
