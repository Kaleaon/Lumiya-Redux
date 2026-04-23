.class final enum Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "PermissionsValueKey"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

.field public static final enum base_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

.field public static final enum creator_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

.field public static final enum everyone_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

.field public static final enum group_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

.field public static final enum group_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

.field public static final enum is_owner_group:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

.field public static final enum last_owner_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

.field public static final enum next_owner_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

.field public static final enum owner_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

.field public static final enum owner_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

.field private static final tagMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x4

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v0, 0x0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const-string/jumbo v2, "creator_id"

    invoke-direct {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->creator_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const-string/jumbo v2, "group_id"

    invoke-direct {v1, v2, v4}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->group_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const-string/jumbo v2, "owner_id"

    invoke-direct {v1, v2, v5}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->owner_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const-string/jumbo v2, "last_owner_id"

    invoke-direct {v1, v2, v6}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->last_owner_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const-string/jumbo v2, "is_owner_group"

    invoke-direct {v1, v2, v7}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->is_owner_group:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const-string/jumbo v2, "base_mask"

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->base_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const-string/jumbo v2, "owner_mask"

    const/4 v3, 0x6

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->owner_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const-string/jumbo v2, "next_owner_mask"

    const/4 v3, 0x7

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->next_owner_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const-string/jumbo v2, "group_mask"

    const/16 v3, 0x8

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->group_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const-string/jumbo v2, "everyone_mask"

    const/16 v3, 0x9

    invoke-direct {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;-><init>(Ljava/lang/String;I)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->everyone_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const/16 v1, 0xa

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->creator_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    aput-object v2, v1, v0

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->group_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    aput-object v2, v1, v4

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->owner_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    aput-object v2, v1, v5

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->last_owner_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    aput-object v2, v1, v6

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->is_owner_group:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    aput-object v2, v1, v7

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->base_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const/4 v3, 0x5

    aput-object v2, v1, v3

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->owner_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const/4 v3, 0x6

    aput-object v2, v1, v3

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->next_owner_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const/4 v3, 0x7

    aput-object v2, v1, v3

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->group_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const/16 v3, 0x8

    aput-object v2, v1, v3

    sget-object v2, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->everyone_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    const/16 v3, 0x9

    aput-object v2, v1, v3

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    new-instance v1, Ljava/util/HashMap;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    move-result-object v2

    array-length v2, v2

    mul-int/lit8 v2, v2, 0x2

    invoke-direct {v1, v2}, Ljava/util/HashMap;-><init>(I)V

    sput-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->tagMap:Ljava/util/Map;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    move-result-object v1

    array-length v2, v1

    :goto_0
    if-ge v0, v2, :cond_0

    aget-object v3, v1, v0

    sget-object v4, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->tagMap:Ljava/util/Map;

    invoke-virtual {v3}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v4, v5, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static byTag(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->tagMap:Ljava/util/Map;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    return-object v0
.end method
