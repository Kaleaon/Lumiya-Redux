package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * PlacesQuery
 * Used for getting a list of places for the group land panel
 * and the user land holdings panel.  NOT for the directory.
 * The dataserver now implements the "/agent/<agent-id>/owned-land"
 * endpoint as a replacement for PlacesQuery and PlacesReply.
 * This has not yet been exposed in the viewer through a capability...
 * but this message's days are numbered.
 *
 * <p>Template: {@code PlacesQuery Low 29 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class PlacesQuery extends SLMessage {
    public AgentData AgentData_Field;
    public QueryData QueryData_Field;
    public TransactionData TransactionData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID QueryID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block QueryData, Single. */
    public static class QueryData {
        public int Category; // S8
        public int QueryFlags; // U32
        public byte[] QueryText; // Variable 1
        public byte[] SimName; // Variable 1
    }

    /** Block TransactionData, Single. */
    public static class TransactionData {
        public UUID TransactionID; // LLUUID
    }

    public PlacesQuery() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.TransactionData_Field = new TransactionData();
        this.QueryData_Field = new QueryData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.QueryData_Field.QueryText.length + 1 + 4 + 1 + 1 + this.QueryData_Field.SimName.length + 68;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandlePlacesQuery(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 29 (PlacesQuery).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x1D);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentData_Field.QueryID);
        packUUID(byteBuffer, this.TransactionData_Field.TransactionID);
        packVariable(byteBuffer, this.QueryData_Field.QueryText, 1);
        packInt(byteBuffer, this.QueryData_Field.QueryFlags);
        packByte(byteBuffer, (byte) this.QueryData_Field.Category);
        packVariable(byteBuffer, this.QueryData_Field.SimName, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.QueryID = unpackUUID(byteBuffer);
        this.TransactionData_Field.TransactionID = unpackUUID(byteBuffer);
        this.QueryData_Field.QueryText = unpackVariable(byteBuffer, 1);
        this.QueryData_Field.QueryFlags = unpackInt(byteBuffer);
        this.QueryData_Field.Category = unpackByte(byteBuffer);
        this.QueryData_Field.SimName = unpackVariable(byteBuffer, 1);
    }
}
