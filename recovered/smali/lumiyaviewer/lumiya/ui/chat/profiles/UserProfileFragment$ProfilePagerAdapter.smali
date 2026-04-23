.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfilePagerAdapter;
.super Landroid/support/v4/app/FragmentStatePagerAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ProfilePagerAdapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;Landroid/support/v4/app/FragmentManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfilePagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    invoke-direct {p0, p2}, Landroid/support/v4/app/FragmentStatePagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->values()[Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    move-result-object v0

    aget-object v0, v0, p2

    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfilePagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;)Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1, v0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_0
    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/FragmentStatePagerAdapter;->destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V

    return-void
.end method

.method public getCount()I
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->values()[Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .locals 5

    const/4 v4, 0x0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->values()[Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    move-result-object v0

    aget-object v1, v0, p1

    :try_start_0
    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;)Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfilePagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->-get1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/support/v4/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfilePagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;)Ljava/util/Map;

    move-result-object v2

    new-instance v3, Ljava/lang/ref/WeakReference;

    invoke-direct {v3, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-interface {v2, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    return-object v4

    :catch_1
    move-exception v0

    return-object v4
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->values()[Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    move-result-object v0

    aget-object v0, v0, p1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfilePagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;)I

    move-result v0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public saveState()Landroid/os/Parcelable;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method
