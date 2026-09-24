package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * The Version 2.0 template requires preservation of message
 * numbers. Each message must be numbered relative to the
 * other messages of that type. The current highest number
 * for each type is listed below:
 * Low: 431
 * Medium: 18
 * High: 32
 * PLEASE UPDATE THIS WHEN YOU ADD A NEW MESSAGE!
 * Test Message
 * Test Message
 *
 * <p>Template: {@code TestMessage Low 1 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 */
public class TestMessage extends SLMessage {
    public NeighborBlock[] NeighborBlock_Fields = new NeighborBlock[4];
    public TestBlock1 TestBlock1_Field;

    /** Block NeighborBlock, Multiple 4. */
    public static class NeighborBlock {
        public int Test0; // U32
        public int Test1; // U32
        public int Test2; // U32
    }

    /** Block TestBlock1, Single. */
    public static class TestBlock1 {
        public int Test1; // U32
    }

    public TestMessage() {
        this.zeroCoded = true;
        this.TestBlock1_Field = new TestBlock1();
        for (int i = 0; i < 4; i++) {
            this.NeighborBlock_Fields[i] = new NeighborBlock();
        }
    }

    @Override
    public int CalcPayloadSize() {
        return 56;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleTestMessage(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 1 (TestMessage).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x01);
        packInt(byteBuffer, this.TestBlock1_Field.Test1);
        for (int i = 0; i < 4; i++) {
            packInt(byteBuffer, this.NeighborBlock_Fields[i].Test0);
            packInt(byteBuffer, this.NeighborBlock_Fields[i].Test1);
            packInt(byteBuffer, this.NeighborBlock_Fields[i].Test2);
        }
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.TestBlock1_Field.Test1 = unpackInt(byteBuffer);
        for (int i = 0; i < 4; i++) {
            this.NeighborBlock_Fields[i].Test0 = unpackInt(byteBuffer);
            this.NeighborBlock_Fields[i].Test1 = unpackInt(byteBuffer);
            this.NeighborBlock_Fields[i].Test2 = unpackInt(byteBuffer);
        }
    }
}
