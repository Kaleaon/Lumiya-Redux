.class public Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;
.super Ljava/lang/Object;


# instance fields
.field protected data:[F

.field protected length:I

.field protected numComponents:I

.field protected offset:I


# direct methods
.method public constructor <init>(II)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    mul-int v0, p1, p2

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->data:[F

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->numComponents:I

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->length:I

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->offset:I

    return-void
.end method

.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->data:[F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->data:[F

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->numComponents:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->numComponents:I

    iget v0, p1, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->length:I

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->length:I

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->offset:I

    return-void
.end method


# virtual methods
.method public final getData()[F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->data:[F

    return-object v0
.end method

.method public final getElementOffset(I)I
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->offset:I

    iget v1, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->numComponents:I

    mul-int/2addr v1, p1

    add-int/2addr v0, v1

    return v0
.end method

.method public final getLength()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->length:I

    return v0
.end method

.method public final getNumComponents()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/types/VectorArray;->numComponents:I

    return v0
.end method
