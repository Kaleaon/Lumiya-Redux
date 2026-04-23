.class public Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;
.super Ljava/lang/Object;

# interfaces
.implements Lbutterknife/Unbinder;


# instance fields
.field private target:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

.field private view2131755728:Landroid/view/View;

.field private view2131755729:Landroid/view/View;

.field private view2131755730:Landroid/view/View;

.field private view2131755731:Landroid/view/View;

.field private view2131755736:Landroid/view/View;

.field private view2131755739:Landroid/view/View;

.field private view2131755740:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)V
    .locals 0
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    invoke-direct {p0, p1, p1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;-><init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;Landroid/view/View;)V

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;Landroid/view/View;)V
    .locals 8
    .annotation build Landroid/support/annotation/UiThread;
    .end annotation

    const v7, 0x7f1002d8

    const v3, 0x7f1002d3

    const v6, 0x7f1002d2

    const v5, 0x7f1002d1

    const v4, 0x7f1002d0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    const-string/jumbo v0, "field \'voiceAnswerButton\' and method \'onVoiceAnswerButton\'"

    invoke-static {p2, v3, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'voiceAnswerButton\'"

    const-class v2, Landroid/widget/ImageButton;

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAnswerButton:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755731:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$1;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'voiceTerminateButton\' and method \'onVoiceTerminateButton\'"

    invoke-static {p2, v7, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'voiceTerminateButton\'"

    const-class v2, Landroid/widget/ImageButton;

    invoke-static {v1, v7, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceTerminateButton:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755736:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$2;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'voiceStatusSmallText\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f1002d6

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusSmallText:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'voiceBluetoothButton\' and method \'onVoiceBluetoothButton\'"

    const v1, 0x7f1002dc

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'voiceBluetoothButton\'"

    const-class v2, Landroid/widget/Button;

    const v3, 0x7f1002dc

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceBluetoothButton:Landroid/widget/Button;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755740:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$3;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$3;-><init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'voiceSpeakIndicatorLeft\'"

    const-class v1, Landroid/widget/ImageView;

    const v2, 0x7f1002d4

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorLeft:Landroid/widget/ImageView;

    const-string/jumbo v0, "field \'voiceMicOnButton\' and method \'onVoiceMicOnButton\'"

    invoke-static {p2, v5, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'voiceMicOnButton\'"

    const-class v2, Landroid/widget/ImageButton;

    invoke-static {v1, v5, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceMicOnButton:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755729:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$4;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$4;-><init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'voiceStatusControls\'"

    const-class v1, Landroid/view/ViewGroup;

    const v2, 0x7f1002d9

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusControls:Landroid/view/ViewGroup;

    const-string/jumbo v0, "field \'voiceLoudspeakerButton\' and method \'onLoudspeakerButton\'"

    const v1, 0x7f1002db

    invoke-static {p2, v1, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'voiceLoudspeakerButton\'"

    const-class v2, Landroid/widget/Button;

    const v3, 0x7f1002db

    invoke-static {v1, v3, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceLoudspeakerButton:Landroid/widget/Button;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755739:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$5;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$5;-><init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'voiceStatusText\'"

    const-class v1, Landroid/widget/TextView;

    const v2, 0x7f1002d5

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusText:Landroid/widget/TextView;

    const-string/jumbo v0, "field \'voiceSpeakIndicatorRight\'"

    const-class v1, Landroid/widget/ImageView;

    const v2, 0x7f1002d7

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorRight:Landroid/widget/ImageView;

    const-string/jumbo v0, "field \'voiceMicOffButton\' and method \'onVoiceMicOffButton\'"

    invoke-static {p2, v6, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'voiceMicOffButton\'"

    const-class v2, Landroid/widget/ImageButton;

    invoke-static {v1, v6, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageButton;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceMicOffButton:Landroid/widget/ImageButton;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755730:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$6;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$6;-><init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'voiceStatusCardView\' and method \'onVoiceStatusCardClick\'"

    invoke-static {p2, v4, v0}, Lbutterknife/internal/Utils;->findRequiredView(Landroid/view/View;ILjava/lang/String;)Landroid/view/View;

    move-result-object v1

    const-string/jumbo v0, "field \'voiceStatusCardView\'"

    const-class v2, Landroid/support/v7/widget/CardView;

    invoke-static {v1, v4, v0, v2}, Lbutterknife/internal/Utils;->castView(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/CardView;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusCardView:Landroid/support/v7/widget/CardView;

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755728:Landroid/view/View;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$7;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$7;-><init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)V

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const-string/jumbo v0, "field \'voiceSpeakerVolumeControl\'"

    const-class v1, Landroid/widget/SeekBar;

    const v2, 0x7f1002da

    invoke-static {p2, v2, v0, v1}, Lbutterknife/internal/Utils;->findRequiredViewAsType(Landroid/view/View;ILjava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    iput-object v0, p1, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakerVolumeControl:Landroid/widget/SeekBar;

    return-void
.end method


# virtual methods
.method public unbind()V
    .locals 2
    .annotation build Landroid/support/annotation/CallSuper;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    if-nez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalStateException;

    const-string/jumbo v1, "Bindings already cleared."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->target:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceAnswerButton:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceTerminateButton:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusSmallText:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceBluetoothButton:Landroid/widget/Button;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorLeft:Landroid/widget/ImageView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceMicOnButton:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusControls:Landroid/view/ViewGroup;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceLoudspeakerButton:Landroid/widget/Button;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusText:Landroid/widget/TextView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakIndicatorRight:Landroid/widget/ImageView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceMicOffButton:Landroid/widget/ImageButton;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceStatusCardView:Landroid/support/v7/widget/CardView;

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->voiceSpeakerVolumeControl:Landroid/widget/SeekBar;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755731:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755731:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755736:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755736:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755740:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755740:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755729:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755729:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755739:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755739:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755730:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755730:Landroid/view/View;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755728:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;->view2131755728:Landroid/view/View;

    return-void
.end method
