.class final enum Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ContactListType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

.field public static final enum Active:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

.field public static final enum Friends:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

.field public static final enum Groups:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

.field public static final enum Nearby:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x3

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    const-string/jumbo v1, "Active"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->Active:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    const-string/jumbo v1, "Friends"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->Friends:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    const-string/jumbo v1, "Groups"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->Groups:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    const-string/jumbo v1, "Nearby"

    invoke-direct {v0, v1, v5}, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->Nearby:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    const/4 v0, 0x4

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->Active:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->Friends:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->Groups:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->Nearby:Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/chat/ContactsFragment$ContactListType;

    return-object v0
.end method
