.class public abstract Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;
.super Ljava/lang/Object;


# static fields
.field public static final MAX_PAY_PRICES:I = 0x4


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(I[I)Lcom/lumiyaviewer/lumiya/slproto/objects/PayInfo;
    .locals 2

    const/4 v0, 0x0

    new-instance v1, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;

    if-eqz p1, :cond_0

    invoke-static {p1}, Lcom/google/common/primitives/Ints;->asList([I)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/collect/ImmutableList;->copyOf(Ljava/util/Collection;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    :cond_0
    invoke-direct {v1, p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_PayInfo;-><init>(ILcom/google/common/collect/ImmutableList;)V

    return-object v1
.end method


# virtual methods
.method public abstract defaultPayPrice()I
.end method

.method public abstract payPrices()Lcom/google/common/collect/ImmutableList;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end method
