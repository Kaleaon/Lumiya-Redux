package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ParcelBuy - change the owner of a patch of land.
 * viewer -> sim
 * reliable
 *
 * <p>Template: {@code ParcelBuy Low 213 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ParcelBuy extends SLMessage {
    public AgentData AgentData_Field;
    public Data Data_Field;
    public ParcelData ParcelData_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Data, Single. */
    public static class Data {
        public boolean Final; // BOOL - true if buyer is in tier
        public UUID GroupID; // LLUUID
        public boolean IsGroupOwned; // BOOL
        public int LocalID; // S32
        public boolean RemoveContribution; // BOOL
    }

    /** Block ParcelData, Single. */
    public static class ParcelData {
        public int Area; // S32
        public int Price; // S32
    }

    public ParcelBuy() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.Data_Field = new Data();
        this.ParcelData_Field = new ParcelData();
    }

    @Override
    public int CalcPayloadSize() {
        return 67;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleParcelBuy(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 213 (ParcelBuy).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xD5);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.Data_Field.GroupID);
        packBoolean(byteBuffer, this.Data_Field.IsGroupOwned);
        packBoolean(byteBuffer, this.Data_Field.RemoveContribution);
        packInt(byteBuffer, this.Data_Field.LocalID);
        packBoolean(byteBuffer, this.Data_Field.Final);
        packInt(byteBuffer, this.ParcelData_Field.Price);
        packInt(byteBuffer, this.ParcelData_Field.Area);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.Data_Field.GroupID = unpackUUID(byteBuffer);
        this.Data_Field.IsGroupOwned = unpackBoolean(byteBuffer);
        this.Data_Field.RemoveContribution = unpackBoolean(byteBuffer);
        this.Data_Field.LocalID = unpackInt(byteBuffer);
        this.Data_Field.Final = unpackBoolean(byteBuffer);
        this.ParcelData_Field.Price = unpackInt(byteBuffer);
        this.ParcelData_Field.Area = unpackInt(byteBuffer);
    }
}
