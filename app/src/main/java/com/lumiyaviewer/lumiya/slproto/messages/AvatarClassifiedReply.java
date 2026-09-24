package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * AvatarClassifiedReply
 * dataserver -> simulator -> viewer
 * Send the header information for this avatar's classifieds
 * This fills in the tabs of the Classifieds panel.
 * reliable
 *
 * <p>Template: {@code AvatarClassifiedReply Low 42 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code LLAvatarPropertiesProcessor::processAvatarClassifiedsReply()} in indra/newview/llavatarpropertiesprocessor.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AvatarClassifiedReply extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<Data> Data_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID TargetID; // LLUUID
    }

    /** Block Data, Variable. */
    public static class Data {
        public UUID ClassifiedID; // LLUUID
        public byte[] Name; // Variable 1
    }

    public AvatarClassifiedReply() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int i = 37;
        Iterator<?> it = this.Data_Fields.iterator();
        while (true) {
            int i2 = i;
            if (!it.hasNext()) {
                return i2;
            }
            i = ((Data) it.next()).Name.length + 17 + i2;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAvatarClassifiedReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 42 (AvatarClassifiedReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x2A);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.TargetID);
        byteBuffer.put((byte) this.Data_Fields.size());
        for (Data data : this.Data_Fields) {
            packUUID(byteBuffer, data.ClassifiedID);
            packVariable(byteBuffer, data.Name, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.TargetID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            Data data = new Data();
            data.ClassifiedID = unpackUUID(byteBuffer);
            data.Name = unpackVariable(byteBuffer, 1);
            this.Data_Fields.add(data);
        }
    }
}
