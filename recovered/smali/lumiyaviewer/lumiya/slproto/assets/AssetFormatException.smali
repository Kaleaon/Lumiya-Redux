.class public Lcom/lumiyaviewer/lumiya/slproto/assets/AssetFormatException;
.super Ljava/lang/Exception;


# static fields
.field private static final serialVersionUID:J = -0x747453db6597a81aL


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string/jumbo v0, "Unsupported asset format"

    invoke-direct {p0, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
