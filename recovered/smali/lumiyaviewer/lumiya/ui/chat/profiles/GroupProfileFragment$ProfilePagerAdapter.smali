.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;
.super Landroid/support/v4/app/FragmentStatePagerAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProfilePagerAdapter"
.end annotation


# instance fields
.field private tabs:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;Landroid/support/v4/app/FragmentManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    invoke-direct {p0, p2}, Landroid/support/v4/app/FragmentStatePagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->tabs:Lcom/google/common/collect/ImmutableList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->tabs:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, p2}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/FragmentStatePagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    return-void
.end method

.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->tabs:Lcom/google/common/collect/ImmutableList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->tabs:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .locals 5

    const/4 v4, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->tabs:Lcom/google/common/collect/ImmutableList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->tabs:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    :try_start_0
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;)Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/support/v4/app/Fragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->-get2(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/support/v4/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;)Ljava/util/Map;

    move-result-object v2

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, v0, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    return-object v4

    :catch_1
    move-exception v0

    return-object v4

    :cond_0
    return-object v4
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->tabs:Lcom/google/common/collect/ImmutableList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->tabs:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;)I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    return-object v1
.end method

.method getTabs()Lcom/google/common/collect/ImmutableList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->tabs:Lcom/google/common/collect/ImmutableList;

    return-object v0
.end method

.method public saveState()Landroid/os/Parcelable;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method setTabs(Lcom/google/common/collect/ImmutableList;)V
    .locals 1
    .param p1    # Lcom/google/common/collect/ImmutableList;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->tabs:Lcom/google/common/collect/ImmutableList;

    if-eq v0, p1, :cond_0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->tabs:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfilePagerAdapter;->notifyDataSetChanged()V

    :cond_0
    return-void
.end method
