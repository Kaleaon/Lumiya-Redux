package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.net.Inet4Address;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * Logout
 * userserver -> dataserver
 *
 * <p>Template: {@code DataServerLogout Low 251 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class DataServerLogout extends SLMessage {
    public UserData UserData_Field;

    /** Block UserData, Single. */
    public static class UserData {
        public UUID AgentID; // LLUUID
        public boolean Disconnect; // BOOL
        public UUID SessionID; // LLUUID
        public Inet4Address ViewerIP; // IPADDR
    }

    public DataServerLogout() {
        this.zeroCoded = false;
        this.UserData_Field = new UserData();
    }

    @Override
    public int CalcPayloadSize() {
        return 41;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleDataServerLogout(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 251 (DataServerLogout).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0xFB);
        packUUID(byteBuffer, this.UserData_Field.AgentID);
        packIPAddress(byteBuffer, this.UserData_Field.ViewerIP);
        packBoolean(byteBuffer, this.UserData_Field.Disconnect);
        packUUID(byteBuffer, this.UserData_Field.SessionID);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.UserData_Field.AgentID = unpackUUID(byteBuffer);
        this.UserData_Field.ViewerIP = unpackIPAddress(byteBuffer);
        this.UserData_Field.Disconnect = unpackBoolean(byteBuffer);
        this.UserData_Field.SessionID = unpackUUID(byteBuffer);
    }
}
