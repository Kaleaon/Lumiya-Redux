.class public Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply$ReplyData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ReplyData"
.end annotation


# instance fields
.field public GroupID:Ljava/util/UUID;

.field public Message:[B

.field public Success:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
