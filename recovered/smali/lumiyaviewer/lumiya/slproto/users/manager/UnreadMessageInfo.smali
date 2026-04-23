.class public abstract Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(ILcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UnreadMessageInfo;
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_UnreadMessageInfo;-><init>(ILcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;)V

    return-object v0
.end method


# virtual methods
.method public abstract lastMessage()Lcom/lumiyaviewer/lumiya/slproto/chat/generic/SLChatEvent;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end method

.method public abstract unreadCount()I
.end method
