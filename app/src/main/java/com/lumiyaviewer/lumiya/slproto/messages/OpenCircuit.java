package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.net.Inet4Address;
import java.nio.ByteBuffer;

/**
 * OpenCircuit - Tells the recipient's messaging system to open the descibed circuit
 *
 * <p>Template: {@code OpenCircuit Fixed 0xFFFFFFFC NotTrusted Unencoded UDPBlackListed}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code open_circuit()} in indra/llmessage/message.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class OpenCircuit extends SLMessage {
    public CircuitInfo CircuitInfo_Field;

    /** Block CircuitInfo, Single. */
    public static class CircuitInfo {
        public Inet4Address IP; // IPADDR
        public int Port; // IPPORT
    }

    public OpenCircuit() {
        this.zeroCoded = false;
        this.CircuitInfo_Field = new CircuitInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return 10;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleOpenCircuit(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Fixed 0xFFFFFFFC (OpenCircuit).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0xFF);
        byteBuffer.put((byte) 0xFC);
        packIPAddress(byteBuffer, this.CircuitInfo_Field.IP);
        packShort(byteBuffer, (short) this.CircuitInfo_Field.Port);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.CircuitInfo_Field.IP = unpackIPAddress(byteBuffer);
        this.CircuitInfo_Field.Port = unpackShort(byteBuffer) & 65535;
    }
}
