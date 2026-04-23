.class public final Lcom/lumiyaviewer/lumiya/orm/DBHandle;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/database/sqlite/SQLiteDatabase$CursorFactory;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/orm/DBHandle$DBHandleCursor;
    }
.end annotation


# instance fields
.field private final sqliteDB:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandle;->sqliteDB:Landroid/database/sqlite/SQLiteDatabase;

    return-void
.end method


# virtual methods
.method public final getDB()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandle;->sqliteDB:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0
.end method

.method public newCursor(Landroid/database/sqlite/SQLiteDatabase;Landroid/database/sqlite/SQLiteCursorDriver;Ljava/lang/String;Landroid/database/sqlite/SQLiteQuery;)Landroid/database/Cursor;
    .locals 6

    new-instance v0, Lcom/lumiyaviewer/lumiya/orm/DBHandle$DBHandleCursor;

    move-object v1, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v5}, Lcom/lumiyaviewer/lumiya/orm/DBHandle$DBHandleCursor;-><init>(Lcom/lumiyaviewer/lumiya/orm/DBHandle;Landroid/database/sqlite/SQLiteDatabase;Landroid/database/sqlite/SQLiteCursorDriver;Ljava/lang/String;Landroid/database/sqlite/SQLiteQuery;)V

    return-object v0
.end method
