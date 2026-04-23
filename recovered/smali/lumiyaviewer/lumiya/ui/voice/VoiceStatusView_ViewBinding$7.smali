.class Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$7;
.super Lbutterknife/internal/DebouncingOnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;-><init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;

.field final synthetic val$target:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$7;->this$0:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$7;->val$target:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    invoke-direct {p0}, Lbutterknife/internal/DebouncingOnClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView_ViewBinding$7;->val$target:Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/voice/VoiceStatusView;->onVoiceStatusCardClick()V

    return-void
.end method
