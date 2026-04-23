.class public Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao$Properties;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Properties"
.end annotation


# static fields
.field public static final GroupID:Lde/greenrobot/dao/Property;

.field public static final RequestID:Lde/greenrobot/dao/Property;

.field public static final RoleID:Lde/greenrobot/dao/Property;

.field public static final UserID:Lde/greenrobot/dao/Property;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v1, 0x0

    new-instance v0, Lde/greenrobot/dao/Property;

    const-class v2, Ljava/util/UUID;

    const-string/jumbo v3, "groupID"

    const-string/jumbo v5, "GROUP_ID"

    move v4, v1

    invoke-direct/range {v0 .. v5}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao$Properties;->GroupID:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/util/UUID;

    const-string/jumbo v5, "requestID"

    const-string/jumbo v7, "REQUEST_ID"

    const/4 v3, 0x1

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao$Properties;->RequestID:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/util/UUID;

    const-string/jumbo v5, "roleID"

    const-string/jumbo v7, "ROLE_ID"

    const/4 v3, 0x2

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao$Properties;->RoleID:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/util/UUID;

    const-string/jumbo v5, "userID"

    const-string/jumbo v7, "USER_ID"

    const/4 v3, 0x3

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberDao$Properties;->UserID:Lde/greenrobot/dao/Property;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
