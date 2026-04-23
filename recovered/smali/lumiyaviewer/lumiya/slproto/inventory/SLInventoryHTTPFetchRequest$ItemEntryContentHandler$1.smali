.class Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;
.super Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDDefaultContentHandler;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-inventory-SLInventoryHTTPFetchRequest$PermissionsValueKeySwitchesValues:[I


# instance fields
.field final synthetic $SWITCH_TABLE$com$lumiyaviewer$lumiya$slproto$inventory$SLInventoryHTTPFetchRequest$PermissionsValueKey:[I

.field final synthetic this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-inventory-SLInventoryHTTPFetchRequest$PermissionsValueKeySwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->-com-lumiyaviewer-lumiya-slproto-inventory-SLInventoryHTTPFetchRequest$PermissionsValueKeySwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->-com-lumiyaviewer-lumiya-slproto-inventory-SLInventoryHTTPFetchRequest$PermissionsValueKeySwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->base_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_9

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->creator_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_8

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->everyone_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_7

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->group_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_6

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->group_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_5

    :goto_4
    :try_start_5
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->is_owner_group:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_4

    :goto_5
    :try_start_6
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->last_owner_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_3

    :goto_6
    :try_start_7
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->next_owner_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_2

    :goto_7
    :try_start_8
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->owner_id:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_1

    :goto_8
    :try_start_9
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->owner_mask:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_0

    :goto_9
    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->-com-lumiyaviewer-lumiya-slproto-inventory-SLInventoryHTTPFetchRequest$PermissionsValueKeySwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_9

    :catch_1
    move-exception v1

    goto :goto_8

    :catch_2
    move-exception v1

    goto :goto_7

    :catch_3
    move-exception v1

    goto :goto_6

    :catch_4
    move-exception v1

    goto :goto_5

    :catch_5
    move-exception v1

    goto :goto_4

    :catch_6
    move-exception v1

    goto :goto_3

    :catch_7
    move-exception v1

    goto :goto_2

    :catch_8
    move-exception v1

    goto :goto_1

    :catch_9
    move-exception v1

    goto :goto_0
.end method

.method constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDStreamingParser$LLSDDefaultContentHandler;-><init>()V

    return-void
.end method


# virtual methods
.method public onPrimitiveValue(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDXMLException;,
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;
        }
    .end annotation

    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->byTag(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->-getcom-lumiyaviewer-lumiya-slproto-inventory-SLInventoryHTTPFetchRequest$PermissionsValueKeySwitchesValues()[I

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$PermissionsValueKey;->ordinal()I

    move-result v0

    aget v0, v1, v0

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->baseMask:I

    goto :goto_0

    :pswitch_1
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupMask:I

    goto :goto_0

    :pswitch_3
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->nextOwnerMask:I

    goto :goto_0

    :pswitch_4
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asInt()I

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    goto :goto_0

    :pswitch_5
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->creatorUUID:Ljava/util/UUID;

    goto :goto_0

    :pswitch_6
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->groupUUID:Ljava/util/UUID;

    goto :goto_0

    :pswitch_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->lastOwnerUUID:Ljava/util/UUID;

    goto :goto_0

    :pswitch_8
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asUUID()Ljava/util/UUID;

    move-result-object v1

    iput-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    goto :goto_0

    :pswitch_9
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler$1;->this$1:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;->-get0(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryHTTPFetchRequest$ItemEntryContentHandler;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asBoolean()Z

    move-result v1

    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->isGroupOwned:Z

    goto/16 :goto_0

    :cond_0
    const-string/jumbo v0, "InvFetch: Permissions unknown key \'%s\'"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_5
        :pswitch_1
        :pswitch_6
        :pswitch_2
        :pswitch_9
        :pswitch_7
        :pswitch_3
        :pswitch_8
        :pswitch_4
    .end packed-switch
.end method
