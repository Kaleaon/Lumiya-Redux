.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate$AgentData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AgentData"
.end annotation


# instance fields
.field public ActiveGroupID:Ljava/util/UUID;

.field public AgentID:Ljava/util/UUID;

.field public FirstName:[B

.field public GroupName:[B

.field public GroupPowers:J

.field public GroupTitle:[B

.field public LastName:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
