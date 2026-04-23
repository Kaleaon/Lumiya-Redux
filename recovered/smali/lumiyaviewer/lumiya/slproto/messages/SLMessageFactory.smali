.class public Lcom/lumiyaviewer/lumiya/slproto/messages/SLMessageFactory;
.super Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static CreateByID(I)Lcom/lumiyaviewer/lumiya/slproto/SLMessage;
    .locals 1

    sparse-switch p0, :sswitch_data_0

    const/4 v0, 0x0

    return-object v0

    :sswitch_0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TestMessage;-><init>()V

    return-object v0

    :sswitch_1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PacketAck;-><init>()V

    return-object v0

    :sswitch_2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/OpenCircuit;-><init>()V

    return-object v0

    :sswitch_3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CloseCircuit;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CloseCircuit;-><init>()V

    return-object v0

    :sswitch_4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartPingCheck;-><init>()V

    return-object v0

    :sswitch_5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CompletePingCheck;-><init>()V

    return-object v0

    :sswitch_6
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AddCircuitCode;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AddCircuitCode;-><init>()V

    return-object v0

    :sswitch_7
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCircuitCode;-><init>()V

    return-object v0

    :sswitch_8
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/NeighborList;-><init>()V

    return-object v0

    :sswitch_9
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarTextureUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarTextureUpdate;-><init>()V

    return-object v0

    :sswitch_a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorMapUpdate;-><init>()V

    return-object v0

    :sswitch_b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorSetMap;-><init>()V

    return-object v0

    :sswitch_c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SubscribeLoad;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SubscribeLoad;-><init>()V

    return-object v0

    :sswitch_d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UnsubscribeLoad;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UnsubscribeLoad;-><init>()V

    return-object v0

    :sswitch_e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorReady;-><init>()V

    return-object v0

    :sswitch_f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TelehubInfo;-><init>()V

    return-object v0

    :sswitch_10
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorPresentAtLocation;-><init>()V

    return-object v0

    :sswitch_11
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorLoad;-><init>()V

    return-object v0

    :sswitch_12
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorShutdownRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorShutdownRequest;-><init>()V

    return-object v0

    :sswitch_13
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionPresenceRequestByRegionID;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionPresenceRequestByRegionID;-><init>()V

    return-object v0

    :sswitch_14
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionPresenceRequestByHandle;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionPresenceRequestByHandle;-><init>()V

    return-object v0

    :sswitch_15
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionPresenceResponse;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionPresenceResponse;-><init>()V

    return-object v0

    :sswitch_16
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateSimulator;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateSimulator;-><init>()V

    return-object v0

    :sswitch_17
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogDwellTime;-><init>()V

    return-object v0

    :sswitch_18
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FeatureDisabled;-><init>()V

    return-object v0

    :sswitch_19
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogFailedMoneyTransaction;-><init>()V

    return-object v0

    :sswitch_1a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReportInternal;-><init>()V

    return-object v0

    :sswitch_1b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimStatusInDatabase;-><init>()V

    return-object v0

    :sswitch_1c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetSimPresenceInDatabase;-><init>()V

    return-object v0

    :sswitch_1d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyDataRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyDataRequest;-><init>()V

    return-object v0

    :sswitch_1e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EconomyData;-><init>()V

    return-object v0

    :sswitch_1f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequest;-><init>()V

    return-object v0

    :sswitch_20
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerRequestBackend;-><init>()V

    return-object v0

    :sswitch_21
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPickerReply;-><init>()V

    return-object v0

    :sswitch_22
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesQuery;-><init>()V

    return-object v0

    :sswitch_23
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PlacesReply;-><init>()V

    return-object v0

    :sswitch_24
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQuery;-><init>()V

    return-object v0

    :sswitch_25
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirFindQueryBackend;-><init>()V

    return-object v0

    :sswitch_26
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQuery;-><init>()V

    return-object v0

    :sswitch_27
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQueryBackend;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesQueryBackend;-><init>()V

    return-object v0

    :sswitch_28
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPlacesReply;-><init>()V

    return-object v0

    :sswitch_29
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPeopleReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPeopleReply;-><init>()V

    return-object v0

    :sswitch_2a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirEventsReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirEventsReply;-><init>()V

    return-object v0

    :sswitch_2b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirGroupsReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirGroupsReply;-><init>()V

    return-object v0

    :sswitch_2c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQuery;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQuery;-><init>()V

    return-object v0

    :sswitch_2d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedQueryBackend;-><init>()V

    return-object v0

    :sswitch_2e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirClassifiedReply;-><init>()V

    return-object v0

    :sswitch_2f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarClassifiedReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarClassifiedReply;-><init>()V

    return-object v0

    :sswitch_30
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoRequest;-><init>()V

    return-object v0

    :sswitch_31
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoReply;-><init>()V

    return-object v0

    :sswitch_32
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedInfoUpdate;-><init>()V

    return-object v0

    :sswitch_33
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedDelete;-><init>()V

    return-object v0

    :sswitch_34
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedGodDelete;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClassifiedGodDelete;-><init>()V

    return-object v0

    :sswitch_35
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQuery;-><init>()V

    return-object v0

    :sswitch_36
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandQueryBackend;-><init>()V

    return-object v0

    :sswitch_37
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirLandReply;-><init>()V

    return-object v0

    :sswitch_38
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQuery;-><init>()V

    return-object v0

    :sswitch_39
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularQueryBackend;-><init>()V

    return-object v0

    :sswitch_3a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DirPopularReply;-><init>()V

    return-object v0

    :sswitch_3b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoRequest;-><init>()V

    return-object v0

    :sswitch_3c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelInfoReply;-><init>()V

    return-object v0

    :sswitch_3d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelObjectOwnersRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelObjectOwnersRequest;-><init>()V

    return-object v0

    :sswitch_3e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelObjectOwnersReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelObjectOwnersReply;-><init>()V

    return-object v0

    :sswitch_3f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticesListRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticesListRequest;-><init>()V

    return-object v0

    :sswitch_40
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticesListReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticesListReply;-><init>()V

    return-object v0

    :sswitch_41
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeRequest;-><init>()V

    return-object v0

    :sswitch_42
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupNoticeAdd;-><init>()V

    return-object v0

    :sswitch_43
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportRequest;-><init>()V

    return-object v0

    :sswitch_44
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocationRequest;-><init>()V

    return-object v0

    :sswitch_45
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocal;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLocal;-><init>()V

    return-object v0

    :sswitch_46
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandmarkRequest;-><init>()V

    return-object v0

    :sswitch_47
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportProgress;-><init>()V

    return-object v0

    :sswitch_48
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataHomeLocationRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DataHomeLocationRequest;-><init>()V

    return-object v0

    :sswitch_49
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataHomeLocationReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DataHomeLocationReply;-><init>()V

    return-object v0

    :sswitch_4a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFinish;-><init>()V

    return-object v0

    :sswitch_4b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartLure;-><init>()V

    return-object v0

    :sswitch_4c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLureRequest;-><init>()V

    return-object v0

    :sswitch_4d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportCancel;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportCancel;-><init>()V

    return-object v0

    :sswitch_4e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportStart;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportStart;-><init>()V

    return-object v0

    :sswitch_4f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFailed;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportFailed;-><init>()V

    return-object v0

    :sswitch_50
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Undo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/Undo;-><init>()V

    return-object v0

    :sswitch_51
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Redo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/Redo;-><init>()V

    return-object v0

    :sswitch_52
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UndoLand;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UndoLand;-><init>()V

    return-object v0

    :sswitch_53
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentPause;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentPause;-><init>()V

    return-object v0

    :sswitch_54
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentResume;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentResume;-><init>()V

    return-object v0

    :sswitch_55
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentUpdate;-><init>()V

    return-object v0

    :sswitch_56
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromViewer;-><init>()V

    return-object v0

    :sswitch_57
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentThrottle;-><init>()V

    return-object v0

    :sswitch_58
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentFOV;-><init>()V

    return-object v0

    :sswitch_59
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentHeightWidth;-><init>()V

    return-object v0

    :sswitch_5a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSetAppearance;-><init>()V

    return-object v0

    :sswitch_5b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAnimation;-><init>()V

    return-object v0

    :sswitch_5c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentRequestSit;-><init>()V

    return-object v0

    :sswitch_5d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSit;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentSit;-><init>()V

    return-object v0

    :sswitch_5e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentQuitCopy;-><init>()V

    return-object v0

    :sswitch_5f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestImage;-><init>()V

    return-object v0

    :sswitch_60
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageNotInDatabase;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageNotInDatabase;-><init>()V

    return-object v0

    :sswitch_61
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RebakeAvatarTextures;-><init>()V

    return-object v0

    :sswitch_62
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetAlwaysRun;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetAlwaysRun;-><init>()V

    return-object v0

    :sswitch_63
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAdd;-><init>()V

    return-object v0

    :sswitch_64
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDelete;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDelete;-><init>()V

    return-object v0

    :sswitch_65
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDuplicate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDuplicate;-><init>()V

    return-object v0

    :sswitch_66
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDuplicateOnRay;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDuplicateOnRay;-><init>()V

    return-object v0

    :sswitch_67
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MultipleObjectUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MultipleObjectUpdate;-><init>()V

    return-object v0

    :sswitch_68
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestMultipleObjects;-><init>()V

    return-object v0

    :sswitch_69
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPosition;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPosition;-><init>()V

    return-object v0

    :sswitch_6a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectScale;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectScale;-><init>()V

    return-object v0

    :sswitch_6b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectRotation;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectRotation;-><init>()V

    return-object v0

    :sswitch_6c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectFlagUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectFlagUpdate;-><init>()V

    return-object v0

    :sswitch_6d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectClickAction;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectClickAction;-><init>()V

    return-object v0

    :sswitch_6e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectImage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectImage;-><init>()V

    return-object v0

    :sswitch_6f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectMaterial;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectMaterial;-><init>()V

    return-object v0

    :sswitch_70
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectShape;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectShape;-><init>()V

    return-object v0

    :sswitch_71
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectExtraParams;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectExtraParams;-><init>()V

    return-object v0

    :sswitch_72
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectOwner;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectOwner;-><init>()V

    return-object v0

    :sswitch_73
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGroup;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGroup;-><init>()V

    return-object v0

    :sswitch_74
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectBuy;-><init>()V

    return-object v0

    :sswitch_75
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/BuyObjectInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/BuyObjectInventory;-><init>()V

    return-object v0

    :sswitch_76
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DerezContainer;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DerezContainer;-><init>()V

    return-object v0

    :sswitch_77
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPermissions;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPermissions;-><init>()V

    return-object v0

    :sswitch_78
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSaleInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSaleInfo;-><init>()V

    return-object v0

    :sswitch_79
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectName;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectName;-><init>()V

    return-object v0

    :sswitch_7a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDescription;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDescription;-><init>()V

    return-object v0

    :sswitch_7b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectCategory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectCategory;-><init>()V

    return-object v0

    :sswitch_7c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSelect;-><init>()V

    return-object v0

    :sswitch_7d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeselect;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeselect;-><init>()V

    return-object v0

    :sswitch_7e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAttach;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectAttach;-><init>()V

    return-object v0

    :sswitch_7f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDetach;-><init>()V

    return-object v0

    :sswitch_80
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDrop;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDrop;-><init>()V

    return-object v0

    :sswitch_81
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectLink;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectLink;-><init>()V

    return-object v0

    :sswitch_82
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDelink;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDelink;-><init>()V

    return-object v0

    :sswitch_83
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrab;-><init>()V

    return-object v0

    :sswitch_84
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrabUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectGrabUpdate;-><init>()V

    return-object v0

    :sswitch_85
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectDeGrab;-><init>()V

    return-object v0

    :sswitch_86
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSpinStart;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSpinStart;-><init>()V

    return-object v0

    :sswitch_87
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSpinUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSpinUpdate;-><init>()V

    return-object v0

    :sswitch_88
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSpinStop;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectSpinStop;-><init>()V

    return-object v0

    :sswitch_89
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectExportSelected;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectExportSelected;-><init>()V

    return-object v0

    :sswitch_8a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ModifyLand;-><init>()V

    return-object v0

    :sswitch_8b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/VelocityInterpolateOn;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/VelocityInterpolateOn;-><init>()V

    return-object v0

    :sswitch_8c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/VelocityInterpolateOff;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/VelocityInterpolateOff;-><init>()V

    return-object v0

    :sswitch_8d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StateSave;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StateSave;-><init>()V

    return-object v0

    :sswitch_8e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReportAutosaveCrash;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ReportAutosaveCrash;-><init>()V

    return-object v0

    :sswitch_8f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimWideDeletes;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimWideDeletes;-><init>()V

    return-object v0

    :sswitch_90
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestObjectPropertiesFamily;-><init>()V

    return-object v0

    :sswitch_91
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TrackAgent;-><init>()V

    return-object v0

    :sswitch_92
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStats;-><init>()V

    return-object v0

    :sswitch_93
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptAnswerYes;-><init>()V

    return-object v0

    :sswitch_94
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReport;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserReport;-><init>()V

    return-object v0

    :sswitch_95
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AlertMessage;-><init>()V

    return-object v0

    :sswitch_96
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentAlertMessage;-><init>()V

    return-object v0

    :sswitch_97
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MeanCollisionAlert;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MeanCollisionAlert;-><init>()V

    return-object v0

    :sswitch_98
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerFrozenMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerFrozenMessage;-><init>()V

    return-object v0

    :sswitch_99
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/HealthMessage;-><init>()V

    return-object v0

    :sswitch_9a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatFromSimulator;-><init>()V

    return-object v0

    :sswitch_9b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStats;-><init>()V

    return-object v0

    :sswitch_9c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestRegionInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestRegionInfo;-><init>()V

    return-object v0

    :sswitch_9d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionInfo;-><init>()V

    return-object v0

    :sswitch_9e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodUpdateRegionInfo;-><init>()V

    return-object v0

    :sswitch_9f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/NearestLandingRegionRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/NearestLandingRegionRequest;-><init>()V

    return-object v0

    :sswitch_a0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/NearestLandingRegionReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/NearestLandingRegionReply;-><init>()V

    return-object v0

    :sswitch_a1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/NearestLandingRegionUpdated;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/NearestLandingRegionUpdated;-><init>()V

    return-object v0

    :sswitch_a2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TeleportLandingStatusChanged;-><init>()V

    return-object v0

    :sswitch_a3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshake;-><init>()V

    return-object v0

    :sswitch_a4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandshakeReply;-><init>()V

    return-object v0

    :sswitch_a5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CoarseLocationUpdate;-><init>()V

    return-object v0

    :sswitch_a6
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImageData;-><init>()V

    return-object v0

    :sswitch_a7
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImagePacket;-><init>()V

    return-object v0

    :sswitch_a8
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LayerData;-><init>()V

    return-object v0

    :sswitch_a9
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdate;-><init>()V

    return-object v0

    :sswitch_aa
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCompressed;-><init>()V

    return-object v0

    :sswitch_ab
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCached;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectUpdateCached;-><init>()V

    return-object v0

    :sswitch_ac
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedTerseObjectUpdate;-><init>()V

    return-object v0

    :sswitch_ad
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KillObject;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/KillObject;-><init>()V

    return-object v0

    :sswitch_ae
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CrossedRegion;-><init>()V

    return-object v0

    :sswitch_af
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimulatorViewerTimeMessage;-><init>()V

    return-object v0

    :sswitch_b0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EnableSimulator;-><init>()V

    return-object v0

    :sswitch_b1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DisableSimulator;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DisableSimulator;-><init>()V

    return-object v0

    :sswitch_b2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmEnableSimulator;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmEnableSimulator;-><init>()V

    return-object v0

    :sswitch_b3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferRequest;-><init>()V

    return-object v0

    :sswitch_b4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInfo;-><init>()V

    return-object v0

    :sswitch_b5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferPacket;-><init>()V

    return-object v0

    :sswitch_b6
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferAbort;-><init>()V

    return-object v0

    :sswitch_b7
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestXfer;-><init>()V

    return-object v0

    :sswitch_b8
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendXferPacket;-><init>()V

    return-object v0

    :sswitch_b9
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmXferPacket;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmXferPacket;-><init>()V

    return-object v0

    :sswitch_ba
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AbortXfer;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AbortXfer;-><init>()V

    return-object v0

    :sswitch_bb
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAnimation;-><init>()V

    return-object v0

    :sswitch_bc
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarAppearance;-><init>()V

    return-object v0

    :sswitch_bd
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarSitResponse;-><init>()V

    return-object v0

    :sswitch_be
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetFollowCamProperties;-><init>()V

    return-object v0

    :sswitch_bf
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ClearFollowCamProperties;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ClearFollowCamProperties;-><init>()V

    return-object v0

    :sswitch_c0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CameraConstraint;-><init>()V

    return-object v0

    :sswitch_c1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectProperties;-><init>()V

    return-object v0

    :sswitch_c2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectPropertiesFamily;-><init>()V

    return-object v0

    :sswitch_c3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestPayPrice;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestPayPrice;-><init>()V

    return-object v0

    :sswitch_c4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PayPriceReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PayPriceReply;-><init>()V

    return-object v0

    :sswitch_c5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUser;-><init>()V

    return-object v0

    :sswitch_c6
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUserAck;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/KickUserAck;-><init>()V

    return-object v0

    :sswitch_c7
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodKickUser;-><init>()V

    return-object v0

    :sswitch_c8
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemKickUser;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemKickUser;-><init>()V

    return-object v0

    :sswitch_c9
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectUser;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectUser;-><init>()V

    return-object v0

    :sswitch_ca
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FreezeUser;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FreezeUser;-><init>()V

    return-object v0

    :sswitch_cb
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequest;-><init>()V

    return-object v0

    :sswitch_cc
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesRequestBackend;-><init>()V

    return-object v0

    :sswitch_cd
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesReply;-><init>()V

    return-object v0

    :sswitch_ce
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsReply;-><init>()V

    return-object v0

    :sswitch_cf
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarGroupsReply;-><init>()V

    return-object v0

    :sswitch_d0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPropertiesUpdate;-><init>()V

    return-object v0

    :sswitch_d1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarInterestsUpdate;-><init>()V

    return-object v0

    :sswitch_d2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesReply;-><init>()V

    return-object v0

    :sswitch_d3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarNotesUpdate;-><init>()V

    return-object v0

    :sswitch_d4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AvatarPicksReply;-><init>()V

    return-object v0

    :sswitch_d5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoRequest;-><init>()V

    return-object v0

    :sswitch_d6
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventInfoReply;-><init>()V

    return-object v0

    :sswitch_d7
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationAddRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationAddRequest;-><init>()V

    return-object v0

    :sswitch_d8
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventNotificationRemoveRequest;-><init>()V

    return-object v0

    :sswitch_d9
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventGodDelete;-><init>()V

    return-object v0

    :sswitch_da
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoReply;-><init>()V

    return-object v0

    :sswitch_db
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickInfoUpdate;-><init>()V

    return-object v0

    :sswitch_dc
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickDelete;-><init>()V

    return-object v0

    :sswitch_dd
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PickGodDelete;-><init>()V

    return-object v0

    :sswitch_de
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptQuestion;-><init>()V

    return-object v0

    :sswitch_df
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptControlChange;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptControlChange;-><init>()V

    return-object v0

    :sswitch_e0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialog;-><init>()V

    return-object v0

    :sswitch_e1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDialogReply;-><init>()V

    return-object v0

    :sswitch_e2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ForceScriptControlRelease;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ForceScriptControlRelease;-><init>()V

    return-object v0

    :sswitch_e3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RevokePermissions;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RevokePermissions;-><init>()V

    return-object v0

    :sswitch_e4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LoadURL;-><init>()V

    return-object v0

    :sswitch_e5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptTeleportRequest;-><init>()V

    return-object v0

    :sswitch_e6
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelOverlay;-><init>()V

    return-object v0

    :sswitch_e7
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequest;-><init>()V

    return-object v0

    :sswitch_e8
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequestByID;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesRequestByID;-><init>()V

    return-object v0

    :sswitch_e9
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelProperties;-><init>()V

    return-object v0

    :sswitch_ea
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelPropertiesUpdate;-><init>()V

    return-object v0

    :sswitch_eb
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReturnObjects;-><init>()V

    return-object v0

    :sswitch_ec
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelSetOtherCleanTime;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelSetOtherCleanTime;-><init>()V

    return-object v0

    :sswitch_ed
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDisableObjects;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDisableObjects;-><init>()V

    return-object v0

    :sswitch_ee
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelSelectObjects;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelSelectObjects;-><init>()V

    return-object v0

    :sswitch_ef
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantRequest;-><init>()V

    return-object v0

    :sswitch_f0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateCovenantReply;-><init>()V

    return-object v0

    :sswitch_f1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ForceObjectSelect;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ForceObjectSelect;-><init>()V

    return-object v0

    :sswitch_f2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuyPass;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuyPass;-><init>()V

    return-object v0

    :sswitch_f3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDeedToGroup;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDeedToGroup;-><init>()V

    return-object v0

    :sswitch_f4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReclaim;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelReclaim;-><init>()V

    return-object v0

    :sswitch_f5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelClaim;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelClaim;-><init>()V

    return-object v0

    :sswitch_f6
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelJoin;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelJoin;-><init>()V

    return-object v0

    :sswitch_f7
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDivide;-><init>()V

    return-object v0

    :sswitch_f8
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRelease;-><init>()V

    return-object v0

    :sswitch_f9
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelBuy;-><init>()V

    return-object v0

    :sswitch_fa
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelGodForceOwner;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelGodForceOwner;-><init>()V

    return-object v0

    :sswitch_fb
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListRequest;-><init>()V

    return-object v0

    :sswitch_fc
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListReply;-><init>()V

    return-object v0

    :sswitch_fd
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAccessListUpdate;-><init>()V

    return-object v0

    :sswitch_fe
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDwellRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDwellRequest;-><init>()V

    return-object v0

    :sswitch_ff
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDwellReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelDwellReply;-><init>()V

    return-object v0

    :sswitch_100
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestParcelTransfer;-><init>()V

    return-object v0

    :sswitch_101
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateParcel;-><init>()V

    return-object v0

    :sswitch_102
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveParcel;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveParcel;-><init>()V

    return-object v0

    :sswitch_103
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MergeParcel;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MergeParcel;-><init>()V

    return-object v0

    :sswitch_104
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogParcelChanges;-><init>()V

    return-object v0

    :sswitch_105
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CheckParcelSales;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CheckParcelSales;-><init>()V

    return-object v0

    :sswitch_106
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelSales;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelSales;-><init>()V

    return-object v0

    :sswitch_107
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelGodMarkAsContent;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelGodMarkAsContent;-><init>()V

    return-object v0

    :sswitch_108
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerStartAuction;-><init>()V

    return-object v0

    :sswitch_109
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartAuction;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartAuction;-><init>()V

    return-object v0

    :sswitch_10a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ConfirmAuctionStart;-><init>()V

    return-object v0

    :sswitch_10b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAuction;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAuction;-><init>()V

    return-object v0

    :sswitch_10c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CancelAuction;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CancelAuction;-><init>()V

    return-object v0

    :sswitch_10d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CheckParcelAuctions;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CheckParcelAuctions;-><init>()V

    return-object v0

    :sswitch_10e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAuctions;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelAuctions;-><init>()V

    return-object v0

    :sswitch_10f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameRequest;-><init>()V

    return-object v0

    :sswitch_110
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDNameReply;-><init>()V

    return-object v0

    :sswitch_111
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDGroupNameRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDGroupNameRequest;-><init>()V

    return-object v0

    :sswitch_112
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDGroupNameReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UUIDGroupNameReply;-><init>()V

    return-object v0

    :sswitch_113
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChatPass;-><init>()V

    return-object v0

    :sswitch_114
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EdgeDataPacket;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EdgeDataPacket;-><init>()V

    return-object v0

    :sswitch_115
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimStatus;-><init>()V

    return-object v0

    :sswitch_116
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUpdate;-><init>()V

    return-object v0

    :sswitch_117
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentAlive;-><init>()V

    return-object v0

    :sswitch_118
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentPositionUpdate;-><init>()V

    return-object v0

    :sswitch_119
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentDying;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentDying;-><init>()V

    return-object v0

    :sswitch_11a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUnknown;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChildAgentUnknown;-><init>()V

    return-object v0

    :sswitch_11b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AtomicPassObject;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AtomicPassObject;-><init>()V

    return-object v0

    :sswitch_11c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/KillChildAgents;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/KillChildAgents;-><init>()V

    return-object v0

    :sswitch_11d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GetScriptRunning;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GetScriptRunning;-><init>()V

    return-object v0

    :sswitch_11e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptRunningReply;-><init>()V

    return-object v0

    :sswitch_11f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetScriptRunning;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetScriptRunning;-><init>()V

    return-object v0

    :sswitch_120
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptReset;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptReset;-><init>()V

    return-object v0

    :sswitch_121
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorRequest;-><init>()V

    return-object v0

    :sswitch_122
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptSensorReply;-><init>()V

    return-object v0

    :sswitch_123
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAgentMovement;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CompleteAgentMovement;-><init>()V

    return-object v0

    :sswitch_124
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentMovementComplete;-><init>()V

    return-object v0

    :sswitch_125
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DataServerLogout;-><init>()V

    return-object v0

    :sswitch_126
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogoutRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogoutRequest;-><init>()V

    return-object v0

    :sswitch_127
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogoutReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogoutReply;-><init>()V

    return-object v0

    :sswitch_128
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ImprovedInstantMessage;-><init>()V

    return-object v0

    :sswitch_129
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RetrieveInstantMessages;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RetrieveInstantMessages;-><init>()V

    return-object v0

    :sswitch_12a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FindAgent;-><init>()V

    return-object v0

    :sswitch_12b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestGodlikePowers;-><init>()V

    return-object v0

    :sswitch_12c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantGodlikePowers;-><init>()V

    return-object v0

    :sswitch_12d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GodlikeMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GodlikeMessage;-><init>()V

    return-object v0

    :sswitch_12e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EstateOwnerMessage;-><init>()V

    return-object v0

    :sswitch_12f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GenericMessage;-><init>()V

    return-object v0

    :sswitch_130
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListRequest;-><init>()V

    return-object v0

    :sswitch_131
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateMuteListEntry;-><init>()V

    return-object v0

    :sswitch_132
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveMuteListEntry;-><init>()V

    return-object v0

    :sswitch_133
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryFromNotecard;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryFromNotecard;-><init>()V

    return-object v0

    :sswitch_134
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryItem;-><init>()V

    return-object v0

    :sswitch_135
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateCreateInventoryItem;-><init>()V

    return-object v0

    :sswitch_136
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryItem;-><init>()V

    return-object v0

    :sswitch_137
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CopyInventoryItem;-><init>()V

    return-object v0

    :sswitch_138
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryItem;-><init>()V

    return-object v0

    :sswitch_139
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChangeInventoryItemFlags;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChangeInventoryItemFlags;-><init>()V

    return-object v0

    :sswitch_13a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SaveAssetIntoInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SaveAssetIntoInventory;-><init>()V

    return-object v0

    :sswitch_13b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryFolder;-><init>()V

    return-object v0

    :sswitch_13c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateInventoryFolder;-><init>()V

    return-object v0

    :sswitch_13d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryFolder;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveInventoryFolder;-><init>()V

    return-object v0

    :sswitch_13e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryFolder;-><init>()V

    return-object v0

    :sswitch_13f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryDescendents;-><init>()V

    return-object v0

    :sswitch_140
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryDescendents;-><init>()V

    return-object v0

    :sswitch_141
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventory;-><init>()V

    return-object v0

    :sswitch_142
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FetchInventoryReply;-><init>()V

    return-object v0

    :sswitch_143
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/BulkUpdateInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/BulkUpdateInventory;-><init>()V

    return-object v0

    :sswitch_144
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestInventoryAsset;-><init>()V

    return-object v0

    :sswitch_145
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InventoryAssetResponse;-><init>()V

    return-object v0

    :sswitch_146
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveInventoryObjects;-><init>()V

    return-object v0

    :sswitch_147
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PurgeInventoryDescendents;-><init>()V

    return-object v0

    :sswitch_148
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateTaskInventory;-><init>()V

    return-object v0

    :sswitch_149
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveTaskInventory;-><init>()V

    return-object v0

    :sswitch_14a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoveTaskInventory;-><init>()V

    return-object v0

    :sswitch_14b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTaskInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTaskInventory;-><init>()V

    return-object v0

    :sswitch_14c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ReplyTaskInventory;-><init>()V

    return-object v0

    :sswitch_14d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezObject;-><init>()V

    return-object v0

    :sswitch_14e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezAck;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeRezAck;-><init>()V

    return-object v0

    :sswitch_14f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObject;-><init>()V

    return-object v0

    :sswitch_150
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezObjectFromNotecard;-><init>()V

    return-object v0

    :sswitch_151
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInventory;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInventory;-><init>()V

    return-object v0

    :sswitch_152
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInventoryAck;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TransferInventoryAck;-><init>()V

    return-object v0

    :sswitch_153
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptFriendship;-><init>()V

    return-object v0

    :sswitch_154
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineFriendship;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineFriendship;-><init>()V

    return-object v0

    :sswitch_155
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/FormFriendship;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/FormFriendship;-><init>()V

    return-object v0

    :sswitch_156
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TerminateFriendship;-><init>()V

    return-object v0

    :sswitch_157
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/OfferCallingCard;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/OfferCallingCard;-><init>()V

    return-object v0

    :sswitch_158
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptCallingCard;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AcceptCallingCard;-><init>()V

    return-object v0

    :sswitch_159
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeclineCallingCard;-><init>()V

    return-object v0

    :sswitch_15a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezScript;-><init>()V

    return-object v0

    :sswitch_15b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateInventoryItem;-><init>()V

    return-object v0

    :sswitch_15c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateLandmarkForEvent;-><init>()V

    return-object v0

    :sswitch_15d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationRequest;-><init>()V

    return-object v0

    :sswitch_15e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EventLocationReply;-><init>()V

    return-object v0

    :sswitch_15f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandleRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionHandleRequest;-><init>()V

    return-object v0

    :sswitch_160
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RegionIDAndHandleReply;-><init>()V

    return-object v0

    :sswitch_161
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferRequest;-><init>()V

    return-object v0

    :sswitch_162
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyTransferBackend;-><init>()V

    return-object v0

    :sswitch_163
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceRequest;-><init>()V

    return-object v0

    :sswitch_164
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MoneyBalanceReply;-><init>()V

    return-object v0

    :sswitch_165
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RoutedMoneyBalanceReply;-><init>()V

    return-object v0

    :sswitch_166
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGestures;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGestures;-><init>()V

    return-object v0

    :sswitch_167
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DeactivateGestures;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DeactivateGestures;-><init>()V

    return-object v0

    :sswitch_168
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MuteListUpdate;-><init>()V

    return-object v0

    :sswitch_169
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCachedMuteList;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UseCachedMuteList;-><init>()V

    return-object v0

    :sswitch_16a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantUserRights;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GrantUserRights;-><init>()V

    return-object v0

    :sswitch_16b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ChangeUserRights;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ChangeUserRights;-><init>()V

    return-object v0

    :sswitch_16c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/OnlineNotification;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/OnlineNotification;-><init>()V

    return-object v0

    :sswitch_16d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/OfflineNotification;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/OfflineNotification;-><init>()V

    return-object v0

    :sswitch_16e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocationRequest;-><init>()V

    return-object v0

    :sswitch_16f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetStartLocation;-><init>()V

    return-object v0

    :sswitch_170
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/NetTest;-><init>()V

    return-object v0

    :sswitch_171
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetCPURatio;-><init>()V

    return-object v0

    :sswitch_172
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SimCrashed;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SimCrashed;-><init>()V

    return-object v0

    :sswitch_173
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/NameValuePair;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/NameValuePair;-><init>()V

    return-object v0

    :sswitch_174
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveNameValuePair;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveNameValuePair;-><init>()V

    return-object v0

    :sswitch_175
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateAttachment;-><init>()V

    return-object v0

    :sswitch_176
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RemoveAttachment;-><init>()V

    return-object v0

    :sswitch_177
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SoundTrigger;-><init>()V

    return-object v0

    :sswitch_178
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AttachedSound;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AttachedSound;-><init>()V

    return-object v0

    :sswitch_179
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AttachedSoundGainChange;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AttachedSoundGainChange;-><init>()V

    return-object v0

    :sswitch_17a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/PreloadSound;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/PreloadSound;-><init>()V

    return-object v0

    :sswitch_17b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadRequest;-><init>()V

    return-object v0

    :sswitch_17c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AssetUploadComplete;-><init>()V

    return-object v0

    :sswitch_17d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageRequest;-><init>()V

    return-object v0

    :sswitch_17e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EmailMessageReply;-><init>()V

    return-object v0

    :sswitch_17f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InternalScriptMail;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InternalScriptMail;-><init>()V

    return-object v0

    :sswitch_180
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataRequest;-><init>()V

    return-object v0

    :sswitch_181
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptDataReply;-><init>()V

    return-object v0

    :sswitch_182
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupRequest;-><init>()V

    return-object v0

    :sswitch_183
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateGroupReply;-><init>()V

    return-object v0

    :sswitch_184
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateGroupInfo;-><init>()V

    return-object v0

    :sswitch_185
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleChanges;-><init>()V

    return-object v0

    :sswitch_186
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupRequest;-><init>()V

    return-object v0

    :sswitch_187
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/JoinGroupReply;-><init>()V

    return-object v0

    :sswitch_188
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberRequest;-><init>()V

    return-object v0

    :sswitch_189
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/EjectGroupMemberReply;-><init>()V

    return-object v0

    :sswitch_18a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupRequest;-><init>()V

    return-object v0

    :sswitch_18b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LeaveGroupReply;-><init>()V

    return-object v0

    :sswitch_18c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupRequest;-><init>()V

    return-object v0

    :sswitch_18d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InviteGroupResponse;-><init>()V

    return-object v0

    :sswitch_18e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileRequest;-><init>()V

    return-object v0

    :sswitch_18f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProfileReply;-><init>()V

    return-object v0

    :sswitch_190
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryRequest;-><init>()V

    return-object v0

    :sswitch_191
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountSummaryReply;-><init>()V

    return-object v0

    :sswitch_192
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsRequest;-><init>()V

    return-object v0

    :sswitch_193
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountDetailsReply;-><init>()V

    return-object v0

    :sswitch_194
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsRequest;-><init>()V

    return-object v0

    :sswitch_195
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupAccountTransactionsReply;-><init>()V

    return-object v0

    :sswitch_196
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalsRequest;-><init>()V

    return-object v0

    :sswitch_197
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalItemReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupActiveProposalItemReply;-><init>()V

    return-object v0

    :sswitch_198
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupVoteHistoryRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupVoteHistoryRequest;-><init>()V

    return-object v0

    :sswitch_199
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupVoteHistoryItemReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupVoteHistoryItemReply;-><init>()V

    return-object v0

    :sswitch_19a
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/StartGroupProposal;-><init>()V

    return-object v0

    :sswitch_19b
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProposalBallot;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupProposalBallot;-><init>()V

    return-object v0

    :sswitch_19c
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/TallyVotes;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/TallyVotes;-><init>()V

    return-object v0

    :sswitch_19d
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersRequest;-><init>()V

    return-object v0

    :sswitch_19e
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupMembersReply;-><init>()V

    return-object v0

    :sswitch_19f
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGroup;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ActivateGroup;-><init>()V

    return-object v0

    :sswitch_1a0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupContribution;-><init>()V

    return-object v0

    :sswitch_1a1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SetGroupAcceptNotices;-><init>()V

    return-object v0

    :sswitch_1a2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataRequest;-><init>()V

    return-object v0

    :sswitch_1a3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleDataReply;-><init>()V

    return-object v0

    :sswitch_1a4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersRequest;-><init>()V

    return-object v0

    :sswitch_1a5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleMembersReply;-><init>()V

    return-object v0

    :sswitch_1a6
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesRequest;-><init>()V

    return-object v0

    :sswitch_1a7
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitlesReply;-><init>()V

    return-object v0

    :sswitch_1a8
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupTitleUpdate;-><init>()V

    return-object v0

    :sswitch_1a9
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupRoleUpdate;-><init>()V

    return-object v0

    :sswitch_1aa
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupRequest;-><init>()V

    return-object v0

    :sswitch_1ab
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LiveHelpGroupReply;-><init>()V

    return-object v0

    :sswitch_1ac
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesRequest;-><init>()V

    return-object v0

    :sswitch_1ad
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentWearablesUpdate;-><init>()V

    return-object v0

    :sswitch_1ae
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentIsNowWearing;-><init>()V

    return-object v0

    :sswitch_1af
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentCachedTexture;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentCachedTexture;-><init>()V

    return-object v0

    :sswitch_1b0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentCachedTextureResponse;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentCachedTextureResponse;-><init>()V

    return-object v0

    :sswitch_1b1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdateRequest;-><init>()V

    return-object v0

    :sswitch_1b2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDataUpdate;-><init>()V

    return-object v0

    :sswitch_1b3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupDataUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/GroupDataUpdate;-><init>()V

    return-object v0

    :sswitch_1b4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentGroupDataUpdate;-><init>()V

    return-object v0

    :sswitch_1b5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDropGroup;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/AgentDropGroup;-><init>()V

    return-object v0

    :sswitch_1b6
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LogTextMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LogTextMessage;-><init>()V

    return-object v0

    :sswitch_1b7
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerEffect;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ViewerEffect;-><init>()V

    return-object v0

    :sswitch_1b8
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateTrustedCircuit;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateTrustedCircuit;-><init>()V

    return-object v0

    :sswitch_1b9
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DenyTrustedCircuit;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DenyTrustedCircuit;-><init>()V

    return-object v0

    :sswitch_1ba
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTrustedCircuit;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RequestTrustedCircuit;-><init>()V

    return-object v0

    :sswitch_1bb
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezSingleAttachmentFromInv;-><init>()V

    return-object v0

    :sswitch_1bc
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezMultipleAttachmentsFromInv;-><init>()V

    return-object v0

    :sswitch_1bd
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/DetachAttachmentIntoInv;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/DetachAttachmentIntoInv;-><init>()V

    return-object v0

    :sswitch_1be
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateNewOutfitAttachments;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/CreateNewOutfitAttachments;-><init>()V

    return-object v0

    :sswitch_1bf
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoRequest;-><init>()V

    return-object v0

    :sswitch_1c0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UserInfoReply;-><init>()V

    return-object v0

    :sswitch_1c1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/UpdateUserInfo;-><init>()V

    return-object v0

    :sswitch_1c2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRename;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelRename;-><init>()V

    return-object v0

    :sswitch_1c3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/InitiateDownload;-><init>()V

    return-object v0

    :sswitch_1c4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SystemMessage;-><init>()V

    return-object v0

    :sswitch_1c5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapLayerRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapLayerRequest;-><init>()V

    return-object v0

    :sswitch_1c6
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapLayerReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapLayerReply;-><init>()V

    return-object v0

    :sswitch_1c7
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockRequest;-><init>()V

    return-object v0

    :sswitch_1c8
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapNameRequest;-><init>()V

    return-object v0

    :sswitch_1c9
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapBlockReply;-><init>()V

    return-object v0

    :sswitch_1ca
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemRequest;-><init>()V

    return-object v0

    :sswitch_1cb
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/MapItemReply;-><init>()V

    return-object v0

    :sswitch_1cc
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/SendPostcard;-><init>()V

    return-object v0

    :sswitch_1cd
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcChannelRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcChannelRequest;-><init>()V

    return-object v0

    :sswitch_1ce
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcChannelReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcChannelReply;-><init>()V

    return-object v0

    :sswitch_1cf
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptRequestInbound;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptRequestInbound;-><init>()V

    return-object v0

    :sswitch_1d0
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptRequestInboundForward;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptRequestInboundForward;-><init>()V

    return-object v0

    :sswitch_1d1
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RpcScriptReplyInbound;-><init>()V

    return-object v0

    :sswitch_1d2
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ScriptMailRegistration;-><init>()V

    return-object v0

    :sswitch_1d3
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaCommandMessage;-><init>()V

    return-object v0

    :sswitch_1d4
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ParcelMediaUpdate;-><init>()V

    return-object v0

    :sswitch_1d5
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatRequest;-><init>()V

    return-object v0

    :sswitch_1d6
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatReply;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LandStatReply;-><init>()V

    return-object v0

    :sswitch_1d7
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/Error;-><init>()V

    return-object v0

    :sswitch_1d8
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectIncludeInSearch;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/ObjectIncludeInSearch;-><init>()V

    return-object v0

    :sswitch_1d9
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/RezRestoreToWorld;-><init>()V

    return-object v0

    :sswitch_1da
    new-instance v0, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;

    invoke-direct {v0}, Lcom/lumiyaviewer/lumiya/slproto/messages/LinkInventoryItem;-><init>()V

    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        -0xffff -> :sswitch_0
        -0xfffe -> :sswitch_6
        -0xfffd -> :sswitch_7
        -0xfffc -> :sswitch_9
        -0xfffb -> :sswitch_a
        -0xfffa -> :sswitch_b
        -0xfff9 -> :sswitch_c
        -0xfff8 -> :sswitch_d
        -0xfff7 -> :sswitch_e
        -0xfff6 -> :sswitch_f
        -0xfff5 -> :sswitch_10
        -0xfff4 -> :sswitch_11
        -0xfff3 -> :sswitch_12
        -0xfff2 -> :sswitch_13
        -0xfff1 -> :sswitch_14
        -0xfff0 -> :sswitch_15
        -0xffef -> :sswitch_16
        -0xffee -> :sswitch_17
        -0xffed -> :sswitch_18
        -0xffec -> :sswitch_19
        -0xffeb -> :sswitch_1a
        -0xffea -> :sswitch_1b
        -0xffe9 -> :sswitch_1c
        -0xffe8 -> :sswitch_1d
        -0xffe7 -> :sswitch_1e
        -0xffe6 -> :sswitch_1f
        -0xffe5 -> :sswitch_20
        -0xffe4 -> :sswitch_21
        -0xffe3 -> :sswitch_22
        -0xffe2 -> :sswitch_23
        -0xffe1 -> :sswitch_24
        -0xffe0 -> :sswitch_25
        -0xffdf -> :sswitch_26
        -0xffde -> :sswitch_27
        -0xffdd -> :sswitch_28
        -0xffdc -> :sswitch_29
        -0xffdb -> :sswitch_2a
        -0xffda -> :sswitch_2b
        -0xffd9 -> :sswitch_2c
        -0xffd8 -> :sswitch_2d
        -0xffd7 -> :sswitch_2e
        -0xffd6 -> :sswitch_2f
        -0xffd5 -> :sswitch_30
        -0xffd4 -> :sswitch_31
        -0xffd3 -> :sswitch_32
        -0xffd2 -> :sswitch_33
        -0xffd1 -> :sswitch_34
        -0xffd0 -> :sswitch_35
        -0xffcf -> :sswitch_36
        -0xffce -> :sswitch_37
        -0xffcd -> :sswitch_38
        -0xffcc -> :sswitch_39
        -0xffcb -> :sswitch_3a
        -0xffca -> :sswitch_3b
        -0xffc9 -> :sswitch_3c
        -0xffc8 -> :sswitch_3d
        -0xffc7 -> :sswitch_3e
        -0xffc6 -> :sswitch_3f
        -0xffc5 -> :sswitch_40
        -0xffc4 -> :sswitch_41
        -0xffc3 -> :sswitch_42
        -0xffc2 -> :sswitch_43
        -0xffc1 -> :sswitch_44
        -0xffc0 -> :sswitch_45
        -0xffbf -> :sswitch_46
        -0xffbe -> :sswitch_47
        -0xffbd -> :sswitch_48
        -0xffbc -> :sswitch_49
        -0xffbb -> :sswitch_4a
        -0xffba -> :sswitch_4b
        -0xffb9 -> :sswitch_4c
        -0xffb8 -> :sswitch_4d
        -0xffb7 -> :sswitch_4e
        -0xffb6 -> :sswitch_4f
        -0xffb5 -> :sswitch_50
        -0xffb4 -> :sswitch_51
        -0xffb3 -> :sswitch_52
        -0xffb2 -> :sswitch_53
        -0xffb1 -> :sswitch_54
        -0xffb0 -> :sswitch_56
        -0xffaf -> :sswitch_57
        -0xffae -> :sswitch_58
        -0xffad -> :sswitch_59
        -0xffac -> :sswitch_5a
        -0xffab -> :sswitch_5e
        -0xffaa -> :sswitch_60
        -0xffa9 -> :sswitch_61
        -0xffa8 -> :sswitch_62
        -0xffa7 -> :sswitch_64
        -0xffa6 -> :sswitch_65
        -0xffa5 -> :sswitch_66
        -0xffa4 -> :sswitch_6a
        -0xffa3 -> :sswitch_6b
        -0xffa2 -> :sswitch_6c
        -0xffa1 -> :sswitch_6d
        -0xffa0 -> :sswitch_6e
        -0xff9f -> :sswitch_6f
        -0xff9e -> :sswitch_70
        -0xff9d -> :sswitch_71
        -0xff9c -> :sswitch_72
        -0xff9b -> :sswitch_73
        -0xff9a -> :sswitch_74
        -0xff99 -> :sswitch_75
        -0xff98 -> :sswitch_76
        -0xff97 -> :sswitch_77
        -0xff96 -> :sswitch_78
        -0xff95 -> :sswitch_79
        -0xff94 -> :sswitch_7a
        -0xff93 -> :sswitch_7b
        -0xff92 -> :sswitch_7c
        -0xff91 -> :sswitch_7d
        -0xff90 -> :sswitch_7e
        -0xff8f -> :sswitch_7f
        -0xff8e -> :sswitch_80
        -0xff8d -> :sswitch_81
        -0xff8c -> :sswitch_82
        -0xff8b -> :sswitch_83
        -0xff8a -> :sswitch_84
        -0xff89 -> :sswitch_85
        -0xff88 -> :sswitch_86
        -0xff87 -> :sswitch_87
        -0xff86 -> :sswitch_88
        -0xff85 -> :sswitch_89
        -0xff84 -> :sswitch_8a
        -0xff83 -> :sswitch_8b
        -0xff82 -> :sswitch_8c
        -0xff81 -> :sswitch_8d
        -0xff80 -> :sswitch_8e
        -0xff7f -> :sswitch_8f
        -0xff7e -> :sswitch_91
        -0xff7d -> :sswitch_92
        -0xff7c -> :sswitch_93
        -0xff7b -> :sswitch_94
        -0xff7a -> :sswitch_95
        -0xff79 -> :sswitch_96
        -0xff78 -> :sswitch_97
        -0xff77 -> :sswitch_98
        -0xff76 -> :sswitch_99
        -0xff75 -> :sswitch_9a
        -0xff74 -> :sswitch_9b
        -0xff73 -> :sswitch_9c
        -0xff72 -> :sswitch_9d
        -0xff71 -> :sswitch_9e
        -0xff70 -> :sswitch_9f
        -0xff6f -> :sswitch_a0
        -0xff6e -> :sswitch_a1
        -0xff6d -> :sswitch_a2
        -0xff6c -> :sswitch_a3
        -0xff6b -> :sswitch_a4
        -0xff6a -> :sswitch_af
        -0xff69 -> :sswitch_b0
        -0xff68 -> :sswitch_b1
        -0xff67 -> :sswitch_b3
        -0xff66 -> :sswitch_b4
        -0xff65 -> :sswitch_b6
        -0xff64 -> :sswitch_b7
        -0xff63 -> :sswitch_ba
        -0xff62 -> :sswitch_bc
        -0xff61 -> :sswitch_be
        -0xff60 -> :sswitch_bf
        -0xff5f -> :sswitch_c3
        -0xff5e -> :sswitch_c4
        -0xff5d -> :sswitch_c5
        -0xff5c -> :sswitch_c6
        -0xff5b -> :sswitch_c7
        -0xff5a -> :sswitch_c8
        -0xff59 -> :sswitch_c9
        -0xff58 -> :sswitch_ca
        -0xff57 -> :sswitch_cb
        -0xff56 -> :sswitch_cc
        -0xff55 -> :sswitch_cd
        -0xff54 -> :sswitch_ce
        -0xff53 -> :sswitch_cf
        -0xff52 -> :sswitch_d0
        -0xff51 -> :sswitch_d1
        -0xff50 -> :sswitch_d2
        -0xff4f -> :sswitch_d3
        -0xff4e -> :sswitch_d4
        -0xff4d -> :sswitch_d5
        -0xff4c -> :sswitch_d6
        -0xff4b -> :sswitch_d7
        -0xff4a -> :sswitch_d8
        -0xff49 -> :sswitch_d9
        -0xff48 -> :sswitch_da
        -0xff47 -> :sswitch_db
        -0xff46 -> :sswitch_dc
        -0xff45 -> :sswitch_dd
        -0xff44 -> :sswitch_de
        -0xff43 -> :sswitch_df
        -0xff42 -> :sswitch_e0
        -0xff41 -> :sswitch_e1
        -0xff40 -> :sswitch_e2
        -0xff3f -> :sswitch_e3
        -0xff3e -> :sswitch_e4
        -0xff3d -> :sswitch_e5
        -0xff3c -> :sswitch_e6
        -0xff3b -> :sswitch_e8
        -0xff3a -> :sswitch_ea
        -0xff39 -> :sswitch_eb
        -0xff38 -> :sswitch_ec
        -0xff37 -> :sswitch_ed
        -0xff36 -> :sswitch_ee
        -0xff35 -> :sswitch_ef
        -0xff34 -> :sswitch_f0
        -0xff33 -> :sswitch_f1
        -0xff32 -> :sswitch_f2
        -0xff31 -> :sswitch_f3
        -0xff30 -> :sswitch_f4
        -0xff2f -> :sswitch_f5
        -0xff2e -> :sswitch_f6
        -0xff2d -> :sswitch_f7
        -0xff2c -> :sswitch_f8
        -0xff2b -> :sswitch_f9
        -0xff2a -> :sswitch_fa
        -0xff29 -> :sswitch_fb
        -0xff28 -> :sswitch_fc
        -0xff27 -> :sswitch_fd
        -0xff26 -> :sswitch_fe
        -0xff25 -> :sswitch_ff
        -0xff24 -> :sswitch_100
        -0xff23 -> :sswitch_101
        -0xff22 -> :sswitch_102
        -0xff21 -> :sswitch_103
        -0xff20 -> :sswitch_104
        -0xff1f -> :sswitch_105
        -0xff1e -> :sswitch_106
        -0xff1d -> :sswitch_107
        -0xff1c -> :sswitch_108
        -0xff1b -> :sswitch_109
        -0xff1a -> :sswitch_10a
        -0xff19 -> :sswitch_10b
        -0xff18 -> :sswitch_10c
        -0xff17 -> :sswitch_10d
        -0xff16 -> :sswitch_10e
        -0xff15 -> :sswitch_10f
        -0xff14 -> :sswitch_110
        -0xff13 -> :sswitch_111
        -0xff12 -> :sswitch_112
        -0xff11 -> :sswitch_113
        -0xff10 -> :sswitch_119
        -0xff0f -> :sswitch_11a
        -0xff0e -> :sswitch_11c
        -0xff0d -> :sswitch_11d
        -0xff0c -> :sswitch_11e
        -0xff0b -> :sswitch_11f
        -0xff0a -> :sswitch_120
        -0xff09 -> :sswitch_121
        -0xff08 -> :sswitch_122
        -0xff07 -> :sswitch_123
        -0xff06 -> :sswitch_124
        -0xff05 -> :sswitch_125
        -0xff04 -> :sswitch_126
        -0xff03 -> :sswitch_127
        -0xff02 -> :sswitch_128
        -0xff01 -> :sswitch_129
        -0xff00 -> :sswitch_12a
        -0xfeff -> :sswitch_12b
        -0xfefe -> :sswitch_12c
        -0xfefd -> :sswitch_12d
        -0xfefc -> :sswitch_12e
        -0xfefb -> :sswitch_12f
        -0xfefa -> :sswitch_130
        -0xfef9 -> :sswitch_131
        -0xfef8 -> :sswitch_132
        -0xfef7 -> :sswitch_133
        -0xfef6 -> :sswitch_134
        -0xfef5 -> :sswitch_135
        -0xfef4 -> :sswitch_136
        -0xfef3 -> :sswitch_137
        -0xfef2 -> :sswitch_138
        -0xfef1 -> :sswitch_139
        -0xfef0 -> :sswitch_13a
        -0xfeef -> :sswitch_13b
        -0xfeee -> :sswitch_13c
        -0xfeed -> :sswitch_13d
        -0xfeec -> :sswitch_13e
        -0xfeeb -> :sswitch_13f
        -0xfeea -> :sswitch_140
        -0xfee9 -> :sswitch_141
        -0xfee8 -> :sswitch_142
        -0xfee7 -> :sswitch_143
        -0xfee6 -> :sswitch_144
        -0xfee5 -> :sswitch_145
        -0xfee4 -> :sswitch_146
        -0xfee3 -> :sswitch_147
        -0xfee2 -> :sswitch_148
        -0xfee1 -> :sswitch_149
        -0xfee0 -> :sswitch_14a
        -0xfedf -> :sswitch_14b
        -0xfede -> :sswitch_14c
        -0xfedd -> :sswitch_14d
        -0xfedc -> :sswitch_14e
        -0xfedb -> :sswitch_14f
        -0xfeda -> :sswitch_150
        -0xfed9 -> :sswitch_151
        -0xfed8 -> :sswitch_152
        -0xfed7 -> :sswitch_153
        -0xfed6 -> :sswitch_154
        -0xfed5 -> :sswitch_155
        -0xfed4 -> :sswitch_156
        -0xfed3 -> :sswitch_157
        -0xfed2 -> :sswitch_158
        -0xfed1 -> :sswitch_159
        -0xfed0 -> :sswitch_15a
        -0xfecf -> :sswitch_15b
        -0xfece -> :sswitch_15c
        -0xfecd -> :sswitch_15d
        -0xfecc -> :sswitch_15e
        -0xfecb -> :sswitch_15f
        -0xfeca -> :sswitch_160
        -0xfec9 -> :sswitch_161
        -0xfec8 -> :sswitch_162
        -0xfec7 -> :sswitch_163
        -0xfec6 -> :sswitch_164
        -0xfec5 -> :sswitch_165
        -0xfec4 -> :sswitch_166
        -0xfec3 -> :sswitch_167
        -0xfec2 -> :sswitch_168
        -0xfec1 -> :sswitch_169
        -0xfec0 -> :sswitch_16a
        -0xfebf -> :sswitch_16b
        -0xfebe -> :sswitch_16c
        -0xfebd -> :sswitch_16d
        -0xfebc -> :sswitch_16e
        -0xfebb -> :sswitch_16f
        -0xfeba -> :sswitch_170
        -0xfeb9 -> :sswitch_171
        -0xfeb8 -> :sswitch_172
        -0xfeb7 -> :sswitch_173
        -0xfeb6 -> :sswitch_174
        -0xfeb5 -> :sswitch_175
        -0xfeb4 -> :sswitch_176
        -0xfeb3 -> :sswitch_17b
        -0xfeb2 -> :sswitch_17c
        -0xfeb1 -> :sswitch_17d
        -0xfeb0 -> :sswitch_17e
        -0xfeaf -> :sswitch_180
        -0xfeae -> :sswitch_181
        -0xfead -> :sswitch_182
        -0xfeac -> :sswitch_183
        -0xfeab -> :sswitch_184
        -0xfeaa -> :sswitch_185
        -0xfea9 -> :sswitch_186
        -0xfea8 -> :sswitch_187
        -0xfea7 -> :sswitch_188
        -0xfea6 -> :sswitch_189
        -0xfea5 -> :sswitch_18a
        -0xfea4 -> :sswitch_18b
        -0xfea3 -> :sswitch_18c
        -0xfea2 -> :sswitch_18d
        -0xfea1 -> :sswitch_18e
        -0xfea0 -> :sswitch_18f
        -0xfe9f -> :sswitch_190
        -0xfe9e -> :sswitch_191
        -0xfe9d -> :sswitch_192
        -0xfe9c -> :sswitch_193
        -0xfe9b -> :sswitch_194
        -0xfe9a -> :sswitch_195
        -0xfe99 -> :sswitch_196
        -0xfe98 -> :sswitch_197
        -0xfe97 -> :sswitch_198
        -0xfe96 -> :sswitch_199
        -0xfe95 -> :sswitch_19a
        -0xfe94 -> :sswitch_19b
        -0xfe93 -> :sswitch_19c
        -0xfe92 -> :sswitch_19d
        -0xfe91 -> :sswitch_19e
        -0xfe90 -> :sswitch_19f
        -0xfe8f -> :sswitch_1a0
        -0xfe8e -> :sswitch_1a1
        -0xfe8d -> :sswitch_1a2
        -0xfe8c -> :sswitch_1a3
        -0xfe8b -> :sswitch_1a4
        -0xfe8a -> :sswitch_1a5
        -0xfe89 -> :sswitch_1a6
        -0xfe88 -> :sswitch_1a7
        -0xfe87 -> :sswitch_1a8
        -0xfe86 -> :sswitch_1a9
        -0xfe85 -> :sswitch_1aa
        -0xfe84 -> :sswitch_1ab
        -0xfe83 -> :sswitch_1ac
        -0xfe82 -> :sswitch_1ad
        -0xfe81 -> :sswitch_1ae
        -0xfe80 -> :sswitch_1af
        -0xfe7f -> :sswitch_1b0
        -0xfe7e -> :sswitch_1b1
        -0xfe7d -> :sswitch_1b2
        -0xfe7c -> :sswitch_1b3
        -0xfe7b -> :sswitch_1b4
        -0xfe7a -> :sswitch_1b5
        -0xfe79 -> :sswitch_1b6
        -0xfe78 -> :sswitch_1b8
        -0xfe77 -> :sswitch_1b9
        -0xfe76 -> :sswitch_1ba
        -0xfe75 -> :sswitch_1bb
        -0xfe74 -> :sswitch_1bc
        -0xfe73 -> :sswitch_1bd
        -0xfe72 -> :sswitch_1be
        -0xfe71 -> :sswitch_1bf
        -0xfe70 -> :sswitch_1c0
        -0xfe6f -> :sswitch_1c1
        -0xfe6e -> :sswitch_1c2
        -0xfe6d -> :sswitch_1c3
        -0xfe6c -> :sswitch_1c4
        -0xfe6b -> :sswitch_1c5
        -0xfe6a -> :sswitch_1c6
        -0xfe69 -> :sswitch_1c7
        -0xfe68 -> :sswitch_1c8
        -0xfe67 -> :sswitch_1c9
        -0xfe66 -> :sswitch_1ca
        -0xfe65 -> :sswitch_1cb
        -0xfe64 -> :sswitch_1cc
        -0xfe63 -> :sswitch_1cd
        -0xfe62 -> :sswitch_1ce
        -0xfe61 -> :sswitch_1cf
        -0xfe60 -> :sswitch_1d0
        -0xfe5f -> :sswitch_1d1
        -0xfe5e -> :sswitch_1d2
        -0xfe5d -> :sswitch_1d3
        -0xfe5c -> :sswitch_1d4
        -0xfe5b -> :sswitch_1d5
        -0xfe5a -> :sswitch_1d6
        -0xfe59 -> :sswitch_1d7
        -0xfe58 -> :sswitch_1d8
        -0xfe57 -> :sswitch_1d9
        -0xfe56 -> :sswitch_1da
        -0x5 -> :sswitch_1
        -0x4 -> :sswitch_2
        -0x3 -> :sswitch_3
        0x1 -> :sswitch_4
        0x2 -> :sswitch_5
        0x3 -> :sswitch_8
        0x4 -> :sswitch_55
        0x5 -> :sswitch_5b
        0x6 -> :sswitch_5c
        0x7 -> :sswitch_5d
        0x8 -> :sswitch_5f
        0x9 -> :sswitch_a6
        0xa -> :sswitch_a7
        0xb -> :sswitch_a8
        0xc -> :sswitch_a9
        0xd -> :sswitch_aa
        0xe -> :sswitch_ab
        0xf -> :sswitch_ac
        0x10 -> :sswitch_ad
        0x11 -> :sswitch_b5
        0x12 -> :sswitch_b8
        0x13 -> :sswitch_b9
        0x14 -> :sswitch_bb
        0x15 -> :sswitch_bd
        0x16 -> :sswitch_c0
        0x17 -> :sswitch_e9
        0x18 -> :sswitch_114
        0x19 -> :sswitch_116
        0x1a -> :sswitch_117
        0x1b -> :sswitch_118
        0x1c -> :sswitch_11b
        0x1d -> :sswitch_177
        0xff01 -> :sswitch_63
        0xff02 -> :sswitch_67
        0xff03 -> :sswitch_68
        0xff04 -> :sswitch_69
        0xff05 -> :sswitch_90
        0xff06 -> :sswitch_a5
        0xff07 -> :sswitch_ae
        0xff08 -> :sswitch_b2
        0xff09 -> :sswitch_c1
        0xff0a -> :sswitch_c2
        0xff0b -> :sswitch_e7
        0xff0c -> :sswitch_115
        0xff0d -> :sswitch_178
        0xff0e -> :sswitch_179
        0xff0f -> :sswitch_17a
        0xff10 -> :sswitch_17f
        0xff11 -> :sswitch_1b7
    .end sparse-switch
.end method
