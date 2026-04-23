.class Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor$InstanceHolder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InstanceHolder"
.end annotation


# static fields
.field private static final Instance:Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;


# direct methods
.method static synthetic -get0()Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor$InstanceHolder;->Instance:Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;-><init>(Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor$InstanceHolder;->Instance:Lcom/lumiyaviewer/lumiya/res/executors/PrimComputeExecutor;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
