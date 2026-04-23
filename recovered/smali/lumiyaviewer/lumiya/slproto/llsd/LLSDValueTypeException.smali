.class public Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDValueTypeException;
.super Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;


# static fields
.field private static final serialVersionUID:J = -0x196ab71f2a55e935L


# direct methods
.method public constructor <init>()V
    .locals 1

    const-string/jumbo v0, "Invalid value type"

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 2

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "Invalid value type: requested "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", actual "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p2}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;-><init>(Ljava/lang/String;)V

    return-void
.end method
