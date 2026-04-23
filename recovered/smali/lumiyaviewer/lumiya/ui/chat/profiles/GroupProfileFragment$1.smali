.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/support/v4/view/ViewPager$OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    return-void
.end method

.method public onPageSelected(I)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;)Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;)Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->getTabs()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v1

    if-ge p1, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    invoke-static {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->-set1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;)Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$1;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->-get2(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->-set0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    :cond_0
    return-void
.end method
