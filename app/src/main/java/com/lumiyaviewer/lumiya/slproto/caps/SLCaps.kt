package com.lumiyaviewer.lumiya.slproto.caps

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDArray
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDString
import java.io.IOException
import java.net.URL
import java.util.EnumMap
import java.util.Map

open class SLCaps {
    private var caps: MutableMap<SLCapability, String> = EnumMap(SLCapability.class)

    open class NoSuchCapabilityException : Exception() {
        private static long serialVersionUID = 1

        fun NoSuchCapabilityException(capability: SLCapability): public {
            super("No such capability: " + capability.name())
        }
    }

    enum class SLCapability {
        // Caps actively used by Lumiya call sites. Preserve the order of
        // the original set so that any serialized form keyed by ordinal
        // (none today, but defensively) stays stable.
        EventQueueGet,
        GetTexture,
        UploadBakedTexture,
        FetchInventoryDescendents2,
        GetDisplayNames,
        UpdateNotecardAgentInventory,
        NewFileAgentInventory,
        CopyInventoryFromNotecard,
        UpdateAvatarAppearance,
        GetMesh,
        UpdateNotecardTaskInventory,
        UpdateScriptTask,
        UpdateScriptAgent,
        GroupMemberData,
        HomeLocation,
        ProvisionVoiceAccountRequest,
        ParcelVoiceInfoRequest,
        ChatSessionRequest,

        // Canonical cap names requested by the upstream Second Life viewer
        // in LLViewerRegionImpl::buildCapabilityNames
        // (secondlife/viewer: indra/newview/llviewerregion.cpp) plus the
        // AIS inventory caps (InventoryAPIv3, LibraryAPIv3) appended via
        // AISAPI::getCapNames. Unsupported caps return null from
        // getCapability; every Lumiya call site already guards on that.
        // Listed alphabetically; duplicates with the active set above are
        // intentionally omitted.
        // See docs/secondlife_apk_2026_analysis.md.
        AbuseCategories,
        AcceptFriendship,
        AcceptGroupInvite,
        AgentExperiences,
        AgentPreferences,
        AgentProfile,
        AgentState,
        AttachmentResources,
        AvatarPickerSearch,
        AvatarRenderInfo,
        CharacterProperties,
        CreateInventoryCategory,
        DeclineFriendship,
        DeclineGroupInvite,
        DirectDelivery,
        DispatchRegionInfo,
        EnvironmentSettings,
        EstateAccess,
        EstateChangeInfo,
        ExperiencePreferences,
        ExperienceQuery,
        ExtEnvironment,
        FetchInventory2,
        FetchLib2,
        FetchLibDescendents2,
        FindExperienceByName,
        GetAdminExperiences,
        GetCreatorExperiences,
        GetExperienceInfo,
        GetExperiences,
        GetMetadata,
        GetObjectCost,
        GetObjectPhysicsData,
        GroupAPIv1,
        GroupExperiences,
        GroupProposalBallot,
        IncrementCOFVersion,
        InterestList,
        InventoryAPIv3,
        InventoryThumbnailUpload,
        IsExperienceAdmin,
        IsExperienceContributor,
        LSLSyntax,
        LandResources,
        LibraryAPIv3,
        MapLayer,
        MapLayerGod,
        MeshUploadFlag,
        ModifyMaterialParams,
        ModifyRegion,
        NavMeshGenerationStatus,
        ObjectAnimation,
        ObjectMedia,
        ObjectMediaNavigate,
        ObjectNavMeshProperties,
        ParcelPropertiesUpdate,
        ProductInfoRequest,
        ReadOfflineMsgs,
        RegionExperiences,
        RegionObjects,
        RegionSchedule,
        RemoteParcelRequest,
        RenderMaterials,
        RequestTaskInventory,
        RequestTextureDownload,
        ResourceCostSelected,
        RetrieveNavMeshSrc,
        SearchStatRequest,
        SearchStatTracking,
        SendPostcard,
        SendUserReport,
        SendUserReportWithScreenshot,
        ServerReleaseNotes,
        SetDisplayName,
        SimConsoleAsync,
        SimulatorFeatures,
        StartGroupProposal,
        TerrainNavMeshProperties,
        TextureStats,
        UntrustedSimulatorMessage,
        UpdateAgentInformation,
        UpdateAgentLanguage,
        UpdateExperience,
        UpdateGestureAgentInventory,
        UpdateGestureTaskInventory,
        UpdateMaterialAgentInventory,
        UpdateMaterialTaskInventory,
        UpdateSettingsAgentInventory,
        UpdateSettingsTaskInventory,
        UploadAgentProfileImage,
        UserInfo,
        ViewerAsset,
        ViewerBenefits,
        ViewerMetrics,
        ViewerStartAuction,
        ViewerStats,
        VoiceSignalingRequest,

