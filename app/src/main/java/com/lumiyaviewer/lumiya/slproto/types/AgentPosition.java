package com.lumiyaviewer.lumiya.slproto.types;

import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.ThreadSafe;

@ThreadSafe
public class AgentPosition {
    private final Object lock = new Object();
    private boolean isValid = false;
    private final LLVector3 position = new LLVector3();
    private final LLVector3 velocity = new LLVector3();
    private long lastAgentDataMillis = 0;

    @Nullable
    public ImmutableVector getImmutablePosition() {
        ImmutableVector immutableVector;
        synchronized (this.lock) {
            immutableVector = this.isValid ? new ImmutableVector(this.position) : null;
        }
        return immutableVector;
    }

    public boolean getInterpolatedPosition(@Nonnull LLVector3 vector3) {
        boolean z;
        synchronized (this.lock) {
            if (this.isValid) {
                if (this.velocity.x == 0.0f && this.velocity.y == 0.0f && this.velocity.z == 0.0f) {
                    vector3.set(this.position);
                } else {
                    vector3.setMul(this.velocity, (System.currentTimeMillis() - this.lastAgentDataMillis) / 1000.0f);
                    vector3.add(this.position);
                }
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    @Nonnull
    public LLVector3 getPosition() {
        LLVector3 vector3 = new LLVector3();
        synchronized (this.lock) {
            if (this.isValid) {
                vector3.set(this.position);
            }
        }
        return vector3;
    }

    public boolean getPosition(@Nonnull LLVector3 vector3) {
        boolean z;
        synchronized (this.lock) {
            if (this.isValid) {
                vector3.set(this.position);
                z = true;
            } else {
                z = false;
            }
        }
        return z;
    }

    public boolean isValid() {
        boolean isValid;
        synchronized (this.lock) {
            isValid = this.isValid;
        }
        return isValid;
    }

    public void set(@Nonnull LLVector3 vector3, @Nullable LLVector3 vector33) {
        synchronized (this.lock) {
            this.position.set(vector3);
            LLVector3 velocity = this.velocity;
            if (vector33 == null) {
                vector33 = LLVector3.Zero;
            }
            velocity.set(vector33);
            this.lastAgentDataMillis = System.currentTimeMillis();
            this.isValid = true;
        }
    }
}
