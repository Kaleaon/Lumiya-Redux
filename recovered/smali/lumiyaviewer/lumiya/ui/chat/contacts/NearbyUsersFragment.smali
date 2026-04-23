.class public Lcom/lumiyaviewer/lumiya/ui/chat/contacts/NearbyUsersFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/UserListFragment;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/UserListFragment;-><init>()V

    return-void
.end method


# virtual methods
.method protected createListAdapter(Landroid/content/Context;Landroid/support/v4/app/LoaderManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)Landroid/widget/ListAdapter;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;->Nearby:Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;

    invoke-direct {v0, p1, p3, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterListType;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ChatterListSubscriptionAdapter;->setUserDistanceInline(Z)V

    return-object v0
.end method
