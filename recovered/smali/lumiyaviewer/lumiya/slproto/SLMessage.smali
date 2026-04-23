.class public abstract Lcom/lumiyaviewer/lumiya/slproto/SLMessage;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/SLMessage$1;
    }
.end annotation


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/SLMessage;",
            ">;"
        }
    .end annotation
.end field

.field private static final LL_ACK_FLAG:B = 0x10t

.field private static final LL_RELIABLE_FLAG:B = 0x40t

.field private static final LL_RESENT_FLAG:B = 0x20t

.field private static final LL_ZERO_CODE_FLAG:B = -0x80t

.field public static final MAX_MESSAGE_SIZE:I = 0x10000

.field public static final MAX_PAYLOAD_SIZE:I = 0x3fa

.field public static final MAX_TRANSMIT_SIZE:I = 0x400


# instance fields
.field public isReliable:Z

.field public isResent:Z

.field private listener:Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;

.field public retries:I

.field public sentTimeMillis:J

.field public seqNum:I

.field public zeroCoded:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage$1;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage$1;-><init>()V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->listener:Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;

    return-void
.end method

.method public static DecodeMessageID(Ljava/nio/ByteBuffer;)I
    .locals 2

    const/4 v1, -0x1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-eq v0, v1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-eq v0, v1, :cond_1

    const v1, 0xff00

    or-int/2addr v0, v1

    return v0

    :cond_1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    const/high16 v1, -0x10000

    or-int/2addr v0, v1

    return v0
.end method

