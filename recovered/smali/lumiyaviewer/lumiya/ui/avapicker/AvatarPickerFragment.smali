.class public abstract Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$AvatarPickerPagerAdapter;,
        Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;,
        Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$UsersOnlyPredicate;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-ui-avapicker-AvatarPickerFragment$ContactListTypeSwitchesValues:[I


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-ui-avapicker-AvatarPickerFragment$ContactListTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;->-com-lumiyaviewer-lumiya-ui-avapicker-AvatarPickerFragment$ContactListTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;->-com-lumiyaviewer-lumiya-ui-avapicker-AvatarPickerFragment$ContactListTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->values()[Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->Friends:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->Nearby:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->Recent:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;->-com-lumiyaviewer-lumiya-ui-avapicker-AvatarPickerFragment$ContactListTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_0
.end method

.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;)Landroid/widget/ListAdapter;
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;->createListAdapter(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;)Landroid/widget/ListAdapter;

    move-result-object v0

    return-object v0
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;-><init>()V

    return-void
.end method

.method private createListAdapter(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;)Landroid/widget/ListAdapter;
    .locals 4
    .param p3    # Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;->-getcom-lumiyaviewer-lumiya-ui-avapicker-AvatarPickerFragment$ContactListTypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p3}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "Unknown contact list type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :pswitch_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Active:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$UsersOnlyPredicate;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$UsersOnlyPredicate;-><init>(Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$UsersOnlyPredicate;)V

    invoke-direct {v0, p1, p2, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;Lcom/google/common/base/Predicate;)V

    return-object v0

    :pswitch_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Friends:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-direct {v0, p1, p2, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    return-object v0

    :pswitch_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Nearby:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-direct {v0, p1, p2, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    return-object v0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method


# virtual methods
.method protected createExtraView(Landroid/view/LayoutInflater;Landroid/widget/FrameLayout;)V
    .locals 0

    return-void
.end method

.method public abstract getTitle()Ljava/lang/String;
.end method

.method protected abstract onAvatarSelected(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    const v0, 0x7f04001f

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    const v0, 0x7f1000f3

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/view/ViewPager;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$AvatarPickerPagerAdapter;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v1, p0, v3}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$AvatarPickerPagerAdapter;-><init>(Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Landroid/support/v4/view/ViewPager;->setAdapter(Landroid/support/v4/view/PagerAdapter;)V

    const v1, 0x7f1000f2

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/astuetz/PagerSlidingTabStrip;

    invoke-virtual {v1, v0}, Lcom/astuetz/PagerSlidingTabStrip;->setViewPager(Landroid/support/v4/view/ViewPager;)V

    const v0, 0x7f1000f4

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;->createExtraView(Landroid/view/LayoutInflater;Landroid/widget/FrameLayout;)V

    return-object v2
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    invoke-virtual {p1, p3}, Landroid/widget/AdapterView;->getItemAtPosition(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v0, v1, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;

    if-eqz v0, :cond_0

    move-object v0, v1

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    invoke-interface {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;->getChatterID(Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    move-result-object v0

    if-eqz v0, :cond_0

    check-cast v1, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;

    invoke-interface {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ChatterDisplayInfo;->getDisplayName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;->onAvatarSelected(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/lang/String;)V

    :cond_0
    return-void
.end method
