.class final Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator",
        "<",
        "Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public createFromParcel(Landroid/os/Parcel;)Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;-><init>(Landroid/os/Parcel;Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;)V

    return-object v0
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo$1;->createFromParcel(Landroid/os/Parcel;)Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;
    .locals 1

    new-array v0, p1, [Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo$1;->newArray(I)[Lcom/lumiyaviewer/lumiya/ui/accounts/AccountList$AccountInfo;

    move-result-object v0

    return-object v0
.end method
