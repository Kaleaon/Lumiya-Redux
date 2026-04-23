.class public Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;
.super Ljava/lang/Object;


# static fields
.field private static final defaultPresets:[Ljava/lang/String;

.field private static final hourTable:[F


# instance fields
.field private presets:[Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    const/16 v1, 0x8

    new-array v0, v1, [F

    fill-array-data v0, :array_0

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->hourTable:[F

    new-array v0, v1, [Ljava/lang/String;

    const-string/jumbo v1, "A%2D12AM"

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string/jumbo v1, "A%2D3AM"

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string/jumbo v1, "A%2D6AM"

    const/4 v2, 0x2

    aput-object v1, v0, v2

    const-string/jumbo v1, "A%2D9AM"

    const/4 v2, 0x3

    aput-object v1, v0, v2

    const-string/jumbo v1, "A%2D12PM"

    const/4 v2, 0x4

    aput-object v1, v0, v2

    const-string/jumbo v1, "A%2D3PM"

    const/4 v2, 0x5

    aput-object v1, v0, v2

    const-string/jumbo v1, "A%2D6PM"

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const-string/jumbo v1, "A%2D9PM"

    const/4 v2, 0x7

    aput-object v1, v0, v2

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->defaultPresets:[Ljava/lang/String;

    return-void

    :array_0
    .array-data 4
        0x0
        0x3e000000    # 0.125f
        0x3e800000    # 0.25f
        0x3ec00000    # 0.375f
        0x3f000000    # 0.5f
        0x3f200000    # 0.625f
        0x3f400000    # 0.75f
        0x3f600000    # 0.875f
    .end array-data
.end method

.method public constructor <init>()V
    .locals 5

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->defaultPresets:[Ljava/lang/String;

    array-length v0, v0

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->presets:[Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    const/4 v0, 0x0

    :goto_0
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->presets:[Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->presets:[Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    new-instance v2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "windlight/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->defaultPresets:[Ljava/lang/String;

    aget-object v4, v4, v0

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ".xml"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;-><init>(Ljava/lang/String;)V

    aput-object v2, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public InterpolatePreset(Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;F)V
    .locals 5

    const/4 v0, 0x0

    const/4 v3, -0x1

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->hourTable:[F

    array-length v1, v1

    add-int/lit8 v1, v1, -0x1

    :goto_0
    if-ltz v1, :cond_4

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->hourTable:[F

    aget v2, v2, v1

    cmpl-float v2, p2, v2

    if-ltz v2, :cond_0

    move v2, v1

    :goto_1
    if-ne v2, v3, :cond_1

    return-void

    :cond_0
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_1
    add-int/lit8 v1, v2, 0x1

    sget-object v3, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->hourTable:[F

    array-length v3, v3

    if-lt v1, v3, :cond_3

    :goto_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->hourTable:[F

    aget v3, v1, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->hourTable:[F

    aget v1, v1, v0

    cmpg-float v4, v1, v3

    if-gez v4, :cond_2

    const/high16 v4, 0x3f800000    # 1.0f

    add-float/2addr v1, v4

    :cond_2
    sub-float v4, p2, v3

    sub-float/2addr v1, v3

    div-float v1, v4, v1

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->presets:[Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    aget-object v2, v3, v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightDay;->presets:[Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;

    aget-object v0, v3, v0

    invoke-virtual {p1, v2, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->setByInterpolation(Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;F)V

    return-void

    :cond_3
    move v0, v1

    goto :goto_2

    :cond_4
    move v2, v3

    goto :goto_1
.end method
