.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalItemReply$ProposalData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalItemReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ProposalData"
.end annotation


# instance fields
.field public AlreadyVoted:Z

.field public EndDateTime:[B

.field public Majority:F

.field public ProposalText:[B

.field public Quorum:I

.field public StartDateTime:[B

.field public TerseDateID:[B

.field public VoteCast:[B

.field public VoteID:Ljava/util/UUID;

.field public VoteInitiator:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
