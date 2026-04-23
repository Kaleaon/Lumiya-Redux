.class public Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest$MoneyData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MoneyData"
.end annotation


# instance fields
.field public CurrentInterval:I

.field public IntervalDays:I

.field public RequestID:Ljava/util/UUID;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
