package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * ScriptDialog
 * sim -> viewer
 * reliable
 *
 * <p>Template: {@code ScriptDialog Low 190 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_script_dialog()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ScriptDialog extends SLMessage {
    public Data Data_Field;
    public ArrayList<Buttons> Buttons_Fields = new ArrayList<>();
    public ArrayList<OwnerData> OwnerData_Fields = new ArrayList<>();

    /** Block Buttons, Variable. */
    public static class Buttons {
        public byte[] ButtonLabel; // Variable 1
    }

    /** Block Data, Single. */
    public static class Data {
        public int ChatChannel; // S32
        public byte[] FirstName; // Variable 1
        public UUID ImageID; // LLUUID
        public byte[] LastName; // Variable 1
        public byte[] Message; // Variable 2
        public UUID ObjectID; // LLUUID
        public byte[] ObjectName; // Variable 1
    }

    /** Block OwnerData, Variable. */
    public static class OwnerData {
        public UUID OwnerID; // LLUUID
    }

    public ScriptDialog() {
        this.zeroCoded = true;
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        int length = this.Data_Field.FirstName.length + 17 + 1 + this.Data_Field.LastName.length + 1 + this.Data_Field.ObjectName.length + 2 + this.Data_Field.Message.length + 4 + 16 + 4 + 1;
        Iterator<?> it = this.Buttons_Fields.iterator();
        while (true) {
            int i = length;
            if (!it.hasNext()) {
                return i + 1 + (this.OwnerData_Fields.size() * 16);
            }
            length = ((Buttons) it.next()).ButtonLabel.length + 1 + i;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleScriptDialog(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 190 (ScriptDialog).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xBE);
        packUUID(byteBuffer, this.Data_Field.ObjectID);
        packVariable(byteBuffer, this.Data_Field.FirstName, 1);
        packVariable(byteBuffer, this.Data_Field.LastName, 1);
        packVariable(byteBuffer, this.Data_Field.ObjectName, 1);
        packVariable(byteBuffer, this.Data_Field.Message, 2);
        packInt(byteBuffer, this.Data_Field.ChatChannel);
        packUUID(byteBuffer, this.Data_Field.ImageID);
        byteBuffer.put((byte) this.Buttons_Fields.size());
        Iterator<?> it = this.Buttons_Fields.iterator();
        while (it.hasNext()) {
            packVariable(byteBuffer, ((Buttons) it.next()).ButtonLabel, 1);
        }
        byteBuffer.put((byte) this.OwnerData_Fields.size());
        Iterator<?> it2 = this.OwnerData_Fields.iterator();
        while (it2.hasNext()) {
            packUUID(byteBuffer, ((OwnerData) it2.next()).OwnerID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Data_Field.ObjectID = unpackUUID(byteBuffer);
        this.Data_Field.FirstName = unpackVariable(byteBuffer, 1);
        this.Data_Field.LastName = unpackVariable(byteBuffer, 1);
        this.Data_Field.ObjectName = unpackVariable(byteBuffer, 1);
        this.Data_Field.Message = unpackVariable(byteBuffer, 2);
        this.Data_Field.ChatChannel = unpackInt(byteBuffer);
        this.Data_Field.ImageID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            Buttons buttons = new Buttons();
            buttons.ButtonLabel = unpackVariable(byteBuffer, 1);
            this.Buttons_Fields.add(buttons);
        }
        int i3 = byteBuffer.get() & 0xFF;
        for (int i4 = 0; i4 < i3; i4++) {
            OwnerData ownerData = new OwnerData();
            ownerData.OwnerID = unpackUUID(byteBuffer);
            this.OwnerData_Fields.add(ownerData);
        }
    }
}
