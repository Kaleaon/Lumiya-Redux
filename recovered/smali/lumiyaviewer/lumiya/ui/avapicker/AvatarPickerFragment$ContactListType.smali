.class final enum Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x401a
    name = "ContactListType"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

.field public static final enum Friends:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

.field public static final enum Nearby:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

.field public static final enum Recent:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;


# instance fields
.field public final drawableId:I


# direct methods
.method static constructor <clinit>()V
    .locals 6

    const/4 v5, 0x2

    const/4 v4, 0x1

    const/4 v3, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    const-string/jumbo v1, "Recent"

    const v2, 0x7f02007d

    invoke-direct {v0, v1, v3, v2}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->Recent:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    const-string/jumbo v1, "Friends"

    const v2, 0x7f02007e

    invoke-direct {v0, v1, v4, v2}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->Friends:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    const-string/jumbo v1, "Nearby"

    const v2, 0x7f020083

    invoke-direct {v0, v1, v5, v2}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;-><init>(Ljava/lang/String;II)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->Nearby:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->Recent:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->Friends:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    aput-object v1, v0, v4

    sget-object v1, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->Nearby:Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    aput-object v1, v0, v5

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    iput p3, p0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->drawableId:I

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;->$VALUES:[Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$ContactListType;

    return-object v0
.end method
