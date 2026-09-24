package com.lumiyaviewer.lumiya.slproto.prims;

import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;

public class PrimFlexibleParams {
    public float AirFriction;
    public float Gravity;
    public int NumFlexiSections;
    public float Tension;
    public LLVector3 UserForce;
    public float WindSensitivity;

    public PrimFlexibleParams(ByteBuffer byteBuffer, int i) {
        byte b = byteBuffer.get();
        byte b2 = byteBuffer.get();
        this.Tension = (b & 0x7F) / 10.0f;
        this.AirFriction = (b2 & 0x7F) / 10.0f;
        int i2 = (b & 128) != 0 ? 2 : 0;
        this.NumFlexiSections = (1 << ((b2 & 128) != 0 ? i2 | 1 : i2)) + 1;
        this.Gravity = ((byteBuffer.get() & 0xFF) / 10.0f) - 10.0f;
        this.WindSensitivity = (byteBuffer.get() & 0xFF) / 10.0f;
        if (byteBuffer.position() < i) {
            this.UserForce = LLVector3.parseFloatVec(byteBuffer);
        } else {
            this.UserForce = LLVector3.Zero;
        }
    }

    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof PrimFlexibleParams)) {
            return false;
        }
        PrimFlexibleParams primFlexibleParams = (PrimFlexibleParams) obj;
        return this.Tension == primFlexibleParams.Tension && this.AirFriction == primFlexibleParams.AirFriction && this.Gravity == primFlexibleParams.Gravity && this.WindSensitivity == primFlexibleParams.WindSensitivity && this.NumFlexiSections == primFlexibleParams.NumFlexiSections && !(this.UserForce.equals(primFlexibleParams.UserForce) ^ true);
    }

    public int hashCode() {
        return Float.floatToRawIntBits(this.Tension) + 0 + Float.floatToRawIntBits(this.AirFriction) + Float.floatToRawIntBits(this.Gravity) + Float.floatToRawIntBits(this.WindSensitivity) + this.NumFlexiSections + this.UserForce.hashCode();
    }
}
