.class public Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;
.super Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;

# interfaces
.implements Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;
.implements Lcom/lumiyaviewer/lumiya/ui/common/BackButtonHandler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$1;,
        Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;
    }
.end annotation


# static fields
.field private static final ROLE_ID_KEY:Ljava/lang/String; = "role_id"

.field private static final rolePermissions:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private RoleID:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field private final agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;",
            ">;"
        }
    .end annotation
.end field

.field private deleteMenuItem:Landroid/view/MenuItem;

.field private final groupProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;",
            ">;"
        }
    .end annotation
.end field

.field private final groupRoles:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;",
            ">;"
        }
    .end annotation
.end field

.field private hasChanged:Z

.field private final loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

.field private final myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/lumiyaviewer/lumiya/react/SubscriptionData",
            "<",
            "Ljava/util/UUID;",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;",
            ">;"
        }
    .end annotation
.end field

.field private final permCheckboxClickListener:Landroid/view/View$OnClickListener;

.field private final textChangedListener:Landroid/text/TextWatcher;

.field private undoMenuItem:Landroid/view/MenuItem;


# direct methods
.method static synthetic -wrap0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->updateUnsavedChanges()V

    return-void
.end method

.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x0

    const/16 v0, 0x2e

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/16 v2, 0x2

    const v4, 0x7f0902c7

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/16 v2, 0x4

    const v4, 0x7f0902c6

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/4 v2, 0x1

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/16 v2, 0x8

    const v4, 0x7f0902c8

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/4 v2, 0x2

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/16 v2, 0x10

    const v4, 0x7f0902d3

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/4 v2, 0x3

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/16 v2, 0x20

    const v4, 0x7f0902d4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/4 v2, 0x4

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/16 v2, 0x40

    const v4, 0x7f0902d5

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/4 v2, 0x5

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/16 v2, 0x80

    const v4, 0x7f0902d1

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/4 v2, 0x6

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/16 v2, 0x100

    const v4, 0x7f0902d0

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/4 v2, 0x7

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/16 v2, 0x200

    const v4, 0x7f0902d6

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x8

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/16 v2, 0x400

    const v4, 0x7f0902d2

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x9

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/16 v2, 0x800

    const v4, 0x7f0902ad

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0xa

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/16 v2, 0x1000

    const v4, 0x7f0902b7

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0xb

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/16 v2, 0x2000

    const v4, 0x7f0902c0

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0xc

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/16 v2, 0x4000

    const v4, 0x7f0902c5

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0xd

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x8000

    const v4, 0x7f0902b8

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0xe

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x20000

    const v4, 0x7f0902ba

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0xf

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x40000

    const v4, 0x7f0902b5

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x10

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x80000

    const v4, 0x7f0902c4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x11

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x100000

    const v4, 0x7f0902b6

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x12

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x200000

    const v4, 0x7f0902b9

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x13

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x400000

    const v4, 0x7f0902bf

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x14

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x800000

    const v4, 0x7f0902b0

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x15

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x1000000

    const v4, 0x7f0902b1

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x16

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x2000000

    const v4, 0x7f0902af

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x17

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x4000000

    const v4, 0x7f0902b3

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x18

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x10000000

    const v4, 0x7f0902b4

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x19

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x20000000000L

    const v4, 0x7f0902b2

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x1a

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x20000000

    const v4, 0x7f0902bc

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x1b

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x40000000

    const v4, 0x7f0902bd

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x1c

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x80000000L

    const v4, 0x7f0902be

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x1d

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x100000000L

    const v4, 0x7f0902ae

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x1e

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x200000000L

    const v4, 0x7f0902c2

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x1f

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x400000000L

    const v4, 0x7f0902c3

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x20

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/high16 v2, 0x1000000000000L

    const v4, 0x7f0902c1

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x21

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x800000000L

    const v4, 0x7f0902bb

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x22

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x1000000000L

    const v4, 0x7f0902cb

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x23

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x4000000000L

    const v4, 0x7f0902cc

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x24

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x8000000000L

    const v4, 0x7f0902cd

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x25

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x10000000000L

    const v4, 0x7f0902ac

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x26

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x40000000000L

    const v4, 0x7f0902ca

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x27

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x80000000000L

    const v4, 0x7f0902c9

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x28

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x100000000000L

    const v4, 0x7f0902ce

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x29

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x200000000000L

    const v4, 0x7f0902cf

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x2a

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x10000

    const v4, 0x7f0902d7

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x2b

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide/32 v2, 0x8000000

    const v4, 0x7f0902d9

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x2c

    aput-object v1, v0, v2

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const-wide v2, 0x2000000000L

    const v4, 0x7f0902d8

    invoke-direct {v1, v2, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V

    const/16 v2, 0x2d

    aput-object v1, v0, v2

    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->copyOf([Ljava/lang/Object;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->rolePermissions:Lcom/google/common/collect/ImmutableList;

    return-void
.end method

.method public constructor <init>()V
    .locals 6

    const/4 v5, 0x1

    const/4 v4, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;-><init>()V

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->groupRoles:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->groupProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/react/UIThreadExecutor;->getInstance()Ljava/util/concurrent/Executor;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;-><init>(Ljava/util/concurrent/Executor;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    const/4 v1, 0x3

    new-array v1, v1, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->groupRoles:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v4

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->groupProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v5

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    const/4 v3, 0x2

    aput-object v2, v1, v3

    invoke-direct {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;-><init>([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)V

    new-array v1, v5, [Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    aput-object v2, v1, v4

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withOptionalLoadables([Lcom/lumiyaviewer/lumiya/ui/common/loadmon/Loadable;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->withDataChangedListener(Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor$OnLoadableDataChangedListener;)Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    iput-boolean v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->hasChanged:Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$1;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$1;-><init>(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->textChangedListener:Landroid/text/TextWatcher;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$oqvWEi5fLgnwnCXV95inckWtW-E$3;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$oqvWEi5fLgnwnCXV95inckWtW-E$3;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->permCheckboxClickListener:Landroid/view/View$OnClickListener;

    return-void
.end method

.method private anyChanges()Z
    .locals 10

    const/4 v8, 0x0

    const/4 v7, 0x1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getView()Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    if-nez v0, :cond_0

    const-string/jumbo v4, ""

    const-string/jumbo v3, ""

    const-string/jumbo v2, ""

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getDefaultPowers()J

    move-result-wide v0

    move-object v5, v4

    move-object v4, v3

    move-object v9, v2

    move-wide v2, v0

    move-object v1, v9

    :goto_0
    const v0, 0x7f1001a3

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v5, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    return v7

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getSelectedRoleData()Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;

    move-result-object v0

    if-nez v0, :cond_1

    return v8

    :cond_1
    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Name:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v4

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Title:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v3

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Description:[B

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v2

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Powers:J

    move-object v5, v4

    move-object v4, v3

    move-object v9, v2

    move-wide v2, v0

    move-object v1, v9

    goto :goto_0

    :cond_2
    const v0, 0x7f1001a5

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    return v7

    :cond_3
    const v0, 0x7f1001a7

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_4

    return v7

    :cond_4
    const v0, 0x7f1001ab

    invoke-virtual {v6, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {p0, v2, v3, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getSelectedPowers(JLandroid/view/ViewGroup;)J

    move-result-wide v0

    cmp-long v0, v2, v0

    if-eqz v0, :cond_5

    return v7

    :cond_5
    return v8

    :cond_6
    return v8
.end method

.method private askForSavingChanges(Ljava/lang/Runnable;)V
    .locals 11

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getView()Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getSelectedRoleData()Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getDefaultPowers()J

    move-result-wide v0

    move-wide v2, v0

    :goto_0
    const v0, 0x7f1001a3

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    const v0, 0x7f1001a5

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    const v0, 0x7f1001a7

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v7

    const v0, 0x7f1001ab

    invoke-virtual {v4, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {p0, v2, v3, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getSelectedPowers(JLandroid/view/ViewGroup;)J

    move-result-wide v2

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0902e0

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v9

    const-string/jumbo v10, "Yes"

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$oqvWEi5fLgnwnCXV95inckWtW-E$6;

    move-object v4, p0

    move-object v8, p1

    invoke-direct/range {v1 .. v8}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$oqvWEi5fLgnwnCXV95inckWtW-E$6;-><init>(JLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v9, v10, v1}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$oqvWEi5fLgnwnCXV95inckWtW-E$1;

    invoke-direct {v3, p1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$oqvWEi5fLgnwnCXV95inckWtW-E$1;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :goto_1
    return-void

    :cond_0
    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Powers:J

    move-wide v2, v0

    goto :goto_0

    :cond_1
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_1
.end method

.method private confirmDeleteRole()V
    .locals 4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getMyGroupPowers()J

    move-result-wide v0

    const-wide/16 v2, 0x20

    and-long/2addr v0, v2

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0900e1

    invoke-virtual {p0, v1}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setCancelable(Z)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "Yes"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$oqvWEi5fLgnwnCXV95inckWtW-E$2;

    invoke-direct {v3, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$oqvWEi5fLgnwnCXV95inckWtW-E$2;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const-string/jumbo v2, "No"

    new-instance v3, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$oqvWEi5fLgnwnCXV95inckWtW-E;

    invoke-direct {v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$oqvWEi5fLgnwnCXV95inckWtW-E;-><init>()V

    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->create()Landroid/app/AlertDialog;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog;->show()V

    :cond_0
    return-void
.end method

.method private createPermEntries(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .locals 6

    const/4 v5, 0x1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->rolePermissions:Lcom/google/common/collect/ImmutableList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;

    const v1, 0x7f04004e

    const/4 v2, 0x0

    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    move-object v1, v2

    check-cast v1, Landroid/widget/CheckedTextView;

    iget v4, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;->permName:I

    invoke-virtual {v1, v4}, Landroid/widget/CheckedTextView;->setText(I)V

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;->permMask:J

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    const v1, 0x7f100024

    invoke-virtual {v2, v1, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    invoke-virtual {v2, v5}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v2, v5}, Landroid/view/View;->setClickable(Z)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->permCheckboxClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p2, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method private getDefaultPowers()J
    .locals 2

    const-wide/32 v0, 0x8010002

    return-wide v0
.end method

.method private getMemberCount()I
    .locals 4

    const/4 v3, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getSelectedRoleData()Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;

    move-result-object v0

    if-eqz v0, :cond_2

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->RoleID:Ljava/util/UUID;

    sget-object v2, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v1, v2}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->groupProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;

    if-eqz v0, :cond_0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->GroupMembershipCount:I

    return v0

    :cond_0
    return v3

    :cond_1
    iget v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Members:I

    return v0

    :cond_2
    return v3
.end method

.method private getMyGroupEntry()Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;
    .locals 2
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList;->Groups:Lcom/google/common/collect/ImmutableMap;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->groupProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->GroupID:Ljava/util/UUID;

    invoke-virtual {v1, v0}, Lcom/google/common/collect/ImmutableMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return-object v0
.end method

.method private getMyGroupPowers()J
    .locals 2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getMyGroupEntry()Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-wide v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AvatarGroupList$AvatarGroupEntry;->GroupPowers:J

    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method private getSelectedPowers(JLandroid/view/ViewGroup;)J
    .locals 9

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v5

    const/4 v0, 0x0

    move v4, v0

    move-wide v2, p1

    :goto_0
    if-ge v4, v5, :cond_1

    invoke-virtual {p3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    instance-of v0, v1, Landroid/widget/CheckedTextView;

    if-eqz v0, :cond_2

    const v0, 0x7f100024

    invoke-virtual {v1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v6, v0, Ljava/lang/Long;

    if-eqz v6, :cond_2

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    move-object v0, v1

    check-cast v0, Landroid/widget/CheckedTextView;

    invoke-virtual {v0}, Landroid/widget/CheckedTextView;->isChecked()Z

    move-result v0

    if-eqz v0, :cond_0

    or-long v0, v2, v6

    :goto_1
    add-int/lit8 v2, v4, 0x1

    move v4, v2

    move-wide v2, v0

    goto :goto_0

    :cond_0
    not-long v0, v6

    and-long/2addr v0, v2

    goto :goto_1

    :cond_1
    return-wide v2

    :cond_2
    move-wide v0, v2

    goto :goto_1
.end method

.method private getSelectedRoleData()Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;
    .locals 5
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    if-eqz v0, :cond_1

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->groupRoles:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;->RoleData_Fields:Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->RoleID:Ljava/util/UUID;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    invoke-static {v3, v4}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    move-result v3

    if-eqz v3, :cond_0

    :goto_0
    return-object v0

    :catch_0
    move-exception v0

    return-object v1

    :cond_1
    return-object v1

    :cond_2
    move-object v0, v1

    goto :goto_0
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_GroupRoleDetailsFragment_23933(Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p0}, Landroid/content/DialogInterface;->cancel()V

    return-void
.end method

.method static synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_GroupRoleDetailsFragment_26404(Ljava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .locals 0

    invoke-interface {p1}, Landroid/content/DialogInterface;->cancel()V

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method public static makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/util/UUID;)Landroid/os/Bundle;
    .locals 3
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-static {p0}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v0

    if-eqz p1, :cond_0

    const-string/jumbo v1, "role_id"

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-object v0
.end method

.method private setLoadedValues()V
    .locals 14

    const v13, 0x7f1001a3

    const v12, 0x7f1001a2

    const/16 v3, 0x8

    const/4 v2, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getSelectedRoleData()Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;

    move-result-object v4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getMyGroupPowers()J

    move-result-wide v6

    const-wide/16 v0, 0x40

    and-long/2addr v0, v6

    const-wide/16 v8, 0x0

    cmp-long v0, v0, v8

    if-eqz v0, :cond_2

    const/4 v0, 0x1

    move v1, v0

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    sget-object v5, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-static {v0, v5}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->groupProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;

    if-eqz v0, :cond_b

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->OwnerRole:Ljava/util/UUID;

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    invoke-static {v0, v8}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    :goto_1
    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->deleteMenuItem:Landroid/view/MenuItem;

    if-eqz v8, :cond_0

    iget-object v8, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->deleteMenuItem:Landroid/view/MenuItem;

    iget-object v9, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    if-eqz v9, :cond_3

    const-wide/16 v10, 0x20

    and-long/2addr v6, v10

    const-wide/16 v10, 0x0

    cmp-long v6, v6, v10

    if-eqz v6, :cond_3

    xor-int/lit8 v0, v0, 0x1

    if-eqz v0, :cond_3

    xor-int/lit8 v0, v5, 0x1

    :goto_2
    invoke-interface {v8, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getView()Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1

    if-eqz v4, :cond_4

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getMemberCount()I

    move-result v6

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-object v7, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Name:[B

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v7, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Name:[B

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1001a5

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-object v7, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Title:[B

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1001a4

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v7, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Title:[B

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1001a7

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    iget-object v7, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Description:[B

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1001a6

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v7, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Description:[B

    invoke-static {v7}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->stringFromVariableOEM([B)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f10017e

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const/4 v8, 0x1

    new-array v8, v8, [Ljava/lang/Object;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    aput-object v9, v8, v2

    const v9, 0x7f110001

    invoke-virtual {v7, v9, v6, v8}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-wide v6, v4, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply$RoleData;->Powers:J

    const v0, 0x7f1001ab

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {p0, v6, v7, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->setPermissionCheckboxes(JLandroid/view/ViewGroup;)V

    const v0, 0x7f1001a8

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_3
    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v1, :cond_5

    move v0, v2

    :goto_4
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-nez v1, :cond_6

    move v0, v2

    :goto_5
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f1001a5

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v1, :cond_7

    move v0, v2

    :goto_6
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f1001a4

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-nez v1, :cond_8

    move v0, v2

    :goto_7
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f1001a7

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    if-eqz v1, :cond_9

    move v0, v2

    :goto_8
    invoke-virtual {v4, v0}, Landroid/view/View;->setVisibility(I)V

    const v0, 0x7f1001a6

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-nez v1, :cond_a

    :goto_9
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->updateUnsavedChanges()V

    return-void

    :cond_2
    move v1, v2

    goto/16 :goto_0

    :cond_3
    move v0, v2

    goto/16 :goto_2

    :cond_4
    const v0, 0x7f1001a8

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v5, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v4, ""

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1001a5

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v4, ""

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1001a7

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    const-string/jumbo v4, ""

    invoke-virtual {v0, v4}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v5, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string/jumbo v4, ""

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1001a4

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string/jumbo v4, ""

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f1001a6

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string/jumbo v4, ""

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v0, 0x7f10017e

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const-string/jumbo v4, ""

    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getDefaultPowers()J

    move-result-wide v6

    const v0, 0x7f1001ab

    invoke-virtual {v5, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {p0, v6, v7, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->setPermissionCheckboxes(JLandroid/view/ViewGroup;)V

    goto/16 :goto_3

    :cond_5
    move v0, v3

    goto/16 :goto_4

    :cond_6
    move v0, v3

    goto/16 :goto_5

    :cond_7
    move v0, v3

    goto/16 :goto_6

    :cond_8
    move v0, v3

    goto/16 :goto_7

    :cond_9
    move v0, v3

    goto/16 :goto_8

    :cond_a
    move v2, v3

    goto/16 :goto_9

    :cond_b
    move v0, v2

    goto/16 :goto_1
.end method

.method private setPermissionCheckboxes(JLandroid/view/ViewGroup;)V
    .locals 11

    const/4 v2, 0x0

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    move v3, v2

    :goto_0
    if-ge v3, v4, :cond_2

    invoke-virtual {p3, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    instance-of v1, v0, Landroid/widget/CheckedTextView;

    if-eqz v1, :cond_0

    const v1, 0x7f100024

    invoke-virtual {v0, v1}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v1

    instance-of v5, v1, Ljava/lang/Long;

    if-eqz v5, :cond_0

    check-cast v0, Landroid/widget/CheckedTextView;

    check-cast v1, Ljava/lang/Long;

    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    move-result-wide v6

    and-long/2addr v6, p1

    const-wide/16 v8, 0x0

    cmp-long v1, v6, v8

    if-eqz v1, :cond_1

    const/4 v1, 0x1

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/CheckedTextView;->setChecked(Z)V

    :cond_0
    add-int/lit8 v0, v3, 0x1

    move v3, v0

    goto :goto_0

    :cond_1
    move v1, v2

    goto :goto_1

    :cond_2
    return-void
.end method

.method private updateUnsavedChanges()V
    .locals 2

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->anyChanges()Z

    move-result v0

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->hasChanged:Z

    if-eq v0, v1, :cond_0

    iput-boolean v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->hasChanged:Z

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->undoMenuItem:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->undoMenuItem:Landroid/view/MenuItem;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->hasChanged:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_0
    return-void
.end method


# virtual methods
.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_GroupRoleDetailsFragment_11905(Landroid/view/View;)V
    .locals 6

    const/4 v1, 0x0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getMyGroupPowers()J

    move-result-wide v2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->groupProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;

    if-eqz v0, :cond_3

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;->GroupData_Field:Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;->OwnerRole:Ljava/util/UUID;

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    invoke-static {v0, v4}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    const-wide/16 v4, 0x400

    and-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2

    xor-int/lit8 v0, v0, 0x1

    :goto_1
    if-eqz v0, :cond_1

    instance-of v0, p1, Landroid/widget/Checkable;

    if-eqz v0, :cond_0

    check-cast p1, Landroid/widget/Checkable;

    invoke-interface {p1}, Landroid/widget/Checkable;->toggle()V

    :cond_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->updateUnsavedChanges()V

    :cond_1
    return-void

    :cond_2
    move v0, v1

    goto :goto_1

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_GroupRoleDetailsFragment_23112(Landroid/content/DialogInterface;I)V
    .locals 3

    invoke-interface {p1}, Landroid/content/DialogInterface;->dismiss()V

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v1, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->groupManager:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    invoke-virtual {v1, v0, v2}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->DeleteRole(Ljava/util/UUID;Ljava/util/UUID;)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_1

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->closeDetailsFragment(Landroid/support/v4/app/Fragment;)Z

    :cond_1
    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_GroupRoleDetailsFragment_24146()V
    .locals 2

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    instance-of v1, v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    if-eqz v1, :cond_0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;

    invoke-virtual {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->closeDetailsFragment(Landroid/support/v4/app/Fragment;)Z

    :cond_0
    return-void
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_GroupRoleDetailsFragment_25587(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/lang/Runnable;Landroid/content/DialogInterface;I)V
    .locals 8

    invoke-interface {p7}, Landroid/content/DialogInterface;->dismiss()V

    :try_start_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v0

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->groupManager:Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    check-cast v1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->getChatterUUID()Ljava/util/UUID;

    move-result-object v1

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-wide v6, p4

    invoke-virtual/range {v0 .. v7}, Lcom/lumiyaviewer/lumiya/slproto/modules/groups/SLGroupManager;->SetRoleProperties(Ljava/util/UUID;Ljava/util/UUID;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    :try_end_0
    .catch Lcom/lumiyaviewer/lumiya/react/SubscriptionData$DataNotReadyException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    invoke-interface {p6}, Ljava/lang/Runnable;->run()V

    return-void

    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method synthetic lambda$-com_lumiyaviewer_lumiya_ui_chat_profiles_GroupRoleDetailsFragment_9928(Landroid/view/View;)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    sget-object v1, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->ZeroUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1}, Ljava/util/UUID;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-static {v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getActivity()Landroid/support/v4/app/FragmentActivity;

    move-result-object v0

    const-class v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    invoke-static {v2, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleMembersFragment;->makeSelection(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;Ljava/util/UUID;)Landroid/os/Bundle;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;->showEmbeddedDetails(Landroid/app/Activity;Ljava/lang/Class;Landroid/os/Bundle;)Z

    goto :goto_0
.end method

.method public onBackButtonPressed()Z
    .locals 1

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->anyChanges()Z

    move-result v0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$oqvWEi5fLgnwnCXV95inckWtW-E$5;

    invoke-direct {v0, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$oqvWEi5fLgnwnCXV95inckWtW-E$5;-><init>(Ljava/lang/Object;)V

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->askForSavingChanges(Ljava/lang/Runnable;)V

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->onCreate(Landroid/os/Bundle;)V

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->setHasOptionsMenu(Z)V

    return-void
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V
    .locals 2

    invoke-super {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->onCreateOptionsMenu(Landroid/view/Menu;Landroid/view/MenuInflater;)V

    const v0, 0x7f120008

    invoke-virtual {p2, v0, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    const v0, 0x7f100302

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->undoMenuItem:Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->undoMenuItem:Landroid/view/MenuItem;

    iget-boolean v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->hasChanged:Z

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v0, 0x7f10030c

    invoke-interface {p1, v0}, Landroid/view/Menu;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->deleteMenuItem:Landroid/view/MenuItem;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->deleteMenuItem:Landroid/view/MenuItem;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 6
    .param p2    # Landroid/view/ViewGroup;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Landroid/os/Bundle;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation

    const v3, 0x7f1000bd

    const v5, 0x7f1000bb

    const v0, 0x7f04004c

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v0, v1}, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;->setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;

    const v3, 0x7f0901e0

    invoke-virtual {p0, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f090151

    invoke-virtual {p0, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v0, v3, v4}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setLoadingLayout(Lcom/lumiyaviewer/lumiya/ui/common/LoadingLayout;Ljava/lang/String;Ljava/lang/String;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/support/v4/widget/SwipeRefreshLayout;

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->setSwipeRefreshLayout(Landroid/support/v4/widget/SwipeRefreshLayout;)V

    const v0, 0x7f1001a3

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->textChangedListener:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    const v0, 0x7f1001a5

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->textChangedListener:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    const v0, 0x7f1001a7

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->textChangedListener:Landroid/text/TextWatcher;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    const v0, 0x7f1001ab

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->createPermEntries(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    const v0, 0x7f1001a9

    invoke-virtual {v2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$oqvWEi5fLgnwnCXV95inckWtW-E$4;

    invoke-direct {v1, p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/-$Lambda$oqvWEi5fLgnwnCXV95inckWtW-E$4;-><init>(Ljava/lang/Object;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v2
.end method

.method public onLoadableDataChanged()V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->setLoadedValues()V

    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2

    const/4 v1, 0x1

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/ChatterFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    return v0

    :sswitch_0
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->setLoadedValues()V

    return v1

    :sswitch_1
    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->confirmDeleteRole()V

    return v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x7f100302 -> :sswitch_0
        0x7f10030c -> :sswitch_1
    .end sparse-switch
.end method

.method protected onShowUser(Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V
    .locals 4
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v2, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->loadableMonitor:Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/ui/common/loadmon/LoadableMonitor;->unsubscribeAll()V

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "role_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->containsKey(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "role_id"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/lang/String;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    :goto_0
    const-string/jumbo v0, "Group role details: new role = %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    if-eqz v0, :cond_0

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDGroup;->getChatterUUID()Ljava/util/UUID;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->groupRoles:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getGroupRoles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->myGroupList:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getAvatarGroupLists()Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/SerializableResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v1, v2, v3}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->groupProfile:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->userManager:Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->getCachedGroupProfiles()Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;

    move-result-object v2

    invoke-virtual {v2}, Lcom/lumiyaviewer/lumiya/slproto/users/SLMessageResponseCacher;->getPool()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v2

    invoke-virtual {v1, v2, v0}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->agentCircuit:Lcom/lumiyaviewer/lumiya/react/SubscriptionData;

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/UserManager;->agentCircuits()Lcom/lumiyaviewer/lumiya/react/Subscribable;

    move-result-object v1

    iget-object v2, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->agentUUID:Ljava/util/UUID;

    invoke-virtual {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/react/SubscriptionData;->subscribe(Lcom/lumiyaviewer/lumiya/react/Subscribable;Ljava/lang/Object;)V

    :cond_0
    return-void

    :cond_1
    iput-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;->RoleID:Ljava/util/UUID;

    goto :goto_0
.end method
