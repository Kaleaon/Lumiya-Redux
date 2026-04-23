.class public Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao$Properties;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Properties"
.end annotation


# static fields
.field public static final Id:Lde/greenrobot/dao/Property;

.field public static final ItemName:Lde/greenrobot/dao/Property;

.field public static final ItemType:Lde/greenrobot/dao/Property;

.field public static final ItemUUID:Lde/greenrobot/dao/Property;

.field public static final LevensteinDistance:Lde/greenrobot/dao/Property;

.field public static final MemberCount:Lde/greenrobot/dao/Property;

.field public static final SearchUUID:Lde/greenrobot/dao/Property;


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

    sput-object v0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao$Properties;->Id:Lde/greenrobot/dao/Property;

    new-instance v3, Lde/greenrobot/dao/Property;

    const-class v5, Ljava/util/UUID;

    const-string/jumbo v6, "searchUUID"

    const-string/jumbo v8, "SEARCH_UUID"

    move v7, v1

    invoke-direct/range {v3 .. v8}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v3, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao$Properties;->SearchUUID:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-string/jumbo v5, "itemType"

    const-string/jumbo v7, "ITEM_TYPE"

    const/4 v3, 0x2

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao$Properties;->ItemType:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/util/UUID;

    const-string/jumbo v5, "itemUUID"

    const-string/jumbo v7, "ITEM_UUID"

    const/4 v3, 0x3

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao$Properties;->ItemUUID:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/String;

    const-string/jumbo v5, "itemName"

    const-string/jumbo v7, "ITEM_NAME"

    const/4 v3, 0x4

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao$Properties;->ItemName:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const-string/jumbo v5, "levensteinDistance"

    const-string/jumbo v7, "LEVENSTEIN_DISTANCE"

    const/4 v3, 0x5

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao$Properties;->LevensteinDistance:Lde/greenrobot/dao/Property;

    new-instance v2, Lde/greenrobot/dao/Property;

    const-class v4, Ljava/lang/Integer;

    const-string/jumbo v5, "memberCount"

    const-string/jumbo v7, "MEMBER_COUNT"

    const/4 v3, 0x6

    move v6, v1

    invoke-direct/range {v2 .. v7}, Lde/greenrobot/dao/Property;-><init>(ILjava/lang/Class;Ljava/lang/String;ZLjava/lang/String;)V

    sput-object v2, Lcom/lumiyaviewer/lumiya/dao/SearchGridResultDao$Properties;->MemberCount:Lde/greenrobot/dao/Property;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
