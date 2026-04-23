.class Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;->this$0:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    const/4 v6, 0x0

    const/4 v5, 0x1

    const-string/jumbo v0, "Avatar: meshUpdate entered for part %s"

    new-array v1, v5, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;->this$0:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->-get0(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v6

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;->this$0:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->-get5(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)Ljava/lang/Object;

    move-result-object v1

    monitor-enter v1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;->this$0:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->-get3(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)Lcom/lumiyaviewer/lumiya/openjpeg/OpenJPEG;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;->this$0:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->-get2(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)[F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result-object v2

    monitor-exit v1

    if-eqz v2, :cond_0

    if-eqz v0, :cond_0

    const-string/jumbo v1, "Avatar: meshUpdate: part %s params %s"

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;->this$0:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->-get0(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;

    move-result-object v4

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/avatar/AvatarTextureFaceIndex;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v6

    invoke-static {v2}, Ljava/util/Arrays;->toString([F)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;->this$0:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->-get4(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    move-result-object v3

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;->this$0:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->-get1(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)Z

    move-result v4

    invoke-direct {v1, v3, v4}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;-><init>(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;Z)V

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;->this$0:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->-get4(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;

    move-result-object v3

    invoke-virtual {v3, v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLPolyMesh;->applyMorphData(Lcom/lumiyaviewer/lumiya/slproto/avatar/SLMeshData;[FLcom/lumiyaviewer/lumiya/render/GLTexture;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;->this$0:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->-get5(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;)Ljava/lang/Object;

    move-result-object v2

    monitor-enter v2

    :try_start_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;->this$0:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->-set0(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;)Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAnimatedMeshData;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart$1;->this$0:Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;->-set1(Lcom/lumiyaviewer/lumiya/render/avatar/DrawableAvatarPart;Z)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    monitor-exit v2

    :cond_0
    return-void

    :catchall_0
    move-exception v0

    monitor-exit v1

    throw v0

    :catchall_1
    move-exception v0

    monitor-exit v2

    throw v0
.end method
