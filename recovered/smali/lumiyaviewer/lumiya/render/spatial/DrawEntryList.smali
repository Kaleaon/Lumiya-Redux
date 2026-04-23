.class public Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;
.super Lcom/lumiyaviewer/lumiya/utils/InlineList;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList$EntryRemovalListener;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/lumiyaviewer/lumiya/utils/InlineList",
        "<",
        "Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;",
        ">;"
    }
.end annotation


# instance fields
.field private final listener:Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList$EntryRemovalListener;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList$EntryRemovalListener;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList$EntryRemovalListener;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/utils/InlineList;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;->listener:Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList$EntryRemovalListener;

    return-void
.end method


# virtual methods
.method public requestEntryRemoval(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;->listener:Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList$EntryRemovalListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;->listener:Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList$EntryRemovalListener;

    invoke-interface {v0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList$EntryRemovalListener;->onEntryRemovalRequested(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    :cond_0
    return-void
.end method

.method public bridge synthetic requestEntryRemoval(Lcom/lumiyaviewer/lumiya/utils/InlineListEntry;)V
    .locals 0

    check-cast p1, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawEntryList;->requestEntryRemoval(Lcom/lumiyaviewer/lumiya/render/spatial/DrawListEntry;)V

    return-void
.end method
