.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration$DataBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DataBlock"
.end annotation


# instance fields
.field public Flags:I

.field public TargetIP:[B

.field public TargetPort:I

.field public TaskID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
