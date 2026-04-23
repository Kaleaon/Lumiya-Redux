.class Lcom/lumiyaviewer/lumiya/orm/DBHandle$DBHandleCursor;
.super Landroid/database/sqlite/SQLiteCursor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/orm/DBHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DBHandleCursor"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/orm/DBHandle;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/orm/DBHandle;Landroid/database/sqlite/SQLiteDatabase;Landroid/database/sqlite/SQLiteCursorDriver;Ljava/lang/String;Landroid/database/sqlite/SQLiteQuery;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandle$DBHandleCursor;->this$0:Lcom/lumiyaviewer/lumiya/orm/DBHandle;

    invoke-direct {p0, p2, p3, p4, p5}, Landroid/database/sqlite/SQLiteCursor;-><init>(Landroid/database/sqlite/SQLiteDatabase;Landroid/database/sqlite/SQLiteCursorDriver;Ljava/lang/String;Landroid/database/sqlite/SQLiteQuery;)V

    return-void
.end method
