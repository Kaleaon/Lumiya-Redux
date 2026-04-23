.class Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$6;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/vr/sdk/controller/ControllerManager$EventListener;


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

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onApiStatusChanged(I)V
    .locals 4

    const-string/jumbo v0, "Cardboard: controller API status: %d"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method

.method public onRecentered()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get7(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/google/vr/sdk/base/GvrView;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity$6;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->-get7(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)Lcom/google/vr/sdk/base/GvrView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/vr/sdk/base/GvrView;->recenterHeadTracker()V

    :cond_0
    return-void
.end method
