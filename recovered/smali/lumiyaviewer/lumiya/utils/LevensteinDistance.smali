.class public Lcom/lumiyaviewer/lumiya/utils/LevensteinDistance;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static computeLevensteinDistance(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I
    .locals 11

    const/4 v3, 0x1

    const/4 v2, 0x0

    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v1, 0x2

    new-array v1, v1, [I

    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    aput v4, v1, v2

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    aput v4, v1, v3

    invoke-static {v0, v1}, Ljava/lang/reflect/Array;->newInstance(Ljava/lang/Class;[I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [[I

    move v1, v2

    :goto_0
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-gt v1, v4, :cond_0

    aget-object v4, v0, v1

    aput v1, v4, v2

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    move v1, v3

    :goto_1
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-gt v1, v4, :cond_1

    aget-object v4, v0, v2

    aput v1, v4, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_1
    move v1, v3

    :goto_2
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v4

    if-gt v1, v4, :cond_4

    move v4, v3

    :goto_3
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    if-gt v4, v5, :cond_3

    aget-object v6, v0, v1

    add-int/lit8 v5, v1, -0x1

    aget-object v5, v0, v5

    aget v5, v5, v4

    add-int/lit8 v7, v5, 0x1

    aget-object v5, v0, v1

    add-int/lit8 v8, v4, -0x1

    aget v5, v5, v8

    add-int/lit8 v8, v5, 0x1

    add-int/lit8 v5, v1, -0x1

    aget-object v5, v0, v5

    add-int/lit8 v9, v4, -0x1

    aget v9, v5, v9

    add-int/lit8 v5, v1, -0x1

    invoke-interface {p0, v5}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v5

    add-int/lit8 v10, v4, -0x1

    invoke-interface {p1, v10}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v10

    if-ne v5, v10, :cond_2

    move v5, v2

    :goto_4
    add-int/2addr v5, v9

    invoke-static {v7, v8, v5}, Lcom/lumiyaviewer/lumiya/utils/LevensteinDistance;->minimum(III)I

    move-result v5

    aput v5, v6, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_3

    :cond_2
    move v5, v3

    goto :goto_4

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_4
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v1

    aget-object v0, v0, v1

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    aget v0, v0, v1

    return v0
.end method

.method private static minimum(III)I
    .locals 1

    invoke-static {p0, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v0, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method
