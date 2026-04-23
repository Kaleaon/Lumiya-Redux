.class public Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;
.super Landroid/support/v7/app/AppCompatActivity;


# instance fields
.field private selectedThemeId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/app/AppCompatActivity;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->selectedThemeId:I

    return-void
.end method


# virtual methods
.method protected isLightTheme()Z
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->selectedThemeId:I

    const v1, 0x7f0b002b

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 4
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getThemeResourceId()I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->selectedThemeId:I

    const-string/jumbo v0, "Theme: activity theme 0x%x"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->selectedThemeId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->selectedThemeId:I

    instance-of v0, p0, Lcom/lumiyaviewer/lumiya/ui/ThemeMapper;

    if-eqz v0, :cond_0

    move-object v0, p0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/ThemeMapper;

    invoke-interface {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/ThemeMapper;->mapThemeResourceId(I)I

    move-result v0

    :goto_0
    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->setTheme(I)V

    invoke-super {p0, p1}, Landroid/support/v7/app/AppCompatActivity;->onCreate(Landroid/os/Bundle;)V

    return-void

    :cond_0
    move v0, v1

    goto :goto_0
.end method

.method protected onResume()V
    .locals 5

    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onResume()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getInstance()Lcom/lumiyaviewer/lumiya/GlobalOptions;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/GlobalOptions;->getThemeResourceId()I

    move-result v0

    const-string/jumbo v1, "Theme: resume, new activity theme 0x%x"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v1, v2}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->selectedThemeId:I

    if-eq v1, v0, :cond_0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->selectedThemeId:I

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/settings/ThemeChangedEvent;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/settings/ThemeChangedEvent;-><init>(I)V

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->onThemeChangedEvent(Lcom/lumiyaviewer/lumiya/ui/settings/ThemeChangedEvent;)V

    :cond_0
    return-void
.end method

.method protected onStart()V
    .locals 1

    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onStart()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->subscribe(Landroid/app/Activity;)V

    return-void
.end method

.method protected onStop()V
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->getInstance()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;->unsubscribeActivity(Landroid/app/Activity;)V

    invoke-super {p0}, Landroid/support/v7/app/AppCompatActivity;->onStop()V

    return-void
.end method

.method public onThemeChangedEvent(Lcom/lumiyaviewer/lumiya/ui/settings/ThemeChangedEvent;)V
    .locals 4
    .annotation runtime Lcom/lumiyaviewer/lumiya/eventbus/EventHandler;
    .end annotation

    const-string/jumbo v0, "Theme: old theme id 0x%x, new theme id 0x%x"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->selectedThemeId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    iget v2, p1, Lcom/lumiyaviewer/lumiya/ui/settings/ThemeChangedEvent;->themeResourceId:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0xb

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->recreate()V

    :goto_0
    return-void

    :cond_0
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->finish()V

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ThemedActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
