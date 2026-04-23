.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerEffect$Effect;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerEffect;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Effect"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public Color:[B

.field public Duration:F

.field public ID:Ljava/util/UUID;

.field public Type:I

.field public TypeData:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
