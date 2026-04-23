.class public Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/cloud/common/Bundleable;


# instance fields
.field public final agentUUID:Ljava/util/UUID;

.field public final lastWrittenMessageID:J


# direct methods
.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "agentUUID"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;->agentUUID:Ljava/util/UUID;

    const-string/jumbo v0, "lastWrittenMessageID"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;->lastWrittenMessageID:J

    return-void
.end method

.method public constructor <init>(Ljava/util/UUID;J)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;->agentUUID:Ljava/util/UUID;

    iput-wide p2, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;->lastWrittenMessageID:J

    return-void
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "agentUUID"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogMessagesCompleted;->lastWrittenMessageID:J

    const-string/jumbo v1, "lastWrittenMessageID"

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    return-object v0
.end method
