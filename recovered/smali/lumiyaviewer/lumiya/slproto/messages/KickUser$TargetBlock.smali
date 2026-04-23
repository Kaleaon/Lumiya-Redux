.class public Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser$TargetBlock;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TargetBlock"
.end annotation


# instance fields
.field public TargetIP:Ljava/net/Inet4Address;

.field public TargetPort:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
