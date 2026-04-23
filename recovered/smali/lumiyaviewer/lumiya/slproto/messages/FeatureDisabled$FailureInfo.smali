.class public Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled$FailureInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FailureInfo"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public ErrorMessage:[B

.field public TransactionID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
