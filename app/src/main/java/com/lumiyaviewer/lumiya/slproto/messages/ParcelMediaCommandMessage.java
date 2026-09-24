package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;

/**
 * ParcelMediaCommandMessage
 * Sends a parcel media command
 *
 * <p>Template: {@code ParcelMediaCommandMessage Low 419 Trusted Unencoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code parcelMediaCommandMessageHandler()} in indra/newview/llviewerparcelmedia.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class ParcelMediaCommandMessage extends SLMessage {
    public CommandBlock CommandBlock_Field;

    /** Block CommandBlock, Single. */
    public static class CommandBlock {
        public int Command; // U32
        public int Flags; // U32
        public float Time; // F32
    }

    public ParcelMediaCommandMessage() {
        this.zeroCoded = false;
        this.CommandBlock_Field = new CommandBlock();
    }

    @Override
    public int CalcPayloadSize() {
        return 16;
    }

    @Override
    public void Handle(SLMessageHandler messageHandler) {
        messageHandler.HandleParcelMediaCommandMessage(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 419 (ParcelMediaCommandMessage).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x01);
        byteBuffer.put((byte) 0xA3);
        packInt(byteBuffer, this.CommandBlock_Field.Flags);
        packInt(byteBuffer, this.CommandBlock_Field.Command);
        packFloat(byteBuffer, this.CommandBlock_Field.Time);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.CommandBlock_Field.Flags = unpackInt(byteBuffer);
        this.CommandBlock_Field.Command = unpackInt(byteBuffer);
        this.CommandBlock_Field.Time = unpackFloat(byteBuffer);
    }
}
