.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate$RoleData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "RoleData"
.end annotation


# instance fields
.field public Description:[B

.field public Name:[B

.field public Powers:J

.field public RoleID:Ljava/util/UUID;

.field public Title:[B

.field public UpdateType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
