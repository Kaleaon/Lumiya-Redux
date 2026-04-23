.class public Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;
.super Ljava/lang/Object;

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;

.field private view2131755698:Landroid/view/View;

.field private view2131755706:Landroid/view/View;

.field private view2131755715:Landroid/view/View;

.field private view2131755720:Landroid/view/View;

.field private view2131755724:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;Landroid/view/View;)V
    .locals 5
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    const v4, 0x7f1002ba

    const v3, 0x7f1002b2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;

    const-string/jumbo v0, "field \'textProfilePrimaryName\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f1002bc

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfilePrimaryName:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'userProfileNotesCaption\'"

    const v1, 0x7f1002ca

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userProfileNotesCaption:Landroid/view/View;

    const-string/jumbo v0, "field \'textProfileOnline\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f1002be

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileOnline:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'userProfilePartnerPic\'"

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const v2, 0x7f1002c2

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userProfilePartnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    const-string/jumbo v0, "field \'userProfilePartnerName\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f1002c1

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userProfilePartnerName:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'userWebProfileCardView\'"

    const v1, 0x7f1002c4

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userWebProfileCardView:Landroid/view/View;

    const-string/jumbo v0, "field \'swipeRefreshLayout\'"

    const-class v1, Landroid/support/v4/widget/SwipeRefreshLayout;

    const v2, 0x7f1000bb

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    const-string/jumbo v0, "field \'textProfileSecondaryName\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f1002bd

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileSecondaryName:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'changePicButton\' and method \'onChangePicClicked\'"

    invoke-static {p2, v3, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'changePicButton\'"

    const-class v2, Landroid/widget/Button;

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->changePicButton:Landroid/widget/Button;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755698:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding$1;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'userPicView\'"

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    const v2, 0x7f1002b6

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userPicView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    const-string/jumbo v0, "field \'userProfileAboutText\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f1002b9

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userProfileAboutText:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'textProfileAge\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f1002bf

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileAge:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'loadingLayout\'"

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v2, 0x7f1000bd

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const-string/jumbo v0, "field \'textProfileAgentKey\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f1002c7

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileAgentKey:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'aboutEditButton\' and method \'onAboutEditClicked\'"

    invoke-static {p2, v4, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'aboutEditButton\'"

    const-class v2, Landroid/widget/Button;

    invoke-static {v1, v4, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->aboutEditButton:Landroid/widget/Button;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755706:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding$2;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'userWebProfileLink\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f1002c5

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userWebProfileLink:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'userPartnerCardView\'"

    const v1, 0x7f1002c0

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userPartnerCardView:Landroid/view/View;

    const-string/jumbo v0, "field \'textProfileNotesText\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f1002cb

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileNotesText:Landroid/widget/TextView;

    const-string/jumbo v0, "method \'onViewProfileClicked\'"

    const v1, 0x7f1002c3

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755715:Landroid/view/View;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding$3;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding$3;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "method \'onEditNotesClicked\'"

    const v1, 0x7f1002cc

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755724:Landroid/view/View;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding$4;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding$4;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "method \'onCopyAgentKeyClicked\'"

    const v1, 0x7f1002c8

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755720:Landroid/view/View;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding$5;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding$5;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfilePrimaryName:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userProfileNotesCaption:Landroid/view/View;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileOnline:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userProfilePartnerPic:Lcom/lumiyaviewer/lumiya/ui/chat/ChatterPicView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userProfilePartnerName:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userWebProfileCardView:Landroid/view/View;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->swipeRefreshLayout:Landroid/support/v4/widget/SwipeRefreshLayout;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileSecondaryName:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->changePicButton:Landroid/widget/Button;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userPicView:Lcom/lumiyaviewer/lumiya/ui/common/ImageAssetView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userProfileAboutText:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileAge:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->loadingLayout:Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileAgentKey:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->aboutEditButton:Landroid/widget/Button;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userWebProfileLink:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->userPartnerCardView:Landroid/view/View;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;->textProfileNotesText:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755698:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755698:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755706:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755706:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755715:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755715:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755724:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755724:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755720:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab_ViewBinding;->view2131755720:Landroid/view/View;

    return-void
.end method
