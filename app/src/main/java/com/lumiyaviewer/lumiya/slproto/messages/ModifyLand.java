package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * ModifyLand - sent to modify a piece of land on a simulator.
 * viewer -> sim
 *
 * <p>Template: {@code ModifyLand Low 124 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ModifyLand extends SLMessage {
    public AgentData AgentData_Field;
    public ModifyBlock ModifyBlock_Field;
    public ArrayList<ParcelData> ParcelData_Fields = new ArrayList<>();
    public ArrayList<ModifyBlockExtended> ModifyBlockExtended_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block ModifyBlock, Single. */
    public static class ModifyBlock {
        public int Action; // U8
        public int BrushSize; // U8
        public float Height; // F32
        public float Seconds; // F32
    }

    /** Block ModifyBlockExtended, Variable. */
    public static class ModifyBlockExtended {
        public float BrushSize; // U8
    }

    /** Block ParcelData, Variable. */
    public static class ParcelData {
        public float East; // F32
        public int LocalID; // S32
        public float North; // F32
        public float South; // F32
        public float West; // F32
    }

    public ModifyLand() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.ModifyBlock_Field = new ModifyBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ParcelData_Fields.size() * 20) + 47 + 1 + (this.ModifyBlockExtended_Fields.size() * 4);
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleModifyLand(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 124 (ModifyLand).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x7C);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packByte(byteBuffer, (byte) this.ModifyBlock_Field.Action);
        packByte(byteBuffer, (byte) this.ModifyBlock_Field.BrushSize);
        packFloat(byteBuffer, this.ModifyBlock_Field.Seconds);
        packFloat(byteBuffer, this.ModifyBlock_Field.Height);
        byteBuffer.put((byte) this.ParcelData_Fields.size());
        for (ParcelData parcelData : this.ParcelData_Fields) {
            packInt(byteBuffer, parcelData.LocalID);
            packFloat(byteBuffer, parcelData.West);
            packFloat(byteBuffer, parcelData.South);
            packFloat(byteBuffer, parcelData.East);
            packFloat(byteBuffer, parcelData.North);
        }
        byteBuffer.put((byte) this.ModifyBlockExtended_Fields.size());
        Iterator<?> it = this.ModifyBlockExtended_Fields.iterator();
        while (it.hasNext()) {
            packFloat(byteBuffer, ((ModifyBlockExtended) it.next()).BrushSize);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.ModifyBlock_Field.Action = unpackByte(byteBuffer) & 0xFF;
        this.ModifyBlock_Field.BrushSize = unpackByte(byteBuffer) & 0xFF;
        this.ModifyBlock_Field.Seconds = unpackFloat(byteBuffer);
        this.ModifyBlock_Field.Height = unpackFloat(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ParcelData parcelData = new ParcelData();
            parcelData.LocalID = unpackInt(byteBuffer);
            parcelData.West = unpackFloat(byteBuffer);
            parcelData.South = unpackFloat(byteBuffer);
            parcelData.East = unpackFloat(byteBuffer);
            parcelData.North = unpackFloat(byteBuffer);
            this.ParcelData_Fields.add(parcelData);
        }
        int i3 = byteBuffer.get() & 0xFF;
        for (int i4 = 0; i4 < i3; i4++) {
            ModifyBlockExtended modifyBlockExtended = new ModifyBlockExtended();
            modifyBlockExtended.BrushSize = unpackFloat(byteBuffer);
            this.ModifyBlockExtended_Fields.add(modifyBlockExtended);
        }
    }
}
