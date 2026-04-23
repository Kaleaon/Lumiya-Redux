.class Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$ComparePriority;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ComparePriority"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T::",
        "Ljava/lang/Runnable;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Ljava/lang/Runnable;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    check-cast p1, Ljava/lang/Runnable;

    check-cast p2, Ljava/lang/Runnable;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/utils/PriorityExecutorService$ComparePriority;->compare(Ljava/lang/Runnable;Ljava/lang/Runnable;)I

    move-result v0

    return v0
.end method

.method public compare(Ljava/lang/Runnable;Ljava/lang/Runnable;)I
    .locals 3

    const/4 v1, 0x0

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/utils/HasPriority;

    if-eqz v0, :cond_1

    check-cast p1, Lcom/lumiyaviewer/lumiya/utils/HasPriority;

    invoke-interface {p1}, Lcom/lumiyaviewer/lumiya/utils/HasPriority;->getPriority()I

    move-result v0

    :goto_0
    instance-of v2, p2, Lcom/lumiyaviewer/lumiya/utils/HasPriority;

    if-eqz v2, :cond_0

    check-cast p2, Lcom/lumiyaviewer/lumiya/utils/HasPriority;

    invoke-interface {p2}, Lcom/lumiyaviewer/lumiya/utils/HasPriority;->getPriority()I

    move-result v1

    :cond_0
    sub-int/2addr v0, v1

    return v0

    :cond_1
    move v0, v1

    goto :goto_0
.end method
