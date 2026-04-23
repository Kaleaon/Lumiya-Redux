.class Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$InstanceHolder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InstanceHolder"
.end annotation


# static fields
.field private static final Instance:Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;


# direct methods
.method static synthetic -get0()Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$InstanceHolder;->Instance:Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor$InstanceHolder;->Instance:Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