        // Legacy mesh fetch cap still offered by OpenSimulator grids that
        // predate ViewerAsset. See getMeshFetchURL().
        GetMesh2

        /* renamed from: values, reason: to resolve conflict with enum method */
        fun valuesCustom(): Array<SLCapability> {
            return values()
        }
    }

    private void GetCapabilitesOnce(String str, String str2) throws LLSDException, IOException {
        var z: Boolean = false
        try {
            z = URL(str).getHost().equals("login.agni.lindenlab.com")
        } catch (e: Exception) {
            Debug.Warning(e)
            z = false
        }
        var repairCapabilityURL: String = repairCapabilityURL(z, str2)
        var llsdxmlRequest: LLSDXMLRequest = LLSDXMLRequest()
        var llsdArray: LLSDArray = LLSDArray()
        for (capability in SLCapability.values()) {
            llsdArray.add(LLSDString(capability.name()))
        }
        var PerformRequest: LLSDNode = llsdxmlRequest.PerformRequest(repairCapabilityURL, llsdArray)
        for (capability2 in SLCapability.values()) {
            if (PerformRequest.keyExists(capability2.name())) {
                var repairCapabilityURL2: String = repairCapabilityURL(z, PerformRequest.byKey(capability2.name()).asString())
                this.caps.put(capability2, repairCapabilityURL2)
                Debug.Log("GetCapabilities: " + capability2.name() + " = " + repairCapabilityURL2)
            } else {
                Debug.Log("GetCapabilities: " + capability2.name() + " not supported")
            }
        }
    }

    private fun repairCapabilityURL(z: Boolean, str: String): String {
        if (!z) {
        return str
        }
        try {
            var host: String = URL(str).getHost()
            if (host.contains(".") || !host.startsWith("sim")) {
        return str
            }
            str = str.replace(host, host + ".agni.lindenlab.com")
            Debug.Printf("Repaired capability URL to %s", str)
        return str
        } catch (e: Exception) {
            Debug.Warning(e)
        return str
        }
    }

    fun repairURL(str: String, str2: String): String {
        try {
            return URL(str).getHost().if (endsWith(".lindenlab.com")) repairCapabilityURL(true, str2) else str2
        } catch (e: Exception) {
            Debug.Warning(e)
        return str2
        }
    }

    fun GetCapabilites(str: String, str2: String) {
        for (int i = 0; i < 1; i++) {
            try {
                GetCapabilitesOnce(str, str2)
                return
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
    }

    fun getCapability(capability: SLCapability): String {
        return this.caps.get(capability)
    }

    /**
     * Base URL for HTTP texture fetches (<code>?texture_id=</code>).
     *
     * <p>Beyond 3.4.2, which only knew GetTexture: current Second Life
     * viewers fetch every asset through the ViewerAsset capability (the
     * viewer's LLViewerRegion::getViewerAssetUrl(), used by lltexturefetch.cpp)
     * and the grid has retired the per-asset GetTexture/GetMesh caps, which
     * left 3.4.2 on the slow UDP ImageData path. ViewerAsset takes the same
     * query parameter. GetTexture is kept for OpenSimulator grids that
     * predate ViewerAsset.</p>
     */
    fun getTextureFetchURL(): String {
        var url: String = this.caps.get(SLCapability.ViewerAsset)
        return if (url != null) url else this.caps.get(SLCapability.GetTexture)
    }

    /**
     * Base URL for HTTP mesh fetches (<code>?mesh_id=</code>): ViewerAsset,
     * as in the viewer's LLMeshRepository, then the legacy GetMesh2 and
     * GetMesh caps. Beyond 3.4.2, which only knew GetMesh and so could not
     * load mesh on current Second Life regions.
     */
    fun getMeshFetchURL(): String {
        var url: String = this.caps.get(SLCapability.ViewerAsset)
        if (url == null) {
            url = this.caps.get(SLCapability.GetMesh2)
        }
        return if (url != null) url else this.caps.get(SLCapability.GetMesh)
    }

    public String getCapabilityOrThrow(SLCapability capability) throws NoSuchCapabilityException {
        var str: String = this.caps.get(capability)
        if (str == null) {
            throw NoSuchCapabilityException(capability)
        }
        return str
    }
}
