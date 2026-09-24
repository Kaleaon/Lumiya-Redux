package com.lumiyaviewer.lumiya.slproto.types;

import com.lumiyaviewer.lumiya.render.HeadTransformCompat;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;
import javax.annotation.concurrent.ThreadSafe;

@ThreadSafe
public class CameraParams {
    private static final float FLING_DECEL_PITCH = 100.0f;
    private static final float FLING_DECEL_YAW = 50.0f;
    private static final float MAX_PITCH = 85.0f;
    private static final float MIN_PITCH = -85.0f;
    private final Object lock = new Object();
    private final LLVector3 offset = new LLVector3(-2.0f, 0.0f, 1.0f);
    private final LLVector3 offsetVR = new LLVector3(0.0f, 0.0f, 1.0f);

    @Nonnull
    private LLVector3 position = new LLVector3();
    private float heading = 0.0f;
    private float tilt = 0.0f;
    private boolean isValid = false;
    private boolean useOffset = false;
    private boolean isFlinging = false;
    private float headingFlingSpeed = 0.0f;
    private float tiltFlingSpeed = 0.0f;
    private long flingStartTime = 0;
    private boolean isManualControl = false;
    private long manualControlStartTime = 0;
    private float manualTurnSpeed = 0.0f;
    private float manualMoveSpeed = 0.0f;
    private float manualFlySpeed = 0.0f;
    private float manualStrafeSpeed = 0.0f;

    public static float angleMinusAngle(float f, float f2) {
        return wrapAngle(wrapAngle(f) - wrapAngle(f2));
    }

    private void processFling() {
        if (this.isFlinging) {
            long currentTimeMillis = System.currentTimeMillis();
            float f = (currentTimeMillis - this.flingStartTime) / 1000.0f;
            this.heading = wrapAngle(this.heading + (this.headingFlingSpeed * f));
            this.tilt = Math.max(Math.min(this.tilt + (this.tiltFlingSpeed * f), MAX_PITCH), MIN_PITCH);
            if (this.headingFlingSpeed > 0.0f) {
                this.headingFlingSpeed -= FLING_DECEL_PITCH * f;
                if (this.headingFlingSpeed < 0.0f) {
                    this.headingFlingSpeed = 0.0f;
                }
            } else if (this.headingFlingSpeed < 0.0f) {
                this.headingFlingSpeed += FLING_DECEL_PITCH * f;
                if (this.headingFlingSpeed > 0.0f) {
                    this.headingFlingSpeed = 0.0f;
                }
            }
            if (this.tiltFlingSpeed > 0.0f) {
                this.tiltFlingSpeed -= f * FLING_DECEL_YAW;
                if (this.tiltFlingSpeed < 0.0f) {
                    this.tiltFlingSpeed = 0.0f;
                }
            } else if (this.tiltFlingSpeed < 0.0f) {
                this.tiltFlingSpeed = (f * FLING_DECEL_YAW) + this.tiltFlingSpeed;
                if (this.tiltFlingSpeed > 0.0f) {
                    this.tiltFlingSpeed = 0.0f;
                }
            }
            this.flingStartTime = currentTimeMillis;
            if (this.tiltFlingSpeed == 0.0f && this.headingFlingSpeed == 0.0f) {
                this.isFlinging = false;
            }
        }
    }

