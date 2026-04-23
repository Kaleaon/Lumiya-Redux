.class public Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo$HasChildrenObjects;
    }
.end annotation


# instance fields
.field public final distance:F

.field public final hierarchyLevel:I

.field public final localID:I

.field public final name:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILjava/lang/String;FI)V
    .locals 0
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->localID:I

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->name:Ljava/lang/String;

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->distance:F

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectDisplayInfo;->hierarchyLevel:I

    return-void
.end method
