.class public Lcom/lumiyaviewer/lumiya/slproto/events/SLJoinLeaveGroupEvent;
.super Ljava/lang/Object;


# instance fields
.field public final groupID:Ljava/util/UUID;

.field public final isJoin:Z

.field public final success:Z


# direct methods
.method public constructor <init>(Ljava/util/UUID;ZZ)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLJoinLeaveGroupEvent;->groupID:Ljava/util/UUID;

    iput-boolean p2, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLJoinLeaveGroupEvent;->isJoin:Z

    iput-boolean p3, p0, Lcom/lumiyaviewer/lumiya/slproto/events/SLJoinLeaveGroupEvent;->success:Z

    return-void
.end method
