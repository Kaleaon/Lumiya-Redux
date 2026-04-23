.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase$Data;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Data"
.end annotation


# instance fields
.field public AgentCount:I

.field public HostName:[B

.field public PID:I

.field public RegionID:Ljava/util/UUID;

.field public Status:[B

.field public TimeToLive:I

.field public X:I

.field public Y:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
