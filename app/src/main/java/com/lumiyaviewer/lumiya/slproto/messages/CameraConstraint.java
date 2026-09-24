package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLVector4;
import java.nio.ByteBuffer;

/**
 * CameraConstraint - new camera distance limit (based on collision with objects)
 *
 * <p>Template: {@code CameraConstraint High 22 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_camera_constraint()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class CameraConstraint extends SLMessage {
    public CameraCollidePlane CameraCollidePlane_Field;

    /** Block CameraCollidePlane, Single. */
    public static class CameraCollidePlane {
        public LLVector4 Plane; // LLVector4
    }

    public CameraConstraint() {
        this.zeroCoded = true;
        this.CameraCollidePlane_Field = new CameraCollidePlane();
    }

    @Override
    public int CalcPayloadSize() {
        return 17;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleCameraConstraint(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 22 (CameraConstraint).
        byteBuffer.put((byte) 0x16);
        packLLVector4(byteBuffer, this.CameraCollidePlane_Field.Plane);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.CameraCollidePlane_Field.Plane = unpackLLVector4(byteBuffer);
    }
}
