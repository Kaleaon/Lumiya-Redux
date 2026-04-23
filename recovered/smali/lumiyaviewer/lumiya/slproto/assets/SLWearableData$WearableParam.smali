.class public Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "WearableParam"
.end annotation


# instance fields
.field public final paramIndex:I

.field public final paramValue:F


# direct methods
.method constructor <init>(IF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramIndex:I

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/assets/SLWearableData$WearableParam;->paramValue:F

    return-void
.end method
