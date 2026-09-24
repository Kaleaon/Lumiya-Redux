package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * TeleportFailed somewhere->sim->viewer
 * announce failure of teleport request
 *
 * <p>Template: {@code TeleportFailed Low 74 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_teleport_failed()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class TeleportFailed extends SLMessage {
    public ArrayList<AlertInfo> AlertInfo_Fields = new ArrayList<>();
    public Info Info_Field;

    /** Block AlertInfo, Variable. */
    public static class AlertInfo {
        public byte[] ExtraParams; // Variable 1 - llsd extra parameters
        public byte[] Message; // Variable 1 - string id
    }

    /** Block Info, Single. */
    public static class Info {
        public UUID AgentID; // LLUUID
        public byte[] Reason; // Variable 1 - string
    }

    public TeleportFailed() {
        this.zeroCoded = false;
        this.Info_Field = new Info();
    }

    @Override
    public int CalcPayloadSize() {
        int length = this.Info_Field.Reason.length + 17 + 4 + 1;
        Iterator<?> it = this.AlertInfo_Fields.iterator();
        while (true) {
            int i = length;
            if (!it.hasNext()) {
                return i;
            }
            AlertInfo alertInfo = (AlertInfo) it.next();
            length = alertInfo.ExtraParams.length + alertInfo.Message.length + 1 + 1 + i;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleTeleportFailed(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 74 (TeleportFailed).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x4A);
        packUUID(byteBuffer, this.Info_Field.AgentID);
        packVariable(byteBuffer, this.Info_Field.Reason, 1);
        byteBuffer.put((byte) this.AlertInfo_Fields.size());
        for (AlertInfo alertInfo : this.AlertInfo_Fields) {
            packVariable(byteBuffer, alertInfo.Message, 1);
            packVariable(byteBuffer, alertInfo.ExtraParams, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Info_Field.AgentID = unpackUUID(byteBuffer);
        this.Info_Field.Reason = unpackVariable(byteBuffer, 1);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            AlertInfo alertInfo = new AlertInfo();
            alertInfo.Message = unpackVariable(byteBuffer, 1);
            alertInfo.ExtraParams = unpackVariable(byteBuffer, 1);
            this.AlertInfo_Fields.add(alertInfo);
        }
    }
}
