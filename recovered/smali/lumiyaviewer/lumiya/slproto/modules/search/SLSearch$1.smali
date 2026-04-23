.class Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$1;
.super Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-modules-search-SearchGridQuery$SearchTypeSwitchesValues:[I


# instance fields
.field final synthetic $SWITCH_TABLE$com$lumiyaviewer$lumiya$slproto$modules$search$SearchGridQuery$SearchType:[I

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-modules-search-SearchGridQuery$SearchTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$1;->-com-lumiyaviewer-lumiya-slproto-modules-search-SearchGridQuery$SearchTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$1;->-com-lumiyaviewer-lumiya-slproto-modules-search-SearchGridQuery$SearchTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->values()[Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->Groups:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_2

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->People:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_1

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->Places:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_0

    :goto_2
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$1;->-com-lumiyaviewer-lumiya-slproto-modules-search-SearchGridQuery$SearchTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    goto :goto_1

    :catch_2
    move-exception v1

    goto :goto_0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/react/SimpleRequestHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onRequest(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;)V
    .locals 3
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->-get1(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;)Ljava/util/concurrent/atomic/AtomicReference;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$1;->-getcom-lumiyaviewer-lumiya-slproto-modules-search-SearchGridQuery$SearchTypeSwitchesValues()[I

    move-result-object v0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchType()Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery$SearchType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->-wrap1(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;Ljava/lang/String;Ljava/util/UUID;)V

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->-wrap2(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;Ljava/lang/String;Ljava/util/UUID;)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$1;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchText()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;->searchUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;->-wrap0(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch;Ljava/lang/String;Ljava/util/UUID;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bridge synthetic onRequest(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/modules/search/SLSearch$1;->onRequest(Lcom/lumiyaviewer/lumiya/slproto/modules/search/SearchGridQuery;)V

    return-void
.end method
