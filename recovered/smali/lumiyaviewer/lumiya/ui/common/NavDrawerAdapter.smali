.class Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;
.super Landroid/widget/ArrayAdapter;

# interfaces
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$1;,
        Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$2;,
        Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;,
        Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/ArrayAdapter",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;",
        ">;",
        "Landroid/widget/AdapterView$OnItemClickListener;"
    }
.end annotation


# static fields
.field private static items:[Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/16 v0, 0xa

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/ChatNewActivity;

    const v3, 0x7f100369

    const v4, 0x7f010033

    const v5, 0x7f0901ca

    invoke-direct {v1, v3, v4, v5, v2}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;-><init>(IIILjava/lang/Class;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/render/WorldViewActivity;

    const v3, 0x7f100347

    const v4, 0x7f010055

    const v5, 0x7f0901c9

    invoke-direct {v1, v3, v4, v5, v2}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;-><init>(IIILjava/lang/Class;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/objects/ObjectListNewActivity;

    const v3, 0x7f100348

    const v4, 0x7f01003c

    const v5, 0x7f0901cf

    invoke-direct {v1, v3, v4, v5, v2}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;-><init>(IIILjava/lang/Class;)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/inventory/InventoryActivity;

    const v3, 0x7f100309

    const v4, 0x7f01002f

    const v5, 0x7f0901cb

    invoke-direct {v1, v3, v4, v5, v2}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;-><init>(IIILjava/lang/Class;)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/minimap/MinimapActivity;

    const v3, 0x7f100349

    const v4, 0x7f010035

    const v5, 0x7f0901cd

    invoke-direct {v1, v3, v4, v5, v2}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;-><init>(IIILjava/lang/Class;)V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$1;

    const v2, 0x7f10034a

    const v3, 0x7f01002d

    const v4, 0x7f0901d4

    invoke-direct {v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$1;-><init>(III)V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/myava/MyAvatarActivity;

    const v3, 0x7f10034b

    const v4, 0x7f01001b

    const v5, 0x7f0901ce

    invoke-direct {v1, v3, v4, v5, v2}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;-><init>(IIILjava/lang/Class;)V

    const/4 v2, 0x6

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/search/SearchGridActivity;

    const v3, 0x7f10034c

    const v4, 0x7f010043

    const v5, 0x7f0901d1

    invoke-direct {v1, v3, v4, v5, v2}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;-><init>(IIILjava/lang/Class;)V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/settings/SettingsActivity;

    const v3, 0x7f10030b

    const v4, 0x7f010045

    const v5, 0x7f0901d2

    invoke-direct {v1, v3, v4, v5, v2}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerActivityItem;-><init>(IIILjava/lang/Class;)V

    const/16 v2, 0x8

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$2;

    const v2, 0x7f100351

    const v3, 0x7f010049

    const v4, 0x7f0901d3

    invoke-direct {v1, v2, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$2;-><init>(III)V

    const/16 v2, 0x9

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;->items:[Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;

    return-void
.end method

.method constructor <init>(Landroid/content/Context;)V
    .locals 2

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;->items:[Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;

    const v1, 0x7f040064

    invoke-direct {p0, p1, v1, v0}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 5

    const/4 v1, 0x0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    if-nez p2, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;->getContext()Landroid/content/Context;

    move-result-object v1

    const-string/jumbo v2, "layout_inflater"

    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/LayoutInflater;

    const v2, 0x7f040064

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p3, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    :cond_1
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    iget v3, v0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;->iconId:I

    const/4 v4, 0x1

    invoke-virtual {v1, v3, v2, v4}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    const v1, 0x7f1001ed

    invoke-virtual {p2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;->getContext()Landroid/content/Context;

    move-result-object v3

    iget v0, v0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;->labelId:I

    invoke-virtual {v3, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1001ec

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iget v1, v2, Landroid/util/TypedValue;->resourceId:I

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-object p2
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    invoke-virtual {p0, p3}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Landroid/widget/AdapterView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;->onClick(Landroid/content/Context;)V

    :cond_0
    return-void
.end method
