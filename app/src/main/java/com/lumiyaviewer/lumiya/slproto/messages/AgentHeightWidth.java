package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * AgentHeightWidth - Update to height and aspect, sent as height/width to save space
 * Usually sent when window resized or created
 *
 * <p>Template: {@code AgentHeightWidth Low 83 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class AgentHeightWidth extends SLMessage {
    public AgentData AgentData_Field;
    public HeightWidthBlock HeightWidthBlock_Field;

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public int CircuitCode; // U32
        public UUID SessionID; // LLUUID
    }

    /** Block HeightWidthBlock, Single. */
    public static class HeightWidthBlock {
        public int GenCounter; // U32
        public int Height; // U16
        public int Width; // U16
    }

    public AgentHeightWidth() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
        this.HeightWidthBlock_Field = new HeightWidthBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 48;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAgentHeightWidth(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 83 (AgentHeightWidth).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x53);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packInt(byteBuffer, this.AgentData_Field.CircuitCode);
        packInt(byteBuffer, this.HeightWidthBlock_Field.GenCounter);
        packShort(byteBuffer, (short) this.HeightWidthBlock_Field.Height);
        packShort(byteBuffer, (short) this.HeightWidthBlock_Field.Width);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.CircuitCode = unpackInt(byteBuffer);
        this.HeightWidthBlock_Field.GenCounter = unpackInt(byteBuffer);
        this.HeightWidthBlock_Field.Height = unpackShort(byteBuffer) & 65535;
        this.HeightWidthBlock_Field.Width = unpackShort(byteBuffer) & 65535;
    }
}
