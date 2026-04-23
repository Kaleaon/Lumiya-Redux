.class public Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;
.super Ljava/lang/Object;


# instance fields
.field private id:Ljava/lang/Long;

.field private itemName:Ljava/lang/String;

.field private itemType:I

.field private itemUUID:Ljava/util/UUID;

.field private levensteinDistance:I

.field private memberCount:Ljava/lang/Integer;

.field private searchUUID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->id:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Long;Ljava/util/UUID;ILjava/util/UUID;Ljava/lang/String;ILjava/lang/Integer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->id:Ljava/lang/Long;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->searchUUID:Ljava/util/UUID;

    iput p3, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->itemType:I

    iput-object p4, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->itemUUID:Ljava/util/UUID;

    iput-object p5, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->itemName:Ljava/lang/String;

    iput p6, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->levensteinDistance:I

    iput-object p7, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->memberCount:Ljava/lang/Integer;

    return-void
.end method


# virtual methods
.method public getId()Ljava/lang/Long;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->id:Ljava/lang/Long;

    return-object v0
.end method

.method public getItemName()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->itemName:Ljava/lang/String;

    return-object v0
.end method

.method public getItemType()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->itemType:I

    return v0
.end method

.method public getItemUUID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->itemUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public getLevensteinDistance()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->levensteinDistance:I

    return v0
.end method

.method public getMemberCount()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->memberCount:Ljava/lang/Integer;

    return-object v0
.end method

.method public getSearchUUID()Ljava/util/UUID;
    .locals 1

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->searchUUID:Ljava/util/UUID;

    return-object v0
.end method

.method public setId(Ljava/lang/Long;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->id:Ljava/lang/Long;

    return-void
.end method

.method public setItemName(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->itemName:Ljava/lang/String;

    return-void
.end method

.method public setItemType(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->itemType:I

    return-void
.end method

.method public setItemUUID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->itemUUID:Ljava/util/UUID;

    return-void
.end method

.method public setLevensteinDistance(I)V
    .locals 0

    iput p1, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->levensteinDistance:I

    return-void
.end method

.method public setMemberCount(Ljava/lang/Integer;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->memberCount:Ljava/lang/Integer;

    return-void
.end method

.method public setSearchUUID(Ljava/util/UUID;)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/dao/SearchGridResult;->searchUUID:Ljava/util/UUID;

    return-void
.end method
