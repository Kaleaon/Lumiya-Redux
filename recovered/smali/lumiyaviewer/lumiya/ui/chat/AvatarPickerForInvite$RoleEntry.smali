.class Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite$RoleEntry;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "RoleEntry"
.end annotation


# instance fields
.field final roleID:Ljava/util/UUID;

.field final roleTitle:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/util/UUID;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite$RoleEntry;->roleID:Ljava/util/UUID;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite$RoleEntry;->roleTitle:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Ljava/util/UUID;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite$RoleEntry;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite$RoleEntry;-><init>(Ljava/util/UUID;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/AvatarPickerForInvite$RoleEntry;->roleTitle:Ljava/lang/String;

    return-object v0
.end method
