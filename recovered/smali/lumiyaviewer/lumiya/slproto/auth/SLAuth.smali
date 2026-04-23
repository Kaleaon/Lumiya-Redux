.class public Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private SendLoginRequest(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;)Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v2, 0x0

    const/4 v5, 0x0

    iget-object v6, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->passwordHash:Ljava/lang/String;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "md5 hash: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    const-string/jumbo v0, "last"

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->startLocation:Ljava/lang/String;

    if-eqz v1, :cond_c

    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->startLocation:Ljava/lang/String;

    const-string/jumbo v3, "first"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const-string/jumbo v0, "home"

    move-object v1, v0

    :goto_0
    new-instance v7, Ljava/util/LinkedList;

    invoke-direct {v7}, Ljava/util/LinkedList;-><init>()V

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginName:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v0

    const-string/jumbo v9, " ._"

    move v3, v0

    move v0, v2

    :goto_1
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v0, v4, :cond_2

    add-int/lit8 v4, v0, 0x1

    invoke-virtual {v9, v0, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v8, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const/4 v10, -0x1

    if-eq v4, v10, :cond_0

    if-ge v4, v3, :cond_0

    move v3, v4

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    iget-object v1, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->startLocation:Ljava/lang/String;

    const-string/jumbo v3, "uri:"

    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_c

    iget-object v0, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->startLocation:Ljava/lang/String;

    move-object v1, v0

    goto :goto_0

    :cond_2
    invoke-virtual {v8, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v0, ""

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    if-ge v3, v9, :cond_3

    add-int/lit8 v0, v3, 0x1

    invoke-virtual {v8, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    :cond_3
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    const-string/jumbo v4, ""

    invoke-virtual {v0, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_4

    const-string/jumbo v0, "Resident"

    :cond_4
    new-instance v4, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;

    const-string/jumbo v8, "first"

    invoke-direct {v4, v8, v3, v5}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;)V

    invoke-interface {v7, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v3, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;

    const-string/jumbo v4, "last"

    invoke-direct {v3, v4, v0, v5}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;)V

    invoke-interface {v7, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;

    const-string/jumbo v3, "passwd"

    invoke-direct {v0, v3, v6, v5}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;

    const-string/jumbo v3, "start"

    invoke-direct {v0, v3, v1, v5}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "Lumiya "

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-static {}, Lcom/lumiyaviewer/lumiya/Debug;->isDebugBuild()Z

    move-result v0

    if-eqz v0, :cond_5

    const-string/jumbo v0, "Test"

    :goto_2
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lcom/lumiyaviewer/lumiya/LumiyaApp;->getAppVersion()Ljava/lang/String;

    move-result-object v3

    const/16 v0, 0x2e

    invoke-static {v3, v0}, Lcom/lumiyaviewer/lumiya/utils/StringUtils;->countOccurrences(Ljava/lang/String;C)I

    move-result v0

    :goto_3
    const/4 v6, 0x3

    if-ge v0, v6, :cond_6

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v6, ".0"

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_5
    const-string/jumbo v0, "Release"

    goto :goto_2

    :cond_6
    const-string/jumbo v0, "Auth: viewer channel \'%s\', version \'%s\'"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    aput-object v4, v6, v2

    const/4 v8, 0x1

    aput-object v3, v6, v8

    invoke-static {v0, v6}, Lcom/lumiyaviewer/lumiya/Debug;->Printf(Ljava/lang/String;[Ljava/lang/Object;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;

    const-string/jumbo v6, "channel"

    invoke-direct {v0, v6, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;

    const-string/jumbo v4, "version"

    invoke-direct {v0, v4, v3, v5}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;

    const-string/jumbo v3, "platform"

    const-string/jumbo v4, "Android"

    invoke-direct {v0, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;

    const-string/jumbo v3, "platform_version"

    sget-object v4, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-direct {v0, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;

    const-string/jumbo v3, "mac"

    const-string/jumbo v4, "android_id"

    invoke-static {v4}, Lcom/lumiyaviewer/lumiya/utils/HashUtils;->MD5_Hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;

    const-string/jumbo v3, "user-agent"

    const-string/jumbo v4, "Lumiya"

    invoke-direct {v0, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;

    const-string/jumbo v3, "id0"

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->clientID:Ljava/util/UUID;

    invoke-virtual {v4}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v0, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;

    const-string/jumbo v3, "agree_to_tos"

    const-string/jumbo v4, "true"

    invoke-direct {v0, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;

    const-string/jumbo v3, "viewer_digest"

    const-string/jumbo v4, "f50cfcc3-d6ce-4f16-a822-b91271de4c48"

    invoke-direct {v0, v3, v4, v5}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;)V

    invoke-interface {v7, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    iget-object v3, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginURL:Ljava/lang/String;

    const-string/jumbo v0, "login_to_simulator"

    move-object v4, v3

    move-object v3, v0

    move-object v0, v5

    :goto_4
    const/4 v5, 0x5

    if-ge v2, v5, :cond_b

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v0, "<?xml version=\"1.0\"?>\n"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "<methodCall>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "<methodName>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v3, "</methodName>"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "<params>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "<param>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "<value>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "<struct>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_5
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;

    const-string/jumbo v6, "<member>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v6, "<name>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v6, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;->name:Ljava/lang/String;

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v6, "</name>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v6, "<value>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v6, "<string>"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;->value:Ljava/lang/String;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "</string>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "</value>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "</member>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5

    :cond_7
    const-string/jumbo v0, "<member>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "<name>options</name>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "<value>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "<array><data>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "<value><string>buddy-list</string></value>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "<value><string>display_names</string></value>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "<value><string>inventory-root</string></value>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "<value><string>inventory-lib-root</string></value>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "<value><string>max-agent-groups</string></value>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "</data></array>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "</value>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "</member>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "</struct>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "</value>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "</param>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "</params>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string/jumbo v0, "</methodCall>"

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Start location: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "Auth request: "

    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/lumiyaviewer/lumiya/Debug;->Log(Ljava/lang/String;)V

    new-instance v3, Lokhttp3/Request$Builder;

    invoke-direct {v3}, Lokhttp3/Request$Builder;-><init>()V

    invoke-virtual {v3, v4}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v3

    const-string/jumbo v4, "Connection"

    const-string/jumbo v5, "close"

    invoke-virtual {v3, v4, v5}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v3

    const-string/jumbo v4, "text/xml"

    invoke-static {v4}, Lokhttp3/MediaType;->parse(Ljava/lang/String;)Lokhttp3/MediaType;

    move-result-object v4

    invoke-static {v4, v0}, Lokhttp3/RequestBody;->create(Lokhttp3/MediaType;Ljava/lang/String;)Lokhttp3/RequestBody;

    move-result-object v0

    invoke-virtual {v3, v0}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    const-string/jumbo v3, "Content-Type"

    const-string/jumbo v4, "text/xml"

    invoke-virtual {v0, v3, v4}, Lokhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    invoke-static {}, Lcom/lumiyaviewer/lumiya/slproto/https/SLHTTPSConnection;->getOkHttpClient()Lokhttp3/OkHttpClient;

    move-result-object v3

    invoke-virtual {v3, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    invoke-interface {v0}, Lokhttp3/Call;->execute()Lokhttp3/Response;

    move-result-object v5

    if-nez v5, :cond_8

    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Null response"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_8
    :try_start_0
    invoke-virtual {v5}, Lokhttp3/Response;->isSuccessful()Z

    move-result v0

    if-nez v0, :cond_9

    new-instance v0, Ljava/io/IOException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Login error code "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v5}, Lokhttp3/Response;->code()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :catchall_0
    move-exception v0

    invoke-virtual {v5}, Lokhttp3/Response;->close()V

    throw v0

    :cond_9
    :try_start_1
    invoke-static {}, Lorg/xmlpull/v1/XmlPullParserFactory;->newInstance()Lorg/xmlpull/v1/XmlPullParserFactory;

    move-result-object v0

    invoke-virtual {v0}, Lorg/xmlpull/v1/XmlPullParserFactory;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    move-result-object v3

    new-instance v0, Ljava/io/BufferedInputStream;

    invoke-virtual {v5}, Lokhttp3/Response;->body()Lokhttp3/ResponseBody;

    move-result-object v4

    invoke-virtual {v4}, Lokhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v4

    const/high16 v6, 0x10000

    invoke-direct {v0, v4, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;I)V

    const/4 v4, 0x0

    invoke-interface {v3, v0, v4}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;

    iget-object v4, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->gridName:Ljava/lang/String;

    iget-object v6, p1, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;->loginURL:Ljava/lang/String;

    invoke-direct {v0, v4, v6, v3}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)V

    iget-boolean v3, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->isIndeterminate:Z

    if-eqz v3, :cond_a

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->nextMethod:Ljava/lang/String;

    if-eqz v3, :cond_a

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->nextURL:Ljava/lang/String;

    if-eqz v3, :cond_a

    iget-object v3, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->nextMethod:Ljava/lang/String;

    iget-object v4, v0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;->nextURL:Ljava/lang/String;
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    invoke-virtual {v5}, Lokhttp3/Response;->close()V

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_4

    :cond_a
    invoke-virtual {v5}, Lokhttp3/Response;->close()V

    return-object v0

    :catch_0
    move-exception v0

    :try_start_2
    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/Debug;->Warning(Ljava/lang/Throwable;)V

    new-instance v1, Ljava/io/IOException;

    const-string/jumbo v2, "Login reply parse error"

    invoke-direct {v1, v2, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :cond_b
    return-object v0

    :cond_c
    move-object v1, v0

    goto/16 :goto_0
.end method

.method public static getPasswordHash(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    const/16 v2, 0x10

    invoke-virtual {p0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-le v1, v2, :cond_0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "$1$"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/utils/HashUtils;->MD5_Hash(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public Login(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;)Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :try_start_0
    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth;->SendLoginRequest(Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthParams;)Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    return-object v0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "Failed to login to simulator"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
