.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MeshEntry"
.end annotation


# instance fields
.field public meshName:Ljava/lang/String;

.field public polyMesh:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

.field public textureFaceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

.field public textureIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;->textureIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/BakedTextureIndex;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;->textureFaceIndex:Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;->meshName:Ljava/lang/String;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLBaseAvatar$MeshEntry;->polyMesh:Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    return-void
.end method
