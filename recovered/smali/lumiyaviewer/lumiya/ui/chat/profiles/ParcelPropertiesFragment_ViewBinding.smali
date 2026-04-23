.class public Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;
.super Ljava/lang/Object;

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

.field private view2131755608:Landroid/view/View;

.field private view2131755611:Landroid/view/View;

.field private view2131755614:Landroid/view/View;

.field private view2131755615:Landroid/view/View;

.field private view2131755617:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;Landroid/view/View;)V
    .locals 5
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    const v4, 0x7f10025f

    const v3, 0x7f10025e

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    const-string/jumbo v0, "field \'parcelMediaURL\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f10025d

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelMediaURL:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'mediaStopButton\' and method \'onParcelMediaStop\'"

    invoke-static {p2, v4, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'mediaStopButton\'"

    const-class v2, Landroid/widget/Button;

    invoke-static {v1, v4, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->mediaStopButton:Landroid/widget/Button;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755615:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding$1;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'parcelMediaCardView\'"

    const-class v1, Landroid/support/v7/widget/CardView;

    const v2, 0x7f10025c

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/CardView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelMediaCardView:Landroid/support/v7/widget/CardView;

    const-string/jumbo v0, "field \'simRestartCardView\'"

    const-class v1, Landroid/support/v7/widget/CardView;

    const v2, 0x7f100260

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/CardView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->simRestartCardView:Landroid/support/v7/widget/CardView;

    const-string/jumbo v0, "field \'parcelName\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f100259

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelName:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'parcelOwnerPic\'"

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const v2, 0x7f100257

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelOwnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const-string/jumbo v0, "field \'parcelArea\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f10025a

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelArea:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'parcelOwnerName\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f100256

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelOwnerName:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'mediaPlayButton\' and method \'onParcelMediaPlay\'"

    invoke-static {p2, v3, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'mediaPlayButton\'"

    const-class v2, Landroid/widget/Button;

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->mediaPlayButton:Landroid/widget/Button;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755614:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding$2;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'parcelImageView\'"

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    const v2, 0x7f100252

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    const-string/jumbo v0, "field \'parcelDescription\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f10024f

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelDescription:Landroid/widget/TextView;

    const-string/jumbo v0, "method \'onOwnerProfileButton\'"

    const v1, 0x7f100258

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755608:Landroid/view/View;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding$3;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding$3;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "method \'onSimRestartButton\'"

    const v1, 0x7f100261

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755617:Landroid/view/View;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding$4;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding$4;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "method \'onSetHomeButton\'"

    const v1, 0x7f10025b

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755611:Landroid/view/View;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding$5;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding$5;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelMediaURL:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->mediaStopButton:Landroid/widget/Button;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelMediaCardView:Landroid/support/v7/widget/CardView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->simRestartCardView:Landroid/support/v7/widget/CardView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelName:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelOwnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelArea:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelOwnerName:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->mediaPlayButton:Landroid/widget/Button;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment;->parcelDescription:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755615:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755615:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755614:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755614:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755608:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755608:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755617:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755617:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755611:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/ParcelPropertiesFragment_ViewBinding;->view2131755611:Landroid/view/View;

    return-void
.end method
