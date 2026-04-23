.class Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    const/4 v8, 0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set0(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get9(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get0(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->hasData()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get20(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;

    if-eqz v0, :cond_1

    iget-object v2, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->state:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    sget-object v3, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;->Active:Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo$VoiceChatState;

    if-ne v2, v3, :cond_1

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/voice/common/model/VoiceChatInfo;->localMicActive:Z

    :goto_0
    if-nez v0, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get12(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)J

    move-result-wide v4

    const-wide/16 v6, 0x1d4c

    add-long/2addr v4, v6

    sub-long v2, v4, v2

    const-string/jumbo v0, "ButtonsFade: remaining %d"

    new-array v4, v8, [Ljava/lang/Object;

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-static {v0, v4}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-wide/16 v0, 0x0

    cmp-long v0, v2, v0

    if-gtz v0, :cond_2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-wrap3(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)V

    :cond_0
    :goto_1
    return-void

    :cond_1
    move v0, v1

    goto :goto_0

    :cond_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0, v8}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set0(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get15(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$3;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get3(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_1
.end method
