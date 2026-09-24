package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ParcelInfoReply
 * dataserver -> simulator -> viewer
 * reliable
 *
 * <p>Template: {@code ParcelInfoReply Low 55 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLRemoteParcelInfoProcessor::processParcelInfoReply()} in indra/newview/llremoteparcelrequest.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ParcelInfoReply extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public int ActualArea; // S32
        public int AuctionID; // S32
        public int BillableArea; // S32
        public byte[] Desc; // Variable 1
        public float Dwell; // F32
        public int Flags; // U8
        public float GlobalX; // F32 - meters
        public float GlobalY; // F32 - meters
        public float GlobalZ; // F32 - meters
        public byte[] Name; // Variable 1
        public UUID OwnerID; // LLUUID
        public UUID ParcelID; // LLUUID
        public int SalePrice; // S32
        public byte[] SimName; // Variable 1
        public UUID SnapshotID; // LLUUID
    }

    public ParcelInfoReply() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Data_Field.Name.length + 33 + 1 + this.Data_Field.Desc.length + 4 + 4 + 1 + 4 + 4 + 4 + 1 + this.Data_Field.SimName.length + 16 + 4 + 4 + 4 + 20;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleParcelInfoReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 55 (ParcelInfoReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x37);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.Data_Field.ParcelID);
        packUUID(byteBuffer, this.Data_Field.OwnerID);
        packVariable(byteBuffer, this.Data_Field.Name, 1);
        packVariable(byteBuffer, this.Data_Field.Desc, 1);
        packInt(byteBuffer, this.Data_Field.ActualArea);
        packInt(byteBuffer, this.Data_Field.BillableArea);
        packByte(byteBuffer, (byte) this.Data_Field.Flags);
        packFloat(byteBuffer, this.Data_Field.GlobalX);
        packFloat(byteBuffer, this.Data_Field.GlobalY);
        packFloat(byteBuffer, this.Data_Field.GlobalZ);
        packVariable(byteBuffer, this.Data_Field.SimName, 1);
        packUUID(byteBuffer, this.Data_Field.SnapshotID);
        packFloat(byteBuffer, this.Data_Field.Dwell);
        packInt(byteBuffer, this.Data_Field.SalePrice);
        packInt(byteBuffer, this.Data_Field.AuctionID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.Data_Field.ParcelID = unpackUUID(byteBuffer);
        this.Data_Field.OwnerID = unpackUUID(byteBuffer);
        this.Data_Field.Name = unpackVariable(byteBuffer, 1);
        this.Data_Field.Desc = unpackVariable(byteBuffer, 1);
        this.Data_Field.ActualArea = unpackInt(byteBuffer);
        this.Data_Field.BillableArea = unpackInt(byteBuffer);
        this.Data_Field.Flags = unpackByte(byteBuffer) & 0xFF;
        this.Data_Field.GlobalX = unpackFloat(byteBuffer);
        this.Data_Field.GlobalY = unpackFloat(byteBuffer);
        this.Data_Field.GlobalZ = unpackFloat(byteBuffer);
        this.Data_Field.SimName = unpackVariable(byteBuffer, 1);
        this.Data_Field.SnapshotID = unpackUUID(byteBuffer);
        this.Data_Field.Dwell = unpackFloat(byteBuffer);
        this.Data_Field.SalePrice = unpackInt(byteBuffer);
        this.Data_Field.AuctionID = unpackInt(byteBuffer);
    }
}
