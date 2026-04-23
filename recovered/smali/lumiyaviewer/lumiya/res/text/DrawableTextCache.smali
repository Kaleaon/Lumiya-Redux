.class public Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;
.super Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache$TextGenRequest;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache",
        "<",
        "Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;",
        "Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;",
        ">;"
    }
.end annotation


# instance fields
.field private final fontSize:I


# direct methods
.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/res/ResourceMemoryCache;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;->fontSize:I

    return-void
.end method


# virtual methods
.method protected CreateNewRequest(Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;",
            "Lcom/lumiyaviewer/lumiya/res/ResourceManager",
            "<",
            "Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;",
            "Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;",
            ">;)",
            "Lcom/lumiyaviewer/lumiya/res/ResourceRequest",
            "<",
            "Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;",
            "Lcom/lumiyaviewer/lumiya/res/text/DrawableTextBitmap;",
            ">;"
        }
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache$TextGenRequest;

    iget v1, p0, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;->fontSize:I

    invoke-direct {v0, p1, v1, p2}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache$TextGenRequest;-><init>(Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;ILcom/lumiyaviewer/lumiya/res/ResourceManager;)V

    return-object v0
.end method

.method protected bridge synthetic CreateNewRequest(Ljava/lang/Object;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;
    .locals 1

    check-cast p1, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;

    invoke-virtual {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/res/text/DrawableTextCache;->CreateNewRequest(Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;Lcom/lumiyaviewer/lumiya/res/ResourceManager;)Lcom/lumiyaviewer/lumiya/res/ResourceRequest;

    move-result-object v0

    return-object v0
.end method
