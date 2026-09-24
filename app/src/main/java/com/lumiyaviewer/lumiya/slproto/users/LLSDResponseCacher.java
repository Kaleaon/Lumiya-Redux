package com.lumiyaviewer.lumiya.slproto.users;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.dao.DaoSession;
import com.lumiyaviewer.lumiya.react.RequestSource;
import com.lumiyaviewer.lumiya.react.Subscribable;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.IOException;
import java.util.concurrent.Executor;
import javax.annotation.Nonnull;

public class LLSDResponseCacher<Key> extends ResponseCacher<Key, LLSDNode> {
    public LLSDResponseCacher(DaoSession daoSession, Executor executor, String str) {
        super(daoSession, executor, str);
    }

    @Override
    public /* bridge */ /* synthetic */ Subscribable getPool() {
        return super.getPool();
    }

    @Override
    public /* bridge */ /* synthetic */ RequestSource getRequestSource() {
        return super.getRequestSource();
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override
    public LLSDNode loadCached(byte[] bytes) {
        try {
            return LLSDNode.fromBinary(new DataInputStream(new ByteArrayInputStream(bytes)));
        } catch (LLSDException e) {
            Debug.Warning(e);
            return null;
        }
    }

    @Override
    public byte[] storeCached(@Nonnull LLSDNode lsdNode) {
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        DataOutputStream dataOutputStream = new DataOutputStream(byteArrayOutputStream);
        try {
            lsdNode.toBinary(dataOutputStream);
            dataOutputStream.flush();
            return byteArrayOutputStream.toByteArray();
        } catch (IOException e) {
            Debug.Warning(e);
            return null;
        }
    }
}
