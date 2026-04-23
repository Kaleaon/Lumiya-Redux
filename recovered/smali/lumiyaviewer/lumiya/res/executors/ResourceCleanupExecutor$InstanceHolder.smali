.class Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor$InstanceHolder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InstanceHolder"
.end annotation


# static fields
.field private static final Instance:Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor;


# direct methods
.method static synthetic -get0()Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor$InstanceHolder;->Instance:Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor$InstanceHolder;->Instance:Lcom/lumiyaviewer/lumiya/res/executors/ResourceCleanupExecutor;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
