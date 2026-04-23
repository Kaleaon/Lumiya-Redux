.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd$ObjectData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectData"
.end annotation


# instance fields
.field public AddFlags:I

.field public BypassRaycast:I

.field public Material:I

.field public PCode:I

.field public PathBegin:I

.field public PathCurve:I

.field public PathEnd:I

.field public PathRadiusOffset:I

.field public PathRevolutions:I

.field public PathScaleX:I

.field public PathScaleY:I

.field public PathShearX:I

.field public PathShearY:I

.field public PathSkew:I

.field public PathTaperX:I

.field public PathTaperY:I

.field public PathTwist:I

.field public PathTwistBegin:I

.field public ProfileBegin:I

.field public ProfileCurve:I

.field public ProfileEnd:I

.field public ProfileHollow:I

.field public RayEnd:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public RayEndIsIntersection:I

.field public RayStart:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public RayTargetID:Ljava/util/UUID;

.field public Rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

.field public Scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public State:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
