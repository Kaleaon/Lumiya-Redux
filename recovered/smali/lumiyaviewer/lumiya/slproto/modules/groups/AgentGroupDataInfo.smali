.class public Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$AgentDataEntry;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;,
        Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$NewGroupDataEntry;
    }
.end annotation


# instance fields
.field public AgentData:Ljava/util/List;
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDSerialized;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$AgentDataEntry;",
            ">;"
        }
    .end annotation
.end field

.field public GroupData:Ljava/util/List;
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDSerialized;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;",
            ">;"
        }
    .end annotation
.end field

.field public NewGroupData:Ljava/util/List;
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDSerialized;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$NewGroupDataEntry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
