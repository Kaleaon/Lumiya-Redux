.class public Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;
.super Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ChatterIDLocal"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal$1;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal$1;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;-><init>(Landroid/os/Parcel;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    return-void
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;-><init>(Landroid/os/Parcel;)V

    return-void
.end method

.method private constructor <init>(Ljava/util/UUID;)V
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;-><init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;)V

    return-void
.end method

.method synthetic constructor <init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;-><init>(Ljava/util/UUID;)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 1

    instance-of v0, p1, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterIDLocal;

    if-eqz v0, :cond_0

    invoke-super {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID;->equals(Ljava/lang/Object;)Z

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getChatterType()Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;
    .locals 1
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;->Local:Lcom/lumiyaviewer/lumiya/slproto/users/ChatterID$ChatterType;

    return-object v0
.end method
