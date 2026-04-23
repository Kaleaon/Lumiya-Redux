.class Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/speech/RecognitionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBeginningOfSpeech()V
    .locals 2

    const-string/jumbo v0, "Cardboard: beginning of speech"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public onBufferReceived([B)V
    .locals 0

    return-void
.end method

.method public onEndOfSpeech()V
    .locals 3

    const/4 v2, 0x4

    const-string/jumbo v0, "Cardboard: end of speech"

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speakLevelIndicator:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speakNowText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method public onError(I)V
    .locals 4

    const-string/jumbo v0, "Cardboard: speech error %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    packed-switch p1, :pswitch_data_0

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const v1, 0x7f090315

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-wrap7(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Ljava/lang/String;)V

    return-void

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const v1, 0x7f090314

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const v1, 0x7f090317

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const v1, 0x7f09031a

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :pswitch_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const v1, 0x7f09031b

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :pswitch_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const v1, 0x7f090316

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :pswitch_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const v1, 0x7f090318

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :pswitch_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const v1, 0x7f090319

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_6
        :pswitch_0
        :pswitch_7
        :pswitch_4
        :pswitch_5
        :pswitch_2
    .end packed-switch
.end method

.method public onEvent(ILandroid/os/Bundle;)V
    .locals 0

    return-void
.end method

.method public onPartialResults(Landroid/os/Bundle;)V
    .locals 3

    const/4 v2, 0x0

    const-string/jumbo v0, "Cardboard: speech recognition: got partial results"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v0, "results_recognition"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-set4(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Ljava/lang/String;)Ljava/lang/String;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognitionResults:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSpeechSend:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public onReadyForSpeech(Landroid/os/Bundle;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speakNowText:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    return-void
.end method

.method public onResults(Landroid/os/Bundle;)V
    .locals 3

    const/4 v2, 0x0

    const-string/jumbo v0, "Cardboard: speech recognition: got some results"

    new-array v1, v2, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-string/jumbo v0, "results_recognition"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speechRecognitionResults:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-set4(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Ljava/lang/String;)Ljava/lang/String;

    invoke-static {v0}, Lcom/google/common/base/Strings;->isNullOrEmpty(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->buttonSpeechSend:Landroid/widget/ImageButton;

    invoke-virtual {v0, v2}, Landroid/widget/ImageButton;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speakLevelIndicator:Landroid/widget/ProgressBar;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-set3(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Z)Z

    :cond_0
    return-void
.end method

.method public onRmsChanged(F)V
    .locals 5

    const/16 v1, 0x64

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get15(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Z

    move-result v0

    if-nez v0, :cond_7

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get27(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get27(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F

    move-result v0

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-set9(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;F)F

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get26(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F

    move-result v0

    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get26(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F

    move-result v0

    cmpl-float v0, p1, v0

    if-lez v0, :cond_3

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-set8(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;F)F

    :cond_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get26(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F

    move-result v0

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get27(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F

    move-result v3

    sub-float v3, v0, v3

    cmpg-float v3, v3, v4

    if-gez v3, :cond_4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get27(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F

    move-result v0

    add-float/2addr v0, v4

    :cond_4
    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get27(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F

    move-result v3

    sub-float v3, p1, v3

    const/high16 v4, 0x42c80000    # 100.0f

    mul-float/2addr v3, v4

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get27(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)F

    move-result v4

    sub-float/2addr v0, v4

    div-float v0, v3, v0

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    if-gez v0, :cond_5

    move v0, v2

    :cond_5
    if-le v0, v1, :cond_6

    move v0, v1

    :cond_6
    const-string/jumbo v1, "Cardboard: speech recognition: RMS %f"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v4

    aput-object v4, v3, v2

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speakLevelIndicator:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v2}, Landroid/widget/ProgressBar;->setVisibility(I)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->speakLevelIndicator:Landroid/widget/ProgressBar;

    invoke-virtual {v1, v0}, Landroid/widget/ProgressBar;->setProgress(I)V

    :cond_7
    return-void
.end method
