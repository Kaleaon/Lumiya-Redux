.class public Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList$NeighborBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NeighborBlock"
.end annotation


# instance fields
.field public IP:Ljava/net/Inet4Address;

.field public Name:[B

.field public Port:I

.field public PublicIP:Ljava/net/Inet4Address;

.field public PublicPort:I

.field public RegionID:Ljava/util/UUID;

.field public SimAccess:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
