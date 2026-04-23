.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupVoteHistoryItemReply$HistoryItemData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/GroupVoteHistoryItemReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HistoryItemData"
.end annotation


# instance fields
.field public EndDateTime:[B

.field public Majority:F

.field public ProposalText:[B

.field public Quorum:I

.field public StartDateTime:[B

.field public TerseDateID:[B

.field public VoteID:Ljava/util/UUID;

.field public VoteInitiator:Ljava/util/UUID;

.field public VoteResult:[B

.field public VoteType:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
