package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * ObjectFlagUpdate
 * viewer -> simulator
 *
 * <p>Template: {@code ObjectFlagUpdate Low 94 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class ObjectFlagUpdate extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<ExtraPhysics> ExtraPhysics_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public boolean CastsShadows; // BOOL
        public boolean IsPhantom; // BOOL
        public boolean IsTemporary; // BOOL
        public int ObjectLocalID; // U32
        public UUID SessionID; // LLUUID
        public boolean UsePhysics; // BOOL
    }

    /** Block ExtraPhysics, Variable. */
    public static class ExtraPhysics {
        public float Density; // F32
        public float Friction; // F32
        public float GravityMultiplier; // F32
        public int PhysicsShapeType; // U8
        public float Restitution; // F32
    }

    public ObjectFlagUpdate() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ExtraPhysics_Fields.size() * 17) + 45;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleObjectFlagUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 94 (ObjectFlagUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x5E);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.AgentData_Field.ObjectLocalID);
        packBoolean(byteBuffer, this.AgentData_Field.UsePhysics);
        packBoolean(byteBuffer, this.AgentData_Field.IsTemporary);
        packBoolean(byteBuffer, this.AgentData_Field.IsPhantom);
        packBoolean(byteBuffer, this.AgentData_Field.CastsShadows);
        byteBuffer.put((byte) this.ExtraPhysics_Fields.size());
        for (ExtraPhysics extraPhysics : this.ExtraPhysics_Fields) {
            packByte(byteBuffer, (byte) extraPhysics.PhysicsShapeType);
            packFloat(byteBuffer, extraPhysics.Density);
            packFloat(byteBuffer, extraPhysics.Friction);
            packFloat(byteBuffer, extraPhysics.Restitution);
            packFloat(byteBuffer, extraPhysics.GravityMultiplier);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.ObjectLocalID = unpackInt(byteBuffer);
        this.AgentData_Field.UsePhysics = unpackBoolean(byteBuffer);
        this.AgentData_Field.IsTemporary = unpackBoolean(byteBuffer);
        this.AgentData_Field.IsPhantom = unpackBoolean(byteBuffer);
        this.AgentData_Field.CastsShadows = unpackBoolean(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            ExtraPhysics extraPhysics = new ExtraPhysics();
            extraPhysics.PhysicsShapeType = unpackByte(byteBuffer) & 0xFF;
            extraPhysics.Density = unpackFloat(byteBuffer);
            extraPhysics.Friction = unpackFloat(byteBuffer);
            extraPhysics.Restitution = unpackFloat(byteBuffer);
            extraPhysics.GravityMultiplier = unpackFloat(byteBuffer);
            this.ExtraPhysics_Fields.add(extraPhysics);
        }
    }
}
