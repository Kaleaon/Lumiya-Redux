.class public Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;
.super Ljava/lang/Object;


# annotations
.annotation build Ljavax/annotation/concurrent/Immutable;
.end annotation


# static fields
.field public static final flagAll:I = 0xf

.field public static final flagObjectSounds:I = 0x8

.field public static final flagParticles:I = 0x4

.field public static final flagTextChat:I = 0x1

.field public static final flagVoiceChat:I = 0x2


# instance fields
.field public final flags:I

.field public final name:Ljava/lang/String;

.field public final type:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

.field public final uuid:Ljava/util/UUID;


# direct methods
.method public constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;Ljava/util/UUID;Ljava/lang/String;I)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->type:Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteType;

    invoke-static {p2}, Lcom/lumiyaviewer/lumiya/utils/UUIDPool;->getUUID(Ljava/util/UUID;)Ljava/util/UUID;

    move-result-object v0

    iput-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->uuid:Ljava/util/UUID;

    iput-object p3, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->name:Ljava/lang/String;

    iput p4, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/mutelist/MuteListEntry;->flags:I

    return-void
.end method
