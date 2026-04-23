.class public Lcom/lumiyaviewer/lumiya/utils/UUIDPool;
.super Lcom/lumiyaviewer/lumiya/utils/InternPool;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/utils/InternPool",
        "<",
        "Ljava/util/UUID;",
        ">;"
    }
.end annotation


# static fields
.field public static final ZeroUUID:Ljava/util/UUID;

.field private static final instance:Lcom/lumiyaviewer/lumiya/utils/UUIDPool;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    const-wide/16 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->instance:Lcom/lumiyaviewer/lumiya/utils/UUIDPool;

    new-instance v0, Ljava/util/UUID;

    invoke-direct {v0, v2, v3, v2, v3}, Ljava/util/UUID;-><init>(JJ)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/InternPool;-><init>()V

    return-void
.end method

.method public static final getInstance()Lcom/lumiyaviewer/lumiya/utils/UUIDPool;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->instance:Lcom/lumiyaviewer/lumiya/utils/UUIDPool;

    return-object v0
.end method

.method public static getUUID(JJ)Ljava/util/UUID;
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->instance:Lcom/lumiyaviewer/lumiya/utils/UUIDPool;

    new-instance v1, Ljava/util/UUID;

    invoke-direct {v1, p0, p1, p2, p3}, Ljava/util/UUID;-><init>(JJ)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    return-object v0
.end method

.method public static getUUID(Ljava/lang/String;)Ljava/util/UUID;
    .locals 2
    .param p0    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    invoke-static {p0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->instance:Lcom/lumiyaviewer/lumiya/utils/UUIDPool;

    invoke-static {p0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public static getUUID(Ljava/util/UUID;)Ljava/util/UUID;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->instance:Lcom/lumiyaviewer/lumiya/utils/UUIDPool;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    return-object v0
.end method

.method public static setUUID(Ljava/util/UUID;JJ)Ljava/util/UUID;
    .locals 3

    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-nez v0, :cond_0

    invoke-virtual {p0}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v0

    cmp-long v0, v0, p3

    if-nez v0, :cond_0

    return-object p0

    :cond_0
    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->instance:Lcom/lumiyaviewer/lumiya/utils/UUIDPool;

    new-instance v1, Ljava/util/UUID;

    invoke-direct {v1, p1, p2, p3, p4}, Ljava/util/UUID;-><init>(JJ)V

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/UUID;

    return-object v0
.end method
