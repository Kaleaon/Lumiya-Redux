.class public Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChattersFragment;
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

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChattersFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1, p3}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChatsListAdapter;-><init>(Landroid/content/Context;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;)V

    return-object v0
.end method

.method protected itemsMayBeDismissed()Z
    .locals 1

    const/4 v0, 0x1

    return v0
.end method
