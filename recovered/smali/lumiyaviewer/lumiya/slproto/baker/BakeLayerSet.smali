.class public Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;
.super Ljava/lang/Object;


# instance fields
.field public bakedTextureIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

.field public clear_alpha:Z

.field public height:I

.field public layers:[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

.field public maskLayers:[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

.field public width:I


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;IIZ[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;->bakedTextureIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;->width:I

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;->height:I

    iput-boolean p4, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;->clear_alpha:Z

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;->layers:[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    iput-object p6, p0, Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayerSet;->maskLayers:[Lcom/lumiyaviewer/lumiya/slproto/baker/BakeLayer;

    return-void
.end method
