.class public Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DrivenParam"
.end annotation


# instance fields
.field public final drivenID:I

.field public final max1:F

.field public final max2:F

.field public final min1:F

.field public final min2:F


# direct methods
.method constructor <init>(IFFFF)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->drivenID:I

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->min1:F

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->max1:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->min2:F

    iput p5, p0, Lcom/lumiyaviewer/lumiya/slproto/avatar/SLAvatarParams$DrivenParam;->max2:F

    return-void
.end method
