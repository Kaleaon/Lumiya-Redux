.class public Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/cloud/common/Bundleable;


# instance fields
.field public final chatterName:Ljava/lang/String;

.field public final chatterType:I

.field public final chatterUUID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final messageID:J

.field public final messageText:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/util/UUID;JLjava/lang/String;Ljava/lang/String;)V
    .locals 1
    .param p2    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->chatterType:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->chatterUUID:Ljava/util/UUID;

    iput-wide p3, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->messageID:J

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->chatterName:Ljava/lang/String;

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->messageText:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>(Landroid/os/Bundle;)V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string/jumbo v0, "chatterType"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->chatterType:I

    const-string/jumbo v0, "chatterUUID"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->chatterUUID:Ljava/util/UUID;

    const-string/jumbo v0, "messageID"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getLong(Ljava/lang/String;)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->messageID:J

    const-string/jumbo v0, "chatterName"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->chatterName:Ljava/lang/String;

    const-string/jumbo v0, "messageText"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->messageText:Ljava/lang/String;

    return-void

    :cond_0
    const-string/jumbo v0, "chatterUUID"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    goto :goto_0
.end method


# virtual methods
.method public toBundle()Landroid/os/Bundle;
    .locals 4

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->chatterType:I

    const-string/jumbo v2, "chatterType"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->chatterUUID:Ljava/util/UUID;

    if-nez v1, :cond_0

    :goto_0
    iget-wide v2, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->messageID:J

    const-string/jumbo v1, "messageID"

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->chatterName:Ljava/lang/String;

    const-string/jumbo v2, "chatterName"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->messageText:Ljava/lang/String;

    const-string/jumbo v2, "messageText"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    return-object v0

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/cloud/common/LogChatMessage;->chatterUUID:Ljava/util/UUID;

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "chatterUUID"

    invoke-virtual {v0, v2, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
