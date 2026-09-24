package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * PayPriceReply
 * sim -> viewer
 *
 * <p>Template: {@code PayPriceReply Low 162 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code 0()} in indra/newview/llfloaterpay.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class PayPriceReply extends SLMessage {
    public ArrayList<ButtonData> ButtonData_Fields = new ArrayList<>();
    public ObjectData ObjectData_Field;

    /** Block ButtonData, Variable. */
    public static class ButtonData {
        public int PayButton; // S32
    }

    /** Block ObjectData, Single. */
    public static class ObjectData {
        public int DefaultPayPrice; // S32
        public UUID ObjectID; // LLUUID
    }

    public PayPriceReply() {
        this.zeroCoded = false;
        this.ObjectData_Field = new ObjectData();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.ButtonData_Fields.size() * 4) + 25;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandlePayPriceReply(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 162 (PayPriceReply).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xA2);
        packUUID(byteBuffer, this.ObjectData_Field.ObjectID);
        packInt(byteBuffer, this.ObjectData_Field.DefaultPayPrice);
        byteBuffer.put((byte) this.ButtonData_Fields.size());
        Iterator<?> it = this.ButtonData_Fields.iterator();
        while (it.hasNext()) {
            packInt(byteBuffer, ((ButtonData) it.next()).PayButton);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.ObjectData_Field.ObjectID = unpackUUID(byteBuffer);
        this.ObjectData_Field.DefaultPayPrice = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ButtonData buttonData = new ButtonData();
            buttonData.PayButton = unpackInt(byteBuffer);
            this.ButtonData_Fields.add(buttonData);
        }
    }
}
