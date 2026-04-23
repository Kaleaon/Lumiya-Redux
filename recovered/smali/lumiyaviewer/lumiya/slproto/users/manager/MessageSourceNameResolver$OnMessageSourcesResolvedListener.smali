.class public interface abstract Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver$OnMessageSourcesResolvedListener;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/MessageSourceNameResolver;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "OnMessageSourcesResolvedListener"
.end annotation


# virtual methods
.method public abstract onMessageSourcesResolved(Ljava/util/Set;Lcom/lumiyaviewer/lumiya/dao/UserName;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set",
            "<",
            "Ljava/lang/Long;",
            ">;",
            "Lcom/lumiyaviewer/lumiya/dao/UserName;",
            ")V"
        }
    .end annotation
.end method
