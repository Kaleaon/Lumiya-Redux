.class public Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;
.super Landroid/opengl/GLSurfaceView;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView$1;
    }
.end annotation


# static fields
.field private static final DEFAULT_FONT_SIZE_SP:I = 0x10


# instance fields
.field private final activity:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

.field private final mHandler:Landroid/os/Handler;
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "HandlerLeak"
        }
    .end annotation
.end field

.field private ownAvatarHidden:Z

.field private final renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

.field private final supportsGL20:Z

.field private wantGL20:Z


# direct methods
.method static synthetic -com_lumiyaviewer_lumiya_ui_render_WorldSurfaceView-mthref-0(Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;)V
    .locals 0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->enableDrawing()V

    return-void
.end method

.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;)Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->activity:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    return-object v0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V
    .locals 7

    const/4 v6, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-direct {p0, p1}, Landroid/opengl/GLSurfaceView;-><init>(Landroid/content/Context;)V

    iput-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->ownAvatarHidden:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->mHandler:Landroid/os/Handler;

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->activity:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    const/high16 v0, 0x41800000    # 16.0f

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    invoke-static {v6, v0, v3}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v3, v0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v4, "activity"

    invoke-virtual {v0, v4}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    invoke-virtual {v0}, Landroid/app/ActivityManager;->getDeviceConfigurationInfo()Landroid/content/pm/ConfigurationInfo;

    move-result-object v0

    iget v0, v0, Landroid/content/pm/ConfigurationInfo;->reqGlEsVersion:I

    const/high16 v4, 0x20000

    if-lt v0, v4, :cond_3

    move v0, v1

    :goto_0
    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->supportsGL20:Z

    invoke-static {}, Lcom/lumiyaviewer/lumiya/Debug;->isDebugBuild()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setDebugFlags(I)V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->getWantGL20()Z

    move-result v0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->wantGL20:Z

    const-string/jumbo v4, "WorldSurfaceView: API level %d, wantGL20 %s"

    new-array v5, v6, [Ljava/lang/Object;

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v5, v2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->wantGL20:Z

    if-eqz v0, :cond_4

    const-string/jumbo v0, "yes"

    :goto_1
    aput-object v0, v5, v1

    invoke-static {v4, v5}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->wantGL20:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0, v6}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setEGLContextClientVersion(I)V

    :cond_1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xb

    if-lt v0, v2, :cond_2

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->wantGL20:Z

    if-eqz v0, :cond_2

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setPreserveEGLContextOnPause(Z)V

    :cond_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->mHandler:Landroid/os/Handler;

    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->wantGL20:Z

    invoke-direct {v0, v1, v2, p2, v3}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;-><init>(Landroid/os/Handler;ZLcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;I)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setEGLContextFactory(Landroid/opengl/GLSurfaceView$EGLContextFactory;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->setRenderer(Landroid/opengl/GLSurfaceView$Renderer;)V

    return-void

    :cond_3
    move v0, v2

    goto :goto_0

    :cond_4
    const-string/jumbo v0, "no"

    goto :goto_1
.end method

.method private getWantGL20()Z
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getAdvancedRendering()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->supportsGL20:Z

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_WorldSurfaceView_5461(I)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setDisplayedHUDid(I)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_WorldSurfaceView_5602(F)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setHUDScaleFactor(F)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_WorldSurfaceView_5758(FF)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setHUDOffset(FF)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_WorldSurfaceView_5904(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setDrawPickedObject(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_WorldSurfaceView_6157(Z)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setOwnAvatarHidden(Z)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_WorldSurfaceView_6395(FF)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1, p2, v1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->touchHUD(FFLandroid/os/Handler;)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_WorldSurfaceView_6612()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->requestScreenshot(Landroid/os/Handler;)V

    return-void
.end method

.method public onPause()V
    .locals 1

    const-string/jumbo v0, "GLView: onPause () entered."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->disableDrawing()V

    const-string/jumbo v0, "GLView: calling super.onPause ()."

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    invoke-super {p0}, Landroid/opengl/GLSurfaceView;->onPause()V

    const-string/jumbo v0, "GLView: onPause () exiting"

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    return-void
.end method

.method public onResume()V
    .locals 2

    invoke-super {p0}, Landroid/opengl/GLSurfaceView;->onResume()V

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->wantGL20:Z

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->getWantGL20()Z

    move-result v1

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->activity:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->activity:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->rendererAdvancedRenderingChanged()V

    :goto_0
    return-void

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    goto :goto_0
.end method

.method pickObjectHover(FF)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->mHandler:Landroid/os/Handler;

    invoke-virtual {v0, p1, p2, v1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->pickObject(FFLandroid/os/Handler;)V

    return-void
.end method

.method public setAvatarCountLimit(I)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setAvatarCountLimit(I)V

    return-void
.end method

.method setDisplayedHUDid(I)V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$3;

    invoke-direct {v0, p1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$3;-><init>(ILjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setDrawDistance(I)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setDrawDistance(I)V

    return-void
.end method

.method setDrawPickedObject(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$2;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$2;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method setForcedTime(ZF)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setForcedTime(ZF)V

    :cond_0
    return-void
.end method

.method setHUDOffset(FF)V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$5;

    invoke-direct {v0, p1, p2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$5;-><init>(FFLjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method setHUDScaleFactor(F)V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$4;

    invoke-direct {v0, p1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$4;-><init>(FLjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method setIsInteracting(Z)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->renderer:Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/render/WorldViewRenderer;->setIsInteracting(Z)V

    return-void
.end method

.method setOwnAvatarHidden(Z)V
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->ownAvatarHidden:Z

    if-eq v0, p1, :cond_0

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->ownAvatarHidden:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$7;

    invoke-direct {v0, p1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$7;-><init>(ZLjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method takeScreenshot()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method

.method touchHUD(FF)V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$6;

    invoke-direct {v0, p1, p2, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$WbegR8yVWPTDY8X58dwHEd9HRSQ$6;-><init>(FFLjava/lang/Object;)V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldSurfaceView;->queueEvent(Ljava/lang/Runnable;)V

    return-void
.end method
