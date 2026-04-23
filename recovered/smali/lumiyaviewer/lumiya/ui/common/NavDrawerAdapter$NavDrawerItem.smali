.class Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "NavDrawerItem"
.end annotation


# instance fields
.field final iconId:I

.field final itemId:I

.field final labelId:I


# direct methods
.method constructor <init>(III)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;->itemId:I

    iput p2, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;->iconId:I

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/common/NavDrawerAdapter$NavDrawerItem;->labelId:I

    return-void
.end method


# virtual methods
.method public onClick(Landroid/content/Context;)V
    .locals 0

    return-void
.end method
