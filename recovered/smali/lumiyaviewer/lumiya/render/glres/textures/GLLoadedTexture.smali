.class public Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;
.super Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;


# instance fields
.field private final hasAlphaLayer:Z

.field private final height:I

.field private final width:I


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/RenderContext;Landroid/graphics/Bitmap;)V
    .locals 8

    const/16 v7, 0x2601

    const v6, 0x46240400    # 10497.0f

    const/high16 v5, 0x46180000    # 9728.0f

    const/4 v4, 0x0

    const/16 v3, 0xde1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getRowBytes()I

    move-result v2

    mul-int/2addr v1, v2

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;I)V

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->handle:I

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    :goto_0
    invoke-virtual {p2}, Landroid/graphics/Bitmap;->hasAlpha()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->hasAlphaLayer:Z

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->width:I

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->height:I

    invoke-virtual {p1, p2}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->KeepTexture(Landroid/graphics/Bitmap;)V

    invoke-static {v3, v4, p2, v4}, Landroid/opengl/GLUtils;->texImage2D(IILandroid/graphics/Bitmap;I)V

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_1

    const/16 v0, 0x2800

    invoke-static {v3, v0, v7}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0x2801

    invoke-static {v3, v0, v7}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0x2802

    const/16 v1, 0x2901

    invoke-static {v3, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0x2803

    const/16 v1, 0x2901

    invoke-static {v3, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    :goto_1
    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_2

    invoke-static {v3, v4}, Landroid/opengl/GLES20;->glBindTexture(II)V

    :goto_2
    return-void

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->handle:I

    invoke-static {v3, v0}, Landroid/opengl/GLES10;->glBindTexture(II)V

    goto :goto_0

    :cond_1
    const/16 v0, 0x2800

    invoke-static {v3, v0, v5}, Landroid/opengl/GLES10;->glTexParameterf(IIF)V

    const/16 v0, 0x2801

    invoke-static {v3, v0, v5}, Landroid/opengl/GLES10;->glTexParameterf(IIF)V

    const/16 v0, 0x2802

    invoke-static {v3, v0, v6}, Landroid/opengl/GLES10;->glTexParameterf(IIF)V

    const/16 v0, 0x2803

    invoke-static {v3, v0, v6}, Landroid/opengl/GLES10;->glTexParameterf(IIF)V

    goto :goto_1

    :cond_2
    invoke-static {v3, v4}, Landroid/opengl/GLES10;->glBindTexture(II)V

    goto :goto_2
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;)V
    .locals 7

    const/16 v6, 0x2601

    const/4 v5, 0x0

    const v4, 0x46240400    # 10497.0f

    const/high16 v3, 0x46180000    # 9728.0f

    const/16 v2, 0xde1

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->glResourceManager:Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getLoadedSize()I

    move-result v1

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLResourceTexture;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;I)V

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->handle:I

    invoke-static {v2, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    :goto_0
    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->hasAlphaLayer()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->hasAlphaLayer:Z

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getWidth()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->width:I

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->getHeight()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->height:I

    invoke-virtual {p1, p2}, Lcom/lumiyaviewer/lumiya/render/RenderContext;->KeepTexture(Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;)V

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL30:Z

    if-eqz v0, :cond_1

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->SetAsImmutableTexture()I

    :goto_1
    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_2

    const/16 v0, 0x2800

    invoke-static {v2, v0, v6}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0x2801

    invoke-static {v2, v0, v6}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0x2802

    const/16 v1, 0x2901

    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0x2803

    const/16 v1, 0x2901

    invoke-static {v2, v0, v1}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    :goto_2
    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/render/RenderContext;->hasGL20:Z

    if-eqz v0, :cond_3

    invoke-static {v2, v5}, Landroid/opengl/GLES20;->glBindTexture(II)V

    :goto_3
    return-void

    :cond_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->handle:I

    invoke-static {v2, v0}, Landroid/opengl/GLES10;->glBindTexture(II)V

    goto :goto_0

    :cond_1
    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;->SetAsTexture()I

    goto :goto_1

    :cond_2
    const/16 v0, 0x2800

    invoke-static {v2, v0, v3}, Landroid/opengl/GLES10;->glTexParameterf(IIF)V

    const/16 v0, 0x2801

    invoke-static {v2, v0, v3}, Landroid/opengl/GLES10;->glTexParameterf(IIF)V

    const/16 v0, 0x2802

    invoke-static {v2, v0, v4}, Landroid/opengl/GLES10;->glTexParameterf(IIF)V

    const/16 v0, 0x2803

    invoke-static {v2, v0, v4}, Landroid/opengl/GLES10;->glTexParameterf(IIF)V

    goto :goto_2

    :cond_3
    invoke-static {v2, v5}, Landroid/opengl/GLES10;->glBindTexture(II)V

    goto :goto_3
.end method

.method public static loadFromAssets(Lcom/lumiyaviewer/lumiya/render/RenderContext;Landroid/content/Context;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;
    .locals 3
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v2, 0x0

    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    if-eqz v1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;

    invoke-direct {v0, p0, v1}, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;-><init>(Lcom/lumiyaviewer/lumiya/render/RenderContext;Landroid/graphics/Bitmap;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :cond_0
    return-object v2

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    return-object v2
.end method


# virtual methods
.method public final GLDraw()V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->handle:I

    const/16 v1, 0xde1

    invoke-static {v1, v0}, Landroid/opengl/GLES10;->glBindTexture(II)V

    return-void
.end method

.method public getHeight()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->height:I

    return v0
.end method

.method public getWidth()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->width:I

    return v0
.end method

.method public hasAlphaLayer()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/textures/GLLoadedTexture;->hasAlphaLayer:Z

    return v0
.end method
