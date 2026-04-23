.class public abstract Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/util/UUID;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;)Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;
    .locals 1
    .param p0    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p1    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;

    invoke-direct {v0, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/AutoValue_SearchGridQuery;-><init>(Ljava/util/UUID;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;)V

    return-object v0
.end method


# virtual methods
.method public abstract searchText()Ljava/lang/String;
.end method

.method public abstract searchType()Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;
.end method

.method public abstract searchUUID()Ljava/util/UUID;
.end method
