.class public abstract Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager$GLGenericResourceReference;
.super Ljava/lang/ref/PhantomReference;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "GLGenericResourceReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/ref/PhantomReference",
        "<",
        "Lcom/lumiyaviewer/lumiya/render/glres/GLGenericResource;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/render/glres/GLGenericResource;Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)V
    .locals 1

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->-get0(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)Ljava/lang/ref/ReferenceQueue;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Ljava/lang/ref/PhantomReference;-><init>(Ljava/lang/Object;Ljava/lang/ref/ReferenceQueue;)V

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;->-get1(Lcom/lumiyaviewer/lumiya/render/glres/GLResourceManager;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public abstract GLFree()V
.end method
