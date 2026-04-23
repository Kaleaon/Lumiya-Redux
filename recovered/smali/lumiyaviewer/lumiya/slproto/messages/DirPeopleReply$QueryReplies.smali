.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DirPeopleReply$QueryReplies;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/DirPeopleReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QueryReplies"
.end annotation


# instance fields
.field public AgentID:Ljava/util/UUID;

.field public FirstName:[B

.field public Group:[B

.field public LastName:[B

.field public Online:Z

.field public Reputation:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
