.class public final enum Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;
.super Ljava/lang/Enum;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x4019
    name = "ConnectionState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

.field public static final enum Connected:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

.field public static final enum Connecting:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

.field public static final enum Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;


# direct methods
.method static constructor <clinit>()V
    .locals 5

    const/4 v4, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    const-string/jumbo v1, "Idle"

    invoke-direct {v0, v1, v2}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    const-string/jumbo v1, "Connecting"

    invoke-direct {v0, v1, v3}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connecting:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    const-string/jumbo v1, "Connected"

    invoke-direct {v0, v1, v4}, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connected:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    const/4 v0, 0x3

    new-array v0, v0, [Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Idle:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    aput-object v1, v0, v2

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connecting:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    aput-object v1, v0, v3

    sget-object v1, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->Connected:Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    aput-object v1, v0, v4

    sput-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;
    .locals 1

    const-class v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    return-object v0
.end method

.method public static values()[Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;
    .locals 1

    sget-object v0, Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;->$VALUES:[Lcom/lumiyaviewer/lumiya/slproto/SLGridConnection$ConnectionState;

    return-object v0
.end method
