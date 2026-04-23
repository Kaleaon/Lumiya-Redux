.class Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex$InstanceHolder;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "InstanceHolder"
.end annotation


# static fields
.field private static final instance:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;


# direct methods
.method static synthetic -get0()Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex$InstanceHolder;->instance:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;-><init>(Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex$InstanceHolder;->instance:Lcom/lumiyaviewer/lumiya/render/spatial/SpatialIndex;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
