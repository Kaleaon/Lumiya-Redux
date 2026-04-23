.class Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactsPagerAdapter;
.super Landroid/support/v4/app/FragmentStatePagerAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ContactsPagerAdapter"
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-ui-chat-ContactsFragment$ContactListTypeSwitchesValues:[I


# instance fields
.field final synthetic $SWITCH_TABLE$com$lumiyaviewer$lumiya$ui$chat$ContactsFragment$ContactListType:[I

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-ui-chat-ContactsFragment$ContactListTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactsPagerAdapter;->-com-lumiyaviewer-lumiya-ui-chat-ContactsFragment$ContactListTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactsPagerAdapter;->-com-lumiyaviewer-lumiya-ui-chat-ContactsFragment$ContactListTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->values()[Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->Active:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->Friends:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->Groups:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->Nearby:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_3
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactsPagerAdapter;->-com-lumiyaviewer-lumiya-ui-chat-ContactsFragment$ContactListTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_3

    :catch_1
    move-exception v1

    goto :goto_2

    :catch_2
    move-exception v1

    goto :goto_1

    :catch_3
    move-exception v1

    goto :goto_0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;Landroid/support/v4/app/FragmentManager;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactsPagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;

    invoke-direct {p0, p2}, Landroid/support/v4/app/FragmentStatePagerAdapter;-><init>(Landroid/support/v4/app/FragmentManager;)V

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->values()[Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public getItem(I)Landroid/support/v4/app/Fragment;
    .locals 5

    const/4 v1, 0x0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->values()[Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    move-result-object v0

    aget-object v0, v0, p1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactsPagerAdapter;->-getcom-lumiyaviewer-lumiya-ui-chat-ContactsFragment$ContactListTypeSwitchesValues()[I

    move-result-object v2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->ordinal()I

    move-result v0

    aget v0, v2, v0

    packed-switch v0, :pswitch_data_0

    move-object v0, v1

    :goto_0
    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactsPagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/os/Bundle;)Ljava/util/UUID;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->makeFragmentArguments(Ljava/util/UUID;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v3, "vrMode"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string/jumbo v3, "vrMode"

    const-string/jumbo v4, "vrMode"

    invoke-virtual {v2, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    invoke-virtual {v1, v3, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    :cond_0
    invoke-virtual {v0, v1}, Landroid/support/v4/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    :cond_1
    return-object v0

    :pswitch_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChattersFragment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/ActiveChattersFragment;-><init>()V

    goto :goto_0

    :pswitch_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/FriendListFragment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/FriendListFragment;-><init>()V

    goto :goto_0

    :pswitch_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/GroupListFragment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/GroupListFragment;-><init>()V

    goto :goto_0

    :pswitch_3
    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/NearbyUsersFragment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/contacts/NearbyUsersFragment;-><init>()V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method public getPageTitle(I)Ljava/lang/CharSequence;
    .locals 3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->values()[Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    move-result-object v0

    aget-object v1, v0, p1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->name()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->Nearby:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactsPagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactsPagerAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/CurrentLocationInfo;->nearbyUsers()I

    move-result v1

    if-eqz v1, :cond_0

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " ("

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ")"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public saveState()Landroid/os/Parcelable;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method
