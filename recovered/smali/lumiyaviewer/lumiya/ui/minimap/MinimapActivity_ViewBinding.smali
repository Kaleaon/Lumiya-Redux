.class public Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity_ViewBinding;
.super Ljava/lang/Object;

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;)V
    .locals 1
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity_ViewBinding;-><init>(Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;Landroid/view/View;)V
    .locals 3
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;

    const-string/jumbo v0, "field \'selectorLayout\'"

    const-class v1, Landroid/widget/FrameLayout;

    const v2, 0x7f100286

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;->selectorLayout:Landroid/widget/FrameLayout;

    const-string/jumbo v0, "field \'splitMainLayout\'"

    const-class v1, Landroid/widget/LinearLayout;

    const v2, 0x7f100284

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;->splitMainLayout:Landroid/widget/LinearLayout;

    const-string/jumbo v0, "field \'splitObjectPopupsLeftSpacer\'"

    const v1, 0x7f100289

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;->splitObjectPopupsLeftSpacer:Landroid/view/View;

    const-string/jumbo v0, "field \'detailsLayout\'"

    const-class v1, Landroid/view/ViewGroup;

    const v2, 0x7f100285

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;->detailsLayout:Landroid/view/ViewGroup;

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;->selectorLayout:Landroid/widget/FrameLayout;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;->splitMainLayout:Landroid/widget/LinearLayout;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;->splitObjectPopupsLeftSpacer:Landroid/view/View;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;->detailsLayout:Landroid/view/ViewGroup;

    return-void
.end method
