.class Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DetailsStackEntry"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry$1;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public final arguments:Landroid/os/Bundle;

.field public final className:Ljava/lang/String;

.field public final fragment:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference",
            "<",
            "Landroid/support/v4/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field public final savedState:Landroid/support/v4/app/Fragment$SavedState;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry$1;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 2

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->fragment:Ljava/lang/ref/SoftReference;

    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->className:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->arguments:Landroid/os/Bundle;

    :goto_0
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readBundle(Ljava/lang/ClassLoader;)Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "savedState"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment$SavedState;

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->savedState:Landroid/support/v4/app/Fragment$SavedState;

    :goto_1
    return-void

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->arguments:Landroid/os/Bundle;

    goto :goto_0

    :cond_1
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->savedState:Landroid/support/v4/app/Fragment$SavedState;

    goto :goto_1
.end method

.method private constructor <init>(Landroid/support/v4/app/Fragment;)V
    .locals 2
    .param p1    # Landroid/support/v4/app/Fragment;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v1, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->fragment:Ljava/lang/ref/SoftReference;

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->className:Ljava/lang/String;

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->arguments:Landroid/os/Bundle;

    invoke-virtual {p1}, Landroid/support/v4/app/Fragment;->getFragmentManager()Landroid/support/v4/app/FragmentManager;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Landroid/support/v4/app/FragmentManager;->saveFragmentInstanceState(Landroid/support/v4/app/Fragment;)Landroid/support/v4/app/Fragment$SavedState;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->savedState:Landroid/support/v4/app/Fragment$SavedState;

    :goto_0
    return-void

    :cond_0
    iput-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->savedState:Landroid/support/v4/app/Fragment$SavedState;

    goto :goto_0
.end method

.method synthetic constructor <init>(Landroid/support/v4/app/Fragment;Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;-><init>(Landroid/support/v4/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getFragment(Landroid/content/Context;)Landroid/support/v4/app/Fragment;
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->fragment:Ljava/lang/ref/SoftReference;

    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/support/v4/app/Fragment;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->className:Ljava/lang/String;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->arguments:Landroid/os/Bundle;

    invoke-static {p1, v0, v1}, Landroid/support/v4/app/Fragment;->instantiate(Landroid/content/Context;Ljava/lang/String;Landroid/os/Bundle;)Landroid/support/v4/app/Fragment;

    move-result-object v0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->savedState:Landroid/support/v4/app/Fragment$SavedState;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->savedState:Landroid/support/v4/app/Fragment$SavedState;

    invoke-virtual {v0, v1}, Landroid/support/v4/app/Fragment;->setInitialSavedState(Landroid/support/v4/app/Fragment$SavedState;)V

    :cond_0
    return-object v0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3

    const/4 v2, 0x1

    const/4 v1, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->className:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->arguments:Landroid/os/Bundle;

    if-eqz v0, :cond_0

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->arguments:Landroid/os/Bundle;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    :goto_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->savedState:Landroid/support/v4/app/Fragment$SavedState;

    if-eqz v0, :cond_1

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeByte(B)V

    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v1, "savedState"

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/ui/common/DetailsActivity$DetailsStackEntry;->savedState:Landroid/support/v4/app/Fragment$SavedState;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBundle(Landroid/os/Bundle;)V

    :goto_1
    return-void

    :cond_0
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    goto :goto_0

    :cond_1
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByte(B)V

    goto :goto_1
.end method
