.class public Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WearableTexture"
.end annotation


# instance fields
.field public final layer:I

.field public final textureID:Ljava/util/UUID;


# direct methods
.method constructor <init>(ILjava/util/UUID;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;->layer:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableTexture;->textureID:Ljava/util/UUID;

    return-void
.end method
