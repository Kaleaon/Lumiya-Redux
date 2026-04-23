.class public abstract Lcom/lumiyaviewer/lumiya/render/glres/GLResource;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/render/glres/GLGenericResource;


# instance fields
.field public final handle:I


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/render/glres/GLResource;->Allocate(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)I

    move-result v0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResource;->handle:I

    return-void
.end method


# virtual methods
.method protected abstract Allocate(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)I
.end method
