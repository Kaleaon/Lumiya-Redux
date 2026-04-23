.class public abstract Lcom/lumiyaviewer/lumiya/render/glres/GLSizedResource;
.super Lcom/lumiyaviewer/lumiya/render/glres/GLResource;


# instance fields
.field private final loadedSize:I


# direct methods
.method protected constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;I)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/GLResource;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)V

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLSizedResource;->loadedSize:I

    return-void
.end method


# virtual methods
.method public final getLoadedSize()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLSizedResource;->loadedSize:I

    return v0
.end method
