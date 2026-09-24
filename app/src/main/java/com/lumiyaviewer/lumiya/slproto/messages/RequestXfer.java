package com.lumiyaviewer.lumiya.slproto.messages;

import com.lumiyaviewer.lumiya.slproto.SLMessage;
import java.nio.ByteBuffer;
import java.util.UUID;

/**
 * General file transfer
 * RequestXfer - request an arbitrary xfer
 *
 * <p>Template: {@code RequestXfer Low 156 NotTrusted Zerocoded}
 * (recovered/reference/message_template.msg).
 * <p>Viewer reference: {@code process_request_xfer()} in indra/llmessage/llxfermanager.cpp
 * (secondlife/viewer @ c179f76c01).
 */
public class RequestXfer extends SLMessage {
    public XferID XferID_Field;

    /** Block XferID, Single. */
    public static class XferID {
        public boolean DeleteOnCompletion; // BOOL
        public int FilePath; // U8 - ELLPath
        public byte[] Filename; // Variable 1
        public long ID; // U64
        public boolean UseBigPackets; // BOOL
        public UUID VFileID; // LLUUID
        public int VFileType; // S16
    }

    public RequestXfer() {
        this.zeroCoded = true;
        this.XferID_Field = new XferID();
    }

    @Override
    public int CalcPayloadSize() {
        return this.XferID_Field.Filename.length + 9 + 1 + 1 + 1 + 16 + 2 + 4;
    }

    @Override
    public void Handle(SLMessageHandler sLMessageHandler) {
        sLMessageHandler.HandleRequestXfer(this);
    }

    @Override
    public void PackPayload(ByteBuffer byteBuffer) {
        // Message number: Low 156 (RequestXfer).
        byteBuffer.putShort((short) 0xFFFF);
        byteBuffer.put((byte) 0x00);
        byteBuffer.put((byte) 0x9C);
        packLong(byteBuffer, this.XferID_Field.ID);
        packVariable(byteBuffer, this.XferID_Field.Filename, 1);
        packByte(byteBuffer, (byte) this.XferID_Field.FilePath);
        packBoolean(byteBuffer, this.XferID_Field.DeleteOnCompletion);
        packBoolean(byteBuffer, this.XferID_Field.UseBigPackets);
        packUUID(byteBuffer, this.XferID_Field.VFileID);
        packShort(byteBuffer, (short) this.XferID_Field.VFileType);
    }

    @Override
    public void UnpackPayload(ByteBuffer byteBuffer) {
        this.XferID_Field.ID = unpackLong(byteBuffer);
        this.XferID_Field.Filename = unpackVariable(byteBuffer, 1);
        this.XferID_Field.FilePath = unpackByte(byteBuffer) & 0xFF;
        this.XferID_Field.DeleteOnCompletion = unpackBoolean(byteBuffer);
        this.XferID_Field.UseBigPackets = unpackBoolean(byteBuffer);
        this.XferID_Field.VFileID = unpackUUID(byteBuffer);
        this.XferID_Field.VFileType = unpackShort(byteBuffer);
    }
}
