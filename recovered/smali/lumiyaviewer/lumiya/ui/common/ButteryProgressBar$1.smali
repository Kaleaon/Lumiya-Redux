.class Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->invalidate()V

    return-void
.end method
