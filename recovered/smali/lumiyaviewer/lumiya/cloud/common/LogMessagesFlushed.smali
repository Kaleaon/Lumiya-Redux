.class public Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/cloud/common/Bundleable;


# instance fields
.field public final agentUUID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final messageIDs:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/lang/Long;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "agentUUID"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;->agentUUID:Ljava/util/UUID;

    const-string/jumbo v0, "messageIDs"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getLongArray(Ljava/lang/String;)[J

    move-result-object v0

    if-eqz v0, :cond_0

    :goto_0
    invoke-static {v0}, Lcom/google/common/primitives/Longs;->asList([J)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;->messageIDs:Lcom/google/common/collect/ImmutableList;

    return-void

    :cond_0
    const/4 v0, 0x0

    new-array v0, v0, [J

    goto :goto_0
.end method

.method public constructor <init>(Ljava/util/UUID;Ljava/util/Collection;)V
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/UUID;",
            "Ljava/util/Collection",
            "<",
            "Ljava/lang/Long;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;->agentUUID:Ljava/util/UUID;

    invoke-static {p2}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;->messageIDs:Lcom/google/common/collect/ImmutableList;

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "agentUUID"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesFlushed;->messageIDs:Lcom/google/common/collect/ImmutableList;

    invoke-static {v1}, Lcom/google/common/primitives/Longs;->toArray(Ljava/util/Collection;)[J

    move-result-object v1

    const-string/jumbo v2, "messageIDs"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putLongArray(Ljava/lang/String;[J)V

    return-object v0
.end method
