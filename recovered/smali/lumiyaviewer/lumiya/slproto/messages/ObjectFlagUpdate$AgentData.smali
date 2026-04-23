.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectFlagUpdate$AgentData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectFlagUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AgentData"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public CastsShadows:Z

.field public IsPhantom:Z

.field public IsTemporary:Z

.field public ObjectLocalID:I

.field public SessionID:Ljava/util/UUID;

.field public UsePhysics:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
