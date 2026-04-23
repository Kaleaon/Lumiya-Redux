.class public Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;
.super Ljava/lang/Exception;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ObjectDoesNotExistException"
.end annotation


# instance fields
.field private final localID:I

.field private final uuid:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method private constructor <init>(I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    iput p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;->localID:I

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;->uuid:Ljava/util/UUID;

    return-void
.end method

.method synthetic constructor <init>(ILcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;-><init>(I)V

    return-void
.end method

.method private constructor <init>(Ljava/util/UUID;)V
    .locals 1
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Exception;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;->localID:I

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;->uuid:Ljava/util/UUID;

    return-void
.end method

.method synthetic constructor <init>(Ljava/util/UUID;Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;)V
    .locals 0

    invoke-direct {p0, p1}, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;-><init>(Ljava/util/UUID;)V

    return-void
.end method


# virtual methods
.method public getLocalID()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/users/manager/ObjectsManager$ObjectDoesNotExistException;->localID:I

    return v0
.end method
