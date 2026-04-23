.class public Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData$1;
    }
.end annotation

.annotation build Ljavax/annotation/concurrent/Immutable;
.end annotation


# static fields
.field private static final ordering:Lcom/google/common/collect/Ordering;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Ordering",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final muteList:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final muteListNames:Lcom/google/common/collect/ImmutableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableMap",
            "<",
            "Ljava/lang/String;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData$1;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->ordering:Lcom/google/common/collect/Ordering;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteList:Lcom/google/common/collect/ImmutableMap;

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteListNames:Lcom/google/common/collect/ImmutableMap;

    return-void
.end method

.method public constructor <init>(Ljava/util/Map;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
            ">;",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteList:Lcom/google/common/collect/ImmutableMap;

    invoke-static {p2}, Lcom/google/common/collect/ImmutableMap;->copyOf(Ljava/util/Map;)Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteListNames:Lcom/google/common/collect/ImmutableMap;

    return-void
.end method

.method public constructor <init>([B)V
    .locals 12

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v2

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v3

    if-eqz p1, :cond_1

    :try_start_0
    new-instance v4, Ljava/io/BufferedReader;

    new-instance v0, Ljava/io/InputStreamReader;

    new-instance v5, Ljava/io/ByteArrayInputStream;

    invoke-direct {v5, p1}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    invoke-direct {v0, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v4, v0}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    :cond_0
    :goto_0
    invoke-virtual {v4}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    const-string/jumbo v7, " "

    invoke-direct {v0, v6, v7}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    const-string/jumbo v6, " "

    invoke-virtual {v0, v6}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getIntToken(Ljava/lang/String;)I

    move-result v6

    const-string/jumbo v7, " "

    invoke-virtual {v0, v7}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, " "

    invoke-virtual {v0, v8}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->skipAllDelimiters(Ljava/lang/String;)V

    const-string/jumbo v8, "|"

    invoke-virtual {v0, v8}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string/jumbo v9, "|"

    invoke-virtual {v0, v9}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->skipAllDelimiters(Ljava/lang/String;)V
    :try_end_1
    .catch Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    :try_start_2
    const-string/jumbo v9, " "

    invoke-virtual {v0, v9}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->getIntToken(Ljava/lang/String;)I
    :try_end_2
    .catch Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    move-result v0

    :goto_1
    :try_start_3
    const-string/jumbo v9, "MuteList: line \'%s\' type %d idstring \'%s\' name \'%s\' flags %d"

    const/4 v10, 0x5

    new-array v10, v10, [Ljava/lang/Object;

    invoke-virtual {v5}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v5

    const/4 v11, 0x0

    aput-object v5, v10, v11

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v11, 0x1

    aput-object v5, v10, v11

    const/4 v5, 0x2

    aput-object v7, v10, v5

    const/4 v5, 0x3

    aput-object v8, v10, v5

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    const/4 v11, 0x4

    aput-object v5, v10, v11

    invoke-static {v9, v10}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-ltz v6, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->values()[Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    move-result-object v5

    array-length v5, v5

    if-ge v6, v5, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->values()[Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    move-result-object v5

    aget-object v5, v5, v6

    new-instance v6, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;

    invoke-static {v7}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v7

    invoke-direct {v6, v5, v7, v8, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;Ljava/util/UUID;Ljava/lang/String;I)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->BY_NAME:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    if-ne v5, v0, :cond_2

    invoke-virtual {v3, v8, v6}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;
    :try_end_3
    .catch Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1

    goto :goto_0

    :catch_0
    move-exception v0

    :try_start_4
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1

    goto/16 :goto_0

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    :cond_1
    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteList:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v3}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteListNames:Lcom/google/common/collect/ImmutableMap;

    return-void

    :catch_2
    move-exception v0

    move v0, v1

    goto :goto_1

    :cond_2
    :try_start_5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;

    invoke-direct {v0, v6}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V

    invoke-virtual {v2, v0, v6}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;
    :try_end_5
    .catch Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto/16 :goto_0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_modules_mutelist_MuteListData_3795(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;Ljava/util/Map$Entry;)Z
    .locals 2

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_modules_mutelist_MuteListData_4217(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;Ljava/util/Map$Entry;)Z
    .locals 1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_modules_mutelist_MuteListData_4795(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;Ljava/util/Map$Entry;)Z
    .locals 2

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_slproto_modules_mutelist_MuteListData_5273(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;Ljava/util/Map$Entry;)Z
    .locals 1

    if-eqz p1, :cond_0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->equals(Ljava/lang/Object;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public Block(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;
    .locals 4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->muteType:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->BY_NAME:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    if-ne v1, v2, :cond_0

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteListNames:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/collect/FluentIterable;->from(Ljava/lang/Iterable;)Lcom/google/common/collect/FluentIterable;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/-$Lambda$pgqqKd1WN3Cb6t0a10SOVDLtoOA;

    invoke-direct {v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/-$Lambda$pgqqKd1WN3Cb6t0a10SOVDLtoOA;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Lcom/google/common/collect/FluentIterable;->filter(Lcom/google/common/base/Predicate;)Lcom/google/common/collect/FluentIterable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableMap$Builder;->putAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMap$Builder;

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->name:Ljava/lang/String;

    invoke-virtual {v0, v1, p1}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteList:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;-><init>(Ljava/util/Map;Ljava/util/Map;)V

    return-object v1

    :cond_0
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteList:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v2

    invoke-static {v2}, Lcom/google/common/collect/FluentIterable;->from(Ljava/lang/Iterable;)Lcom/google/common/collect/FluentIterable;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/-$Lambda$pgqqKd1WN3Cb6t0a10SOVDLtoOA$1;

    invoke-direct {v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/-$Lambda$pgqqKd1WN3Cb6t0a10SOVDLtoOA$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Lcom/google/common/collect/FluentIterable;->filter(Lcom/google/common/base/Predicate;)Lcom/google/common/collect/FluentIterable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/common/collect/ImmutableMap$Builder;->putAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMap$Builder;

    invoke-virtual {v1, v0, p1}, Lcom/google/common/collect/ImmutableMap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMap$Builder;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteListNames:Lcom/google/common/collect/ImmutableMap;

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;-><init>(Ljava/util/Map;Ljava/util/Map;)V

    return-object v0
.end method

.method public Unblock(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;
    .locals 4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;)V

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;->muteType:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;->BY_NAME:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    if-ne v1, v2, :cond_0

    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteListNames:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v1

    invoke-static {v1}, Lcom/google/common/collect/FluentIterable;->from(Ljava/lang/Iterable;)Lcom/google/common/collect/FluentIterable;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/-$Lambda$pgqqKd1WN3Cb6t0a10SOVDLtoOA$2;

    invoke-direct {v2, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/-$Lambda$pgqqKd1WN3Cb6t0a10SOVDLtoOA$2;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2}, Lcom/google/common/collect/FluentIterable;->filter(Lcom/google/common/base/Predicate;)Lcom/google/common/collect/FluentIterable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableMap$Builder;->putAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMap$Builder;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteList:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v0

    invoke-direct {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;-><init>(Ljava/util/Map;Ljava/util/Map;)V

    return-object v1

    :cond_0
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->builder()Lcom/google/common/collect/ImmutableMap$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteList:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v2}, Lcom/google/common/collect/ImmutableMap;->entrySet()Lcom/google/common/collect/ImmutableSet;

    move-result-object v2

    invoke-static {v2}, Lcom/google/common/collect/FluentIterable;->from(Ljava/lang/Iterable;)Lcom/google/common/collect/FluentIterable;

    move-result-object v2

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/-$Lambda$pgqqKd1WN3Cb6t0a10SOVDLtoOA$3;

    invoke-direct {v3, v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/-$Lambda$pgqqKd1WN3Cb6t0a10SOVDLtoOA$3;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Lcom/google/common/collect/FluentIterable;->filter(Lcom/google/common/base/Predicate;)Lcom/google/common/collect/FluentIterable;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/common/collect/ImmutableMap$Builder;->putAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMap$Builder;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap$Builder;->build()Lcom/google/common/collect/ImmutableMap;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteListNames:Lcom/google/common/collect/ImmutableMap;

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;-><init>(Ljava/util/Map;Ljava/util/Map;)V

    return-object v0
.end method

.method public getMuteList()Lcom/google/common/collect/ImmutableList;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;",
            ">;"
        }
    .end annotation

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteList:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap;->values()Lcom/google/common/collect/ImmutableCollection;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList$Builder;->addAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList$Builder;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteListNames:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableMap;->values()Lcom/google/common/collect/ImmutableCollection;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/ImmutableList$Builder;->addAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList$Builder;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->ordering:Lcom/google/common/collect/Ordering;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/google/common/collect/Ordering;->immutableSortedCopy(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    return-object v0
.end method

.method public isMuted(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;)Z
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;

    invoke-direct {v0, p2, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListKey;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;Ljava/util/UUID;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteList:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v1, v0}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isMutedByName(Ljava/lang/String;)Z
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListData;->muteListNames:Lcom/google/common/collect/ImmutableMap;

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
