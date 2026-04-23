.class public interface abstract Lcom/lumiyaviewer/lumiya/react/RequestSource;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# virtual methods
.method public abstract attachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)Lcom/lumiyaviewer/lumiya/react/ResultHandler;
    .param p1    # Lcom/lumiyaviewer/lumiya/react/RequestHandler;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;)",
            "Lcom/lumiyaviewer/lumiya/react/ResultHandler",
            "<TK;TT;>;"
        }
    .end annotation
.end method

.method public abstract detachRequestHandler(Lcom/lumiyaviewer/lumiya/react/RequestHandler;)V
    .param p1    # Lcom/lumiyaviewer/lumiya/react/RequestHandler;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/react/RequestHandler",
            "<TK;>;)V"
        }
    .end annotation
.end method
