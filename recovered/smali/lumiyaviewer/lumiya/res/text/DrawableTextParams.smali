.class public abstract Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static create(Ljava/lang/String;I)Lcom/lumiyaviewer/lumiya/res/text/DrawableTextParams;
    .locals 1

    new-instance v0, Lcom/lumiyaviewer/lumiya/res/text/AutoValue_DrawableTextParams;

    invoke-direct {v0, p0, p1}, Lcom/lumiyaviewer/lumiya/res/text/AutoValue_DrawableTextParams;-><init>(Ljava/lang/String;I)V

    return-object v0
.end method


# virtual methods
.method public abstract backgroundColor()I
.end method

.method public abstract text()Ljava/lang/String;
.end method
