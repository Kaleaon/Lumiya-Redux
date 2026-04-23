.class public Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint$CameraCollidePlane;
    }
.end annotation


# instance fields
.field public CameraCollidePlane_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint$CameraCollidePlane;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint$CameraCollidePlane;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint$CameraCollidePlane;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint;->CameraCollidePlane_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint$CameraCollidePlane;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x11

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleCameraConstraint(Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/16 v0, 0x16

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint;->CameraCollidePlane_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint$CameraCollidePlane;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint$CameraCollidePlane;->Plane:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint;->packLLVector4(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint;->CameraCollidePlane_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint$CameraCollidePlane;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint;->unpackLLVector4(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint$CameraCollidePlane;->Plane:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    return-void
.end method
