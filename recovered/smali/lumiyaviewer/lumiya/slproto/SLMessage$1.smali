.class final Lcom/lumiyaviewer/lumiya/slproto/SLMessage$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/SLMessage;
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
        "Lcom/lumiyaviewer/lumiya/slproto/SLMessage;",
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
.method public createFromParcel(Landroid/os/Parcel;)Lcom/lumiyaviewer/lumiya/slproto/SLMessage;
    .locals 3

    const/4 v2, 0x0

    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->readByteArray([B)V

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->DecodeMessageIDGeneric(Ljava/nio/ByteBuffer;)I

    move-result v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageFactory;->CreateByID(I)Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1, v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->UnpackPayload(Ljava/nio/ByteBuffer;)V

    return-object v1

    :cond_0
    return-object v2
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage$1;->createFromParcel(Landroid/os/Parcel;)Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    move-result-object v0

    return-object v0
.end method

.method public newArray(I)[Lcom/lumiyaviewer/lumiya/slproto/SLMessage;
    .locals 1

    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 1

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage$1;->newArray(I)[Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    move-result-object v0

    return-object v0
.end method
