.class public Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportRequest$Info;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Info"
.end annotation


# instance fields
.field public LookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public Position:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public RegionID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
