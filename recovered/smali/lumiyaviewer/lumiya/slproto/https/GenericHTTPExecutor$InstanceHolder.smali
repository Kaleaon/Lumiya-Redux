.class Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor$InstanceHolder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InstanceHolder"
.end annotation


# static fields
.field private static final instance:Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;


# direct methods
.method static synthetic -get0()Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor$InstanceHolder;->instance:Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;-><init>(Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor$InstanceHolder;->instance:Lcom/lumiyaviewer/lumiya/slproto/https/GenericHTTPExecutor;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
