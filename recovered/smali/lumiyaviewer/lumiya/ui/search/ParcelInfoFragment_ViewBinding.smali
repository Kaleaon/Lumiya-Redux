.class public Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;
.super Ljava/lang/Object;

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;

.field private view2131755600:Landroid/view/View;

.field private view2131755608:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;Landroid/view/View;)V
    .locals 3
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;

    const-string/jumbo v0, "field \'parcelImageView\'"

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    const v2, 0x7f100252

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    const-string/jumbo v0, "field \'parcelDetailsDescription\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f10024f

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelDetailsDescription:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'parcelOwnerName\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f100256

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelOwnerName:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'parcelOwnerPic\'"

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const v2, 0x7f100257

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelOwnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const-string/jumbo v0, "field \'parcelSimName\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f100254

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelSimName:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'parcelDetailsName\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f10024e

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelDetailsName:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'parcelLocation\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f100255

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelLocation:Landroid/widget/TextView;

    const-string/jumbo v0, "method \'onParcelTeleportButton\'"

    const v1, 0x7f100250

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;->view2131755600:Landroid/view/View;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding$1;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "method \'onParcelOwnerProfileClick\'"

    const v1, 0x7f100258

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;->view2131755608:Landroid/view/View;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding$2;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelImageView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelDetailsDescription:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelOwnerName:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelOwnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelSimName:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelDetailsName:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment;->parcelLocation:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;->view2131755600:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;->view2131755600:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;->view2131755608:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/search/ParcelInfoFragment_ViewBinding;->view2131755608:Landroid/view/View;

    return-void
.end method
