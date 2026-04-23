.class Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;
.super Ljava/util/TimerTask;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AgentUpdateTimerTask"
.end annotation


# instance fields
.field private final scheduledInterval:I

.field final synthetic this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;


# direct methods
.method private constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;I)V
    .locals 0

    iput-object p1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-direct {p0}, Ljava/util/TimerTask;-><init>()V

    iput p2, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;->scheduledInterval:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;ILcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;-><init>(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;I)V

    return-void
.end method


# virtual methods
.method getScheduledInterval()I
    .locals 1

    iget v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;->scheduledInterval:I

    return v0
.end method

.method public run()V
    .locals 2

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    invoke-static {v0}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->-get0(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iget-object v1, p0, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl$AgentUpdateTimerTask;->this$0:Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->agentCircuit:Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;

    invoke-virtual {v1}, Lcom/lumiyaviewer/lumiya/slproto/SLAgentCircuit;->getModules()Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;

    move-result-object v1

    iget-object v1, v1, Lcom/lumiyaviewer/lumiya/slproto/modules/SLModules;->drawDistance:Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;

    invoke-static {v0, v1}, Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;->-wrap1(Lcom/lumiyaviewer/lumiya/slproto/modules/SLAvatarControl;Lcom/lumiyaviewer/lumiya/slproto/modules/SLDrawDistance;)V

    :cond_0
    return-void
.end method
