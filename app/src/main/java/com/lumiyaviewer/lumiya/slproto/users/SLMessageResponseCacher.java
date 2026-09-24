package com.lumiyaviewer.lumiya.slproto.users;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.dao.DaoSession;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.messages.SLMessageFactory;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.concurrent.Executor;
import javax.annotation.Nonnull;

public class SLMessageResponseCacher<Key, MessageType extends SLMessage> extends ResponseCacher<Key, MessageType> {
    public SLMessageResponseCacher(DaoSession daoSession, Executor executor, String str) {
        super(daoSession, executor, str);
    }

    @Override
    public MessageType loadCached(byte[] bytes) {
        ByteBuffer order = ByteBuffer.wrap(bytes).order(ByteOrder.nativeOrder());
        int DecodeMessageIDGeneric = SLMessage.DecodeMessageIDGeneric(order);
        MessageType messagetype = (MessageType) SLMessageFactory.CreateByID(DecodeMessageIDGeneric);
        if (messagetype != null) {
            messagetype.UnpackPayload(order);
            return messagetype;
        }
        Debug.Printf("Failed to create message for id 0x%x", Integer.valueOf(DecodeMessageIDGeneric));
        return null;
    }

    @Override
    public byte[] storeCached(@Nonnull MessageType messagetype) {
        byte[] bytes = new byte[messagetype.CalcPayloadSize()];
        messagetype.PackPayload(ByteBuffer.wrap(bytes).order(ByteOrder.nativeOrder()));
        return bytes;
    }
}
