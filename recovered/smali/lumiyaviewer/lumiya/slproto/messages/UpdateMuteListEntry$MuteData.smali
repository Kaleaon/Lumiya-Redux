.class public Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry$MuteData;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "MuteData"
.end annotation


# instance fields
.field public MuteFlags:I

.field public MuteID:Ljava/util/UUID;

.field public MuteName:[B

.field public MuteType:I


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
