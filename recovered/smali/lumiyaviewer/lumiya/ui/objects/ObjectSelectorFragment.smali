.class public Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;
.super Landroid/support/v4/app/Fragment;

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/widget/ExpandableListView$OnGroupClickListener;
.implements Landroid/widget/ExpandableListView$OnChildClickListener;


# static fields
.field private static final MAX_FILTER_DISTANCE:I = 0x100

.field private static final PROGRESS_BAR_SIZE_DIP:I = 0x4


# instance fields
.field private filterInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

.field private final onObjectListData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;",
            ">;"
        }
    .end annotation
.end field

.field private final onObjectListError:Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;

.field private searchView:Landroid/support/v7/widget/SearchView;

.field private subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->updateFilter()V

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Landroid/support/v4/app/Fragment;-><init>()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->create()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->filterInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$rXtKRyOts6GGB3GxWNYA5oEvU2Y$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$rXtKRyOts6GGB3GxWNYA5oEvU2Y$1;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->onObjectListError:Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$rXtKRyOts6GGB3GxWNYA5oEvU2Y;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$rXtKRyOts6GGB3GxWNYA5oEvU2Y;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->onObjectListData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    return-void
.end method

.method private getFilter()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;
    .locals 6

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getView()Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->create()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    move-result-object v0

    return-object v0

    :cond_0
    const v0, 0x7f100229

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_1

    const v0, 0x7f10022b

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getProgress()I

    move-result v0

    int-to-float v0, v0

    cmpg-float v3, v0, v1

    if-gez v3, :cond_2

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->searchView:Landroid/support/v7/widget/SearchView;

    invoke-virtual {v0}, Landroid/support/v7/widget/SearchView;->getQuery()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    const v0, 0x7f10022f

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v4

    const v0, 0x7f100230

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v5

    const v0, 0x7f10022e

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0}, Landroid/widget/CheckBox;->isChecked()Z

    move-result v0

    invoke-static {v3, v4, v5, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->create(Ljava/lang/String;ZZZF)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    move-result-object v0

    return-object v0

    :cond_1
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->create()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    move-result-object v0

    return-object v0

    :cond_2
    move v1, v0

    goto :goto_0
.end method

.method private getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    return-object v0
.end method

.method public static newInstance(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;-><init>()V

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->setArguments(Landroid/os/Bundle;)V

    return-object v0
.end method

.method private showObjectDetails(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;)V
    .locals 4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getActiveAgentID(Landroid/os/Bundle;)Ljava/util/UUID;

    move-result-object v0

    if-eqz v0, :cond_0

    instance-of v1, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLAvatarObjectDisplayInfo;

    if-eqz v1, :cond_1

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLAvatarObjectDisplayInfo;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLAvatarObjectDisplayInfo;->uuid:Ljava/util/UUID;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v2

    const-class v3, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->getUserChatterID(Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v2, v3, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity$ObjectDetailsActivityFactory;->getInstance()Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity$ObjectDetailsActivityFactory;

    move-result-object v2

    iget v3, p1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->localID:I

    invoke-static {v0, v3}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectDetailsFragment;->makeSelection(Ljava/util/UUID;I)Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showDetails(Landroid/app/Activity;Lcom/lumiyaviewer/lumiya/ui/common/FragmentActivityFactory;Landroid/os/Bundle;)V

    goto :goto_0
.end method

.method private updateFilter()V
    .locals 3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getFilter()Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->filterInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->filterInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->filterInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    invoke-virtual {v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->setFilter(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->filterInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->range()F

    move-result v1

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->filterInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;->range()F

    move-result v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->setObjectSelectRange(F)V

    :cond_0
    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectSelectorFragment_10042(Ljava/lang/Throwable;)V
    .locals 4

    const/16 v3, 0x8

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getView()Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_1

    const v0, 0x7f100021

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    const v0, 0x7f100234

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f100233

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v2, 0x7f090231

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    const v0, 0x7f100232

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f100231

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_ObjectSelectorFragment_10971(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;)V
    .locals 8

    const v6, 0x7f100231

    const/16 v1, 0x8

    const/4 v4, 0x0

    iget-object v5, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;->objects:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getView()Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_a

    const v0, 0x7f100021

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;->isLoading:Z

    if-eqz v0, :cond_2

    move v0, v4

    :goto_0
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    const v0, 0x7f100234

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    iget-boolean v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;->isLoading:Z

    if-eqz v0, :cond_3

    move v0, v4

    :goto_1
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f100233

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-boolean v2, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDisplayList;->isLoading:Z

    if-eqz v2, :cond_4

    const v2, 0x7f090230

    :goto_2
    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    const v0, 0x7f100232

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_5

    move v0, v4

    :goto_3
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_6

    :goto_4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v3, v6}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ExpandableListView;

    invoke-virtual {v0}, Landroid/widget/ExpandableListView;->getExpandableListAdapter()Landroid/widget/ExpandableListAdapter;

    move-result-object v2

    instance-of v1, v2, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;

    if-eqz v1, :cond_a

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    move-object v1, v2

    check-cast v1, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->getData()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_1
    :goto_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

    instance-of v3, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfoWithChildren;

    if-eqz v3, :cond_1

    move-object v3, v1

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfoWithChildren;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfoWithChildren;->isImplicitlyAdded()Z

    move-result v3

    if-nez v3, :cond_1

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->localID:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_5

    :cond_2
    move v0, v1

    goto/16 :goto_0

    :cond_3
    move v0, v1

    goto :goto_1

    :cond_4
    const v2, 0x7f090232

    goto :goto_2

    :cond_5
    move v0, v1

    goto :goto_3

    :cond_6
    move v1, v4

    goto :goto_4

    :cond_7
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    :goto_6
    invoke-virtual {v5}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v1

    if-ge v4, v1, :cond_9

    invoke-virtual {v5, v4}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

    instance-of v3, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfoWithChildren;

    if-eqz v3, :cond_8

    move-object v3, v1

    check-cast v3, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfoWithChildren;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfoWithChildren;->isImplicitlyAdded()Z

    move-result v3

    if-eqz v3, :cond_8

    iget v1, v1, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->localID:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v6, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_8

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v7, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_8
    add-int/lit8 v4, v4, 0x1

    goto :goto_6

    :cond_9
    check-cast v2, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;

    invoke-virtual {v2, v5}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->setData(Lcom/google/common/collect/ImmutableList;)V

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/ExpandableListView;->expandGroup(I)Z

    goto :goto_7

    :cond_a
    return-void
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->updateFilter()V

    return-void
.end method

.method public onChildClick(Landroid/widget/ExpandableListView;Landroid/view/View;IIJ)Z
    .locals 2

    invoke-virtual {p1}, Landroid/widget/ExpandableListView;->getExpandableListAdapter()Landroid/widget/ExpandableListAdapter;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;

    invoke-virtual {v0, p3, p4}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->getChild(II)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->showObjectDetails(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;)V

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Landroid/support/v4/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->setHasOptionsMenu(Z)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 3

    const v2, 0x7f100330

    invoke-super {p0, p1, p2}, Landroid/support/v4/app/Fragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    const v0, 0x7f120012

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-static {v0}, Landroid/support/v4/view/MenuItemCompat;->getActionView(Landroid/view/MenuItem;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v7/widget/SearchView;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->searchView:Landroid/support/v7/widget/SearchView;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->searchView:Landroid/support/v7/widget/SearchView;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment$1;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;)V

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/SearchView;->setOnQueryTextListener(Landroid/support/v7/widget/SearchView$OnQueryTextListener;)V

    invoke-interface {p1, v2}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment$2;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;)V

    invoke-static {v0, v1}, Landroid/support/v4/view/MenuItemCompat;->setOnActionExpandListener(Landroid/view/MenuItem;Landroid/support/v4/view/MenuItemCompat$OnActionExpandListener;)Landroid/view/MenuItem;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 7

    const v5, 0x7f10022b

    const v4, 0x7f100231

    invoke-super {p0, p1, p2, p3}, Landroid/support/v4/app/Fragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    const v0, 0x7f040076

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ExpandableListView;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0, v2}, Landroid/widget/ExpandableListView;->setAdapter(Landroid/widget/ExpandableListAdapter;)V

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ExpandableListView;

    invoke-virtual {v0, p0}, Landroid/widget/ExpandableListView;->setOnGroupClickListener(Landroid/widget/ExpandableListView$OnGroupClickListener;)V

    invoke-virtual {v1, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ExpandableListView;

    invoke-virtual {v0, p0}, Landroid/widget/ExpandableListView;->setOnChildClickListener(Landroid/widget/ExpandableListView$OnChildClickListener;)V

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    const/16 v2, 0x100

    invoke-virtual {v0, v2}, Landroid/widget/SeekBar;->setMax(I)V

    invoke-virtual {v1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    const v0, 0x7f10022f

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0, p0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    const v0, 0x7f100230

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0, p0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    const v0, 0x7f10022e

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/CheckBox;

    invoke-virtual {v0, p0}, Landroid/widget/CheckBox;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0xe

    if-lt v0, v2, :cond_0

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;-><init>(Landroid/content/Context;)V

    const v0, 0x7f100021

    invoke-virtual {v2, v0}, Lcom/lumiyaviewer/lumiya/ui/common/ButteryProgressBar;->setId(I)V

    const v0, 0x7f100228

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    new-instance v3, Landroid/widget/FrameLayout$LayoutParams;

    const/high16 v4, 0x40800000    # 4.0f

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    const/4 v6, 0x1

    invoke-static {v6, v4, v5}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v4

    float-to-int v4, v4

    const/4 v5, -0x1

    invoke-direct {v3, v5, v4}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v2, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    :cond_0
    return-object v1
.end method

.method public onGroupClick(Landroid/widget/ExpandableListView;Landroid/view/View;IJ)Z
    .locals 4

    const/4 v3, 0x1

    const-string/jumbo v0, "displayObjects: onGroupClick: view %s id %d"

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p2, v1, v2

    invoke-virtual {p2}, Landroid/view/View;->getId()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroid/widget/ExpandableListView;->getExpandableListAdapter()Landroid/widget/ExpandableListAdapter;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;

    invoke-virtual {v0, p3}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListAdapter;->getGroup(I)Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->showObjectDetails(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;)V

    :cond_0
    return v3
.end method

.method public onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    const v1, 0x7f10022c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const v2, 0x7f090244

    invoke-virtual {p0, v2, v1}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz p3, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->updateFilter()V

    :cond_0
    return-void
.end method

.method public onStart()V
    .locals 8

    const/16 v1, 0x100

    const/4 v0, 0x1

    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStart()V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->filterInfo:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;

    invoke-virtual {v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->setFilter(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectFilterInfo;)V

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v3

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->getObjectDisplayList()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v3

    sget-object v4, Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;->Value:Lcom/lumiyaviewer/lumiya/react/SubscriptionSingleKey;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v5

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->onObjectListData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->onObjectListError:Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;

    invoke-interface {v3, v4, v5, v6, v7}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;Lcom/lumiyaviewer/lumiya/react/Subscription$OnError;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v3

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v2

    if-eqz v2, :cond_1

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v2

    if-eqz v2, :cond_1

    iget-object v3, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->EnableObjectSelect()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getView()Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_1

    iget-object v2, v2, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->getObjectSelectRange()F

    move-result v2

    float-to-int v2, v2

    if-ge v2, v0, :cond_2

    move v1, v0

    :cond_0
    :goto_0
    const v0, 0x7f10022b

    invoke-virtual {v3, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setProgress(I)V

    :cond_1
    return-void

    :cond_2
    if-gt v2, v1, :cond_0

    move v1, v2

    goto :goto_0
.end method

.method public onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public onStop()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->subscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectSelectorFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;->DisableObjectSelect()V

    :cond_1
    invoke-super {p0}, Landroid/support/v4/app/Fragment;->onStop()V

    return-void
.end method

.method public onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method
