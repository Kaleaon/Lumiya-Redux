.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator$ChatData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ChatData"
.end annotation


# instance fields
.field public Audible:I

.field public ChatType:I

.field public FromName:[B

.field public Message:[B

.field public OwnerID:Ljava/util/UUID;

.field public Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public SourceID:Ljava/util/UUID;

.field public SourceType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
