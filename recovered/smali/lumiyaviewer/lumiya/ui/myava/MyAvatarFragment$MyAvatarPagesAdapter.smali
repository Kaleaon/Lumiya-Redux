.class Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;
.super Landroid/widget/ArrayAdapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "MyAvatarPagesAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-ui-myava-MyAvatarDetailsPagesSwitchesValues:[I


# instance fields
.field final synthetic $SWITCH_TABLE$com$lumiyaviewer$lumiya$ui$myava$MyAvatarDetailsPages:[I

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-ui-myava-MyAvatarDetailsPagesSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;->-com-lumiyaviewer-lumiya-ui-myava-MyAvatarDetailsPagesSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;->-com-lumiyaviewer-lumiya-ui-myava-MyAvatarDetailsPagesSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->values()[Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageBalance:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_3

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageBlockList:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_2

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageOutfits:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_1

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->pageProfile:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_0

    :goto_3
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;->-com-lumiyaviewer-lumiya-ui-myava-MyAvatarDetailsPagesSwitchesValues:[I

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

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;Landroid/content/Context;)V
    .locals 2

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->values()[Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    move-result-object v0

    const v1, 0x1090003

    invoke-direct {p0, p2, v1, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    invoke-super {p0, p1, p2, p3}, Landroid/widget/ArrayAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;

    instance-of v2, v1, Landroid/widget/TextView;

    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;->-getcom-lumiyaviewer-lumiya-ui-myava-MyAvatarDetailsPagesSwitchesValues()[I

    move-result-object v2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->ordinal()I

    move-result v3

    aget v2, v2, v3

    packed-switch v2, :pswitch_data_0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarDetailsPages;->getTitleResource()I

    move-result v0

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    move-object v0, v1

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_0
    :goto_0
    return-object v1

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->-get0(Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;)Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    if-eqz v0, :cond_1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const v0, 0x7f0901c3

    invoke-virtual {v2, v0, v3}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    :goto_1
    move-object v0, v1

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    :cond_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment$MyAvatarPagesAdapter;->this$0:Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;

    const v2, 0x7f0901c4

    invoke-virtual {v0, v2}, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    goto :goto_1

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method
