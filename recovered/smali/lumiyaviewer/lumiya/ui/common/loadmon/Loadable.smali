.class public interface abstract Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$LoadableStatusListener;,
        Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;
    }
.end annotation


# virtual methods
.method public abstract addLoadableStatusListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$LoadableStatusListener;)V
.end method

.method public abstract getLoadableStatus()Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable$Status;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end method
