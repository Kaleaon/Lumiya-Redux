.class public Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse$InviteData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "InviteData"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public GroupID:Ljava/util/UUID;

.field public InviteeID:Ljava/util/UUID;

.field public MembershipFee:I

.field public RoleID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
