.class public Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LLSDMapEntry"
.end annotation


# instance fields
.field final key:Ljava/lang/String;

.field final value:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;->key:Ljava/lang/String;

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/slproto/llsd/types/LLSDMap$LLSDMapEntry;->value:Lcom/lumiyaviewer/lumiya/slproto/llsd/LLSDNode;

    return-void
.end method
