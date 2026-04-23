.class Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$UsersOnlyPredicate;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/google/common/base/Predicate;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "UsersOnlyPredicate"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/common/base/Predicate",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;",
        ">;"
    }
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$UsersOnlyPredicate;)V
    .locals 0

    invoke-direct {p0}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$UsersOnlyPredicate;-><init>()V

    return-void
.end method


# virtual methods
.method public apply(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)Z
    .locals 1
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    if-eqz p1, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    instance-of v0, v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDUser;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;->chatterID:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->isValidUUID()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public bridge synthetic apply(Ljava/lang/Object;)Z
    .locals 1
    .param p1    # Ljava/lang/Object;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    check-cast p1, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/avapicker/AvatarPickerFragment$UsersOnlyPredicate;->apply(Lcom/lumiyaviewer/lumiya/slproto/users/manager/ChatterDisplayData;)Z

    move-result v0

    return v0
.end method
