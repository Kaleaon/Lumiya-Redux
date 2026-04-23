.class public Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/dao/ChatterDao;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Properties"
.end annotation


# static fields
.field public static final Active:Lde/greenrobot/dao/Property;

.field public static final Id:Lde/greenrobot/dao/Property;

.field public static final LastMessageID:Lde/greenrobot/dao/Property;

.field public static final LastSessionID:Lde/greenrobot/dao/Property;

.field public static final Muted:Lde/greenrobot/dao/Property;

.field public static final Type:Lde/greenrobot/dao/Property;

.field public static final UnreadCount:Lde/greenrobot/dao/Property;

.field public static final Uuid:Lde/greenrobot/dao/Property;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    const/4 v4, 0x1

    const/4 v1, 0x0

    new-instance v0, Lde/greenrobot/dao/Property;

    const-class v2, Ljava/lang/Long;

    const-string/jumbo v3, "id"

    const-string/jumbo v5, "_id"

    invoke-direct/range {v0 .. v5}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Id:Lde/greenrobot/dao/Property;

    new-instance v3, Lde/greenrobot/dao/Property;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-string/jumbo v6, "type"

    const-string/jumbo v8, "TYPE"

    move v7, v1

    invoke-direct/range {v3 .. v8}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Type:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/util/UUID;

    const-string/jumbo v5, "uuid"

    const-string/jumbo v7, "UUID"

    const/4 v3, 0x2

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Uuid:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const-string/jumbo v5, "active"

    const-string/jumbo v7, "ACTIVE"

    const/4 v3, 0x3

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Active:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const-string/jumbo v5, "muted"

    const-string/jumbo v7, "MUTED"

    const/4 v3, 0x4

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->Muted:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-string/jumbo v5, "unreadCount"

    const-string/jumbo v7, "UNREAD_COUNT"

    const/4 v3, 0x5

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->UnreadCount:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/Long;

    const-string/jumbo v5, "lastMessageID"

    const-string/jumbo v7, "LAST_MESSAGE_ID"

    const/4 v3, 0x6

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->LastMessageID:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/util/UUID;

    const-string/jumbo v5, "lastSessionID"

    const-string/jumbo v7, "LAST_SESSION_ID"

    const/4 v3, 0x7

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/ChatterDao$Properties;->LastSessionID:Lde/greenrobot/dao/Property;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
