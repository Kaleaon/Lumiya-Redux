.class public Lcom/lumiyaviewer/lumiya/slproto/messages/AddCircuitCode$CircuitCode;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/AddCircuitCode;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CircuitCode"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public Code:I

.field public SessionID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
