.class public Lcom/lumiyaviewer/lumiya/slproto/messages/DirGroupsReply$QueryReplies;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/DirGroupsReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "QueryReplies"
.end annotation


# instance fields
.field public GroupID:Ljava/util/UUID;

.field public GroupName:[B

.field public Members:I

.field public SearchOrder:F


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
