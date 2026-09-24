package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * ViewerEffect
 * Viewer side effect that's sent from one viewer, and broadcast to other agents nearby
 * viewer-->sim (single effect created by viewer)
 * sim-->viewer (multiple effects that can be seen by viewer)
 * the AgentData block used for authentication for viewer-->sim messages
 *
 * <p>Template: {@code ViewerEffect Medium 17 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLHUDManager::processViewerEffect()} in indra/newview/llhudmanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ViewerEffect extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<Effect> Effect_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block Effect, Variable. */
    public static class Effect {
        public UUID AgentID; // LLUUID
        public byte[] Color; // Fixed 4 - Color4U
        public float Duration; // F32 - time (seconds)
        public UUID ID; // LLUUID - unique UUID of the effect
        public int Type; // U8 - Type of the effect
        public byte[] TypeData; // Variable 1 - Type specific data
    }

    public ViewerEffect() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 35;
        Iterator<?> it = this.Effect_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((Effect) it.next()).TypeData.length + 42 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleViewerEffect(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Medium 17 (ViewerEffect).
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0x11);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.Effect_Fields.size());
        for (Effect effect : this.Effect_Fields) {
            packUUID(byteBuffer, effect.ID);
            packUUID(byteBuffer, effect.AgentID);
            packByte(byteBuffer, (byte) effect.Type);
            packFloat(byteBuffer, effect.Duration);
            packFixed(byteBuffer, effect.Color, 4);
            packVariable(byteBuffer, effect.TypeData, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            Effect effect = new Effect();
            effect.ID = unpackUUID(byteBuffer);
            effect.AgentID = unpackUUID(byteBuffer);
            effect.Type = unpackByte(byteBuffer) & 0xFF;
            effect.Duration = unpackFloat(byteBuffer);
            effect.Color = unpackFixed(byteBuffer, 4);
            effect.TypeData = unpackVariable(byteBuffer, 1);
            this.Effect_Fields.add(effect);
        }
    }
}
