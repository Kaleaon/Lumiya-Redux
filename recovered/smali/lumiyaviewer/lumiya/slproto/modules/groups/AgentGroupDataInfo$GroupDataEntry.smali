.class public Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo$GroupDataEntry;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/groups/AgentGroupDataInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GroupDataEntry"
.end annotation


# instance fields
.field public AcceptNotices:Z
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDSerialized;
    .end annotation
.end field

.field public Contribution:I
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDSerialized;
    .end annotation
.end field

.field public GroupID:Ljava/util/UUID;
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDSerialized;
    .end annotation
.end field

.field public GroupInsigniaID:Ljava/util/UUID;
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDSerialized;
    .end annotation
.end field

.field public GroupName:Ljava/lang/String;
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDSerialized;
    .end annotation
.end field

.field public GroupPowers:J
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDSerialized;
    .end annotation
.end field

.field public GroupTitle:Ljava/lang/String;
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDSerialized;
    .end annotation
.end field

.field public ListInProfile:Z
    .annotation runtime Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDSerialized;
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
