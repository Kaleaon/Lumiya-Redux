.class public Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$AvatarPickerPagerAdapter;
.super Landroid/support/v4/view/PagerAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AvatarPickerPagerAdapter"
.end annotation


# instance fields
.field private final context:Landroid/content/Context;

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;Landroid/content/Context;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$AvatarPickerPagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;

    invoke-direct {p0}, Landroid/support/v4/view/PagerAdapter;-><init>()V

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$AvatarPickerPagerAdapter;->context:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 2

    instance-of v0, p3, Landroid/view/View;

    if-eqz v0, :cond_1

    instance-of v0, p3, Landroid/widget/ListView;

    if-eqz v0, :cond_0

    move-object v0, p3

    check-cast v0, Landroid/widget/ListView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    :cond_0
    check-cast p3, Landroid/view/View;

    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    :cond_1
    return-void
.end method

.method public getCount()I
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->values()[Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 1

    if-ltz p1, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->values()[Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    move-result-object v0

    array-length v0, v0

    if-ge p1, v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->values()[Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    move-result-object v0

    aget-object v0, v0, p1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 5

    if-ltz p2, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->values()[Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    move-result-object v0

    array-length v0, v0

    if-ge p2, v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->values()[Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    move-result-object v0

    aget-object v0, v0, p2

    new-instance v1, Landroid/widget/ListView;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$AvatarPickerPagerAdapter;->context:Landroid/content/Context;

    invoke-direct {v1, v2}, Landroid/widget/ListView;-><init>(Landroid/content/Context;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$AvatarPickerPagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;

    invoke-virtual {v1, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$AvatarPickerPagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$AvatarPickerPagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$AvatarPickerPagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v4

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v4

    invoke-static {v2, v3, v4, v0}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;->-wrap0(Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;)Landroid/widget/ListAdapter;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-object v1

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 1

    if-ne p1, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method
