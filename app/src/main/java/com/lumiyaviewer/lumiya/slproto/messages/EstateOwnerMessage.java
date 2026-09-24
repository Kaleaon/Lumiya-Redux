package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * EstateOwnerMessage
 * format must be identical to above
 *
 * <p>Template: {@code EstateOwnerMessage Low 260 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code processEstateOwnerRequest()} in indra/newview/llfloaterregioninfo.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class EstateOwnerMessage extends SLMessage {
    public AgentData AgentData_Field;
    public MethodData MethodData_Field;
    public ArrayList<ParamList> ParamList_Fields = new ArrayList<>();

    /** Block AgentData, Single. */
    public static class AgentData {
        public UUID AgentID; // LLUUID
        public UUID SessionID; // LLUUID
        public UUID TransactionID; // LLUUID
    }

    /** Block MethodData, Single. */
    public static class MethodData {
        public UUID Invoice; // LLUUID
        public byte[] Method; // Variable 1
    }

    /** Block ParamList, Variable. */
    public static class ParamList {
        public byte[] Parameter; // Variable 1
    }

    public EstateOwnerMessage() {
        this.zeroCoded = true;
        this.AgentData_Field = new AgentData();
        this.MethodData_Field = new MethodData();
    }

    @Override
    public int CalcPayloadSize() {
        int length = this.MethodData_Field.Method.length + 1 + 16 + 52 + 1;
        Iterator<?> it = this.ParamList_Fields.iterator();
        while (true) {
            int i = length;
            if (!it.hasNext()) {
                return i;
            }
            length = ((ParamList) it.next()).Parameter.length + 1 + i;
        }
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleEstateOwnerMessage(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 260 (EstateOwnerMessage).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x04);
        packUUID(byteBuffer, this.AgentData_Field.AgentID);
        packUUID(byteBuffer, this.AgentData_Field.SessionID);
        packUUID(byteBuffer, this.AgentData_Field.TransactionID);
        packVariable(byteBuffer, this.MethodData_Field.Method, 1);
        packUUID(byteBuffer, this.MethodData_Field.Invoice);
        byteBuffer.put((byte) this.ParamList_Fields.size());
        Iterator<?> it = this.ParamList_Fields.iterator();
        while (it.hasNext()) {
            packVariable(byteBuffer, ((ParamList) it.next()).Parameter, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.AgentData_Field.AgentID = unpackUUID(byteBuffer);
        this.AgentData_Field.SessionID = unpackUUID(byteBuffer);
        this.AgentData_Field.TransactionID = unpackUUID(byteBuffer);
        this.MethodData_Field.Method = unpackVariable(byteBuffer, 1);
        this.MethodData_Field.Invoice = unpackUUID(byteBuffer);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ParamList paramList = new ParamList();
            paramList.Parameter = unpackVariable(byteBuffer, 1);
            this.ParamList_Fields.add(paramList);
        }
    }
}
