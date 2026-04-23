.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate$GroupData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GroupData"
.end annotation


# instance fields
.field public AcceptNotices:Z

.field public Contribution:I

.field public GroupID:Ljava/util/UUID;

.field public GroupInsigniaID:Ljava/util/UUID;

.field public GroupName:[B

.field public GroupPowers:J


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
