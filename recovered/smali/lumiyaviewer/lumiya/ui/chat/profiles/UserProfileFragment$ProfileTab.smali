.class final enum Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ProfileTab"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

.field public static final enum FirstLife:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

.field public static final enum Groups:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

.field public static final enum MainProfile:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

.field public static final enum Picks:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;


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
.method static synthetic -get0(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;)I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->tabCaption:I

    return v0
.end method

.method static synthetic -get1(Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;)Ljava/lang/Class;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->tabClass:Ljava/lang/Class;

    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 8

    const/4 v7, 0x3

    const/4 v6, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    const-string/jumbo v1, "MainProfile"

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserMainProfileTab;

    const v3, 0x7f090297

    invoke-direct {v0, v1, v4, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;-><init>(Ljava/lang/String;IILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->MainProfile:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    const-string/jumbo v1, "Picks"

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserPicksProfileTab;

    const v3, 0x7f090296

    invoke-direct {v0, v1, v5, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;-><init>(Ljava/lang/String;IILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->Picks:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    const-string/jumbo v1, "Groups"

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserGroupsProfileTab;

    const v3, 0x7f090290

    invoke-direct {v0, v1, v6, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;-><init>(Ljava/lang/String;IILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->Groups:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    const-string/jumbo v1, "FirstLife"

    const-class v2, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserFirstLifeProfileTab;

    const v3, 0x7f09028a

    invoke-direct {v0, v1, v7, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;-><init>(Ljava/lang/String;IILjava/lang/Class;)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->FirstLife:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->MainProfile:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->Picks:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    aput-object v1, v0, v5

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->Groups:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    aput-object v1, v0, v6

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->FirstLife:Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    aput-object v1, v0, v7

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

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

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->tabCaption:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->tabClass:Ljava/lang/Class;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/chat/profiles/UserProfileFragment$ProfileTab;

    return-object v0
.end method
