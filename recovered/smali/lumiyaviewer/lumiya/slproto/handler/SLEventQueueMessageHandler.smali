.class public interface abstract annotation Lcom/lumiyaviewer/lumiya/slproto/handler/SLEventQueueMessageHandler;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/annotation/Annotation;


# annotations
.annotation runtime Ljava/lang/annotation/Retention;
    value = .enum Ljava/lang/annotation/RetentionPolicy;->RUNTIME:Ljava/lang/annotation/RetentionPolicy;
.end annotation

.annotation runtime Ljava/lang/annotation/Target;
    value = {
        .enum Ljava/lang/annotation/ElementType;->METHOD:Ljava/lang/annotation/ElementType;
    }
.end annotation


# virtual methods
.method public abstract eventName()Lcom/lumiyaviewer/lumiya/slproto/caps/SLCapEventQueue$CapsEventType;
.end method
