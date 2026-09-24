package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Disabled feature response message
 *
 * <p>Template: {@code FeatureDisabled Low 19 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_feature_disabled_message()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class FeatureDisabled extends SLMessage {
    public FailureInfo FailureInfo_Field;

    /** Block FailureInfo, Single. */
    public static class FailureInfo {
        public UUID AgentID; // LLUUID
        public byte[] ErrorMessage; // Variable 1
        public UUID TransactionID; // LLUUID
    }

    public FeatureDisabled() {
        this.zeroCoded = false;
        this.FailureInfo_Field = new FailureInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return this.FailureInfo_Field.ErrorMessage.length + 1 + 16 + 16 + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleFeatureDisabled(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 19 (FeatureDisabled).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x13);
        packVariable(byteBuffer, this.FailureInfo_Field.ErrorMessage, 1);
        packUUID(byteBuffer, this.FailureInfo_Field.AgentID);
        packUUID(byteBuffer, this.FailureInfo_Field.TransactionID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.FailureInfo_Field.ErrorMessage = unpackVariable(byteBuffer, 1);
        this.FailureInfo_Field.AgentID = unpackUUID(byteBuffer);
        this.FailureInfo_Field.TransactionID = unpackUUID(byteBuffer);
    }
}
