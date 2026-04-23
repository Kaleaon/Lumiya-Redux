.class public Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;
    }
.end annotation


# instance fields
.field private curPos:I

.field private spaceChars:Ljava/lang/String;

.field private string:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->string:Ljava/lang/String;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->spaceChars:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    return-void
.end method


# virtual methods
.method public endOfString()Z
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->string:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public expectToken(Ljava/lang/String;Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;
        }
    .end annotation

    invoke-virtual {p0, p2}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Expected \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "\', got \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, "\'"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    return-object p0
.end method

.method public getHexToken(Ljava/lang/String;)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x10

    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;I)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    return v0

    :catch_0
    move-exception v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Cannot parse expected integer: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v2
.end method

.method public getIntToken(Ljava/lang/String;)I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;
        }
    .end annotation

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :try_start_0
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    return v0

    :catch_0
    move-exception v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Cannot parse expected integer: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    throw v2
.end method

.method public getPipeTerminatedString(Ljava/lang/String;)Ljava/lang/String;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;
        }
    .end annotation

    const/4 v2, 0x0

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->nextToken(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/16 v1, 0x7c

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v1

    if-ltz v1, :cond_0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0
.end method

.method public getSubstring(I)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;
        }
    .end annotation

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->string:Ljava/lang/String;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringToVariableUTF(Ljava/lang/String;)[B

    move-result-object v0

    array-length v1, v0

    if-ge v1, p1, :cond_0

    new-instance v1, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "End of string reached: wanted "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, ", still has "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v0, v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_0
    new-array v1, p1, [B

    invoke-static {v0, v2, v1, v2, p1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableUTF([B)Ljava/lang/String;

    move-result-object v0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/2addr v1, v2

    iput v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    return-object v0
.end method

.method public nextToken(Ljava/lang/String;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;
        }
    .end annotation

    const/4 v0, 0x0

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->string:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lt v1, v2, :cond_1

    new-instance v0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;

    const-string/jumbo v1, "End of string reached"

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser$StringParsingException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    :cond_1
    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->string:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->spaceChars:Ljava/lang/String;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->string:Ljava/lang/String;

    iget v3, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_0

    :cond_2
    :goto_0
    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->string:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_3

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->string:Ljava/lang/String;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-virtual {p1, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_4

    :cond_3
    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->string:Ljava/lang/String;

    iget v2, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    sub-int v0, v2, v0

    iget v2, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    invoke-virtual {v1, v0, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_4
    add-int/lit8 v0, v0, 0x1

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    goto :goto_0
.end method

.method public skipAllDelimiters(Ljava/lang/String;)V
    .locals 2

    :goto_0
    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->string:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->string:Ljava/lang/String;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    goto :goto_0

    :cond_0
    return-void
.end method

.method public skipOneDelimiter(Ljava/lang/String;)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->string:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->string:Ljava/lang/String;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    if-ltz v0, :cond_0

    iget v0, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/utils/SimpleStringParser;->curPos:I

    :cond_0
    return-void
.end method
