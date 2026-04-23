.class public abstract Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLResourceReference;
.super Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLGenericResourceReference;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "GLResourceReference"
.end annotation


# instance fields
.field protected final handle:I


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLResource;ILcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)V
    .locals 1

    invoke-direct {p0, p1, p3}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLGenericResourceReference;-><init>(Lcom/lumiyaviewer/lumiya/render/glres/GLGenericResource;Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)V

    iput p2, p0, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLResourceReference;->handle:I

    invoke-static {p3}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->-get1(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method
