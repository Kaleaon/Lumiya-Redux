.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab_ViewBinding$1;
.super Lbutterknife/internal/DebouncingOnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab_ViewBinding;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab_ViewBinding;

.field final synthetic val$target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab_ViewBinding;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab_ViewBinding$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab_ViewBinding;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab_ViewBinding$1;->val$target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;

    invoke-direct {p0}, Lbutterknife/internal/DebouncingOnClickListener;-><init>()V

    return-void
.end method


# virtual methods
.method public doClick(Landroid/view/View;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab_ViewBinding$1;->val$target:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;->onAboutEditClicked(Landroid/view/View;)V

    return-void
.end method
