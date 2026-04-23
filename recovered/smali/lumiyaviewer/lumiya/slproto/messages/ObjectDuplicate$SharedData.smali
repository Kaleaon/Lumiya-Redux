.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDuplicate$SharedData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDuplicate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "SharedData"
.end annotation


# instance fields
.field public DuplicateFlags:I

.field public Offset:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
