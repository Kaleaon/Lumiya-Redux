.class Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$2;
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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 8

    const/4 v7, 0x1

    const/4 v6, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0, v6}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set6(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Z)Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get9(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get13(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)J

    move-result-wide v2

    const-wide/16 v4, 0x1770

    add-long/2addr v2, v4

    sub-long v0, v2, v0

    const-string/jumbo v2, "ObjectDeselect: remaining %d"

    new-array v3, v7, [Ljava/lang/Object;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-gtz v2, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->handlePickedObject(Lcom/lumiyaviewer/lumiya/render/picking/ObjectIntersectInfo;)V

    :cond_0
    :goto_0
    return-void

    :cond_1
    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v2, v7}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-set6(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;Z)Z

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get15(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Landroid/os/Handler;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;->-get16(Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
