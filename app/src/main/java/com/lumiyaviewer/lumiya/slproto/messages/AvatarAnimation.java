package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * Avatar information
 * AvatarAnimation - Update animation state
 * simulator --> viewer
 *
 * <p>Template: {@code AvatarAnimation High 20 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_avatar_animation()} in indra/newview/llviewermessage.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class AvatarAnimation extends SLMessage {
    public ArrayList<AnimationList> AnimationList_Fields = new ArrayList<>();
    public ArrayList<AnimationSourceList> AnimationSourceList_Fields = new ArrayList<>();
    public ArrayList<PhysicalAvatarEventList> PhysicalAvatarEventList_Fields = new ArrayList<>();
    public Sender Sender_Field;

    /** Block AnimationList, Variable. */
    public static class AnimationList {
        public UUID AnimID; // LLUUID
        public int AnimSequenceID; // S32
    }

    /** Block AnimationSourceList, Variable. */
    public static class AnimationSourceList {
        public UUID ObjectID; // LLUUID
    }

    /** Block PhysicalAvatarEventList, Variable. */
    public static class PhysicalAvatarEventList {
        public byte[] TypeData; // Variable 1
    }

    /** Block Sender, Single. */
    public static class Sender {
        public UUID ID; // LLUUID
    }

    public AvatarAnimation() {
        this.zeroCoded = false;
        this.Sender_Field = new Sender();
    }

    @Override
    public int CalcPayloadSize() {
        int size = (this.AnimationList_Fields.size() * 20) + 18 + 1 + (this.AnimationSourceList_Fields.size() * 16) + 1;
        Iterator<?> it = this.PhysicalAvatarEventList_Fields.iterator();
        while (true) {
            int size2 = size;
            if (!it.hasNext()) {
                return size2;
            }
            size = ((PhysicalAvatarEventList) it.next()).TypeData.length + 1 + size2;
        }
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleAvatarAnimation(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 20 (AvatarAnimation).
        byteBuffer.put((byte) 0x14);
        packUUID(byteBuffer, this.Sender_Field.ID);
        byteBuffer.put((byte) this.AnimationList_Fields.size());
        for (AnimationList animationList : this.AnimationList_Fields) {
            packUUID(byteBuffer, animationList.AnimID);
            packInt(byteBuffer, animationList.AnimSequenceID);
        }
        byteBuffer.put((byte) this.AnimationSourceList_Fields.size());
        Iterator<?> it = this.AnimationSourceList_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((AnimationSourceList) it.next()).ObjectID);
        }
        byteBuffer.put((byte) this.PhysicalAvatarEventList_Fields.size());
        Iterator<?> iterator = this.PhysicalAvatarEventList_Fields.iterator();
        while (iterator.hasNext()) {
            packVariable(byteBuffer, ((PhysicalAvatarEventList) iterator.next()).TypeData, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Sender_Field.ID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int j = 0; j < i; j++) {
            AnimationList animationList = new AnimationList();
            animationList.AnimID = unpackUUID(byteBuffer);
            animationList.AnimSequenceID = unpackInt(byteBuffer);
            this.AnimationList_Fields.add(animationList);
        }
        int i3 = byteBuffer.get() & 0xFF;
        for (int k = 0; k < i3; k++) {
            AnimationSourceList animationSourceList = new AnimationSourceList();
            animationSourceList.ObjectID = unpackUUID(byteBuffer);
            this.AnimationSourceList_Fields.add(animationSourceList);
        }
        int i5 = byteBuffer.get() & 0xFF;
        for (int m = 0; m < i5; m++) {
            PhysicalAvatarEventList physicalAvatarEventList = new PhysicalAvatarEventList();
            physicalAvatarEventList.TypeData = unpackVariable(byteBuffer, 1);
            this.PhysicalAvatarEventList_Fields.add(physicalAvatarEventList);
        }
    }
}
