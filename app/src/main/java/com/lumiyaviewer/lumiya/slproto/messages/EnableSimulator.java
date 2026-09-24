package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.net.Inet4Address;
import java.nio.ByteBuffer;

/**
 * EnableSimulator - Preps a viewer to receive data from a simulator
 *
 * <p>Template: {@code EnableSimulator Low 151 Trusted Unencoded UDPBlackListed}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_enable_simulator()} in indra/newview/llworld.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class EnableSimulator extends SLMessage {
    public SimulatorInfo SimulatorInfo_Field;

    /** Block SimulatorInfo, Single. */
    public static class SimulatorInfo {
        public long Handle; // U64
        public Inet4Address IP; // IPADDR
        public int Port; // IPPORT
    }

    public EnableSimulator() {
        this.zeroCoded = false;
        this.SimulatorInfo_Field = new SimulatorInfo();
    }

    @Override
    public int CalcPayloadSize() {
        return 18;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleEnableSimulator(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 151 (EnableSimulator).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x97);
        packLong(byteBuffer, this.SimulatorInfo_Field.Handle);
        packIPAddress(byteBuffer, this.SimulatorInfo_Field.IP);
        packShort(byteBuffer, (short) this.SimulatorInfo_Field.Port);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.SimulatorInfo_Field.Handle = unpackLong(byteBuffer);
        this.SimulatorInfo_Field.IP = unpackIPAddress(byteBuffer);
        this.SimulatorInfo_Field.Port = unpackShort(byteBuffer) & 65535;
    }
}
