package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.UUID;

/**
 * Generalized system message. Each Requst has its own protocol for
 * the StringData block format and contents.
 *
 * <p>Template: {@code SystemMessage Low 404 Trusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class SystemMessage extends SLMessage {
    public MethodData MethodData_Field;
    public ArrayList<ParamList> ParamList_Fields = new ArrayList<>();

    /** Block MethodData, Single. */
    public static class MethodData {
        public byte[] Digest; // Fixed 32 - 32 hex digits == 1 MD5 Digest
        public UUID Invoice; // LLUUID
        public byte[] Method; // Variable 1
    }

    /** Block ParamList, Variable. */
    public static class ParamList {
        public byte[] Parameter; // Variable 1
    }

    public SystemMessage() {
        this.zeroCoded = true;
        this.MethodData_Field = new MethodData();
    }

    @Override
    public int CalcPayloadSize() {
        int length = this.MethodData_Field.Method.length + 1 + 16 + 32 + 4 + 1;
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
        sLMessageHandler.HandleSystemMessage(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 404 (SystemMessage).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x94);
        packVariable(byteBuffer, this.MethodData_Field.Method, 1);
        packUUID(byteBuffer, this.MethodData_Field.Invoice);
        packFixed(byteBuffer, this.MethodData_Field.Digest, 32);
        byteBuffer.put((byte) this.ParamList_Fields.size());
        Iterator<?> it = this.ParamList_Fields.iterator();
        while (it.hasNext()) {
            packVariable(byteBuffer, ((ParamList) it.next()).Parameter, 1);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.MethodData_Field.Method = unpackVariable(byteBuffer, 1);
        this.MethodData_Field.Invoice = unpackUUID(byteBuffer);
        this.MethodData_Field.Digest = unpackFixed(byteBuffer, 32);
        int i = byteBuffer.get() & 0xFF;
        for (int i2 = 0; i2 < i; i2++) {
            ParamList paramList = new ParamList();
            paramList.Parameter = unpackVariable(byteBuffer, 1);
            this.ParamList_Fields.add(paramList);
        }
    }
}
