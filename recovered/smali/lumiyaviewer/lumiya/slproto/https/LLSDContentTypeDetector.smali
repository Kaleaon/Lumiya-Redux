.class public Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static DetectContentType(Ljava/io/BufferedInputStream;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v10, 0x3

    const/4 v3, 0x1

    const/4 v1, 0x0

    const/16 v0, 0x40

    invoke-virtual {p0, v0}, Ljava/io/BufferedInputStream;->mark(I)V

    new-array v2, v10, [B

    fill-array-data v2, :array_0

    const/16 v0, 0x20

    new-array v4, v0, [B

    array-length v0, v4

    invoke-virtual {p0, v4, v1, v0}, Ljava/io/BufferedInputStream;->read([BII)I

    move-result v5

    array-length v0, v2

    if-lt v5, v0, :cond_b

    move v0, v1

    :goto_0
    if-ge v0, v5, :cond_2

    array-length v6, v2

    if-ge v0, v6, :cond_2

    aget-byte v6, v4, v0

    aget-byte v7, v2, v0

    if-eq v6, v7, :cond_3

    move v0, v1

    :goto_1
    if-eqz v0, :cond_b

    array-length v0, v2

    :goto_2
    new-instance v6, Ljava/lang/String;

    sub-int v2, v5, v0

    const-string/jumbo v5, "UTF-8"

    invoke-direct {v6, v4, v0, v2, v5}, Ljava/lang/String;-><init>([BIILjava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/BufferedInputStream;->reset()V

    int-to-long v4, v0

    invoke-virtual {p0, v4, v5}, Ljava/io/BufferedInputStream;->skip(J)J

    const-string/jumbo v2, "<llsd>"

    invoke-virtual {v6, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string/jumbo v2, "<?xml"

    invoke-virtual {v6, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    :cond_0
    move v2, v3

    move v4, v1

    :goto_3
    const-string/jumbo v7, "LLSD: contentType \'%s\', detected binary %s, xml %s, skipBytes %d, firstString \'%s\'"

    const/4 v5, 0x5

    new-array v8, v5, [Ljava/lang/Object;

    aput-object p1, v8, v1

    if-eqz v4, :cond_6

    const-string/jumbo v5, "true"

    :goto_4
    aput-object v5, v8, v3

    if-eqz v2, :cond_7

    const-string/jumbo v5, "true"

    :goto_5
    const/4 v9, 0x2

    aput-object v5, v8, v9

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v8, v10

    const/4 v0, 0x4

    aput-object v6, v8, v0

    invoke-static {v7, v8}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    if-nez v4, :cond_8

    :goto_6
    if-nez v2, :cond_1

    const-string/jumbo v0, "application/llsd+binary"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v4, v3

    :cond_1
    if-eqz v4, :cond_9

    const-string/jumbo v0, "LLSD: using binary parser"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->llsdBinary:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    return-object v0

    :cond_2
    move v0, v3

    goto :goto_1

    :cond_3
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_4
    const-string/jumbo v2, "<? LLSD/Binary ?>"

    invoke-virtual {v6, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string/jumbo v2, "{"

    invoke-virtual {v6, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_5

    const-string/jumbo v2, "<?llsd/binary"

    invoke-virtual {v6, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_a

    :cond_5
    move v2, v1

    move v4, v3

    goto :goto_3

    :cond_6
    const-string/jumbo v5, "false"

    goto :goto_4

    :cond_7
    const-string/jumbo v5, "false"

    goto :goto_5

    :cond_8
    move v2, v3

    goto :goto_6

    :cond_9
    const-string/jumbo v0, "LLSD: using XML parser"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;->llsdXML:Lcom/lumiyaviewer/lumiya/slproto/https/LLSDContentTypeDetector$LLSDContentType;

    return-object v0

    :cond_a
    move v2, v1

    move v4, v1

    goto :goto_3

    :cond_b
    move v0, v1

    goto/16 :goto_2

    :array_0
    .array-data 1
        -0x11t
        -0x45t
        -0x41t
    .end array-data
.end method
