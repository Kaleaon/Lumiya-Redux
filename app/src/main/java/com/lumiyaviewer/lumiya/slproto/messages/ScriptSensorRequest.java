package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * ScriptSensorRequest - causes the receiving sim to run a script sensor and return the results
 *
 * <p>Template: {@code ScriptSensorRequest Low 247 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ScriptSensorRequest extends SLMessage {
    public Requester Requester_Field;

    /** Block Requester, Single. */
    public static class Requester {
        public float Arc; // F32
        public float Range; // F32
        public long RegionHandle; // U64
        public UUID RequestID; // LLUUID
        public LLQuaternion SearchDir; // LLQuaternion
        public UUID SearchID; // LLUUID
        public byte[] SearchName; // Variable 1
        public LLVector3 SearchPos; // LLVector3
        public int SearchRegions; // U8
        public UUID SourceID; // LLUUID
        public int Type; // S32
    }

    public ScriptSensorRequest() {
        this.zeroCoded = true;
        this.Requester_Field = new Requester();
    }

    @Override
    public int CalcPayloadSize() {
        return this.Requester_Field.SearchName.length + 73 + 4 + 4 + 4 + 8 + 1 + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleScriptSensorRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 247 (ScriptSensorRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xF7);
        packUUID(byteBuffer, this.Requester_Field.SourceID);
        packUUID(byteBuffer, this.Requester_Field.RequestID);
        packUUID(byteBuffer, this.Requester_Field.SearchID);
        packLLVector3(byteBuffer, this.Requester_Field.SearchPos);
        packLLQuaternion(byteBuffer, this.Requester_Field.SearchDir);
        packVariable(byteBuffer, this.Requester_Field.SearchName, 1);
        packInt(byteBuffer, this.Requester_Field.Type);
        packFloat(byteBuffer, this.Requester_Field.Range);
        packFloat(byteBuffer, this.Requester_Field.Arc);
        packLong(byteBuffer, this.Requester_Field.RegionHandle);
        packByte(byteBuffer, (byte) this.Requester_Field.SearchRegions);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Requester_Field.SourceID = unpackUUID(byteBuffer);
        this.Requester_Field.RequestID = unpackUUID(byteBuffer);
        this.Requester_Field.SearchID = unpackUUID(byteBuffer);
        this.Requester_Field.SearchPos = unpackLLVector3(byteBuffer);
        this.Requester_Field.SearchDir = unpackLLQuaternion(byteBuffer);
        this.Requester_Field.SearchName = unpackVariable(byteBuffer, 1);
        this.Requester_Field.Type = unpackInt(byteBuffer);
        this.Requester_Field.Range = unpackFloat(byteBuffer);
        this.Requester_Field.Arc = unpackFloat(byteBuffer);
        this.Requester_Field.RegionHandle = unpackLong(byteBuffer);
        this.Requester_Field.SearchRegions = unpackByte(byteBuffer) & 0xFF;
    }
}
