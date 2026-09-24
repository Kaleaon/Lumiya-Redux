package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * AvatarAppearance - Update visual params
 *
 * <p>Template: {@code AvatarAppearance Low 158 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_avatar_appearance()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AvatarAppearance extends SLMessage {
    public ObjectData ObjectData_Field;
    public Sender Sender_Field;
    public ArrayList<VisualParam> VisualParam_Fields = new ArrayList<>();
    public ArrayList<AppearanceData> AppearanceData_Fields = new ArrayList<>();

    /** Block AppearanceData, Variable. */
    public static class AppearanceData {
        public int AppearanceVersion; // U8
        public int CofVersion; // S32
        public int Flags; // U32
    }

    /** Block ObjectData, Single. */
    public static class ObjectData {
        public byte[] TextureEntry; // Variable 2
    }

    /** Block Sender, Single. */
    public static class Sender {
        public UUID ID; // LLUUID
        public boolean IsTrial; // BOOL
    }

    /** Block VisualParam, Variable. */
    public static class VisualParam {
        public int ParamValue; // U8
    }

    public AvatarAppearance() {
        this.zeroCoded = true;
        this.Sender_Field = new Sender();
        this.ObjectData_Field = new ObjectData();
    }

    @Override
    public int CalcPayloadSize() {
        return this.ObjectData_Field.TextureEntry.length + 2 + 21 + 1 + (this.VisualParam_Fields.size() * 1) + 1 + (this.AppearanceData_Fields.size() * 9);
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAvatarAppearance(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 158 (AvatarAppearance).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x9E);
        packUUID(byteBuffer, this.Sender_Field.ID);
        packBoolean(byteBuffer, this.Sender_Field.IsTrial);
        packVariable(byteBuffer, this.ObjectData_Field.TextureEntry, 2);
        byteBuffer.put((byte) this.VisualParam_Fields.size());
        Iterator<?> it = this.VisualParam_Fields.iterator();
        while (it.hasNext()) {
            packByte(byteBuffer, (byte) ((VisualParam) it.next()).ParamValue);
        }
        byteBuffer.put((byte) this.AppearanceData_Fields.size());
        for (AppearanceData appearanceData : this.AppearanceData_Fields) {
            packByte(byteBuffer, (byte) appearanceData.AppearanceVersion);
            packInt(byteBuffer, appearanceData.CofVersion);
            packInt(byteBuffer, appearanceData.Flags);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Sender_Field.ID = unpackUUID(byteBuffer);
        this.Sender_Field.IsTrial = unpackBoolean(byteBuffer);
        this.ObjectData_Field.TextureEntry = unpackVariable(byteBuffer, 2);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            VisualParam visualParam = new VisualParam();
            visualParam.ParamValue = unpackByte(byteBuffer) & 0xFF;
            this.VisualParam_Fields.add(visualParam);
        }
        int i3 = byteBuffer.get() & 0xFF;
        for (int i4 = 0; i4 < i3; i4++) {
            AppearanceData appearanceData = new AppearanceData();
            appearanceData.AppearanceVersion = unpackByte(byteBuffer) & 0xFF;
            appearanceData.CofVersion = unpackInt(byteBuffer);
            appearanceData.Flags = unpackInt(byteBuffer);
            this.AppearanceData_Fields.add(appearanceData);
        }
    }
}
