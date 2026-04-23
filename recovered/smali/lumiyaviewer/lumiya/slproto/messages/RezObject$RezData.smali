.class public Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject$RezData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RezData"
.end annotation


# instance fields
.field public BypassRaycast:I

.field public EveryoneMask:I

.field public FromTaskID:Ljava/util/UUID;

.field public GroupMask:I

.field public ItemFlags:I

.field public NextOwnerMask:I

.field public RayEnd:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public RayEndIsIntersection:Z

.field public RayStart:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public RayTargetID:Ljava/util/UUID;

.field public RemoveItem:Z

.field public RezSelected:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
