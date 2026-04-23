.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap$MapData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MapData"
.end annotation


# instance fields
.field public MapImage:Ljava/util/UUID;

.field public RegionHandle:J

.field public Type:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
