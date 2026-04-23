.class public Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark$LandmarkFormatException;
.super Lcom/lumiyaviewer/lumiya/slproto/assets/AssetFormatException;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/assets/SLLandmark;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LandmarkFormatException"
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x1ac04bb3ca0c195bL


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string/jumbo v0, "Unsupported landmark format"

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/AssetFormatException;-><init>(Ljava/lang/String;)V

    return-void
.end method
