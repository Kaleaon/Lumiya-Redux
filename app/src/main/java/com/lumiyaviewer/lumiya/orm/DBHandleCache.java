package com.lumiyaviewer.lumiya.orm;

import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import com.lumiyaviewer.lumiya.Debug;
import java.lang.ref.PhantomReference;
import java.lang.ref.Reference;
import java.lang.ref.ReferenceQueue;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.Map;

public class DBHandleCache {
    private final Map<String, DBOpenRef> fileMap;
    private final Map<PhantomReference<DBHandle>, DBOpenRef> refMap;
    private final ReferenceQueue<DBHandle> refQueue;

    public interface DBOpenHelper {
        SQLiteDatabase openOrCreateDatabase(String str) throws SQLiteException;
    }

    private static class DBOpenRef {
        private final String fileName;
        private int handleCount = 0;
        private final SQLiteDatabase sqliteDB;

        public DBOpenRef(String fileName, SQLiteDatabase sqLiteDatabase) {
            this.fileName = fileName;
            this.sqliteDB = sqLiteDatabase;
        }

        public final void acquireReference() {
            this.handleCount++;
        }

        public final SQLiteDatabase getDB() {
            return this.sqliteDB;
        }

        public final String getFileName() {
            return this.fileName;
        }

        public final int releaseReference() {
            this.handleCount--;
            return this.handleCount;
        }
    }

    private static class InstanceHolder {
        private static final DBHandleCache Instance = new DBHandleCache(null);

        private InstanceHolder() {
        }
    }

    private DBHandleCache() {
        this.refQueue = new ReferenceQueue<>();
        this.refMap = new IdentityHashMap();
        this.fileMap = new HashMap();
        Debug.Printf("DBHandleCache: Initialized.", new Object[0]);
    }

    /* synthetic */ DBHandleCache(DBHandleCache dbHandleCache) {
        this();
    }

    public static DBHandleCache getInstance() {
        return InstanceHolder.Instance;
    }

    public synchronized void Cleanup() {
        while (true) {
            Reference<? extends DBHandle> poll = this.refQueue.poll();
            if (poll != null) {
                DBOpenRef remove = this.refMap.remove(poll);
                if (remove != null && remove.releaseReference() <= 0) {
                    String fileName = remove.getFileName();
                    Debug.Printf("DBHandle: Closing db '%s'", fileName);
                    try {
                        SQLiteDatabase db = remove.getDB();
                        if (db.isOpen()) {
                            db.close();
                        }
                    } catch (SQLiteException e) {
                        Debug.Warning(e);
                    }
                    this.fileMap.remove(fileName);
                }
            }
        }
    }

    public synchronized DBHandle OpenDB(String str, DBOpenHelper dbOpenHelper) throws SQLiteException {
        DBHandle dbHandle;
        DBOpenRef dbOpenRef = this.fileMap.get(str);
        if (dbOpenRef == null) {
            Debug.Printf("DBHandle: Opening db '%s'", str);
            dbOpenRef = new DBOpenRef(str, dbOpenHelper.openOrCreateDatabase(str));
            this.fileMap.put(str, dbOpenRef);
        }
        dbHandle = new DBHandle(dbOpenRef.getDB());
        dbOpenRef.acquireReference();
        this.refMap.put(new PhantomReference<>(dbHandle, this.refQueue), dbOpenRef);
        return dbHandle;
    }

    public synchronized boolean hasOpenHandles() {
        return !(this.fileMap.isEmpty() ? this.refMap.isEmpty() : false);
    }
}
