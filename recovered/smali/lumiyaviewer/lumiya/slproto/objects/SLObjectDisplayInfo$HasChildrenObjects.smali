.class public interface abstract Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo$HasChildrenObjects;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x609
    name = "HasChildrenObjects"
.end annotation


# virtual methods
.method public abstract getChildren()Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;",
            ">;"
        }
    .end annotation
.end method

.method public abstract isImplicitlyAdded()Z
.end method
