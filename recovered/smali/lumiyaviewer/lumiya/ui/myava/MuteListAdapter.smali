.class Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;
.super Landroid/widget/BaseAdapter;


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-modules-mutelist-MuteTypeSwitchesValues:[I


# instance fields
.field private final layoutInflater:Landroid/view/LayoutInflater;

.field private muteList:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-modules-mutelist-MuteTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->-com-lumiyaviewer-lumiya-slproto-modules-mutelist-MuteTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->-com-lumiyaviewer-lumiya-slproto-modules-mutelist-MuteTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->values()[Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->AGENT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_4

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->BY_NAME:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_3

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->EXTERNAL:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_2

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->GROUP:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_1

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->OBJECT:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_0

    :goto_4
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->-com-lumiyaviewer-lumiya-slproto-modules-mutelist-MuteTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_4

    :catch_1
    move-exception v1

    goto :goto_3

    :catch_2
    move-exception v1

    goto :goto_2

    :catch_3
    move-exception v1

    goto :goto_1

    :catch_4
    move-exception v1

    goto :goto_0
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->muteList:Lcom/google/common/collect/ImmutableList;

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    return-void
.end method


# virtual methods
.method public getCount()I
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->muteList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    return v0
.end method

.method public getItem(I)Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;
    .locals 1

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->muteList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v0

    if-ge p1, v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->muteList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;

    move-result-object v0

    return-object v0
.end method

.method public getItemId(I)J
    .locals 2

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    const/4 v4, 0x0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;

    move-result-object v1

    if-eqz v1, :cond_1

    if-nez p2, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->layoutInflater:Landroid/view/LayoutInflater;

    const v2, 0x7f040062

    const/4 v3, 0x0

    invoke-virtual {v0, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_0
    if-eqz p2, :cond_1

    const v0, 0x7f1001e7

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v2, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->-getcom-lumiyaviewer-lumiya-slproto-modules-mutelist-MuteTypeSwitchesValues()[I

    move-result-object v0

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->type:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    const v0, 0x7f0200c4

    move v1, v0

    :goto_0
    const v0, 0x7f1001e6

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/ui/common/SwipeDismissListViewTouchListener;->restoreViewState(Landroid/view/View;)V

    return-object p2

    :pswitch_1
    const v0, 0x7f0200c1

    move v1, v0

    goto :goto_0

    :pswitch_2
    const v0, 0x7f0200c6

    move v1, v0

    goto :goto_0

    :cond_1
    return-object v4

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public hasStableIds()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method setData(Ljava/util/List;)V
    .locals 1
    .param p1    # Ljava/util/List;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    :goto_0
    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->muteList:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/myava/MuteListAdapter;->notifyDataSetChanged()V

    return-void

    :cond_0
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    goto :goto_0
.end method
