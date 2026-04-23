.class public Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;
.super Ljava/lang/Object;

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

.field private view2131755264:Landroid/view/View;

.field private view2131755268:Landroid/view/View;

.field private view2131755269:Landroid/view/View;

.field private view2131755270:Landroid/view/View;

.field private view2131755538:Landroid/view/View;

.field private view2131755554:Landroid/view/View;

.field private view2131755754:Landroid/view/View;

.field private view2131755758:Landroid/view/View;

.field private view2131755761:Landroid/view/View;

.field private view2131755762:Landroid/view/View;

.field private view2131755763:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V
    .locals 1
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Landroid/view/View;)V
    .locals 9
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    const v8, 0x7f100212

    const v7, 0x7f100106

    const v6, 0x7f100105

    const v5, 0x7f100104

    const v4, 0x7f100100

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    const-string/jumbo v0, "field \'objectPayButton\' and method \'onObjectPayButton\'"

    const v1, 0x7f100222

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'objectPayButton\'"

    const-class v2, Landroid/widget/ImageButton;

    const v3, 0x7f100222

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectPayButton:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755554:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$1;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'buttonFlyUpward\'"

    const-class v1, Landroid/widget/ImageButton;

    const v2, 0x7f1002ec

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonFlyUpward:Landroid/widget/ImageButton;

    const-string/jumbo v0, "field \'buttonHUD\' and method \'onHUDButton\'"

    const v1, 0x7f1002f3

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonHUD\'"

    const-class v2, Landroid/widget/Button;

    const v3, 0x7f1002f3

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonHUD:Landroid/widget/Button;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755763:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$2;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'buttonStandUp\' and method \'onObjectStandButton\'"

    invoke-static {p2, v4, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonStandUp\'"

    const-class v2, Landroid/widget/ImageButton;

    invoke-static {v1, v4, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonStandUp:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755264:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$3;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$3;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'objectMoreButton\' and method \'onObjectMoreButton\'"

    const v1, 0x7f1002ea

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'objectMoreButton\'"

    const-class v2, Landroid/widget/ImageButton;

    const v3, 0x7f1002ea

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectMoreButton:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755754:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$4;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$4;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'flyButtonsLayout\'"

    const-class v1, Landroid/widget/LinearLayout;

    const v2, 0x7f1002eb

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->flyButtonsLayout:Landroid/widget/LinearLayout;

    const-string/jumbo v0, "field \'objectPopupLeftSpacer\'"

    const v1, 0x7f1002f4

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectPopupLeftSpacer:Landroid/view/View;

    const-string/jumbo v0, "field \'objectTouchButton\' and method \'onObjectTouchButton\'"

    invoke-static {p2, v5, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'objectTouchButton\'"

    const-class v2, Landroid/widget/ImageButton;

    invoke-static {v1, v5, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectTouchButton:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755268:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$5;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$5;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'buttonFlyDownward\'"

    const-class v1, Landroid/widget/ImageButton;

    const v2, 0x7f1002ed

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonFlyDownward:Landroid/widget/ImageButton;

    const-string/jumbo v0, "field \'chatsOverlayLayout\'"

    const-class v1, Landroid/widget/LinearLayout;

    const v2, 0x7f1002ef

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->chatsOverlayLayout:Landroid/widget/LinearLayout;

    const-string/jumbo v0, "field \'moveButtonsLayout\'"

    const v1, 0x7f1000fb

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->moveButtonsLayout:Landroid/view/View;

    const-string/jumbo v0, "field \'avatarIconView\'"

    const-class v1, Landroid/widget/ImageView;

    const v2, 0x7f100238

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarIconView:Landroid/widget/ImageView;

    const-string/jumbo v0, "field \'worldViewHolder\'"

    const-class v1, Landroid/widget/FrameLayout;

    const v2, 0x7f1002df

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewHolder:Landroid/widget/FrameLayout;

    const-string/jumbo v0, "field \'worldOverlaysContainer\'"

    const-class v1, Landroid/view/ViewGroup;

    const v2, 0x7f1002e6

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldOverlaysContainer:Landroid/view/ViewGroup;

    const-string/jumbo v0, "field \'objectChatButton\' and method \'onObjectChatButton\'"

    invoke-static {p2, v7, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'objectChatButton\'"

    const-class v2, Landroid/widget/ImageButton;

    invoke-static {v1, v7, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectChatButton:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755270:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$6;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$6;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'detailsContainer\'"

    const v1, 0x7f100114

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->detailsContainer:Landroid/view/View;

    const-string/jumbo v0, "field \'worldViewTouchReceiver\'"

    const v1, 0x7f1002e2

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewTouchReceiver:Landroid/view/View;

    const-string/jumbo v0, "field \'buttonTurnRight\'"

    const-class v1, Landroid/widget/ImageButton;

    const v2, 0x7f1000ff

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonTurnRight:Landroid/widget/ImageButton;

    const-string/jumbo v0, "field \'objectSitButton\' and method \'onObjectSitButton\'"

    invoke-static {p2, v6, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'objectSitButton\'"

    const-class v2, Landroid/widget/ImageButton;

    invoke-static {v1, v6, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectSitButton:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755269:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$7;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$7;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'buttonTurnLeft\'"

    const-class v1, Landroid/widget/ImageButton;

    const v2, 0x7f1000fd

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonTurnLeft:Landroid/widget/ImageButton;

    const-string/jumbo v0, "field \'buttonMoveForward\'"

    const-class v1, Landroid/widget/ImageButton;

    const v2, 0x7f1000fc

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonMoveForward:Landroid/widget/ImageButton;

    const-string/jumbo v0, "field \'objectControlsPanel\'"

    const v1, 0x7f1002e9

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectControlsPanel:Landroid/view/View;

    const-string/jumbo v0, "field \'dragPointerLayout\'"

    const-class v1, Landroid/view/ViewGroup;

    const v2, 0x7f1002e3

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointerLayout:Landroid/view/ViewGroup;

    const-string/jumbo v0, "field \'buttonCamOff\' and method \'onCamOffButton\'"

    const v1, 0x7f1002f2

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonCamOff\'"

    const-class v2, Landroid/widget/ImageButton;

    const v3, 0x7f1002f2

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonCamOff:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755762:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$8;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$8;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'voiceStatusView\'"

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    const v2, 0x7f1002e8

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    const-string/jumbo v0, "field \'insetsBackground\'"

    const-class v1, Landroid/widget/FrameLayout;

    const v2, 0x7f1002e0

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->insetsBackground:Landroid/widget/FrameLayout;

    const-string/jumbo v0, "field \'buttonMoveBackward\'"

    const-class v1, Landroid/widget/ImageButton;

    const v2, 0x7f1000fe

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonMoveBackward:Landroid/widget/ImageButton;

    const-string/jumbo v0, "field \'buttonCamOn\' and method \'onCamOnButton\'"

    const v1, 0x7f1002f1

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonCamOn\'"

    const-class v2, Landroid/widget/ImageButton;

    const v3, 0x7f1002f1

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonCamOn:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755761:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$9;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$9;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'objectStandButton\' and method \'onObjectStandButton\'"

    invoke-static {p2, v8, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'objectStandButton\'"

    const-class v2, Landroid/widget/ImageButton;

    invoke-static {v1, v8, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectStandButton:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755538:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$10;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$10;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'dragPointer\'"

    const v1, 0x7f1002e4

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    const-string/jumbo v0, "field \'objectNameTextView\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f100239

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectNameTextView:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'buttonStopFlying\' and method \'onStopFlyingButton\'"

    const v1, 0x7f1002ee

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonStopFlying\'"

    const-class v2, Landroid/widget/ImageButton;

    const v3, 0x7f1002ee

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonStopFlying:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755758:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$11;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding$11;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectPayButton:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonFlyUpward:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonHUD:Landroid/widget/Button;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonStandUp:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectMoreButton:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->flyButtonsLayout:Landroid/widget/LinearLayout;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectPopupLeftSpacer:Landroid/view/View;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectTouchButton:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonFlyDownward:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->chatsOverlayLayout:Landroid/widget/LinearLayout;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->moveButtonsLayout:Landroid/view/View;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->avatarIconView:Landroid/widget/ImageView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewHolder:Landroid/widget/FrameLayout;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldOverlaysContainer:Landroid/view/ViewGroup;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectChatButton:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->detailsContainer:Landroid/view/View;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->worldViewTouchReceiver:Landroid/view/View;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonTurnRight:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectSitButton:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonTurnLeft:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonMoveForward:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectControlsPanel:Landroid/view/View;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointerLayout:Landroid/view/ViewGroup;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonCamOff:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->insetsBackground:Landroid/widget/FrameLayout;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonMoveBackward:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonCamOn:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectStandButton:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->dragPointer:Landroid/view/View;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->objectNameTextView:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->buttonStopFlying:Landroid/widget/ImageButton;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755554:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755554:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755763:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755763:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755264:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755264:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755754:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755754:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755268:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755268:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755270:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755270:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755269:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755269:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755762:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755762:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755761:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755761:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755538:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755538:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755758:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity_ViewBinding;->view2131755758:Landroid/view/View;

    return-void
.end method
