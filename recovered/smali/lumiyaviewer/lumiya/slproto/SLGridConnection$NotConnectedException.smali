.class public Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$NotConnectedException;
.super Ljava/lang/Exception;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "NotConnectedException"
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1e0880fec7da93a6L


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string/jumbo v0, "Grid not connected"

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    return-void
.end method
