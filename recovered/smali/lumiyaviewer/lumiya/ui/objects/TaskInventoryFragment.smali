.class public Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$1;
    }
.end annotation


# static fields
.field private static final synthetic -com-lumiyaviewer-lumiya-slproto-inventory-SLAssetTypeSwitchesValues:[I = null

.field private static final OBJECT_LOCAL_ID_KEY:Ljava/lang/String; = "objectLocalId"

.field private static final OBJECT_UUID_KEY:Ljava/lang/String; = "objectUUID"


# instance fields
.field private objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private objectProfileSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;",
            ">;"
        }
    .end annotation
.end field

.field private final onObjectProfileData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;",
            ">;"
        }
    .end annotation
.end field

.field private final onTaskInventoryReceived:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription$OnData",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;",
            ">;"
        }
    .end annotation
.end field

.field private taskInventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private taskInventorySubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/Subscription",
            "<",
            "Ljava/lang/Integer;",
            "Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private static synthetic -getcom-lumiyaviewer-lumiya-slproto-inventory-SLAssetTypeSwitchesValues()[I
    .locals 3

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->-com-lumiyaviewer-lumiya-slproto-inventory-SLAssetTypeSwitchesValues:[I

    if-eqz v0, :cond_0

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->-com-lumiyaviewer-lumiya-slproto-inventory-SLAssetTypeSwitchesValues:[I

    return-object v0

    :cond_0
    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->values()[Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v0

    array-length v0, v0

    new-array v0, v0, [I

    :try_start_0
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_ANIMATION:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/4 v2, 0x3

    aput v2, v0, v1
    :try_end_0
    .catch Ljava/lang/NoSuchFieldError; {:try_start_0 .. :try_end_0} :catch_17

    :goto_0
    :try_start_1
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_BODYPART:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/4 v2, 0x4

    aput v2, v0, v1
    :try_end_1
    .catch Ljava/lang/NoSuchFieldError; {:try_start_1 .. :try_end_1} :catch_16

    :goto_1
    :try_start_2
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CALLINGCARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/4 v2, 0x5

    aput v2, v0, v1
    :try_end_2
    .catch Ljava/lang/NoSuchFieldError; {:try_start_2 .. :try_end_2} :catch_15

    :goto_2
    :try_start_3
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CATEGORY:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/4 v2, 0x6

    aput v2, v0, v1
    :try_end_3
    .catch Ljava/lang/NoSuchFieldError; {:try_start_3 .. :try_end_3} :catch_14

    :goto_3
    :try_start_4
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_CLOTHING:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/4 v2, 0x7

    aput v2, v0, v1
    :try_end_4
    .catch Ljava/lang/NoSuchFieldError; {:try_start_4 .. :try_end_4} :catch_13

    :goto_4
    :try_start_5
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_GESTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0x8

    aput v2, v0, v1
    :try_end_5
    .catch Ljava/lang/NoSuchFieldError; {:try_start_5 .. :try_end_5} :catch_12

    :goto_5
    :try_start_6
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_IMAGE_JPEG:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0x9

    aput v2, v0, v1
    :try_end_6
    .catch Ljava/lang/NoSuchFieldError; {:try_start_6 .. :try_end_6} :catch_11

    :goto_6
    :try_start_7
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_IMAGE_TGA:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0xa

    aput v2, v0, v1
    :try_end_7
    .catch Ljava/lang/NoSuchFieldError; {:try_start_7 .. :try_end_7} :catch_10

    :goto_7
    :try_start_8
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LANDMARK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0xb

    aput v2, v0, v1
    :try_end_8
    .catch Ljava/lang/NoSuchFieldError; {:try_start_8 .. :try_end_8} :catch_f

    :goto_8
    :try_start_9
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0xc

    aput v2, v0, v1
    :try_end_9
    .catch Ljava/lang/NoSuchFieldError; {:try_start_9 .. :try_end_9} :catch_e

    :goto_9
    :try_start_a
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LINK_FOLDER:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0xd

    aput v2, v0, v1
    :try_end_a
    .catch Ljava/lang/NoSuchFieldError; {:try_start_a .. :try_end_a} :catch_d

    :goto_a
    :try_start_b
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LSL_BYTECODE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0xe

    aput v2, v0, v1
    :try_end_b
    .catch Ljava/lang/NoSuchFieldError; {:try_start_b .. :try_end_b} :catch_c

    :goto_b
    :try_start_c
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_LSL_TEXT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    aput v2, v0, v1
    :try_end_c
    .catch Ljava/lang/NoSuchFieldError; {:try_start_c .. :try_end_c} :catch_b

    :goto_c
    :try_start_d
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_MESH:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0xf

    aput v2, v0, v1
    :try_end_d
    .catch Ljava/lang/NoSuchFieldError; {:try_start_d .. :try_end_d} :catch_a

    :goto_d
    :try_start_e
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_NOTECARD:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/4 v2, 0x2

    aput v2, v0, v1
    :try_end_e
    .catch Ljava/lang/NoSuchFieldError; {:try_start_e .. :try_end_e} :catch_9

    :goto_e
    :try_start_f
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_OBJECT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0x10

    aput v2, v0, v1
    :try_end_f
    .catch Ljava/lang/NoSuchFieldError; {:try_start_f .. :try_end_f} :catch_8

    :goto_f
    :try_start_10
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_SCRIPT:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0x11

    aput v2, v0, v1
    :try_end_10
    .catch Ljava/lang/NoSuchFieldError; {:try_start_10 .. :try_end_10} :catch_7

    :goto_10
    :try_start_11
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_SIMSTATE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0x12

    aput v2, v0, v1
    :try_end_11
    .catch Ljava/lang/NoSuchFieldError; {:try_start_11 .. :try_end_11} :catch_6

    :goto_11
    :try_start_12
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_SOUND:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0x13

    aput v2, v0, v1
    :try_end_12
    .catch Ljava/lang/NoSuchFieldError; {:try_start_12 .. :try_end_12} :catch_5

    :goto_12
    :try_start_13
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_SOUND_WAV:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0x14

    aput v2, v0, v1
    :try_end_13
    .catch Ljava/lang/NoSuchFieldError; {:try_start_13 .. :try_end_13} :catch_4

    :goto_13
    :try_start_14
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_TEXTURE:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0x15

    aput v2, v0, v1
    :try_end_14
    .catch Ljava/lang/NoSuchFieldError; {:try_start_14 .. :try_end_14} :catch_3

    :goto_14
    :try_start_15
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_TEXTURE_TGA:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0x16

    aput v2, v0, v1
    :try_end_15
    .catch Ljava/lang/NoSuchFieldError; {:try_start_15 .. :try_end_15} :catch_2

    :goto_15
    :try_start_16
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_UNKNOWN:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0x17

    aput v2, v0, v1
    :try_end_16
    .catch Ljava/lang/NoSuchFieldError; {:try_start_16 .. :try_end_16} :catch_1

    :goto_16
    :try_start_17
    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->AT_WIDGET:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v1

    const/16 v2, 0x18

    aput v2, v0, v1
    :try_end_17
    .catch Ljava/lang/NoSuchFieldError; {:try_start_17 .. :try_end_17} :catch_0

    :goto_17
    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->-com-lumiyaviewer-lumiya-slproto-inventory-SLAssetTypeSwitchesValues:[I

    return-object v0

    :catch_0
    move-exception v1

    goto :goto_17

    :catch_1
    move-exception v1

    goto :goto_16

    :catch_2
    move-exception v1

    goto :goto_15

    :catch_3
    move-exception v1

    goto :goto_14

    :catch_4
    move-exception v1

    goto :goto_13

    :catch_5
    move-exception v1

    goto :goto_12

    :catch_6
    move-exception v1

    goto :goto_11

    :catch_7
    move-exception v1

    goto :goto_10

    :catch_8
    move-exception v1

    goto :goto_f

    :catch_9
    move-exception v1

    goto :goto_e

    :catch_a
    move-exception v1

    goto :goto_d

    :catch_b
    move-exception v1

    goto/16 :goto_c

    :catch_c
    move-exception v1

    goto/16 :goto_b

    :catch_d
    move-exception v1

    goto/16 :goto_a

    :catch_e
    move-exception v1

    goto/16 :goto_9

    :catch_f
    move-exception v1

    goto/16 :goto_8

    :catch_10
    move-exception v1

    goto/16 :goto_7

    :catch_11
    move-exception v1

    goto/16 :goto_6

    :catch_12
    move-exception v1

    goto/16 :goto_5

    :catch_13
    move-exception v1

    goto/16 :goto_4

    :catch_14
    move-exception v1

    goto/16 :goto_3

    :catch_15
    move-exception v1

    goto/16 :goto_2

    :catch_16
    move-exception v1

    goto/16 :goto_1

    :catch_17
    move-exception v1

    goto/16 :goto_0
.end method

.method static synthetic -set0(Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->taskInventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;

    return-object p1
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->onTaskInventoryReceived:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$3;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$3;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->onObjectProfileData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    return-void
.end method

.method private canModifyObject()Z
    .locals 2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->ownerUUID()Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->isModifiable()Z

    move-result v0

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private canModifyObjectContents(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z
    .locals 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v2

    if-eqz v2, :cond_3

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v2

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerUUID:Ljava/util/UUID;

    invoke-virtual {v2, v3}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    and-int/lit16 v2, v2, 0x4000

    if-eqz v2, :cond_0

    :goto_0
    return v0

    :cond_0
    move v0, v1

    goto :goto_0

    :cond_1
    iget v2, p1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->everyoneMask:I

    and-int/lit16 v2, v2, 0x4000

    if-eqz v2, :cond_2

    :goto_1
    return v0

    :cond_2
    move v0, v1

    goto :goto_1

    :cond_3
    return v1
.end method

.method private copyAllToInventory(Z)V
    .locals 9

    const/4 v0, 0x0

    const/4 v2, 0x1

    const/4 v8, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getObjectLocalID()I

    move-result v3

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v4

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->taskInventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    if-nez v1, :cond_1

    :cond_0
    return-void

    :cond_1
    if-eqz v4, :cond_0

    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getActiveAgentCircuit()Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    move-result-object v1

    if-nez v1, :cond_2

    return-void

    :cond_2
    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    if-nez v1, :cond_3

    return-void

    :cond_3
    iget-object v5, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->inventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->taskInventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;->entries:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v1}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result v1

    if-nez v1, :cond_4

    return-void

    :cond_4
    invoke-virtual {v4}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->ownerUUID()Ljava/util/UUID;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f09021b

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void

    :cond_5
    if-nez p1, :cond_7

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->taskInventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;->entries:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v1, v0

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->ownerMask:I

    const v7, 0x8000

    and-int/2addr v0, v7

    if-nez v0, :cond_9

    move v0, v2

    :goto_1
    move v1, v0

    goto :goto_0

    :cond_6
    if-eqz v1, :cond_7

    new-instance v0, Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f090219

    invoke-virtual {v0, v1}, Landroid/support/v7/app/AlertDialog$Builder;->setMessage(I)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$1;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$1;-><init>(Ljava/lang/Object;)V

    const v3, 0x7f09021d

    invoke-virtual {v1, v3, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0;

    invoke-direct {v2}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0;-><init>()V

    const v3, 0x7f0900a8

    invoke-virtual {v1, v3, v2}, Landroid/support/v7/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/support/v7/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog$Builder;->create()Landroid/support/v7/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/support/v7/app/AlertDialog;->show()V

    return-void

    :cond_7
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->name()Lcom/google/common/base/Optional;

    move-result-object v0

    const v1, 0x7f0900da

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    new-instance v6, Ljava/util/HashSet;

    invoke-direct {v6}, Ljava/util/HashSet;-><init>()V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->taskInventory:Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLTaskInventory;->entries:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_2
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_8

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->uuid:Ljava/util/UUID;

    invoke-interface {v6, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_8
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    const v7, 0x7f0900d1

    invoke-virtual {p0, v7}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v1, v8, v7, v2, v2}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ZZ)Landroid/app/ProgressDialog;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;

    invoke-direct {v2, p0, v4, v3, v1}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment$2;-><init>(Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;ILandroid/app/ProgressDialog;)V

    invoke-virtual {v5, v0, v3, v6, v2}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventory;->CopyObjectContents(Ljava/lang/String;ILjava/util/Set;Lcom/google/common/base/Function;)V

    return-void

    :cond_9
    move v0, v1

    goto :goto_1
.end method

.method private getObjectLocalID()I
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "objectLocalId"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private getObjectUUID()Ljava/util/UUID;
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "objectUUID"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/UUID;->fromString(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    return-object v0
.end method

.method private getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;
    .locals 1
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->getUserManager(Landroid/os/Bundle;)Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    return-object v0
.end method

.method private handleObjectClick(I)V
    .locals 7

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getView()Landroid/view/View;

    move-result-object v0

    const v3, 0x7f10028c

    invoke-virtual {v0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    instance-of v3, v0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryListAdapter;

    if-eqz v3, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryListAdapter;

    invoke-virtual {v0, p1}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryListAdapter;->getItem(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;

    move-result-object v3

    if-eqz v3, :cond_0

    iget v0, v3, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;->assetType:I

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->getByType(I)Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->-getcom-lumiyaviewer-lumiya-slproto-inventory-SLAssetTypeSwitchesValues()[I

    move-result-object v4

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/inventory/SLAssetType;->ordinal()I

    move-result v0

    aget v0, v4, v0

    packed-switch v0, :pswitch_data_0

    :cond_0
    :goto_0
    return-void

    :pswitch_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->canModifyObject()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->canModifyObjectContents(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getObjectUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getObjectLocalID()I

    move-result v6

    const/4 v4, 0x0

    invoke-static/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->createIntent(Landroid/content/Context;Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;ZLjava/util/UUID;I)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->canModifyObject()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->canModifyObjectContents(Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getUserID()Ljava/util/UUID;

    move-result-object v1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getObjectUUID()Ljava/util/UUID;

    move-result-object v5

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getObjectLocalID()I

    move-result v6

    const/4 v4, 0x1

    invoke-static/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/ui/inventory/NotecardEditActivity;->createIntent(Landroid/content/Context;Ljava/util/UUID;Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/inventory/SLInventoryEntry;ZLjava/util/UUID;I)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_TaskInventoryFragment_10120(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->dismiss()V

    return-void
.end method

.method public static makeSelection(Ljava/util/UUID;Ljava/util/UUID;I)Landroid/os/Bundle;
    .locals 3

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-static {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/ActivityUtils;->setActiveAgentID(Landroid/os/Bundle;Ljava/util/UUID;)V

    if-eqz p1, :cond_0

    const-string/jumbo v1, "objectUUID"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    const-string/jumbo v1, "objectLocalId"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    return-object v0
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_TaskInventoryFragment_10017(Landroid/content/DialogInterface;I)V
    .locals 1

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->copyAllToInventory(Z)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_TaskInventoryFragment_3527(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 0

    invoke-direct {p0, p3}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->handleObjectClick(I)V

    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_objects_TaskInventoryFragment_5570(Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;)V
    .locals 3

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->name()Lcom/google/common/base/Optional;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/base/Optional;->isPresent()Z

    move-result v0

    if-eqz v0, :cond_0

    const v0, 0x7f09021c

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->objectProfileData:Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/SLObjectProfileData;->name()Lcom/google/common/base/Optional;

    move-result-object v0

    const v2, 0x7f090239

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/google/common/base/Optional;->or(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p0, v1, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->setHasOptionsMenu(Z)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 1

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    const v0, 0x7f120020

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    const v3, 0x7f10028c

    invoke-super {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    const v0, 0x7f0400a7

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryListAdapter;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {v2, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryListAdapter;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    const v2, 0x1020004

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setEmptyView(Landroid/view/View;)V

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ListView;

    new-instance v2, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$2;

    invoke-direct {v2, p0}, Lcom/lumiyaviewer/lumiya/ui/objects/-$Lambda$2R1p9WuPUwPagPVBm9YiYK9KyJ0$2;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v2}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    return-object v1
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :pswitch_0
    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->copyAllToInventory(Z)V

    const/4 v0, 0x1

    return v0

    :pswitch_data_0
    .packed-switch 0x7f100352
        :pswitch_0
    .end packed-switch
.end method

.method public onStart()V
    .locals 6

    const/4 v1, 0x0

    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStart()V

    const v0, 0x7f09021c

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->setTitle(Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getUserManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->getObjectLocalID()I

    move-result v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->getObjectTaskInventory()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v4

    iget-object v5, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->onTaskInventoryReceived:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    invoke-interface {v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v2

    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->taskInventorySubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getObjectsManager()Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;->getObjectProfile()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v0

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v2

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->onObjectProfileData:Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;

    invoke-interface {v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/Subscribable;->subscribe(Ljava/lang/Object;Ljava/util/concurrent/Executor;Lcom/lumiyaviewer/lumiya/react/Subscription$OnData;)Lcom/lumiyaviewer/lumiya/react/Subscription;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->objectProfileSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_0
    return-void
.end method

.method public onStop()V
    .locals 2

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->taskInventorySubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->taskInventorySubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->taskInventorySubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->objectProfileSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->objectProfileSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/Subscription;->unsubscribe()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/objects/TaskInventoryFragment;->objectProfileSubscription:Lcom/lumiyaviewer/lumiya/react/Subscription;

    :cond_1
    invoke-super {p0}, Lcom/lumiyaviewer/lumiya/ui/common/FragmentWithTitle;->onStop()V

    return-void
.end method