    private void processManualControl(HeadTransformCompat headTransformCompat) {
        float wrapAngle;
        float pitchDegrees;
        if (this.isManualControl) {
            long currentTimeMillis = System.currentTimeMillis();
            float f3 = (currentTimeMillis - this.manualControlStartTime) / 1000.0f;
            if (headTransformCompat != null) {
                wrapAngle = wrapAngle(headTransformCompat.yawDegrees + headTransformCompat.viewExtraYaw);
                pitchDegrees = headTransformCompat.pitchDegrees;
            } else {
                this.heading = wrapAngle(this.heading + (this.manualTurnSpeed * f3));
                wrapAngle = this.heading;
                pitchDegrees = this.tilt;
            }
            if (this.manualMoveSpeed != 0.0f || this.manualFlySpeed != 0.0f || this.manualStrafeSpeed != 0.0f) {
                LLQuaternion mayaQ = LLQuaternion.mayaQ(0.0f, pitchDegrees, wrapAngle, LLQuaternion.Order.YZX);
                LLVector3 vector3 = new LLVector3(1.0f, 0.0f, 0.0f);
                LLVector3 vector34 = new LLVector3(0.0f, 0.0f, 1.0f);
                LLVector3 vector35 = new LLVector3(0.0f, 1.0f, 0.0f);
                vector3.mul(mayaQ);
                vector34.mul(mayaQ);
                vector35.mul(mayaQ);
                this.position.addMul(vector3, this.manualMoveSpeed * f3);
                this.position.addMul(vector34, this.manualFlySpeed * f3);
                this.position.addMul(vector35, this.manualStrafeSpeed * f3);
            }
            this.manualControlStartTime = currentTimeMillis;
        }
    }

    public static float wrapAngle(float f) {
        float f2 = (f + 180.0f) % 360.0f;
        if (f2 < 0.0f) {
            f2 += 360.0f;
        }
        return f2 - 180.0f;
    }

    public void copyFrom(@Nullable CameraParams cameraParams) {
        float x;
        float y;
        float z2;
        float heading;
        float tilt;
        boolean isValid;
        if (cameraParams != null) {
            synchronized (cameraParams.lock) {
                cameraParams.processFling();
                cameraParams.processManualControl(null);
                x = cameraParams.position.x;
                y = cameraParams.position.y;
                z2 = cameraParams.position.z;
                heading = cameraParams.heading;
                tilt = cameraParams.tilt;
                isValid = cameraParams.isValid;
                if (cameraParams.useOffset) {
                    LLVector3 vector3 = new LLVector3(this.offset);
                    vector3.mul(LLQuaternion.mayaQ(0.0f, tilt, heading, LLQuaternion.Order.YZX));
                    x += vector3.x;
                    y += vector3.y;
                    z2 += vector3.z;
                }
            }
            synchronized (this.lock) {
                this.position.set(x, y, z2);
                this.heading = heading;
                this.tilt = tilt;
                this.isValid = isValid;
            }
        }
    }

    public void fling(float headingFlingSpeed, float tiltFlingSpeed) {
        synchronized (this.lock) {
            this.headingFlingSpeed = headingFlingSpeed;
            this.tiltFlingSpeed = tiltFlingSpeed;
            this.flingStartTime = System.currentTimeMillis();
            this.isFlinging = true;
        }
    }

    public float getHeading() {
        float heading;
        synchronized (this.lock) {
            heading = this.heading;
        }
        return heading;
    }

    @Nonnull
    public LLVector3 getPosition() {
        LLVector3 position;
        synchronized (this.lock) {
            position = this.position;
        }
        return position;
    }

    public float getTilt() {
        float tilt;
        synchronized (this.lock) {
            tilt = this.tilt;
        }
        return tilt;
    }

    public void getVRCamera(@Nullable CameraParams cameraParams, HeadTransformCompat headTransformCompat) {
        float x;
        float y;
        float z2;
        float heading;
        float tilt;
        boolean isValid;
        if (cameraParams != null) {
            synchronized (cameraParams.lock) {
                cameraParams.processManualControl(headTransformCompat);
                x = cameraParams.position.x;
                y = cameraParams.position.y;
                z2 = cameraParams.position.z;
                heading = cameraParams.heading;
                tilt = cameraParams.tilt;
                isValid = cameraParams.isValid;
                if (cameraParams.useOffset) {
                    LLVector3 vector3 = new LLVector3(this.offsetVR);
                    vector3.mul(LLQuaternion.mayaQ(0.0f, tilt, heading, LLQuaternion.Order.YZX));
                    x += vector3.x;
                    y += vector3.y;
                    z2 += vector3.z;
                }
            }
            synchronized (this.lock) {
                this.position.set(x, y, z2);
                this.heading = heading;
                this.tilt = tilt;
                this.isValid = isValid;
            }
        }
    }

