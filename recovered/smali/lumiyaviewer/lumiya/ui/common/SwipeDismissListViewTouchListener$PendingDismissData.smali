.class Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$PendingDismissData;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "PendingDismissData"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/lang/Comparable",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$PendingDismissData;",
        ">;"
    }
.end annotation


# instance fields
.field public position:I

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;

.field public view:Landroid/view/View;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;ILandroid/view/View;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$PendingDismissData;->this$0:Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$PendingDismissData;->position:I

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$PendingDismissData;->view:Landroid/view/View;

    return-void
.end method


# virtual methods
.method public compareTo(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$PendingDismissData;)I
    .locals 2

    iget v0, p1, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$PendingDismissData;->position:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$PendingDismissData;->position:I

    sub-int/2addr v0, v1

    return v0
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$PendingDismissData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$PendingDismissData;->compareTo(Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener$PendingDismissData;)I

    move-result v0

    return v0
.end method
