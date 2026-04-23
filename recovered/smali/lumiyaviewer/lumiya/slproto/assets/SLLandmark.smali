.class public Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark$LandmarkFormatException;
    }
.end annotation


# instance fields
.field public localPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public regionUUID:Ljava/util/UUID;


# direct methods
.method public constructor <init>([B)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark$LandmarkFormatException;
        }
    .end annotation

    const/4 v6, 0x0

    const/4 v1, 0x1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    :try_start_0
    new-instance v0, Ljava/lang/String;

    const-string/jumbo v2, "ISO-8859-1"

    invoke-direct {v0, p1, v2}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v2, "\n+"

    invoke-virtual {v0, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    array-length v0, v2

    if-ge v0, v1, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark$LandmarkFormatException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark$LandmarkFormatException;-><init>()V

    throw v0

    :catch_0
    move-exception v0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark$LandmarkFormatException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark$LandmarkFormatException;-><init>()V

    throw v0

    :cond_0
    aget-object v0, v2, v6

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v3, "Landmark version 2"

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark$LandmarkFormatException;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark$LandmarkFormatException;-><init>()V

    throw v0

    :cond_1
    move v0, v1

    :goto_0
    array-length v3, v2

    if-ge v0, v3, :cond_4

    aget-object v3, v2, v0

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "\\s+"

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    if-lt v4, v1, :cond_2

    aget-object v4, v3, v6

    const-string/jumbo v5, "region_id"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    aget-object v3, v3, v1

    invoke-static {v3}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v3

    iput-object v3, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark;->regionUUID:Ljava/util/UUID;

    :cond_2
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    aget-object v4, v3, v6

    const-string/jumbo v5, "local_pos"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    iput-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark;->localPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark;->localPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    aget-object v5, v3, v1

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark;->localPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v5, 0x2

    aget-object v5, v3, v5

    invoke-static {v5}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v5

    iput v5, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark;->localPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    const/4 v5, 0x3

    aget-object v3, v3, v5

    invoke-static {v3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v3

    iput v3, v4, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    goto :goto_1

    :cond_4
    return-void
.end method
