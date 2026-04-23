.class Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment_ViewBinding$1;
.super Lbutterknife/internal/DebouncingOnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment_ViewBinding;-><init>(Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment_ViewBinding;

.field final synthetic val$target:Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment_ViewBinding$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment_ViewBinding;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment_ViewBinding$1;->val$target:Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;

    invoke-direct {p0}, Lbutterknife/internal/DebouncingOnClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment_ViewBinding$1;->val$target:Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListFragment;->onAddMuteListButtonClick()V

    return-void
.end method
