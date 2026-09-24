package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * PlacesReply
 * dataserver -> simulator -> viewer
 * If the user has specified a location, use that to compute
 * global x,y,z.  Otherwise, use center of the AABB.
 * reliable
 *
 * <p>Template: {@code PlacesReply Low 30 Trusted Zerocoded UDPDeprecated}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_places_reply()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class PlacesReply extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<QueryData> QueryData_Fields = new ArrayList<>();
    public TransactionData TransactionData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID QueryID; // LLUUID
    }

    /** Block QueryData, Variable. */
    public static class QueryData {
        public int ActualArea; // S32
        public int BillableArea; // S32
        public byte[] Desc; // Variable 1
        public float Dwell; // F32
        public int Flags; // U8
        public float GlobalX; // F32 - meters
        public float GlobalY; // F32 - meters
        public float GlobalZ; // F32 - meters
        public byte[] Name; // Variable 1
        public UUID OwnerID; // LLUUID
        public int Price; // S32
        public byte[] SimName; // Variable 1
        public UUID SnapshotID; // LLUUID
    }

    /** Block TransactionData, Single. */
    public static class TransactionData {
        public UUID TransactionID; // LLUUID
    }

    public PlacesReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.TransactionData_Field = new TransactionData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 53;
        Iterator<?> it = this.QueryData_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            QueryData queryData = (QueryData) it.next();
            i = queryData.SimName.length + queryData.Name.length + 17 + 1 + queryData.Desc.length + 4 + 4 + 1 + 4 + 4 + 4 + 1 + 16 + 4 + 4 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandlePlacesReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 30 (PlacesReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x1E);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.QueryID);
        packUUID(byteBuffer, this.TransactionData_Field.TransactionID);
        byteBuffer.put((byte) this.QueryData_Fields.size());
        for (QueryData queryData : this.QueryData_Fields) {
            packUUID(byteBuffer, queryData.OwnerID);
            packVariable(byteBuffer, queryData.Name, 1);
            packVariable(byteBuffer, queryData.Desc, 1);
            packInt(byteBuffer, queryData.ActualArea);
            packInt(byteBuffer, queryData.BillableArea);
            packByte(byteBuffer, (byte) queryData.Flags);
            packFloat(byteBuffer, queryData.GlobalX);
            packFloat(byteBuffer, queryData.GlobalY);
            packFloat(byteBuffer, queryData.GlobalZ);
            packVariable(byteBuffer, queryData.SimName, 1);
            packUUID(byteBuffer, queryData.SnapshotID);
            packFloat(byteBuffer, queryData.Dwell);
            packInt(byteBuffer, queryData.Price);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.QueryID = unpackUUID(byteBuffer);
        this.TransactionData_Field.TransactionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            QueryData queryData = new QueryData();
            queryData.OwnerID = unpackUUID(byteBuffer);
            queryData.Name = unpackVariable(byteBuffer, 1);
            queryData.Desc = unpackVariable(byteBuffer, 1);
            queryData.ActualArea = unpackInt(byteBuffer);
            queryData.BillableArea = unpackInt(byteBuffer);
            queryData.Flags = unpackByte(byteBuffer) & 0xFF;
            queryData.GlobalX = unpackFloat(byteBuffer);
            queryData.GlobalY = unpackFloat(byteBuffer);
            queryData.GlobalZ = unpackFloat(byteBuffer);
            queryData.SimName = unpackVariable(byteBuffer, 1);
            queryData.SnapshotID = unpackUUID(byteBuffer);
            queryData.Dwell = unpackFloat(byteBuffer);
            queryData.Price = unpackInt(byteBuffer);
            this.QueryData_Fields.add(queryData);
        }
    }
}
