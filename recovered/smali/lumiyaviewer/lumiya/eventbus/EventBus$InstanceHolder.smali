.class Lcom/lumiyaviewer/lumiya/eventbus/EventBus$InstanceHolder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/eventbus/EventBus;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InstanceHolder"
.end annotation


# static fields
.field private static final Instance:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;


# direct methods
.method static synthetic -get0()Lcom/lumiyaviewer/lumiya/eventbus/EventBus;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$InstanceHolder;->Instance:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/eventbus/EventBus;-><init>(Lcom/lumiyaviewer/lumiya/eventbus/EventBus;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/eventbus/EventBus$InstanceHolder;->Instance:Lcom/lumiyaviewer/lumiya/eventbus/EventBus;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
