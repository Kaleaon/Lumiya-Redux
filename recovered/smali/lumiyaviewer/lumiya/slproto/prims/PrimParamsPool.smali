.class public Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;
.super Ljava/lang/Object;


# static fields
.field public static drawParamsPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/InternPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;",
            ">;"
        }
    .end annotation
.end field

.field public static pathParamsPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/InternPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;",
            ">;"
        }
    .end annotation
.end field

.field public static profileParamsPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/InternPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;",
            ">;"
        }
    .end annotation
.end field

.field public static volumeParamsPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/utils/InternPool",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/InternPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/utils/InternPool;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->pathParamsPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/InternPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/utils/InternPool;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->profileParamsPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/InternPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/utils/InternPool;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->volumeParamsPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/InternPool;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/utils/InternPool;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->drawParamsPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static get(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->drawParamsPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/utils/InternPool;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimDrawParams;

    return-object v0
.end method

.method public static get(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->pathParamsPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/utils/InternPool;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimPathParams;

    return-object v0
.end method

.method public static get(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->profileParamsPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/utils/InternPool;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimProfileParams;

    return-object v0
.end method

.method public static get(Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;)Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimParamsPool;->volumeParamsPool:Lcom/lumiyaviewer/lumiya/utils/InternPool;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/utils/InternPool;->intern(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/prims/PrimVolumeParams;

    return-object v0
.end method
