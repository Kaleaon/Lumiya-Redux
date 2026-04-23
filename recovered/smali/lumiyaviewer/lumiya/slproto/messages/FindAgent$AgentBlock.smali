.class public Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent$AgentBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AgentBlock"
.end annotation


# instance fields
.field public Hunter:Ljava/util/UUID;

.field public Prey:Ljava/util/UUID;

.field public SpaceIP:Ljava/net/Inet4Address;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
