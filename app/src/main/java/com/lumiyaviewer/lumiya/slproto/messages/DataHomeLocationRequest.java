package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * DataHomeLocationRequest sim->data
 * Request
 *
 * <p>Template: {@code DataHomeLocationRequest Low 67 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class DataHomeLocationRequest extends SLMessage {
    public AgentInfo AgentInfo_Field;
    public Info Info_Field;

    /** Block AgentInfo, Single. */
    public static class AgentInfo {
        public int AgentEffectiveMaturity; // U32
    }

    /** Block Info, Single. */
    public static class Info {
        public UUID AgentID; // LLUUID
        public int KickedFromEstateID; // U32
    }

    public DataHomeLocationRequest() {
        this.zeroCoded = true;
        this.Info_Field = new Info();
        this.AgentInfo_Field = new AgentInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return 28;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleDataHomeLocationRequest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 67 (DataHomeLocationRequest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x43);
        packUUID(byteBuffer, this.Info_Field.AgentID);
        packInt(byteBuffer, this.Info_Field.KickedFromEstateID);
        packInt(byteBuffer, this.AgentInfo_Field.AgentEffectiveMaturity);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Info_Field.AgentID = unpackUUID(byteBuffer);
        this.Info_Field.KickedFromEstateID = unpackInt(byteBuffer);
        this.AgentInfo_Field.AgentEffectiveMaturity = unpackInt(byteBuffer);
    }
}
