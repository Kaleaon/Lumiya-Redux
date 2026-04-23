.class Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceGroup;
.super Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;


# instance fields
.field public final name:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final uuid:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;-><init>()V

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getSenderUUID()Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceGroup;->uuid:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->getSenderName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceGroup;->name:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getDefaultChatter(Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceGroup;->uuid:Ljava/util/UUID;

    invoke-static {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getGroupChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    return-object v0
.end method

.method public getSourceName(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Ljava/lang/String;
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceGroup;->name:Ljava/lang/String;

    return-object v0
.end method

.method public getSourceType()Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;->Group:Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource$ChatMessageSourceType;

    return-object v0
.end method

.method public getSourceUUID()Ljava/util/UUID;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceGroup;->uuid:Ljava/util/UUID;

    return-object v0
.end method

.method public serializeTo(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSource;->serializeTo(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceGroup;->uuid:Ljava/util/UUID;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setSenderUUID(Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/chatsrc/ChatMessageSourceGroup;->name:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/dao/ChatMessage;->setSenderName(Ljava/lang/String;)V

    return-void
.end method
