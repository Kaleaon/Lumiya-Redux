package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.UUID;

/**
 * SetFollowCamProperties
 *
 * <p>Template: {@code SetFollowCamProperties Low 159 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_set_follow_cam_properties()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class SetFollowCamProperties extends SLMessage {
    public ArrayList<CameraProperty> CameraProperty_Fields = new ArrayList<>();
    public ObjectData ObjectData_Field;

    /** Block CameraProperty, Variable. */
    public static class CameraProperty {
        public int Type; // S32
        public float Value; // F32
    }

    /** Block ObjectData, Single. */
    public static class ObjectData {
        public UUID ObjectID; // LLUUID
    }

    public SetFollowCamProperties() {
        this.zeroCoded = false;
        this.ObjectData_Field = new ObjectData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.CameraProperty_Fields.size() * 8) + 21;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleSetFollowCamProperties(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 159 (SetFollowCamProperties).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x9F);
        packUUID(byteBuffer, this.ObjectData_Field.ObjectID);
        byteBuffer.put((byte) this.CameraProperty_Fields.size());
        for (CameraProperty cameraProperty : this.CameraProperty_Fields) {
            packInt(byteBuffer, cameraProperty.Type);
            packFloat(byteBuffer, cameraProperty.Value);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ObjectData_Field.ObjectID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            CameraProperty cameraProperty = new CameraProperty();
            cameraProperty.Type = unpackInt(byteBuffer);
            cameraProperty.Value = unpackFloat(byteBuffer);
            this.CameraProperty_Fields.add(cameraProperty);
        }
    }
}
