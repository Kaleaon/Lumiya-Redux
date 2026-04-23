.class public Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;


# instance fields
.field private glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

.field private final rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->position(I)Ljava/nio/Buffer;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    return-void
.end method


# virtual methods
.method public final Bind(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V
    .locals 3

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->useVBO:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->KeepBuffer(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glBindArrayBuffer(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getCapacity()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glBufferArrayData(ILjava/nio/Buffer;Z)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->addCleanable(Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;)V

    :goto_0
    invoke-static {p2}, Landroid/opengl/GLES10;->glEnableClientState(I)V

    packed-switch p2, :pswitch_data_0

    :goto_1
    :pswitch_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glBindArrayBuffer(I)V

    goto :goto_0

    :pswitch_1
    invoke-static {p3, p4, p5, p6}, Landroid/opengl/GLES11;->glVertexPointer(IIII)V

    goto :goto_1

    :pswitch_2
    invoke-static {p4, p5, p6}, Landroid/opengl/GLES11;->glNormalPointer(III)V

    goto :goto_1

    :pswitch_3
    invoke-static {p3, p4, p5, p6}, Landroid/opengl/GLES11;->glTexCoordPointer(IIII)V

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->KeepBuffer(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    invoke-static {p2}, Landroid/opengl/GLES10;->glEnableClientState(I)V

    packed-switch p2, :pswitch_data_1

    :pswitch_4
    goto :goto_1

    :pswitch_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0, p6}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->positionFloat(I)Ljava/nio/Buffer;

    move-result-object v0

    invoke-static {p3, p4, p5, v0}, Landroid/opengl/GLES10;->glVertexPointer(IIILjava/nio/Buffer;)V

    goto :goto_1

    :pswitch_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0, p6}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->positionFloat(I)Ljava/nio/Buffer;

    move-result-object v0

    invoke-static {p4, p5, v0}, Landroid/opengl/GLES10;->glNormalPointer(IILjava/nio/Buffer;)V

    goto :goto_1

    :pswitch_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0, p6}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->positionFloat(I)Ljava/nio/Buffer;

    move-result-object v0

    invoke-static {p3, p4, p5, v0}, Landroid/opengl/GLES10;->glTexCoordPointer(IIILjava/nio/Buffer;)V

    goto :goto_1

    nop

    :pswitch_data_0
    .packed-switch 0x8074
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_0
        :pswitch_3
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x8074
        :pswitch_5
        :pswitch_6
        :pswitch_4
        :pswitch_4
        :pswitch_7
    .end packed-switch
.end method

.method public final Bind20(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V
    .locals 6

    const v3, 0x8892

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->KeepBuffer(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getCapacity()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    const v2, 0x88e4

    invoke-static {v3, v0, v1, v2}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->addCleanable(Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;)V

    :goto_0
    invoke-static {p2}, Landroid/opengl/GLES20;->glEnableVertexAttribArray(I)V

    const/4 v3, 0x0

    move v0, p2

    move v1, p3

    move v2, p4

    move v4, p5

    move v5, p6

    invoke-static/range {v0 .. v5}, Landroid/opengl/GLES20;->glVertexAttribPointer(IIIZII)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    goto :goto_0
.end method

.method public final Bind30Integer(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIIII)V
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    const v3, 0x8892

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->KeepBuffer(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getCapacity()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    const v2, 0x88e4

    invoke-static {v3, v0, v1, v2}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->addCleanable(Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;)V

    :goto_0
    invoke-static {p2}, Landroid/opengl/GLES30;->glEnableVertexAttribArray(I)V

    invoke-static {p2, p3, p4, p5, p6}, Landroid/opengl/GLES30;->glVertexAttribIPointer(IIIII)V

    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    goto :goto_0
.end method

.method public final BindElements(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 3

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->useVBO:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    if-nez v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->KeepBuffer(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glBindElementArrayBuffer(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getCapacity()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glBufferElementArrayData(ILjava/nio/Buffer;Z)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->addCleanable(Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glBindElementArrayBuffer(I)V

    goto :goto_0
.end method

.method public final BindElements20(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 4

    const v3, 0x8893

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->KeepBuffer(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getCapacity()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    const v2, 0x88e4

    invoke-static {v3, v0, v1, v2}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->addCleanable(Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindBuffer(II)V

    goto :goto_0
.end method

.method public final BindUniform(Lcom/lumiyaviewer/lumiya/render/RenderContext;I)V
    .locals 4
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    const v3, 0x8a11

    const/4 v0, 0x0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    if-nez v1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->addCleanable(Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;)V

    const/4 v0, 0x1

    :cond_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget v1, v1, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-static {v3, p2, v1}, Landroid/opengl/GLES30;->glBindBufferBase(III)V

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getCapacity()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    const v2, 0x88e4

    invoke-static {v3, v0, v1, v2}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    :cond_1
    return-void
.end method

.method public final BindUniformDynamic(Lcom/lumiyaviewer/lumiya/render/RenderContext;IZ)V
    .locals 5
    .annotation build Landroid/annotation/TargetApi;
        value = 0x12
    .end annotation

    const/4 v1, 0x0

    const v4, 0x8a11

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    if-eqz v0, :cond_0

    if-eqz p3, :cond_3

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    if-nez v0, :cond_3

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-direct {v0, v2, v3}, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->addCleanable(Lcom/lumiyaviewer/lumiya/render/glres/GLCleanable;)V

    const/4 v0, 0x1

    :goto_0
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget v2, v2, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-static {v4, p2, v2}, Landroid/opengl/GLES30;->glBindBufferBase(III)V

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getCapacity()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    const v2, 0x88e8

    invoke-static {v4, v0, v1, v2}, Landroid/opengl/GLES20;->glBufferData(IILjava/nio/Buffer;I)V

    :cond_1
    :goto_1
    return-void

    :cond_2
    if-eqz p3, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getCapacity()I

    move-result v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v2}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-static {v4, v1, v0, v2}, Landroid/opengl/GLES20;->glBufferSubData(IIILjava/nio/Buffer;)V

    goto :goto_1

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public final DrawElements(Lcom/lumiyaviewer/lumiya/render/RenderContext;IIII)V
    .locals 2

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->useVBO:Z

    if-eqz v0, :cond_0

    invoke-static {p2, p3, p4, p5}, Landroid/opengl/GLES11;->glDrawElements(IIII)V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0, p5}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->position(I)Ljava/nio/Buffer;

    move-result-object v0

    const/16 v1, 0x1403

    invoke-static {p2, p3, v1, v0}, Landroid/opengl/GLES10;->glDrawElements(IIILjava/nio/Buffer;)V

    goto :goto_0
.end method

.method public final DrawElements20(IIII)V
    .locals 0

    invoke-static {p1, p2, p3, p4}, Landroid/opengl/GLES20;->glDrawElements(IIII)V

    return-void
.end method

.method public GLCleanup()V
    .locals 1

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    return-void
.end method

.method public final Reload(Lcom/lumiyaviewer/lumiya/render/RenderContext;)V
    .locals 3

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->useVBO:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->KeepBuffer(Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->glBuffer:Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLBuffer;->handle:I

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glBindArrayBuffer(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getCapacity()I

    move-result v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->asByteBuffer()Ljava/nio/ByteBuffer;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glBufferArrayData(ILjava/nio/Buffer;Z)V

    :cond_0
    return-void
.end method

.method public getFloat(I)F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getFloat(I)F

    move-result v0

    return v0
.end method

.method public getRawBuffer()Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    return-object v0
.end method

.method public getShort(I)I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/buffers/GLLoadableBuffer;->rawBuffer:Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->getShort(I)S

    move-result v0

    return v0
.end method
