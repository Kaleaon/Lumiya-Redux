.class public Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage$CommandBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CommandBlock"
.end annotation


# instance fields
.field public Command:I

.field public Flags:I

.field public Time:F


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
