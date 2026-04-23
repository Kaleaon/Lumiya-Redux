.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest$StartLocationData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "StartLocationData"
.end annotation


# instance fields
.field public LocationID:I

.field public LocationLookAt:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public LocationPos:Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

.field public SimName:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
