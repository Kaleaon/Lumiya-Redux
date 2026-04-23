.class public Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xc
    name = "UploadImageResult"
.end annotation


# instance fields
.field public final errorMessage:Ljava/lang/String;
    .annotation runtime Ljavax/annotation/Nullable;
    .end annotation
.end field

.field public final success:Z


# direct methods
.method private constructor <init>(ZLjava/lang/String;)V
    .locals 0
    .param p2    # Ljava/lang/String;
        .annotation runtime Ljavax/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-boolean p1, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;->success:Z

    iput-object p2, p0, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;->errorMessage:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(ZLjava/lang/String;Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/ui/inventory/UploadImageAsyncTask$UploadImageResult;-><init>(ZLjava/lang/String;)V

    return-void
.end method
