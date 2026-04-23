.class public abstract Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;I)Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_HoverText;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/AutoValue_HoverText;-><init>(Ljava/lang/String;I)V

    return-object v0
.end method


# virtual methods
.method public abstract color()I
.end method

.method public final sameText(Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;)Z
    .locals 2
    .param p1    # Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    invoke-virtual {p0}, Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;->text()Ljava/lang/String;

    move-result-object v1

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Lcom/lumiyaviewer/lumiya/slproto/objects/HoverText;->text()Ljava/lang/String;

    move-result-object v0

    :cond_0
    invoke-static {v1, v0}, Lcom/google/common/base/Objects;->equal(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public abstract text()Ljava/lang/String;
.end method
