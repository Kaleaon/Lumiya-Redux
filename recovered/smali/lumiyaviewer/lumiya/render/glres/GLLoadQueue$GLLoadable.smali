.class interface abstract Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadable;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x608
    name = "GLLoadable"
.end annotation


# virtual methods
.method public abstract GLCompleteLoad()V
.end method

.method public abstract GLGetLoadSize()I
.end method

.method public abstract GLLoad(Lcom/lumiyaviewer/lumiya/render/RenderContext;Lcom/lumiyaviewer/lumiya/render/glres/GLLoadQueue$GLLoadHandler;)I
.end method
