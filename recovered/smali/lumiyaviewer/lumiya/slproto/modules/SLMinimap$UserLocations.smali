.class public Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UserLocations"
.end annotation


# instance fields
.field public final myAvatarHeading:F

.field public final myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final userPositions:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;FLjava/util/Map;)V
    .locals 0
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;",
            "F",
            "Ljava/util/Map",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;->myAvatarPosition:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;->myAvatarHeading:F

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocations;->userPositions:Ljava/util/Map;

    return-void
.end method
