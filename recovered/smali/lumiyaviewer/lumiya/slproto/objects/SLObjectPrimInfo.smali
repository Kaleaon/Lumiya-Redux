.class public Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectPrimInfo;
.super Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;-><init>()V

    return-void
.end method


# virtual methods
.method protected createDrawListEntry()Lcom/lumiyaviewer/lumiya/render/spatial/DrawListObjectEntry;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    new-instance v0, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/render/spatial/DrawListPrimEntry;-><init>(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectInfo;)V

    return-object v0
.end method

.method public isAvatar()Z
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
