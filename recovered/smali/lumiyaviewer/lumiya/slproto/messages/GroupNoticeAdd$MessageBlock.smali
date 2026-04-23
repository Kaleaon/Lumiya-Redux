.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd$MessageBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MessageBlock"
.end annotation


# instance fields
.field public BinaryBucket:[B

.field public Dialog:I

.field public FromAgentName:[B

.field public ID:Ljava/util/UUID;

.field public Message:[B

.field public ToGroupID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
