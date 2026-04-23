.class public Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao$Properties;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Properties"
.end annotation


# static fields
.field public static final GroupID:Lde/greenrobot/dao/Property;

.field public static final MustRevalidate:Lde/greenrobot/dao/Property;

.field public static final RequestID:Lde/greenrobot/dao/Property;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v4, 0x1

    const/4 v1, 0x0

    new-instance v0, Lde/greenrobot/dao/Property;

    const-class v2, Ljava/util/UUID;

    const-string/jumbo v3, "groupID"

    const-string/jumbo v5, "GROUP_ID"

    invoke-direct/range {v0 .. v5}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao$Properties;->GroupID:Lde/greenrobot/dao/Property;

    new-instance v3, Lde/greenrobot/dao/Property;

    const-class v5, Ljava/util/UUID;

    const-string/jumbo v6, "requestID"

    const-string/jumbo v8, "REQUEST_ID"

    move v7, v1

    invoke-direct/range {v3 .. v8}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao$Properties;->RequestID:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const-string/jumbo v5, "mustRevalidate"

    const-string/jumbo v7, "MUST_REVALIDATE"

    const/4 v3, 0x2

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/GroupRoleMemberListDao$Properties;->MustRevalidate:Lde/greenrobot/dao/Property;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
