.class public Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;
.super Ljava/lang/Object;


# instance fields
.field public final agentUUID:Ljava/util/UUID;

.field public final bitmap:Landroid/graphics/Bitmap;

.field public final folderID:Ljava/util/UUID;

.field public final name:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/util/UUID;Ljava/util/UUID;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;->name:Ljava/lang/String;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;->bitmap:Landroid/graphics/Bitmap;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;->agentUUID:Ljava/util/UUID;

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageParams;->folderID:Ljava/util/UUID;

    return-void
.end method
