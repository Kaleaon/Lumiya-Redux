package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;

/**
 * Simulator to Viewer Messages
 * AlertMessage
 * Specifies the text to be posted in an alert dialog
 * Also sent from dataserver to simulator with AgentInfo block
 * Simulator doesn't include AgentInfo block to viewer
 *
 * <p>Template: {@code AlertMessage Low 134 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_alert_message()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AlertMessage extends SLMessage {
    public AlertData AlertData_Field;
    public ArrayList<AlertInfo> AlertInfo_Fields = new ArrayList<>();

    /** Block AlertData, Single. */
    public static class AlertData {
        public byte[] Message; // Variable 1
    }

    /** Block AlertInfo, Variable. */
    public static class AlertInfo {
        public byte[] ExtraParams; // Variable 1
        public byte[] Message; // Variable 1
    }

    public AlertMessage() {
        this.zeroCoded = false;
        this.AlertData_Field = new AlertData();
    }

    @Override
    public int CalcPayloadSize() {
        int length = this.AlertData_Field.Message.length + 1 + 4 + 1;
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
        sLMessageHandler.HandleAlertMessage(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 134 (AlertMessage).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x86);
        packVariable(byteBuffer, this.AlertData_Field.Message, 1);
        byteBuffer.put((byte) this.AlertInfo_Fields.size());
        for (AlertInfo alertInfo : this.AlertInfo_Fields) {
            packVariable(byteBuffer, alertInfo.Message, 1);
            packVariable(byteBuffer, alertInfo.ExtraParams, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AlertData_Field.Message = unpackVariable(byteBuffer, 1);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            AlertInfo alertInfo = new AlertInfo();
            alertInfo.Message = unpackVariable(byteBuffer, 1);
            alertInfo.ExtraParams = unpackVariable(byteBuffer, 1);
            this.AlertInfo_Fields.add(alertInfo);
        }
    }
}
