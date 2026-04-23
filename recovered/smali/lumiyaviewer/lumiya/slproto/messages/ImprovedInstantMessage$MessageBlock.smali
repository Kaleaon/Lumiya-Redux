.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage$MessageBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MessageBlock"
.end annotation


# instance fields
.field public BinaryBucket:[B

.field public Dialog:I

.field public FromAgentName:[B

.field public FromGroup:Z

.field public ID:Ljava/util/UUID;

.field public Message:[B

.field public Offline:I

.field public ParentEstateID:I

.field public Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public RegionID:Ljava/util/UUID;

.field public Timestamp:I

.field public ToAgentID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
