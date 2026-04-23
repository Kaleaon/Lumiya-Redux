.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ChatMessageEvent"
.end annotation


# instance fields
.field public final chatMessage:Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final isNewMessage:Z

.field public final isPrivate:Z


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/dao/ChatMessage;ZZ)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/dao/ChatMessage;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;->chatMessage:Lcom/lumiyaviewer/lumiya/dao/ChatMessage;

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;->isNewMessage:Z

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ActiveChattersManager$ChatMessageEvent;->isPrivate:Z

    return-void
.end method