    public boolean isFlinging() {
        boolean isFlinging;
        synchronized (this.lock) {
            isFlinging = this.isFlinging;
        }
        return isFlinging;
    }

    public boolean isValid() {
        boolean isValid;
        synchronized (this.lock) {
            isValid = this.isValid;
        }
        return isValid;
    }

    public void rotate(float f, float f2) {
        synchronized (this.lock) {
            this.heading = wrapAngle(this.heading + f);
            this.tilt = Math.max(Math.min(this.tilt + f2, MAX_PITCH), MIN_PITCH);
            this.isFlinging = false;
        }
    }

    public void set(@Nullable LLVector3 vector3, float heading, float tilt) {
        synchronized (this.lock) {
            if (vector3 != null) {
                this.position.set(vector3);
            }
            this.heading = heading;
            this.tilt = tilt;
            this.isValid = true;
        }
    }

    public void setHeading(float heading) {
        synchronized (this.lock) {
            this.heading = heading;
        }
    }

    public void setPosition(@Nullable LLVector3 position) {
        synchronized (this.lock) {
            if (position != null) {
                this.position.set(position);
            }
            this.useOffset = true;
            this.isValid = true;
        }
    }

    public void setPosition(@Nullable LLVector3 vector3, float heading) {
        synchronized (this.lock) {
            if (vector3 != null) {
                this.position.set(vector3);
            }
            this.heading = heading;
            this.tilt = 0.0f;
            this.isFlinging = false;
            this.isValid = true;
            this.useOffset = true;
        }
    }

    public void startManualControl(float manualTurnSpeed, float manualMoveSpeed, float manualFlySpeed, float manualStrafeSpeed) {
        synchronized (this.lock) {
            if (!this.isManualControl) {
                LLVector3 vector3 = new LLVector3(this.position);
                LLQuaternion mayaQ = LLQuaternion.mayaQ(0.0f, this.tilt, this.heading, LLQuaternion.Order.YZX);
                if (!this.useOffset) {
                    LLVector3 vector33 = new LLVector3(this.offset);
                    vector33.mul(mayaQ);
                    vector3.add(vector33);
                    this.useOffset = true;
                }
                this.position.set(vector3);
                this.isManualControl = true;
                this.manualControlStartTime = System.currentTimeMillis();
            }
            this.manualMoveSpeed = manualMoveSpeed;
            this.manualTurnSpeed = manualTurnSpeed;
            this.manualFlySpeed = manualFlySpeed;
            this.manualStrafeSpeed = manualStrafeSpeed;
        }
    }

    public void stopManualControl() {
        synchronized (this.lock) {
            this.isManualControl = false;
        }
    }

    public void zoom(float f, float f2, float f3, float f4, float f5) {
        synchronized (this.lock) {
            float f6 = f - 1.0f;
            LLVector3 vector3 = new LLVector3(this.position);
            LLQuaternion mayaQ = LLQuaternion.mayaQ(0.0f, this.tilt, this.heading, LLQuaternion.Order.YZX);
            if (!this.useOffset) {
                LLVector3 vector36 = new LLVector3(this.offset);
                vector36.mul(mayaQ);
                vector3.add(vector36);
                this.useOffset = true;
            }
            LLVector3 vector37 = new LLVector3(1.0f, 0.0f, 0.0f);
            LLVector3 vector38 = new LLVector3(0.0f, 0.0f, 1.0f);
            LLVector3 vector39 = new LLVector3(0.0f, 1.0f, 0.0f);
            vector37.mul(mayaQ);
            vector37.mul(f6);
            vector38.mul(mayaQ);
            vector38.mul((f6 * f3) + f5);
            vector39.mul(mayaQ);
            vector39.mul((f6 * f2) + f4);
            vector3.add(vector37);
            vector3.add(vector38);
            vector3.add(vector39);
            this.position.set(vector3);
        }
    }
}
