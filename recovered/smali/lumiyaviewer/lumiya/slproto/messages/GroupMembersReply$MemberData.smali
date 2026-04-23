.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply$MemberData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MemberData"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public AgentPowers:J

.field public Contribution:I

.field public IsOwner:Z

.field public OnlineStatus:[B

.field public Title:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
