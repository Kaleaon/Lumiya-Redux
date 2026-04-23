.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;
.super Lcom/lumiyaviewer/lumiya/slproto/SLMessage;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitObject;,
        Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;
    }
.end annotation


# instance fields
.field public SitObject_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitObject;

.field public SitTransform_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;-><init>()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->zeroCoded:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitObject;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitObject;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitObject_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitObject;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitTransform_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;

    return-void
.end method


# virtual methods
.method public CalcPayloadSize()I
    .locals 1

    const/16 v0, 0x43

    return v0
.end method

.method public Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
    .locals 0

    invoke-virtual {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;->HandleAvatarSitResponse(Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;)V

    return-void
.end method

.method public PackPayload(Ljava/nio/ByteBuffer;)V
    .locals 1

    const/16 v0, 0x15

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitObject_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitObject;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitObject;->ID:Ljava/util/UUID;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitTransform_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;->AutoPilot:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitTransform_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;->SitPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitTransform_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;->SitRotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->packLLQuaternion(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitTransform_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;->CameraEyeOffset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitTransform_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;->CameraAtOffset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitTransform_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;->ForceMouselook:Z

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->packBoolean(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method

.method public UnpackPayload(Ljava/nio/ByteBuffer;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitObject_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitObject;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitObject;->ID:Ljava/util/UUID;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitTransform_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;->AutoPilot:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitTransform_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;->SitPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitTransform_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->unpackLLQuaternion(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;->SitRotation:Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitTransform_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;->CameraEyeOffset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitTransform_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;->CameraAtOffset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->SitTransform_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;->unpackBoolean(Ljava/nio/ByteBuffer;)Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse$SitTransform;->ForceMouselook:Z

    return-void
.end method
