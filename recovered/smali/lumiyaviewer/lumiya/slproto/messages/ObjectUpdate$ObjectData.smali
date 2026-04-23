.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate$ObjectData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectData"
.end annotation


# instance fields
.field public CRC:I

.field public ClickAction:I

.field public Data:[B

.field public ExtraParams:[B

.field public Flags:I

.field public FullID:Ljava/util/UUID;

.field public Gain:F

.field public ID:I

.field public JointAxisOrAnchor:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public JointPivot:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public JointType:I

.field public Material:I

.field public MediaURL:[B

.field public NameValue:[B

.field public ObjectData:[B

.field public OwnerID:Ljava/util/UUID;

.field public PCode:I

.field public PSBlock:[B

.field public ParentID:I

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

.field public Radius:F

.field public Scale:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public Sound:Ljava/util/UUID;

.field public State:I

.field public Text:[B

.field public TextColor:[B

.field public TextureAnim:[B

.field public TextureEntry:[B

.field public UpdateFlags:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
