.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard$AgentData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AgentData"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public AllowPublish:Z

.field public AssetID:Ljava/util/UUID;

.field public From:[B

.field public MaturePublish:Z

.field public Msg:[B

.field public Name:[B

.field public PosGlobal:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

.field public SessionID:Ljava/util/UUID;

.field public Subject:[B

.field public To:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
