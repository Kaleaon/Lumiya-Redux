package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * SimCrashed - Sent to dataserver when the sim goes down.
 * Maybe we should notify the spaceserver as well?
 *
 * <p>Template: {@code SimCrashed Low 328 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class SimCrashed extends SLMessage {
    public Data Data_Field;
    public ArrayList<Users> Users_Fields = new ArrayList<>();

    /** Block Data, Single. */
    public static class Data {
        public int RegionX; // U32
        public int RegionY; // U32
    }

    /** Block Users, Variable. */
    public static class Users {
        public UUID AgentID; // LLUUID
    }

    public SimCrashed() {
        this.zeroCoded = false;
        this.Data_Field = new Data();
    }

    @Override
    public int CalcPayloadSize() {
        return (this.Users_Fields.size() * 16) + 13;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleSimCrashed(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 328 (SimCrashed).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x48);
        packInt(byteBuffer, this.Data_Field.RegionX);
        packInt(byteBuffer, this.Data_Field.RegionY);
        byteBuffer.put((byte) this.Users_Fields.size());
        Iterator<?> it = this.Users_Fields.iterator();
        while (it.hasNext()) {
            packUUID(byteBuffer, ((Users) it.next()).AgentID);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.Data_Field.RegionX = unpackInt(byteBuffer);
        this.Data_Field.RegionY = unpackInt(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            Users users = new Users();
            users.AgentID = unpackUUID(byteBuffer);
            this.Users_Fields.add(users);
        }
    }
}
