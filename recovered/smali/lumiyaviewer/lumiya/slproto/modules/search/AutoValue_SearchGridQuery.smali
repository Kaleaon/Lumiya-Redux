.class final Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;
.super Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;


# instance fields
.field private final searchText:Ljava/lang/String;

.field private final searchType:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

.field private final searchUUID:Ljava/util/UUID;


# direct methods
.method constructor <init>(Ljava/util/UUID;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;)V
    .locals 2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;-><init>()V

    if-nez p1, :cond_0

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Null searchUUID"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchUUID:Ljava/util/UUID;

    if-nez p2, :cond_1

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Null searchText"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchText:Ljava/lang/String;

    if-nez p3, :cond_2

    new-instance v0, Ljava/lang/NullPointerException;

    const-string/jumbo v1, "Null searchType"

    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_2
    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchType:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    const/4 v0, 0x0

    if-ne p1, p0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    instance-of v1, p1, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;

    if-eqz v1, :cond_2

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchUUID:Ljava/util/UUID;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchText:Ljava/lang/String;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchText()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchType:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchType()Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->equals(Ljava/lang/Object;)Z

    move-result v0

    :cond_1
    return v0

    :cond_2
    return v0
.end method

.method public hashCode()I
    .locals 3

    const v2, 0xf4243

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchUUID:Ljava/util/UUID;

    invoke-virtual {v0}, Ljava/util/UUID;->hashCode()I

    move-result v0

    xor-int/2addr v0, v2

    mul-int/2addr v0, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchText:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    mul-int/2addr v0, v2

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchType:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->hashCode()I

    move-result v1

    xor-int/2addr v0, v1

    return v0
.end method

.method public searchText()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchText:Ljava/lang/String;

    return-object v0
.end method

.method public searchType()Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchType:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    return-object v0
.end method

.method public searchUUID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "SearchGridQuery{searchUUID="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "searchText="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchText:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "searchType="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;->searchType:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "}"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
