.class Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RolePermission"
.end annotation


# instance fields
.field final permMask:J

.field final permName:I


# direct methods
.method private constructor <init>(JI)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;->permMask:J

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;->permName:I

    return-void
.end method

.method synthetic constructor <init>(JILcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;)V
    .locals 1

    invoke-direct {p0, p1, p2, p3}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRoleDetailsFragment$RolePermission;-><init>(JI)V

    return-void
.end method
