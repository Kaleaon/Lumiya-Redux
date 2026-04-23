.class public interface abstract Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenHelper;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "DBOpenHelper"
.end annotation


# virtual methods
.method public abstract openOrCreateDatabase(Ljava/lang/String;)Landroid/database/sqlite/SQLiteDatabase;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/database/sqlite/SQLiteException;
        }
    .end annotation
.end method
