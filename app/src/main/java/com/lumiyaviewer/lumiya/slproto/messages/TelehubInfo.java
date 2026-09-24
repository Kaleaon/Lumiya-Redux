package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * TelehubInfo - fill in the UI for telehub creation floater.
 * sim -> viewer
 * reliable
 *
 * <p>Template: {@code TelehubInfo Low 10 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processTelehubInfo()} in indra/newview/llfloatertelehub.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class TelehubInfo extends SLMessage {
    public ArrayList<SpawnPointBlock> SpawnPointBlock_Fields = new ArrayList<>();
    public TelehubBlock TelehubBlock_Field;

    /** Block SpawnPointBlock, Variable. */
    public static class SpawnPointBlock {
        public LLVector3 SpawnPointPos; // LLVector3 - relative to telehub position
    }

    /** Block TelehubBlock, Single. */
    public static class TelehubBlock {
        public UUID ObjectID; // LLUUID - null if no telehub
        public byte[] ObjectName; // Variable 1 - string
        public LLVector3 TelehubPos; // LLVector3 - fallback if viewer can't find object
        public LLQuaternion TelehubRot; // LLQuaternion
    }

    public TelehubInfo() {
        this.zeroCoded = false;
        this.TelehubBlock_Field = new TelehubBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return this.TelehubBlock_Field.ObjectName.length + 17 + 12 + 12 + 4 + 1 + (this.SpawnPointBlock_Fields.size() * 12);
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleTelehubInfo(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 10 (TelehubInfo).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x0A);
        packUUID(byteBuffer, this.TelehubBlock_Field.ObjectID);
        packVariable(byteBuffer, this.TelehubBlock_Field.ObjectName, 1);
        packLLVector3(byteBuffer, this.TelehubBlock_Field.TelehubPos);
        packLLQuaternion(byteBuffer, this.TelehubBlock_Field.TelehubRot);
        byteBuffer.put((byte) this.SpawnPointBlock_Fields.size());
        Iterator<?> it = this.SpawnPointBlock_Fields.iterator();
        while (it.hasNext()) {
            packLLVector3(byteBuffer, ((SpawnPointBlock) it.next()).SpawnPointPos);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TelehubBlock_Field.ObjectID = unpackUUID(byteBuffer);
        this.TelehubBlock_Field.ObjectName = unpackVariable(byteBuffer, 1);
        this.TelehubBlock_Field.TelehubPos = unpackLLVector3(byteBuffer);
        this.TelehubBlock_Field.TelehubRot = unpackLLQuaternion(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            SpawnPointBlock spawnPointBlock = new SpawnPointBlock();
            spawnPointBlock.SpawnPointPos = unpackLLVector3(byteBuffer);
            this.SpawnPointBlock_Fields.add(spawnPointBlock);
        }
    }
}
