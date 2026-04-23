.class public Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;,
        Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;,
        Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;
    }
.end annotation


# instance fields
.field public final name:Ljava/lang/String;

.field public final params:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;",
            ">;"
        }
    .end annotation
.end field

.field public final textures:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>([B)V
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;
        }
    .end annotation

    const/4 v4, 0x2

    const/4 v11, 0x1

    const/4 v3, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :try_start_0
    new-instance v0, Ljava/lang/String;

    const-string/jumbo v1, "ISO-8859-1"

    invoke-direct {v0, p1, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "\n+"

    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    array-length v0, v5

    if-ge v0, v4, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;-><init>()V

    throw v0

    :catch_0
    move-exception v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :cond_0
    aget-object v0, v5, v3

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "LLWearable"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;-><init>()V

    throw v0

    :cond_1
    const/4 v0, 0x1

    :try_start_1
    aget-object v0, v5, v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;->name:Ljava/lang/String;

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v6

    invoke-static {}, Lcom/google/common/collect/ImmutableList;->builder()Lcom/google/common/collect/ImmutableList$Builder;

    move-result-object v7

    move v0, v4

    :cond_2
    :goto_0
    array-length v1, v5

    if-ge v0, v1, :cond_f

    aget-object v1, v5, v0

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "\\s+"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    if-lt v2, v11, :cond_e

    const/4 v2, 0x0

    aget-object v2, v1, v2

    const-string/jumbo v8, "permissions"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_3

    const/4 v2, 0x0

    aget-object v2, v1, v2

    const-string/jumbo v8, "sale_info"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    :cond_3
    add-int/lit8 v0, v0, 0x1

    array-length v1, v5

    if-lt v0, v1, :cond_4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;-><init>()V

    throw v0
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    move-exception v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :cond_4
    :try_start_2
    aget-object v1, v5, v0

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "{"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_6

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;-><init>()V

    throw v0

    :cond_5
    add-int/lit8 v0, v0, 0x1

    :cond_6
    array-length v1, v5

    if-ge v0, v1, :cond_2

    aget-object v1, v5, v0

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    const-string/jumbo v2, "}"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_7
    const/4 v2, 0x0

    aget-object v2, v1, v2

    const-string/jumbo v8, "parameters"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    add-int/lit8 v1, v0, 0x1

    move v2, v3

    :goto_1
    if-ge v2, v8, :cond_10

    array-length v0, v5

    if-lt v1, v0, :cond_8

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;-><init>()V

    throw v0
    :try_end_2
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_1

    :cond_8
    :try_start_3
    aget-object v0, v5, v1

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v9, "\\s+"

    invoke-virtual {v0, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v9, v0

    if-ge v9, v4, :cond_9

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;-><init>()V

    throw v0
    :try_end_3
    .catch Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_3

    :catch_2
    move-exception v0

    :try_start_4
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_4
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_1

    :goto_2
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_1

    :cond_9
    const/4 v9, 0x0

    :try_start_5
    aget-object v9, v0, v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    const/4 v10, 0x1

    aget-object v0, v0, v10

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;

    invoke-direct {v10, v9, v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;-><init>(IF)V

    invoke-virtual {v6, v10}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;
    :try_end_5
    .catch Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_2

    :catch_3
    move-exception v0

    :try_start_6
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_2

    :cond_a
    const/4 v2, 0x0

    aget-object v2, v1, v2

    const-string/jumbo v8, "textures"

    invoke-virtual {v2, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_d

    const/4 v2, 0x1

    aget-object v1, v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v8

    add-int/lit8 v1, v0, 0x1

    move v2, v3

    :goto_3
    if-ge v2, v8, :cond_10

    array-length v0, v5

    if-lt v1, v0, :cond_b

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;-><init>()V

    throw v0
    :try_end_6
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_1

    :cond_b
    :try_start_7
    aget-object v0, v5, v1

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v9, "\\s+"

    invoke-virtual {v0, v9}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    array-length v9, v0

    if-ge v9, v4, :cond_c

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;-><init>()V

    throw v0
    :try_end_7
    .catch Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/lang/NumberFormatException; {:try_start_7 .. :try_end_7} :catch_5

    :catch_4
    move-exception v0

    :try_start_8
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V
    :try_end_8
    .catch Ljava/lang/NumberFormatException; {:try_start_8 .. :try_end_8} :catch_1

    :goto_4
    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v0, v2, 0x1

    move v2, v0

    goto :goto_3

    :cond_c
    const/4 v9, 0x0

    :try_start_9
    aget-object v9, v0, v9

    invoke-static {v9}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v9

    const/4 v10, 0x1

    aget-object v0, v0, v10

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    new-instance v10, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;

    invoke-direct {v10, v9, v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;-><init>(ILjava/util/UUID;)V

    invoke-virtual {v7, v10}, Lcom/google/common/collect/ImmutableList$Builder;->add(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList$Builder;
    :try_end_9
    .catch Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException; {:try_start_9 .. :try_end_9} :catch_4
    .catch Ljava/lang/NumberFormatException; {:try_start_9 .. :try_end_9} :catch_5

    goto :goto_4

    :catch_5
    move-exception v0

    :try_start_a
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_4

    :cond_d
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_e
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :cond_f
    invoke-virtual {v6}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;->params:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v7}, Lcom/google/common/collect/ImmutableList$Builder;->build()Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;->textures:Lcom/google/common/collect/ImmutableList;
    :try_end_a
    .catch Ljava/lang/NumberFormatException; {:try_start_a .. :try_end_a} :catch_1

    return-void

    :cond_10
    move v0, v1

    goto/16 :goto_0
.end method
