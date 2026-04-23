.class public Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UserLocation"
.end annotation


# instance fields
.field public final chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field

.field public volatile distance:F

.field public volatile location:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;)V
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param
    .param p2    # Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;->location:Lcom/lumiyaviewer/lumiya/slproto/types/ImmutableVector;

    const/high16 v0, 0x7fc00000    # Float.NaN

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLMinimap$UserLocation;->distance:F

    return-void
.end method
