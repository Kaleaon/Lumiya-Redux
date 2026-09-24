package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * userserver -> viewer, up-to-date inventory is here
 * could be sent as a result of spam
 * as well as in response to InventoryRequest
 * {
 * InventoryUpdate Low Trusted Unencoded
 * {
 * AgentData Single
 * {   AgentID LLUUID  }
 * }
 * {
 * InventoryData Single
 * {   IsComplete  U8          }
 * {   Filename    Variable 1  }
 * }
 * }
 * dataserver-> userserver -> viewer to move around the mute list
 *
 * <p>Template: {@code MuteListUpdate Low 318 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class MuteListUpdate extends SLMessage {
    public MuteData MuteData_Field;

    /** Block MuteData, Single. */
    public static class MuteData {
        public UUID AgentID; // LLUUID
        public byte[] Filename; // Variable 1
    }

    public MuteListUpdate() {
        this.zeroCoded = false;
        this.MuteData_Field = new MuteData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.MuteData_Field.Filename.length + 17 + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleMuteListUpdate(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 318 (MuteListUpdate).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x3E);
        packUUID(byteBuffer, this.MuteData_Field.AgentID);
        packVariable(byteBuffer, this.MuteData_Field.Filename, 1);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.MuteData_Field.AgentID = unpackUUID(byteBuffer);
        this.MuteData_Field.Filename = unpackVariable(byteBuffer, 1);
    }
}
