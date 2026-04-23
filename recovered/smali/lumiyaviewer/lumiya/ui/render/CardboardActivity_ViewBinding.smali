.class public Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;
.super Ljava/lang/Object;

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

.field private view2131755255:Landroid/view/View;

.field private view2131755256:Landroid/view/View;

.field private view2131755257:Landroid/view/View;

.field private view2131755260:Landroid/view/View;

.field private view2131755261:Landroid/view/View;

.field private view2131755262:Landroid/view/View;

.field private view2131755263:Landroid/view/View;

.field private view2131755264:Landroid/view/View;

.field private view2131755265:Landroid/view/View;

.field private view2131755266:Landroid/view/View;

.field private view2131755268:Landroid/view/View;

.field private view2131755269:Landroid/view/View;

.field private view2131755270:Landroid/view/View;

.field private view2131755272:Landroid/view/View;

.field private view2131755274:Landroid/view/View;

.field private view2131755275:Landroid/view/View;

.field private view2131755277:Landroid/view/View;

.field private view2131755281:Landroid/view/View;

.field private view2131755282:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V
    .locals 1
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Landroid/view/View;)V
    .locals 8
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    const v7, 0x7f1000fd

    const v6, 0x7f1000fc

    const v5, 0x7f1000f9

    const v3, 0x7f1000f8

    const v4, 0x7f1000f7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const-string/jumbo v0, "field \'buttonSpeak\' and method \'onSpeakButton\'"

    invoke-static {p2, v3, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonSpeak\'"

    const-class v2, Landroid/widget/ImageButton;

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSpeak:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755256:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$1;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'buttonChat\' and method \'onChatButton\'"

    invoke-static {p2, v5, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonChat\'"

    const-class v2, Landroid/widget/ImageButton;

    invoke-static {v1, v5, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonChat:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755257:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$2;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'buttonSpeechSend\' and method \'onSpeechSendButton\'"

    const v1, 0x7f100111

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonSpeechSend\'"

    const-class v2, Landroid/widget/ImageButton;

    const v3, 0x7f100111

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSpeechSend:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755281:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$3;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$3;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'speechRecognitionResults\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f100110

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognitionResults:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'chatsOverlayLayout\'"

    const-class v1, Landroid/widget/LinearLayout;

    const v2, 0x7f1000fa

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->chatsOverlayLayout:Landroid/widget/LinearLayout;

    const-string/jumbo v0, "field \'cardboardAimControls\' and method \'onAimControlsTouch\'"

    const v1, 0x7f100101

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'cardboardAimControls\'"

    const-class v2, Landroid/view/ViewGroup;

    const v3, 0x7f100101

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->cardboardAimControls:Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755265:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$4;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$4;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const-string/jumbo v0, "field \'cardboardSpeakControls\' and method \'onSpeakControlsTouch\'"

    const v1, 0x7f10010d

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'cardboardSpeakControls\'"

    const-class v2, Landroid/view/ViewGroup;

    const v3, 0x7f10010d

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->cardboardSpeakControls:Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755277:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$5;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$5;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const-string/jumbo v0, "field \'cardboardObjectControls\' and method \'onObjectControlsTouch\'"

    const v1, 0x7f100102

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'cardboardObjectControls\'"

    const-class v2, Landroid/view/ViewGroup;

    const v3, 0x7f100102

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->cardboardObjectControls:Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755266:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$6;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$6;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const-string/jumbo v0, "field \'buttonTouchObject\' and method \'onObjectTouch\'"

    const v1, 0x7f100104

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonTouchObject\'"

    const-class v2, Landroid/widget/ImageButton;

    const v3, 0x7f100104

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTouchObject:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755268:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$7;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$7;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'cardboardScriptDialog\' and method \'onScriptDialogOutsideTouch\'"

    const v1, 0x7f100112

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'cardboardScriptDialog\'"

    const-class v2, Landroid/view/ViewGroup;

    const v3, 0x7f100112

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->cardboardScriptDialog:Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755282:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$8;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$8;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const-string/jumbo v0, "field \'speakLevelIndicator\'"

    const-class v1, Landroid/widget/ProgressBar;

    const v2, 0x7f10010f

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speakLevelIndicator:Landroid/widget/ProgressBar;

    const-string/jumbo v0, "field \'yesButton\' and method \'onYesButton\'"

    const v1, 0x7f10010a

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'yesButton\'"

    const-class v2, Landroid/widget/ImageButton;

    const v3, 0x7f10010a

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->yesButton:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755274:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$9;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$9;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'buttonObjectChat\' and method \'onObjectChat\'"

    const v1, 0x7f100106

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonObjectChat\'"

    const-class v2, Landroid/widget/ImageButton;

    const v3, 0x7f100106

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonObjectChat:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755270:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$10;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$10;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'yesNoText\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f10010c

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->yesNoText:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'cardboardDetailsPage\'"

    const-class v1, Landroid/view/ViewGroup;

    const v2, 0x7f100113

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->cardboardDetailsPage:Landroid/view/ViewGroup;

    const-string/jumbo v0, "field \'moveButtonsLayout\'"

    const-class v1, Landroid/view/ViewGroup;

    const v2, 0x7f1000fb

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->moveButtonsLayout:Landroid/view/ViewGroup;

    const-string/jumbo v0, "field \'buttonStandUp\' and method \'onStandUpButton\'"

    const v1, 0x7f100100

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonStandUp\'"

    const-class v2, Landroid/widget/ImageButton;

    const v3, 0x7f100100

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonStandUp:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755264:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$11;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$11;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'speakNowText\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f10010e

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speakNowText:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'buttonMoveForward\' and method \'onCamButtonTouch\'"

    invoke-static {p2, v6, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonMoveForward\'"

    const-class v2, Landroid/widget/ImageButton;

    invoke-static {v1, v6, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonMoveForward:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755260:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$12;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$12;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const-string/jumbo v0, "field \'dialogQuestionText\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f100274

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->dialogQuestionText:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'objectNameView\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f100107

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->objectNameView:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'buttonMoveBackward\' and method \'onCamButtonTouch\'"

    const v1, 0x7f1000fe

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonMoveBackward\'"

    const-class v2, Landroid/widget/ImageButton;

    const v3, 0x7f1000fe

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonMoveBackward:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755262:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$13;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$13;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const-string/jumbo v0, "field \'voiceStatusView\'"

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    const v2, 0x7f1000f6

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    const-string/jumbo v0, "field \'noButton\' and method \'onNoButton\'"

    const v1, 0x7f10010b

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'noButton\'"

    const-class v2, Landroid/widget/ImageButton;

    const v3, 0x7f10010b

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->noButton:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755275:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$14;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$14;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'buttonTouch\' and method \'onTouchButton\'"

    invoke-static {p2, v4, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonTouch\'"

    const-class v2, Landroid/widget/ImageButton;

    invoke-static {v1, v4, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTouch:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755255:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$15;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$15;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'buttonTurnLeft\' and method \'onCamButtonTouch\'"

    invoke-static {p2, v7, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonTurnLeft\'"

    const-class v2, Landroid/widget/ImageButton;

    invoke-static {v1, v7, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTurnLeft:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755261:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$16;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$16;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const-string/jumbo v0, "field \'buttonTurnRight\' and method \'onCamButtonTouch\'"

    const v1, 0x7f1000ff

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonTurnRight\'"

    const-class v2, Landroid/widget/ImageButton;

    const v3, 0x7f1000ff

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTurnRight:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755263:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$17;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$17;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    const-string/jumbo v0, "field \'buttonSit\' and method \'onObjectSit\'"

    const v1, 0x7f100105

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'buttonSit\'"

    const-class v2, Landroid/widget/ImageButton;

    const v3, 0x7f100105

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSit:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755269:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$18;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$18;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'cardboardPrimaryControls\'"

    const-class v1, Landroid/view/ViewGroup;

    const v2, 0x7f1000f5

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->cardboardPrimaryControls:Landroid/view/ViewGroup;

    const-string/jumbo v0, "method \'onYesNoOutsideTouch\'"

    const v1, 0x7f100108

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755272:Landroid/view/View;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$19;

    invoke-direct {v1, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$19;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSpeak:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonChat:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSpeechSend:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognitionResults:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->chatsOverlayLayout:Landroid/widget/LinearLayout;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->cardboardAimControls:Landroid/view/ViewGroup;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->cardboardSpeakControls:Landroid/view/ViewGroup;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->cardboardObjectControls:Landroid/view/ViewGroup;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTouchObject:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->cardboardScriptDialog:Landroid/view/ViewGroup;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speakLevelIndicator:Landroid/widget/ProgressBar;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->yesButton:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonObjectChat:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->yesNoText:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->cardboardDetailsPage:Landroid/view/ViewGroup;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->moveButtonsLayout:Landroid/view/ViewGroup;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonStandUp:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speakNowText:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonMoveForward:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->dialogQuestionText:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->objectNameView:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonMoveBackward:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->voiceStatusView:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->noButton:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTouch:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTurnLeft:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonTurnRight:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSit:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->cardboardPrimaryControls:Landroid/view/ViewGroup;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755256:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755256:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755257:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755257:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755281:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755281:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755265:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755265:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755277:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755277:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755266:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755266:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755268:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755268:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755282:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755282:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755274:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755274:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755270:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755270:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755264:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755264:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755260:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755260:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755262:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755262:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755275:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755275:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755255:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755255:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755261:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755261:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755263:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755263:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755269:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755269:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755272:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;->view2131755272:Landroid/view/View;

    return-void
.end method
