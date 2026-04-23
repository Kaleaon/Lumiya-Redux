.class Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$1;
.super Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;-><init>(Landroid/content/Context;IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;Landroid/content/Context;)V
    .locals 0

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;

    invoke-direct {p0, p1, p3}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager$SmoothScroller;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/ChatLayoutManager;Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method protected getScrollMs()F
    .locals 1

    const/high16 v0, 0x447a0000    # 1000.0f

    return v0
.end method
