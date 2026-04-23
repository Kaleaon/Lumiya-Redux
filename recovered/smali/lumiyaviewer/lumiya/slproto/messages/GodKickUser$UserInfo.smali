.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser$UserInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UserInfo"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public GodID:Ljava/util/UUID;

.field public GodSessionID:Ljava/util/UUID;

.field public KickFlags:I

.field public Reason:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
