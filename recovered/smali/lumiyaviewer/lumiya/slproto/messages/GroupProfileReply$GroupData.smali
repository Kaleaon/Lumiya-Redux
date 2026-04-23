.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply$GroupData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "GroupData"
.end annotation


# instance fields
.field public AllowPublish:Z

.field public Charter:[B

.field public FounderID:Ljava/util/UUID;

.field public GroupID:Ljava/util/UUID;

.field public GroupMembershipCount:I

.field public GroupRolesCount:I

.field public InsigniaID:Ljava/util/UUID;

.field public MaturePublish:Z

.field public MemberTitle:[B

.field public MembershipFee:I

.field public Money:I

.field public Name:[B

.field public OpenEnrollment:Z

.field public OwnerRole:Ljava/util/UUID;

.field public PowersMask:J

.field public ShowInList:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
