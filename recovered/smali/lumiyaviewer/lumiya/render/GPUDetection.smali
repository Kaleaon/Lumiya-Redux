.class public Lcom/lumiyaviewer/lumiya/render/GPUDetection;
.super Ljava/lang/Object;


# static fields
.field public static final GPU_FAMILY_ADRENO:Ljava/lang/String; = "Adreno"

.field public static final GPU_FAMILY_TEGRA:Ljava/lang/String; = "Tegra"

.field public static final INVALID_VERSION:I = -0x1


# instance fields
.field public final detectedFamily:Lcom/google/common/base/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public final detectedNumericVersion:I

.field public final detectedVersion:Lcom/google/common/base/Optional;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Optional",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v1, -0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Lcom/google/common/base/Strings;->nullToEmpty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "adreno"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string/jumbo v2, "Adreno"

    invoke-static {v2}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v2

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedFamily:Lcom/google/common/base/Optional;

    const-string/jumbo v2, ".*?Adreno.*?([0-9]+).*?"

    const/4 v3, 0x2

    invoke-static {v2, v3}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/regex/Matcher;->matches()Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Strings;->emptyToNull(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedVersion:Lcom/google/common/base/Optional;

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedVersion:Lcom/google/common/base/Optional;

    const-string/jumbo v2, ""

    invoke-virtual {v0, v2}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    :goto_0
    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedNumericVersion:I

    :goto_1
    return-void

    :catch_0
    move-exception v0

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedVersion:Lcom/google/common/base/Optional;

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedNumericVersion:I

    goto :goto_1

    :cond_1
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v2, "tegra"

    invoke-virtual {v0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    const-string/jumbo v0, "Tegra"

    invoke-static {v0}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedFamily:Lcom/google/common/base/Optional;

    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedVersion:Lcom/google/common/base/Optional;

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedNumericVersion:I

    goto :goto_1

    :cond_2
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedFamily:Lcom/google/common/base/Optional;

    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedVersion:Lcom/google/common/base/Optional;

    iput v1, p0, Lcom/lumiyaviewer/lumiya/render/GPUDetection;->detectedNumericVersion:I

    goto :goto_1
.end method
