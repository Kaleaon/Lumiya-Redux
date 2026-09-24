package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * AgentAnimation - Update animation state
 * viewer --> simulator
 *
 * <p>Template: {@code AgentAnimation High 5 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class AgentAnimation extends SLMessage {
    public AgentData AgentData_Field;
    public ArrayList<AnimationList> AnimationList_Fields = new ArrayList<>();
    public ArrayList<PhysicalAvatarEventList> PhysicalAvatarEventList_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
    }

    /** Block AnimationList, Variable. */
    public static class AnimationList {
        public UUID AnimID; // LLUUID
        public boolean StartAnim; // BOOL
    }

    /** Block PhysicalAvatarEventList, Variable. */
    public static class PhysicalAvatarEventList {
        public byte[] TypeData; // Variable 1
    }

    public AgentAnimation() {
        this.zeroCoded = false;
        this.AgentData_Field = new AgentData();
    }

    @Override
    public int CalcPayloadSize() {
        int size = (this.AnimationList_Fields.size() * 17) + 34 + 1;
        Iterator<?> it = this.PhysicalAvatarEventList_Fields.iterator();
        while (true) {
            int i = size;
            if (!it.hasNext()) {
                return i;
            }
            size = ((PhysicalAvatarEventList) it.next()).TypeData.length + 1 + i;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleAgentAnimation(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: High 5 (AgentAnimation).
        byteBuffer.put((byte) 0x05);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        byteBuffer.put((byte) this.AnimationList_Fields.size());
        for (AnimationList animationList : this.AnimationList_Fields) {
            packUUID(byteBuffer, animationList.AnimID);
            packBoolean(byteBuffer, animationList.StartAnim);
        }
        byteBuffer.put((byte) this.PhysicalAvatarEventList_Fields.size());
        Iterator<?> it = this.PhysicalAvatarEventList_Fields.iterator();
        while (it.hasNext()) {
            packVariable(byteBuffer, ((PhysicalAvatarEventList) it.next()).TypeData, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            AnimationList animationList = new AnimationList();
            animationList.AnimID = unpackUUID(byteBuffer);
            animationList.StartAnim = unpackBoolean(byteBuffer);
            this.AnimationList_Fields.add(animationList);
        }
        int i3 = byteBuffer.get() & 0xFF;
        for (int i4 = 0; i4 < i3; i4++) {
            PhysicalAvatarEventList physicalAvatarEventList = new PhysicalAvatarEventList();
            physicalAvatarEventList.TypeData = unpackVariable(byteBuffer, 1);
            this.PhysicalAvatarEventList_Fields.add(physicalAvatarEventList);
        }
    }
}
