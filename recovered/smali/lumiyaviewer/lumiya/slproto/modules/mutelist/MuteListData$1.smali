.class final Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData$1;
.super Lcom/google/common/collect/Ordering;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Ordering",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/google/common/collect/Ordering;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)I
    .locals 2

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->type:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->getViewOrder()I

    move-result v0

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->type:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->getViewOrder()I

    move-result v1

    sub-int/2addr v0, v1

    if-eqz v0, :cond_0

    return v0

    :cond_0
    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->name:Ljava/lang/String;

    iget-object v1, p2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;

    check-cast p2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData$1;->compare(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)I

    move-result v0

    return v0
.end method
