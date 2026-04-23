.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest$Data;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Data"
.end annotation


# instance fields
.field public LookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public ObjectName:[B

.field public SimName:[B

.field public SimPosition:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
