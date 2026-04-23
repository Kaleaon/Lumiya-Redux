.class public Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Friend"
.end annotation


# instance fields
.field public final rightsGiven:I

.field public final rightsHas:I

.field public final uuid:Ljava/util/UUID;
    .annotation runtime Ljavax/annotation/Nonnull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/UUID;II)V
    .locals 0
    .param p1    # Ljava/util/UUID;
        .annotation runtime Ljavax/annotation/Nonnull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;->uuid:Ljava/util/UUID;

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;->rightsGiven:I

    iput p3, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuthReply$Friend;->rightsHas:I

    return-void
.end method
