.class public Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$NoSuchCapabilityException;,
        Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;
    }
.end annotation


# instance fields
.field private final caps:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/EnumMap;

    const-class v1, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    invoke-direct {v0, v1}, Ljava/util/EnumMap;-><init>(Ljava/lang/Class;)V

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->caps:Ljava/util/Map;

    return-void
.end method

.method private GetCapabilitesOnce(Ljava/lang/String;Ljava/lang/String;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDException;,
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v1, 0x0

    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v2, "login.agni.lindenlab.com"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    :goto_0
    invoke-static {v0, p2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->repairCapabilityURL(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;

    invoke-direct {v4}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;-><init>()V

    new-instance v5, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;

    invoke-direct {v5}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;-><init>()V

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->values()[Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    move-result-object v6

    array-length v7, v6

    move v2, v1

    :goto_1
    if-ge v2, v7, :cond_0

    aget-object v8, v6, v2

    new-instance v9, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;

    invoke-virtual {v8}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->name()Ljava/lang/String;

    move-result-object v8

    invoke-direct {v9, v8}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDString;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v9}, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDArray;->add(Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    move v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {v4, v3, v5}, Lcom/lumiyaviewer/lumiya/slproto/https/LLSDXMLRequest;->PerformRequest(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v2

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->values()[Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;

    move-result-object v3

    array-length v4, v3

    :goto_2
    if-ge v1, v4, :cond_2

    aget-object v5, v3, v1

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->keyExists(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->name()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->byKey(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    move-result-object v6

    invoke-virtual {v6}, Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;->asString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v0, v6}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->repairCapabilityURL(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->caps:Ljava/util/Map;

    invoke-interface {v7, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v8, "GetCapabilities: "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v7, " = "

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    :goto_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    :cond_1
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "GetCapabilities: "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v5}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;->name()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " not supported"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    goto :goto_3

    :cond_2
    return-void

    :cond_3
    move v0, v1

    goto/16 :goto_0
.end method

.method private static repairCapabilityURL(ZLjava/lang/String;)Ljava/lang/String;
    .locals 3

    if-eqz p0, :cond_0

    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, "."

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string/jumbo v1, "sim"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ".agni.lindenlab.com"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    const-string/jumbo v0, "Repaired capability URL to %s"

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    :goto_0
    return-object p1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public static repairURL(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v1, ".lindenlab.com"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    invoke-static {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->repairCapabilityURL(ZLjava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object p1

    :cond_0
    :goto_0
    return-object p1

    :catch_0
    move-exception v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    goto :goto_0
.end method


# virtual methods
.method public GetCapabilites(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    const/4 v1, 0x1

    if-ge v0, v1, :cond_0

    :try_start_0
    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->GetCapabilitesOnce(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :cond_0
    return-void

    :catch_0
    move-exception v1

    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getCapability(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->caps:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getCapabilityOrThrow(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$NoSuchCapabilityException;
        }
    .end annotation

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps;->caps:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    if-nez v0, :cond_0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$NoSuchCapabilityException;

    invoke-direct {v0, p1}, Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$NoSuchCapabilityException;-><init>(Lcom/lumiyaviewer/lumiya/slproto/caps/SLCaps$SLCapability;)V

    throw v0

    :cond_0
    return-object v0
.end method
