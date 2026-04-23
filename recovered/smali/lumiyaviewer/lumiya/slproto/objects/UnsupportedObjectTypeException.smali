.class public Lcom/lumiyaviewer/lumiya/slproto/objects/UnsupportedObjectTypeException;
.super Ljava/lang/Exception;


# direct methods
.method public constructor <init>(B)V
    .locals 4

    const-string/jumbo v0, "Unsupported object type: 0x%x"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Byte;->valueOf(B)Ljava/lang/Byte;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    return-void
.end method
