.class Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableFormatException;
.super Lcom/lumiyaviewer/lumiya/slproto/assets/AssetFormatException;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "WearableFormatException"
.end annotation


# direct methods
.method constructor <init>()V
    .locals 1

    const-string/jumbo v0, "Unsupported wearable format"

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/assets/AssetFormatException;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method constructor <init>(Ljava/lang/Throwable;)V
    .locals 1

    const-string/jumbo v0, "Unsupported wearable format"

    invoke-direct {p0, v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/assets/AssetFormatException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
