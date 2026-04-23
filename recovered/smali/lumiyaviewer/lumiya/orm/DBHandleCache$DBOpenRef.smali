.class Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/orm/DBHandleCache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DBOpenRef"
.end annotation


# instance fields
.field private final fileName:Ljava/lang/String;

.field private handleCount:I

.field private final sqliteDB:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->fileName:Ljava/lang/String;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->sqliteDB:Landroid/database/sqlite/SQLiteDatabase;

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->handleCount:I

    return-void
.end method


# virtual methods
.method public final acquireReference()V
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->handleCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->handleCount:I

    return-void
.end method

.method public final getDB()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->sqliteDB:Landroid/database/sqlite/SQLiteDatabase;

    return-object v0
.end method

.method public final getFileName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public final releaseReference()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->handleCount:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->handleCount:I

    iget v0, p0, Lcom/lumiyaviewer/lumiya/orm/DBHandleCache$DBOpenRef;->handleCount:I

    return v0
.end method
