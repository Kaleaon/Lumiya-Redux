.class public Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;
.super Ljava/lang/Object;


# instance fields
.field public final muteType:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

.field public final uuid:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->type:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->muteType:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->uuid:Ljava/util/UUID;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->uuid:Ljava/util/UUID;

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->muteType:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->uuid:Ljava/util/UUID;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4

    const/4 v1, 0x1

    const/4 v2, 0x0

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;

    if-nez v0, :cond_0

    return v2

    :cond_0
    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->muteType:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->muteType:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    if-eq v0, v3, :cond_1

    return v2

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->uuid:Ljava/util/UUID;

    if-nez v0, :cond_2

    move v0, v1

    :goto_0
    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->uuid:Ljava/util/UUID;

    if-nez v3, :cond_3

    move v3, v1

    :goto_1
    if-eq v0, v3, :cond_4

    return v2

    :cond_2
    move v0, v2

    goto :goto_0

    :cond_3
    move v3, v2

    goto :goto_1

    :cond_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->uuid:Ljava/util/UUID;

    if-eqz v0, :cond_5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->uuid:Ljava/util/UUID;

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->uuid:Ljava/util/UUID;

    invoke-virtual {v0, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    return v2

    :cond_5
    return v1
.end method

.method public hashCode()I
    .locals 2

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->muteType:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->muteType:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->hashCode()I

    move-result v0

    add-int/lit8 v0, v0, 0x0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->uuid:Ljava/util/UUID;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->uuid:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->hashCode()I

    move-result v1

    add-int/2addr v0, v1

    :cond_1
    return v0
.end method
