.class public Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;
.super Ljava/lang/Object;


# static fields
.field private static final WINDLIGHT_GAMMA:F = 2.2f


# instance fields
.field public ambient:[F

.field public ambientBelowWater:[F

.field public blue_density:[F

.field public blue_horizon:[F

.field public cloud_color:[F

.field public cloud_pos_density1:[F

.field public cloud_pos_density2:[F

.field public cloud_shadow:[F

.field private defaultPresets:[Ljava/lang/String;

.field public haze_density:[F

.field public haze_horizon:[F

.field private hourTable:[F

.field public lightnorm:[F

.field public star_brightness:F

.field public sunlightBelowWater:[F

.field public sunlight_color:[F


# direct methods
.method public constructor <init>()V
    .locals 4

    const/16 v1, 0x8

    const/4 v3, 0x4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, v1, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->hourTable:[F

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

    aput-object v1, v0, v3

    const-string/jumbo v1, "A%2D3PM"

    const/4 v2, 0x5

    aput-object v1, v0, v2

    const-string/jumbo v1, "A%2D6PM"

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const-string/jumbo v1, "A%2D9PM"

    const/4 v2, 0x7

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->defaultPresets:[Ljava/lang/String;

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambientBelowWater:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lightnorm:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlight_color:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlightBelowWater:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_density:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_horizon:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_density:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_horizon:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_color:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_pos_density1:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_pos_density2:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_shadow:[F

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->reset()V

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

.method public constructor <init>(Ljava/lang/String;)V
    .locals 4

    const/16 v1, 0x8

    const/4 v3, 0x4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-array v0, v1, [F

    fill-array-data v0, :array_0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->hourTable:[F

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

    aput-object v1, v0, v3

    const-string/jumbo v1, "A%2D3PM"

    const/4 v2, 0x5

    aput-object v1, v0, v2

    const-string/jumbo v1, "A%2D6PM"

    const/4 v2, 0x6

    aput-object v1, v0, v2

    const-string/jumbo v1, "A%2D9PM"

    const/4 v2, 0x7

    aput-object v1, v0, v2

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->defaultPresets:[Ljava/lang/String;

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambientBelowWater:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lightnorm:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlight_color:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlightBelowWater:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_density:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_horizon:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_density:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_horizon:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_color:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_pos_density1:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_pos_density2:[F

    new-array v0, v3, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_shadow:[F

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->loadFromAssetFile(Ljava/lang/String;)V

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

.method private darkenUnderWater([F[F)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_2

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    :cond_0
    aget v1, p2, v0

    aput v1, p1, v0

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    aget v1, p2, v0

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    aput v1, p1, v0

    goto :goto_1

    :cond_2
    return-void
.end method

.method private gammaFloatArray([FFF)V
    .locals 6

    const/4 v0, 0x0

    :goto_0
    array-length v1, p1

    if-ge v0, v1, :cond_0

    aget v1, p1, v0

    float-to-double v2, v1

    const/high16 v1, 0x3f800000    # 1.0f

    div-float/2addr v1, p2

    float-to-double v4, v1

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v2

    double-to-float v1, v2

    mul-float/2addr v1, p3

    aput v1, p1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private getFloatArray(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;[FF)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;
        }
    .end annotation

    const/4 v0, 0x0

    :goto_0
    array-length v1, p2

    if-ge v0, v1, :cond_0

    invoke-virtual {p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byIndex(I)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v2

    double-to-float v1, v2

    div-float/2addr v1, p3

    aput v1, p2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private static final lerpFloatArray([F[F[FF)V
    .locals 3

    const/4 v0, 0x0

    :goto_0
    array-length v1, p0

    if-ge v0, v1, :cond_0

    array-length v1, p1

    if-ge v0, v1, :cond_0

    array-length v1, p2

    if-ge v0, v1, :cond_0

    aget v1, p1, v0

    const/high16 v2, 0x3f800000    # 1.0f

    sub-float/2addr v2, p3

    mul-float/2addr v1, v2

    aget v2, p2, v0

    mul-float/2addr v2, p3

    add-float/2addr v1, v2

    aput v1, p0, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private loadFromAssetFile(Ljava/lang/String;)V
    .locals 4

    const-string/jumbo v0, "Windlight preset loading from \'%s\'"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    :try_start_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getAssetManager()Landroid/content/res/AssetManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    const-string/jumbo v1, "UTF-8"

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->parseXML(Ljava/io/InputStream;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v1

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    const-string/jumbo v0, "ambient"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    const/high16 v3, 0x40400000    # 3.0f

    invoke-direct {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->getFloatArray(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;[FF)V

    const-string/jumbo v0, "sunlight_color"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlight_color:[F

    const/high16 v3, 0x40400000    # 3.0f

    invoke-direct {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->getFloatArray(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;[FF)V

    const-string/jumbo v0, "lightnorm"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lightnorm:[F

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->getFloatArray(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;[FF)V

    const-string/jumbo v0, "blue_density"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_density:[F

    const/high16 v3, 0x40000000    # 2.0f

    invoke-direct {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->getFloatArray(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;[FF)V

    const-string/jumbo v0, "blue_horizon"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_horizon:[F

    const/high16 v3, 0x40000000    # 2.0f

    invoke-direct {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->getFloatArray(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;[FF)V

    const-string/jumbo v0, "haze_density"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_density:[F

    const/high16 v3, 0x40a00000    # 5.0f

    invoke-direct {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->getFloatArray(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;[FF)V

    const-string/jumbo v0, "haze_horizon"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_horizon:[F

    const/high16 v3, 0x40a00000    # 5.0f

    invoke-direct {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->getFloatArray(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;[FF)V

    const-string/jumbo v0, "cloud_color"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_color:[F

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->getFloatArray(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;[FF)V

    const-string/jumbo v0, "cloud_pos_density1"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_pos_density1:[F

    const/high16 v3, 0x40400000    # 3.0f

    invoke-direct {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->getFloatArray(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;[FF)V

    const-string/jumbo v0, "cloud_pos_density2"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_pos_density2:[F

    const/high16 v3, 0x40400000    # 3.0f

    invoke-direct {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->getFloatArray(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;[FF)V

    const-string/jumbo v0, "cloud_shadow"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_shadow:[F

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-direct {p0, v0, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->getFloatArray(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;[FF)V

    const-string/jumbo v0, "star_brightness"

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asDouble()D

    move-result-wide v0

    double-to-float v0, v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->star_brightness:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    const v1, 0x400ccccd    # 2.2f

    const/high16 v2, 0x3fa00000    # 1.25f

    invoke-direct {p0, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->gammaFloatArray([FFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlight_color:[F

    const v1, 0x400ccccd    # 2.2f

    const/high16 v2, 0x3fa00000    # 1.25f

    invoke-direct {p0, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->gammaFloatArray([FFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambientBelowWater:[F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->darkenUnderWater([F[F)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlightBelowWater:[F

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlight_color:[F

    invoke-direct {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->darkenUnderWater([F[F)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0

    :catch_1
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public reset()V
    .locals 1

    const-string/jumbo v0, "windlight/A%2D12PM.xml"

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->loadFromAssetFile(Ljava/lang/String;)V

    return-void
.end method

.method public setByInterpolation(Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;F)V
    .locals 3

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->star_brightness:F

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, p3

    mul-float/2addr v0, v1

    iget v1, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->star_brightness:F

    mul-float/2addr v1, p3

    add-float/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->star_brightness:F

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambient:[F

    invoke-static {v0, v1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lerpFloatArray([F[F[FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambientBelowWater:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambientBelowWater:[F

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->ambientBelowWater:[F

    invoke-static {v0, v1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lerpFloatArray([F[F[FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlight_color:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlight_color:[F

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlight_color:[F

    invoke-static {v0, v1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lerpFloatArray([F[F[FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlightBelowWater:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlightBelowWater:[F

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->sunlightBelowWater:[F

    invoke-static {v0, v1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lerpFloatArray([F[F[FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lightnorm:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lightnorm:[F

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lightnorm:[F

    invoke-static {v0, v1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lerpFloatArray([F[F[FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_density:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_density:[F

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_density:[F

    invoke-static {v0, v1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lerpFloatArray([F[F[FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_horizon:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_horizon:[F

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->blue_horizon:[F

    invoke-static {v0, v1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lerpFloatArray([F[F[FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_density:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_density:[F

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_density:[F

    invoke-static {v0, v1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lerpFloatArray([F[F[FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_horizon:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_horizon:[F

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->haze_horizon:[F

    invoke-static {v0, v1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lerpFloatArray([F[F[FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_color:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_color:[F

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_color:[F

    invoke-static {v0, v1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lerpFloatArray([F[F[FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_pos_density1:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_pos_density1:[F

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_pos_density1:[F

    invoke-static {v0, v1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lerpFloatArray([F[F[FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_pos_density2:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_pos_density2:[F

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_pos_density2:[F

    invoke-static {v0, v1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lerpFloatArray([F[F[FF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_shadow:[F

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_shadow:[F

    iget-object v2, p2, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->cloud_shadow:[F

    invoke-static {v0, v1, v2, p3}, Lcom/lumiyaviewer/lumiya/slproto/windlight/WindlightPreset;->lerpFloatArray([F[F[FF)V

    return-void
.end method
