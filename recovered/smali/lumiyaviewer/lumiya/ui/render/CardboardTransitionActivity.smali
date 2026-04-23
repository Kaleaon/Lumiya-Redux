.class public Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;
.super Landroid/support/v7/app/AppCompatActivity;


# static fields
.field private static final MAX_WAIT_ATTEMPTS:I = 0xf

.field private static final WAIT_INTERVAL:J = 0xfaL


# instance fields
.field private handler:Landroid/os/Handler;

.field private waitAttempts:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->handler:Landroid/os/Handler;

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->waitAttempts:I

    return-void
.end method

.method private tryToStartCardboard()V
    .locals 4

    const-wide/16 v2, 0xfa

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->waitAttempts:I

    const/16 v1, 0xf

    if-ge v0, v1, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/render/TextureMemoryTracker;->hasActiveRenderer()Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$4MERJxt3ZMMK7daj1OhYLtxY69Y;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$4MERJxt3ZMMK7daj1OhYLtxY69Y;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    :goto_0
    return-void

    :cond_1
    const-string/jumbo v0, "Cardboard: EGL renderer still active."

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->waitAttempts:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->waitAttempts:I

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->handler:Landroid/os/Handler;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$4MERJxt3ZMMK7daj1OhYLtxY69Y$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/render/-$Lambda$4MERJxt3ZMMK7daj1OhYLtxY69Y$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method


# virtual methods
.method synthetic -com_lumiyaviewer_lumiya_ui_render_CardboardTransitionActivity-mthref-0()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->tryToStartCardboard()V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_render_CardboardTransitionActivity_1411()V
    .locals 3

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/content/Intent;)Ljava/util/UUID;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/content/Intent;Ljava/util/UUID;)V

    const/high16 v0, 0x1000000

    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->startActivity(Landroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->finish()V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    const/16 v1, 0x400

    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->requestWindowFeature(I)Z

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0, v1, v1}, Landroid/view/Window;->setFlags(II)V

    const v0, 0x7f040023

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->setContentView(I)V

    return-void
.end method

.method protected onResume()V
    .locals 0

    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardTransitionActivity;->tryToStartCardboard()V

    return-void
.end method
