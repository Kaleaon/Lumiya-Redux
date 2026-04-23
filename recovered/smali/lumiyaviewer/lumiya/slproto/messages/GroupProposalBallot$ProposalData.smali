.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProposalBallot$ProposalData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProposalBallot;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ProposalData"
.end annotation


# instance fields
.field public GroupID:Ljava/util/UUID;

.field public ProposalID:Ljava/util/UUID;

.field public VoteCast:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
