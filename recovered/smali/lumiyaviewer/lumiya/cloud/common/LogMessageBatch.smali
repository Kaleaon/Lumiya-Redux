.class public Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/cloud/common/Bundleable;


# instance fields
.field public final agentName:Ljava/lang/String;

.field public final agentUUID:Ljava/util/UUID;

.field public final lastMessageID:J

.field public final messages:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 6

    const/4 v0, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v1, "agentUUID"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;->agentUUID:Ljava/util/UUID;

    const-string/jumbo v1, "agentName"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;->agentName:Ljava/lang/String;

    const-string/jumbo v1, "lastMessageID"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;->lastMessageID:J

    const-string/jumbo v1, "messages"

    invoke-virtual {p1, v1}, Landroid/os/Bundle;->getParcelableArray(Ljava/lang/String;)[Landroid/os/Parcelable;

    move-result-object v2

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v3

    if-nez v2, :cond_1

    :cond_0
    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;->messages:Lcom/google/common/collect/ImmutableList;

    return-void

    :cond_1
    array-length v4, v2

    move v1, v0

    :goto_0
    if-ge v1, v4, :cond_0

    aget-object v0, v2, v1

    instance-of v5, v0, Landroid/os/Bundle;

    if-nez v5, :cond_2

    :goto_1
    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_2
    new-instance v5, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;

    check-cast v0, Landroid/os/Bundle;

    invoke-direct {v5, v0}, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;-><init>(Landroid/os/Bundle;)V

    invoke-virtual {v3, v5}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;

    goto :goto_1
.end method

.method public constructor <init>(Ljava/util/UUID;Ljava/lang/String;Ljava/util/List;J)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Ljava/lang/String;",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;",
            ">;J)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;->agentUUID:Ljava/util/UUID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;->agentName:Ljava/lang/String;

    invoke-static {p3}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;->messages:Lcom/google/common/collect/ImmutableList;

    iput-wide p4, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;->lastMessageID:J

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 4

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "agentUUID"

    invoke-virtual {v2, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;->agentName:Ljava/lang/String;

    const-string/jumbo v1, "agentName"

    invoke-virtual {v2, v1, v0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;->lastMessageID:J

    const-string/jumbo v3, "lastMessageID"

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;->messages:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    new-array v3, v0, [Landroid/os/Bundle;

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;->messages:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    if-lt v1, v0, :cond_0

    const-string/jumbo v0, "messages"

    invoke-virtual {v2, v0, v3}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    return-object v2

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessageBatch;->messages:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    aput-object v0, v3, v1

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0
.end method
