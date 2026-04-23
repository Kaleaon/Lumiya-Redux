.class public Lcom/lumiyaviewer/lumiya/utils/IdentityMatrix;
.super Ljava/lang/Object;


# static fields
.field private static final matrix:[F


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const/16 v0, 0x10

    new-array v0, v0, [F

    sput-object v0, Lcom/lumiyaviewer/lumiya/utils/IdentityMatrix;->matrix:[F

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/IdentityMatrix;->matrix:[F

    const/4 v1, 0x0

    invoke-static {v0, v1}, Landroid/opengl/Matrix;->setIdentityM([FI)V

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getMatrix()[F
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/utils/IdentityMatrix;->matrix:[F

    return-object v0
.end method
