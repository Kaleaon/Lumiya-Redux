.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment_ViewBinding$2;
.super Lbutterknife/internal/DebouncingOnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment_ViewBinding;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment_ViewBinding;

.field final synthetic val$target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment_ViewBinding$2;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment_ViewBinding;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment_ViewBinding$2;->val$target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;

    invoke-direct {p0}, Lbutterknife/internal/DebouncingOnClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment_ViewBinding$2;->val$target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPickFragment;->onChangePic(Landroid/view/View;)V

    return-void
.end method
