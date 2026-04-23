.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataRequest$GroupData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GroupData"
.end annotation


# instance fields
.field public GroupID:Ljava/util/UUID;

.field public RequestID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
