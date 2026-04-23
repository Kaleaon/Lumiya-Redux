.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout$UserData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "UserData"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public Disconnect:Z

.field public SessionID:Ljava/util/UUID;

.field public ViewerIP:Ljava/net/Inet4Address;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
