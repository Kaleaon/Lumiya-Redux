.class public abstract Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMemberRolesQuery;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "GroupMemberRolesQuery"
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/GroupManager$GroupMemberRolesQuery;
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_GroupManager_GroupMemberRolesQuery;

    invoke-direct {v0, p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/AutoValue_GroupManager_GroupMemberRolesQuery;-><init>(Ljava/util/UUID;Ljava/util/UUID;Ljava/util/UUID;)V

    return-object v0
.end method


# virtual methods
.method public abstract groupID()Ljava/util/UUID;
.end method

.method public abstract memberID()Ljava/util/UUID;
.end method

.method public abstract requestID()Ljava/util/UUID;
.end method
