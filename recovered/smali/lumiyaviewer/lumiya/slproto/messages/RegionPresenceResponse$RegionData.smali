.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RegionPresenceResponse$RegionData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RegionPresenceResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RegionData"
.end annotation


# instance fields
.field public ExternalRegionIP:Ljava/net/Inet4Address;

.field public InternalRegionIP:Ljava/net/Inet4Address;

.field public Message:[B

.field public RegionHandle:J

.field public RegionID:Ljava/util/UUID;

.field public RegionPort:I

.field public ValidUntil:D


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
