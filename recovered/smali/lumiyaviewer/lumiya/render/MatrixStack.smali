.class public Lcom/lumiyaviewer/lumiya/render/MatrixStack;
.super Ljava/lang/Object;


# static fields
.field private static final DEFAULT_MAX_DEPTH:I = 0x20

.field private static final MATRIX_SIZE:I = 0x10


# instance fields
.field private mMatrix:[F

.field private mTemp:[F

.field private mTop:I


# direct methods
.method public constructor <init>()V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x20

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->commonInit(I)V

    return-void
.end method

.method public constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->commonInit(I)V

    return-void
.end method

.method private adjust(I)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    mul-int/lit8 v1, p1, 0x10

    add-int/2addr v0, v1

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    return-void
.end method

.method private commonInit(I)V
    .locals 1

    mul-int/lit8 v0, p1, 0x10

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    const/16 v0, 0x20

    new-array v0, v0, [F

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTemp:[F

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glLoadIdentity()V

    return-void
.end method

.method private fixedToFloat(I)F
    .locals 2

    int-to-float v0, p1

    const/high16 v1, 0x37800000

    mul-float/2addr v0, v1

    return v0
.end method

.method private preflight_adjust(I)V
    .locals 2

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    mul-int/lit8 v1, p1, 0x10

    add-int/2addr v0, v1

    if-gez v0, :cond_0

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "stack underflow"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_0
    add-int/lit8 v0, v0, 0x10

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    array-length v1, v1

    if-le v0, v1, :cond_1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "stack overflow"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_1
    return-void
.end method


# virtual methods
.method public getMatrix([FI)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    const/16 v2, 0x10

    invoke-static {v0, v1, p1, p2, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public getMatrixData()[F
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    return-object v0
.end method

.method public getMatrixDataOffset()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    return v0
.end method

.method public glApplyUniformMatrix(I)V
    .locals 4

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    invoke-static {p1, v2, v3, v0, v1}, Landroid/opengl/GLES20;->glUniformMatrix4fv(IIZ[FI)V

    return-void
.end method

.method public glFrustumf(FFFFFF)V
    .locals 8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-static/range {v0 .. v7}, Landroid/opengl/Matrix;->frustumM([FIFFFFFF)V

    return-void
.end method

.method public glFrustumx(IIIIII)V
    .locals 7

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v1

    invoke-direct {p0, p2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v2

    invoke-direct {p0, p3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v3

    invoke-direct {p0, p4}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v4

    invoke-direct {p0, p5}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v5

    invoke-direct {p0, p6}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v6

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glFrustumf(FFFFFF)V

    return-void
.end method

.method public glLoadIdentity()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    return-void
.end method

.method public glLoadMatrixf(Ljava/nio/FloatBuffer;)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    const/16 v2, 0x10

    invoke-virtual {p1, v0, v1, v2}, Ljava/nio/FloatBuffer;->get([FII)Ljava/nio/FloatBuffer;

    return-void
.end method

.method public glLoadMatrixf([FI)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    const/16 v2, 0x10

    invoke-static {p1, p2, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    return-void
.end method

.method public glLoadMatrixx(Ljava/nio/IntBuffer;)V
    .locals 4

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    add-int/2addr v2, v0

    invoke-virtual {p1}, Ljava/nio/IntBuffer;->get()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public glLoadMatrixx([II)V
    .locals 4

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x10

    if-ge v0, v1, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    add-int/2addr v2, v0

    add-int v3, p2, v0

    aget v3, p1, v3

    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public glMultMatrixf(Ljava/nio/FloatBuffer;)V
    .locals 2

    const/16 v1, 0x10

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTemp:[F

    invoke-virtual {p1, v0, v1, v1}, Ljava/nio/FloatBuffer;->get([FII)Ljava/nio/FloatBuffer;

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTemp:[F

    invoke-virtual {p0, v0, v1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glMultMatrixf([FI)V

    return-void
.end method

.method public glMultMatrixf([FI)V
    .locals 6

    const/4 v3, 0x0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTemp:[F

    const/16 v4, 0x10

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTemp:[F

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    return-void
.end method

.method public glMultMatrixx(Ljava/nio/IntBuffer;)V
    .locals 5

    const/16 v4, 0x10

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v4, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTemp:[F

    add-int/lit8 v2, v0, 0x10

    invoke-virtual {p1}, Ljava/nio/IntBuffer;->get()I

    move-result v3

    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTemp:[F

    invoke-virtual {p0, v0, v4}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glMultMatrixf([FI)V

    return-void
.end method

.method public glMultMatrixx([II)V
    .locals 5

    const/16 v4, 0x10

    const/4 v0, 0x0

    :goto_0
    if-ge v0, v4, :cond_0

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTemp:[F

    add-int/lit8 v2, v0, 0x10

    add-int v3, p2, v0

    aget v3, p1, v3

    invoke-direct {p0, v3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v3

    aput v3, v1, v2

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTemp:[F

    invoke-virtual {p0, v0, v4}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glMultMatrixf([FI)V

    return-void
.end method

.method public glOrthof(FFFFFF)V
    .locals 8

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move v7, p6

    invoke-static/range {v0 .. v7}, Landroid/opengl/Matrix;->orthoM([FIFFFFFF)V

    return-void
.end method

.method public glOrthox(IIIIII)V
    .locals 7

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v1

    invoke-direct {p0, p2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v2

    invoke-direct {p0, p3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v3

    invoke-direct {p0, p4}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v4

    invoke-direct {p0, p5}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v5

    invoke-direct {p0, p6}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v6

    move-object v0, p0

    invoke-virtual/range {v0 .. v6}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glOrthof(FFFFFF)V

    return-void
.end method

.method public glPopMatrix()V
    .locals 1

    const/4 v0, -0x1

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->preflight_adjust(I)V

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->adjust(I)V

    return-void
.end method

.method public glPushAndLoadMatrixf([FI)V
    .locals 3

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    add-int/lit8 v1, v1, 0x10

    const/16 v2, 0x10

    invoke-static {p1, p2, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    add-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    return-void
.end method

.method public glPushAndMultMatrixf([FI)V
    .locals 6

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    add-int/lit8 v1, v1, 0x10

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    move-object v4, p1

    move v5, p2

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    iget v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    add-int/lit8 v0, v0, 0x10

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    return-void
.end method

.method public glPushMatrix()V
    .locals 6

    const/4 v5, 0x1

    invoke-direct {p0, v5}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->preflight_adjust(I)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    add-int/lit8 v3, v3, 0x10

    const/16 v4, 0x10

    invoke-static {v0, v1, v2, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    invoke-direct {p0, v5}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->adjust(I)V

    return-void
.end method

.method public glRotatef(FFFF)V
    .locals 8

    const/4 v1, 0x0

    const/16 v7, 0x10

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTemp:[F

    move v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    invoke-static/range {v0 .. v5}, Landroid/opengl/Matrix;->setRotateM([FIFFFF)V

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v2, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    iget-object v3, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTemp:[F

    invoke-static {v0, v2, v3, v7, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    iget-object v2, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v3, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    iget-object v4, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTemp:[F

    iget-object v6, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTemp:[F

    move v5, v7

    move v7, v1

    invoke-static/range {v2 .. v7}, Landroid/opengl/Matrix;->multiplyMM([FI[FI[FI)V

    return-void
.end method

.method public glRotatex(IIII)V
    .locals 4

    int-to-float v0, p1

    invoke-direct {p0, p2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v1

    invoke-direct {p0, p3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v2

    invoke-direct {p0, p4}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v3

    invoke-virtual {p0, v0, v1, v2, v3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glRotatef(FFFF)V

    return-void
.end method

.method public glScalef(FFF)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    invoke-static {v0, v1, p1, p2, p3}, Landroid/opengl/Matrix;->scaleM([FIFFF)V

    return-void
.end method

.method public glScalex(III)V
    .locals 3

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v0

    invoke-direct {p0, p2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v1

    invoke-direct {p0, p3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glScalef(FFF)V

    return-void
.end method

.method public glTranslatef(FFF)V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mMatrix:[F

    iget v1, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    invoke-static {v0, v1, p1, p2, p3}, Landroid/opengl/Matrix;->translateM([FIFFF)V

    return-void
.end method

.method public glTranslatex(III)V
    .locals 3

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v0

    invoke-direct {p0, p2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v1

    invoke-direct {p0, p3}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->fixedToFloat(I)F

    move-result v2

    invoke-virtual {p0, v0, v1, v2}, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->glTranslatef(FFF)V

    return-void
.end method

.method public reset()V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/render/MatrixStack;->mTop:I

    return-void
.end method
