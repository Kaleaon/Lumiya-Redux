.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply$SensedData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SensedData"
.end annotation


# instance fields
.field public GroupID:Ljava/util/UUID;

.field public Name:[B

.field public ObjectID:Ljava/util/UUID;

.field public OwnerID:Ljava/util/UUID;

.field public Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public Range:F

.field public Rotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

.field public Type:I

.field public Velocity:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
