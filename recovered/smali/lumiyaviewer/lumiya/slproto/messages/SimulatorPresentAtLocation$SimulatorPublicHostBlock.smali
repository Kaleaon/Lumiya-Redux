.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation$SimulatorPublicHostBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimulatorPublicHostBlock"
.end annotation


# instance fields
.field public GridX:I

.field public GridY:I

.field public Port:I

.field public SimulatorIP:Ljava/net/Inet4Address;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
