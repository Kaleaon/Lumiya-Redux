.class public Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfoWithChildren;
.super Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfo;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo$HasChildrenObjects;


# instance fields
.field public final children:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field private final implicitlyAdded:Z


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;FLcom/google/common/collect/ImmutableList;Z)V
    .locals 0
    .param p3    # Lcom/google/common/collect/ImmutableList;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;",
            "F",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;",
            ">;Z)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfo;-><init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;F)V

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfoWithChildren;->children:Lcom/google/common/collect/ImmutableList;

    iput-boolean p4, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfoWithChildren;->implicitlyAdded:Z

    return-void
.end method


# virtual methods
.method public getChildren()Lcom/google/common/collect/ImmutableList;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;",
            ">;"
        }
    .end annotation

    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfoWithChildren;->children:Lcom/google/common/collect/ImmutableList;

    return-object v0
.end method

.method public isImplicitlyAdded()Z
    .locals 1

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLPrimObjectDisplayInfoWithChildren;->implicitlyAdded:Z

    return v0
.end method
