package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AvatarSitResponse - response to a request to sit on an object
 *
 * <p>Template: {@code AvatarSitResponse High 21 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_avatar_sit_response()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AvatarSitResponse extends SLMessage {
    public SitObject SitObject_Field;
    public SitTransform SitTransform_Field;

    /** Block SitObject, Single. */
    public static class SitObject {
        public UUID ID; // LLUUID
    }

    /** Block SitTransform, Single. */
    public static class SitTransform {
        public boolean AutoPilot; // BOOL
        public LLVector3 CameraAtOffset; // LLVector3
        public LLVector3 CameraEyeOffset; // LLVector3
        public boolean ForceMouselook; // BOOL
        public LLVector3 SitPosition; // LLVector3
        public LLQuaternion SitRotation; // LLQuaternion
    }

    public AvatarSitResponse() {
        this.zeroCoded = true;
        this.SitObject_Field = new SitObject();
        this.SitTransform_Field = new SitTransform();
    }

    @Override
    public int CalcPayloadSize() {
        return 67;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAvatarSitResponse(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 21 (AvatarSitResponse).
        byteBuffer.put((byte) 0x15);
        packUUID(byteBuffer, this.SitObject_Field.ID);
        packBoolean(byteBuffer, this.SitTransform_Field.AutoPilot);
        packLLVector3(byteBuffer, this.SitTransform_Field.SitPosition);
        packLLQuaternion(byteBuffer, this.SitTransform_Field.SitRotation);
        packLLVector3(byteBuffer, this.SitTransform_Field.CameraEyeOffset);
        packLLVector3(byteBuffer, this.SitTransform_Field.CameraAtOffset);
        packBoolean(byteBuffer, this.SitTransform_Field.ForceMouselook);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.SitObject_Field.ID = unpackUUID(byteBuffer);
        this.SitTransform_Field.AutoPilot = unpackBoolean(byteBuffer);
        this.SitTransform_Field.SitPosition = unpackLLVector3(byteBuffer);
        this.SitTransform_Field.SitRotation = unpackLLQuaternion(byteBuffer);
        this.SitTransform_Field.CameraEyeOffset = unpackLLVector3(byteBuffer);
        this.SitTransform_Field.CameraAtOffset = unpackLLVector3(byteBuffer);
        this.SitTransform_Field.ForceMouselook = unpackBoolean(byteBuffer);
    }
}
