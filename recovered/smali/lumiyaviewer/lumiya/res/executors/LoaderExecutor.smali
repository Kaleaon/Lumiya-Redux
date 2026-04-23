.class public Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;
.super Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor$InstanceHolder;
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 2

    const-string/jumbo v0, "ResourceLoader"

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/WeakExecutor;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;
    .locals 1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor$InstanceHolder;->-get0()Lcom/lumiyaviewer/lumiya/res/executors/LoaderExecutor;

    move-result-object v0

    return-object v0
.end method
