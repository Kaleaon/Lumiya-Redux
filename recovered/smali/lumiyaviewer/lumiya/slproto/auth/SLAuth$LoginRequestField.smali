.class Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "LoginRequestField"
.end annotation


# instance fields
.field public final name:Ljava/lang/String;

.field public final value:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;->name:Ljava/lang/String;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;->value:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/auth/SLAuth$LoginRequestField;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
