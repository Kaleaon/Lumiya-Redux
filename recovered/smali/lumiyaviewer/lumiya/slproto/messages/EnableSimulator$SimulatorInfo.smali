.class public Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator$SimulatorInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SimulatorInfo"
.end annotation


# instance fields
.field public Handle:J

.field public IP:Ljava/net/Inet4Address;

.field public Port:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