.method public static DecodeMessageIDGeneric(Ljava/nio/ByteBuffer;)I
    .locals 3

    const v2, 0xff00

    const/4 v1, -0x1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-eq v0, v1, :cond_0

    return v0

    :cond_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-eq v0, v1, :cond_1

    or-int/2addr v0, v2

    return v0

    :cond_1
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    shl-int/lit8 v0, v0, 0x8

    and-int/2addr v0, v2

    const/high16 v2, -0x10000

    or-int/2addr v0, v2

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method private PackPayloadLE(Ljava/nio/ByteBuffer;)V
    .locals 2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->PackPayload(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    return-void
.end method

.method public static Unpack(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;Ljava/util/List;)Lcom/lumiyaviewer/lumiya/slproto/SLMessage;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "Ljava/nio/ByteBuffer;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lcom/lumiyaviewer/lumiya/slproto/SLMessage;"
        }
    .end annotation

    const/4 v9, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v4

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v5

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v6

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    :cond_0
    and-int/lit8 v0, v5, 0x10

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v7

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    mul-int/lit8 v1, v7, 0x4

    sub-int/2addr v0, v1

    move v1, v0

    move v0, v3

    :goto_0
    if-ge v0, v7, :cond_1

    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-interface {p2, v8}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, 0x4

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    invoke-virtual {p0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    :cond_2
    and-int/lit8 v0, v5, -0x80

    if-eqz v0, :cond_7

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-static {p1, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->ZeroDecode(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    :goto_1
    invoke-static {p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->DecodeMessageID(Ljava/nio/ByteBuffer;)I

    move-result v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageFactory;->CreateByID(I)Lcom/lumiyaviewer/lumiya/slproto/SLMessage;

    move-result-object v0

    if-nez v0, :cond_3

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLDefaultMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLDefaultMessage;-><init>()V

    :cond_3
    iput v6, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->seqNum:I

    and-int/lit8 v1, v5, 0x40

    if-eqz v1, :cond_4

    move v1, v2

    :goto_2
    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->isReliable:Z

    and-int/lit8 v1, v5, 0x20

    if-eqz v1, :cond_5

    move v1, v2

    :goto_3
    iput-boolean v1, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->isResent:Z

    and-int/lit8 v1, v5, -0x80

    if-eqz v1, :cond_6

    :goto_4
    iput-boolean v2, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->zeroCoded:Z

    :try_start_0
    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->UnpackPayloadLE(Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catch Ljava/nio/BufferUnderflowException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_5
    return-object v0

    :cond_4
    move v1, v3

    goto :goto_2

    :cond_5
    move v1, v3

    goto :goto_3

    :cond_6
    move v2, v3

    goto :goto_4

    :catch_0
    move-exception v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Failed to unpack ("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "), zeroCoded = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-boolean v0, v0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->zeroCoded:Z

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const-string/jumbo v0, "decodedPayload"

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/Debug;->DumpBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    const-string/jumbo v0, "origPacket w/o acks"

    invoke-static {v0, p0}, Lcom/lumiyaviewer/lumiya/Debug;->DumpBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    invoke-virtual {p0, v4}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    const-string/jumbo v0, "origPacket"

    invoke-static {v0, p0}, Lcom/lumiyaviewer/lumiya/Debug;->DumpBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    return-object v9

    :catch_1
    move-exception v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Message too short: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    goto :goto_5

    :cond_7
    move-object p1, p0

    goto/16 :goto_1
.end method

.method private UnpackPayloadLE(Ljava/nio/ByteBuffer;)V
    .locals 2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->UnpackPayload(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    return-void
.end method

.method private static ZeroDecode(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 6

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v1

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    add-int/2addr v1, v2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v2

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    sub-int/2addr v2, v3

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v3

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->arrayOffset()I

    move-result v4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v5

    add-int/2addr v4, v5

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->remaining()I

    move-result v5

    invoke-static/range {v0 .. v5}, Lcom/lumiyaviewer/rawbuffers/DirectByteBuffer;->zeroDecode([BII[BII)I

    move-result v0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->position()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0, v0}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    return-void
.end method

.method private static ZeroEncode(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v1, 0x0

    move v0, v1

    move v2, v1

    :goto_0
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->hasRemaining()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->get()B

    move-result v3

    if-eqz v3, :cond_1

    if-eqz v0, :cond_0

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    move v0, v1

    move v2, v1

    :cond_0
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_0

    :cond_1
    if-nez v2, :cond_2

    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    const/4 v2, 0x1

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    if-eqz v0, :cond_4

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    :cond_4
    return-void
.end method

.method public static flipBytes(I)I
    .locals 5

    ushr-int/lit8 v0, p0, 0x18

    int-to-byte v0, v0

    ushr-int/lit8 v1, p0, 0x10

    int-to-byte v1, v1

    ushr-int/lit8 v2, p0, 0x8

    int-to-byte v2, v2

    ushr-int/lit8 v3, p0, 0x0

    int-to-byte v3, v3

    shl-int/lit8 v3, v3, 0x18

    const/high16 v4, -0x1000000

    and-int/2addr v3, v4

    shl-int/lit8 v2, v2, 0x10

    const/high16 v4, 0xff0000

    and-int/2addr v2, v4

    or-int/2addr v2, v3

    shl-int/lit8 v1, v1, 0x8

    const v3, 0xff00

    and-int/2addr v1, v3

    or-int/2addr v1, v2

    and-int/lit16 v0, v0, 0xff

    or-int/2addr v0, v1

    return v0
.end method

.method public static stringFromVariableOEM([B)Ljava/lang/String;
    .locals 3

    :try_start_0
    new-instance v0, Ljava/lang/String;

    const-string/jumbo v1, "ISO-8859-1"

    invoke-direct {v0, p0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    const-string/jumbo v1, "\u0000"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0

    :catch_0
    move-exception v0

    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public static stringFromVariableUTF([B)Ljava/lang/String;
    .locals 3

    :try_start_0
    new-instance v0, Ljava/lang/String;

    const-string/jumbo v1, "UTF-8"

    invoke-direct {v0, p0, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    const-string/jumbo v1, "\u0000"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_0
    return-object v0

    :catch_0
    move-exception v0

    const-string/jumbo v0, ""

    goto :goto_0
.end method

.method public static stringToVariableOEM(Ljava/lang/String;)[B
    .locals 3

    const/4 v2, 0x0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\u0000"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "ISO-8859-1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x1

    new-array v0, v0, [B

    aput-byte v2, v0, v2

    return-object v0
.end method

.method public static stringToVariableUTF(Ljava/lang/String;)[B
    .locals 3

    const/4 v2, 0x0

    :try_start_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\u0000"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "UTF-8"

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x1

    new-array v0, v0, [B

    aput-byte v2, v0, v2

    return-object v0
.end method


# virtual methods
.method public AppendPendingAcks(Ljava/nio/ByteBuffer;Ljava/util/List;)I
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/nio/ByteBuffer;",
            "Ljava/util/List",
            "<",
            "Ljava/lang/Integer;",
            ">;)I"
        }
    .end annotation

    const/4 v2, 0x0

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v1, v2

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v0

    const/16 v4, 0x3fb

    if-gt v0, v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    add-int/lit8 v0, v1, 0x1

    move v1, v0

    goto :goto_0

    :cond_0
    if-eqz v1, :cond_1

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    or-int/lit8 v0, v0, 0x10

    int-to-byte v0, v0

    invoke-virtual {p1, v2, v0}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    int-to-byte v0, v1

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    :cond_1
    return v1
.end method

.method public abstract CalcPayloadSize()I
.end method

.method public abstract Handle(Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageHandler;)V
.end method

.method public Pack(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V
    .locals 4

    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->isReliable:Z

    if-eqz v0, :cond_3

    const/16 v0, 0x40

    int-to-byte v0, v0

    :goto_0
    iget-boolean v2, p0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->isResent:Z

    if-eqz v2, :cond_0

    or-int/lit8 v0, v0, 0x20

    int-to-byte v0, v0

    :cond_0
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->seqNum:I

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    iget-boolean v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->zeroCoded:Z

    if-eqz v0, :cond_2

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    sget-object v0, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p2, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-direct {p0, p2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->PackPayloadLE(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->limit()I

    move-result v0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v2

    invoke-static {p2, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->ZeroEncode(Ljava/nio/ByteBuffer;Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->position()I

    move-result v3

    sub-int/2addr v3, v2

    if-ge v3, v0, :cond_1

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->get(I)B

    move-result v0

    or-int/lit8 v0, v0, -0x80

    int-to-byte v0, v0

    invoke-virtual {p1, v1, v0}, Ljava/nio/ByteBuffer;->put(IB)Ljava/nio/ByteBuffer;

    :goto_1
    return-void

    :cond_1
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    goto :goto_1

    :cond_2
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->PackPayloadLE(Ljava/nio/ByteBuffer;)V

    goto :goto_1

    :cond_3
    move v0, v1

    goto :goto_0
.end method

.method public abstract PackPayload(Ljava/nio/ByteBuffer;)V
.end method

.method public abstract UnpackPayload(Ljava/nio/ByteBuffer;)V
.end method

.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public handleMessageAcknowledged()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->listener:Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->listener:Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;

    invoke-interface {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;->onMessageAcknowledged(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    :cond_0
    return-void
.end method

.method public handleMessageTimeout()V
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->listener:Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->listener:Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;

    invoke-interface {v0, p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;->onMessageTimeout(Lcom/lumiyaviewer/lumiya/slproto/SLMessage;)V

    :cond_0
    return-void
.end method

.method protected packBoolean(Ljava/nio/ByteBuffer;Z)V
    .locals 1

    if-eqz p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected packByte(Ljava/nio/ByteBuffer;B)V
    .locals 0

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    return-void
.end method

.method protected packDouble(Ljava/nio/ByteBuffer;D)V
    .locals 0

    invoke-virtual {p1, p2, p3}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    return-void
.end method

.method protected packFixed(Ljava/nio/ByteBuffer;[BI)V
    .locals 3

    const/4 v1, 0x0

    array-length v0, p2

    if-ne v0, p3, :cond_1

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    :cond_0
    return-void

    :cond_1
    move v0, v1

    :goto_0
    if-ge v0, p3, :cond_0

    array-length v2, p2

    if-ge v0, v2, :cond_2

    aget-byte v2, p2, v0

    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_1
.end method

.method protected packFloat(Ljava/nio/ByteBuffer;F)V
    .locals 0

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    return-void
.end method

.method protected packIPAddress(Ljava/nio/ByteBuffer;Ljava/net/Inet4Address;)V
    .locals 1

    invoke-virtual {p2}, Ljava/net/Inet4Address;->getAddress()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    return-void
.end method

.method protected packInt(Ljava/nio/ByteBuffer;I)V
    .locals 0

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->putInt(I)Ljava/nio/ByteBuffer;

    return-void
.end method

.method protected packLLQuaternion(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;)V
    .locals 1

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    return-void
.end method

.method protected packLLVector3(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;)V
    .locals 1

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    return-void
.end method

.method protected packLLVector3d(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;)V
    .locals 2

    iget-wide v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->x:D

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    iget-wide v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->y:D

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    iget-wide v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->z:D

    invoke-virtual {p1, v0, v1}, Ljava/nio/ByteBuffer;->putDouble(D)Ljava/nio/ByteBuffer;

    return-void
.end method

.method protected packLLVector4(Ljava/nio/ByteBuffer;Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;)V
    .locals 1

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    iget v0, p2, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->putFloat(F)Ljava/nio/ByteBuffer;

    return-void
.end method

.method protected packLong(Ljava/nio/ByteBuffer;J)V
    .locals 0

    invoke-virtual {p1, p2, p3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    return-void
.end method

.method protected packShort(Ljava/nio/ByteBuffer;S)V
    .locals 0

    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    return-void
.end method

.method protected packUUID(Ljava/nio/ByteBuffer;Ljava/util/UUID;)V
    .locals 4

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/util/UUID;->getMostSignificantBits()J

    move-result-wide v2

    invoke-virtual {p1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {p2}, Ljava/util/UUID;->getLeastSignificantBits()J

    move-result-wide v2

    invoke-virtual {p1, v2, v3}, Ljava/nio/ByteBuffer;->putLong(J)Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    return-void
.end method

.method protected packVariable(Ljava/nio/ByteBuffer;[BI)V
    .locals 1

    const/4 v0, 0x1

    if-ne p3, v0, :cond_0

    array-length v0, p2

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    :goto_0
    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    return-void

    :cond_0
    array-length v0, p2

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    array-length v0, p2

    ushr-int/lit8 v0, v0, 0x8

    and-int/lit16 v0, v0, 0xff

    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    goto :goto_0
.end method

.method public setEventListener(Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->listener:Lcom/lumiyaviewer/lumiya/slproto/SLMessageEventListener;

    return-void
.end method

.method protected unpackBoolean(Ljava/nio/ByteBuffer;)Z
    .locals 2

    const/4 v0, 0x0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    return v0
.end method

.method protected unpackByte(Ljava/nio/ByteBuffer;)B
    .locals 1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    return v0
.end method

.method protected unpackDouble(Ljava/nio/ByteBuffer;)D
    .locals 2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getDouble()D

    move-result-wide v0

    return-wide v0
.end method

.method protected unpackFixed(Ljava/nio/ByteBuffer;I)[B
    .locals 1

    new-array v0, p2, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    return-object v0
.end method

.method protected unpackFloat(Ljava/nio/ByteBuffer;)F
    .locals 1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v0

    return v0
.end method

.method protected unpackIPAddress(Ljava/nio/ByteBuffer;)Ljava/net/Inet4Address;
    .locals 1

    const/4 v0, 0x4

    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    :try_start_0
    invoke-static {v0}, Ljava/net/Inet4Address;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object v0

    check-cast v0, Ljava/net/Inet4Address;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    const/4 v0, 0x0

    return-object v0
.end method

.method protected unpackInt(Ljava/nio/ByteBuffer;)I
    .locals 1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getInt()I

    move-result v0

    return v0
.end method

.method protected unpackLLQuaternion(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;-><init>()V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->x:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->y:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLQuaternion;->z:F

    return-object v0
.end method

.method protected unpackLLVector3(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;-><init>()V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->x:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->y:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3;->z:F

    return-object v0
.end method

.method protected unpackLLVector3d(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;
    .locals 4

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;-><init>()V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getDouble()D

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->x:D

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getDouble()D

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->y:D

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getDouble()D

    move-result-wide v2

    iput-wide v2, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector3d;->z:D

    return-object v0
.end method

.method protected unpackLLVector4(Ljava/nio/ByteBuffer;)Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;
    .locals 2

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;-><init>()V

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->x:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->y:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->z:F

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getFloat()F

    move-result v1

    iput v1, v0, Lcom/lumiyaviewer/lumiya/slproto/types/LLVector4;->w:F

    return-object v0
.end method

.method protected unpackLong(Ljava/nio/ByteBuffer;)J
    .locals 2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    return-wide v0
.end method

.method protected unpackShort(Ljava/nio/ByteBuffer;)S
    .locals 1

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getShort()S

    move-result v0

    return v0
.end method

.method protected unpackUUID(Ljava/nio/ByteBuffer;)Ljava/util/UUID;
    .locals 6

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->order()Ljava/nio/ByteOrder;

    move-result-object v0

    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v2

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v4

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    new-instance v0, Ljava/util/UUID;

    invoke-direct {v0, v2, v3, v4, v5}, Ljava/util/UUID;-><init>(JJ)V

    return-object v0
.end method

.method protected unpackVariable(Ljava/nio/ByteBuffer;I)[B
    .locals 2

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    :goto_0
    new-array v0, v0, [B

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    return-object v0

    :cond_0
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v0

    and-int/lit16 v0, v0, 0xff

    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->get()B

    move-result v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    goto :goto_0
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 4

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->CalcPayloadSize()I

    move-result v0

    new-array v1, v0, [B

    invoke-static {v1}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-static {}, Ljava/nio/ByteOrder;->nativeOrder()Ljava/nio/ByteOrder;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    move-result-object v2

    invoke-virtual {p0, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLMessage;->PackPayload(Ljava/nio/ByteBuffer;)V

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeByteArray([B)V

    return-void
.end method
