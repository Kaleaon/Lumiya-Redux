.class final enum Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ProfileTab"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

.field public static final enum MainProfile:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

.field public static final enum Members:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

.field public static final enum Roles:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;


# instance fields
.field private final tabCaption:I

.field private final tabClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<+",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;)I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->tabCaption:I

    return v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;)Ljava/lang/Class;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->tabClass:Ljava/lang/Class;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 7

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    const-string/jumbo v1, "MainProfile"

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMainProfileTab;

    const v3, 0x7f090297

    invoke-direct {v0, v1, v4, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;-><init>(Ljava/lang/String;IILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->MainProfile:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    const-string/jumbo v1, "Roles"

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupRolesProfileTab;

    const v3, 0x7f090152

    invoke-direct {v0, v1, v5, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;-><init>(Ljava/lang/String;IILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->Roles:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    const-string/jumbo v1, "Members"

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupMembersProfileTab;

    const v3, 0x7f090144

    invoke-direct {v0, v1, v6, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;-><init>(Ljava/lang/String;IILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->Members:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->MainProfile:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->Roles:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->Members:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    aput-object v1, v0, v6

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/Class;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Class",
            "<+",
            "Landroid/support/v4/app/Fragment;",
            ">;)V"
        }
    .end annotation

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->tabCaption:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->tabClass:Ljava/lang/Class;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/chat/profiles/GroupProfileFragment$ProfileTab;

    return-object v0
.end method
