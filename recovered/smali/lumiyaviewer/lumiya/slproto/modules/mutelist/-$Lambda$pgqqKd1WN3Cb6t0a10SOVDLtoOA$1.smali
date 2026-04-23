.class final synthetic Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/-$Lambda$pgqqKd1WN3Cb6t0a10SOVDLtoOA$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/common/base/Predicate;


# instance fields
.field private final synthetic -$f0:Ljava/lang/Object;


# direct methods
.method private final synthetic $m$0(Ljava/lang/Object;)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/-$Lambda$pgqqKd1WN3Cb6t0a10SOVDLtoOA$1;->-$f0:Ljava/lang/Object;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;

    check-cast p1, Ljava/util/Map$Entry;

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->lambda$-com_lumiyaviewer_lumiya_slproto_modules_mutelist_MuteListData_5273(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;Ljava/util/Map$Entry;)Z

    move-result v0

    return v0
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/-$Lambda$pgqqKd1WN3Cb6t0a10SOVDLtoOA$1;->-$f0:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Z
    .locals 1

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/-$Lambda$pgqqKd1WN3Cb6t0a10SOVDLtoOA$1;->$m$0(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
