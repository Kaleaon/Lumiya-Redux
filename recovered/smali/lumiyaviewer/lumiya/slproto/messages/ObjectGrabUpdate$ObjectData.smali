.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrabUpdate$ObjectData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrabUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectData"
.end annotation


# instance fields
.field public GrabOffsetInitial:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public GrabPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public ObjectID:Ljava/util/UUID;

.field public TimeSinceLast:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
