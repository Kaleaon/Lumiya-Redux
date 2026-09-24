package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * Launcher messages
 * NetTest - This goes back and forth to the space server because of
 * problems determining the port
 *
 * <p>Template: {@code NetTest Low 326 NotTrusted Unencoded}
 * (recovered/reference/message_template.msg).
 */
public class NetTest extends SLMessage {
    public NetBlock NetBlock_Field;

    /** Block NetBlock, Single. */
    public static class NetBlock {
        public int Port; // IPPORT
    }

    public NetTest() {
        this.zeroCoded = false;
        this.NetBlock_Field = new NetBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 6;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleNetTest(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 326 (NetTest).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0x46);
        packShort(byteBuffer, (short) this.NetBlock_Field.Port);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.NetBlock_Field.Port = unpackShort(byteBuffer) & 65535;
    }
}
