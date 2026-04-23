.class Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$19;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;-><init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;

.field final synthetic val$target:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$19;->this$0:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$19;->val$target:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity_ViewBinding$19;->val$target:Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;

    invoke-virtual {v0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/render/CardboardActivity;->onYesNoOutsideTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result v0

    return v0
.end method
