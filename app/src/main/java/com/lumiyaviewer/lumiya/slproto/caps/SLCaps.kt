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

open class SLCaps {
    private val caps: MutableMap<SLCapability, String> = EnumMap(SLCapability::class.java)

    open class NoSuchCapabilityException(capability: SLCapability) :
        Exception("No such capability: ${capability.name}")

    enum class SLCapability {
        // Caps actively used by Lumiya call sites. Preserve the order of
        // the original set so that any serialized form keyed by ordinal
        // stays stable.
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
        DispatchOpenRegionSettings,
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
        GetMesh2;

        companion object {
            @JvmStatic
            fun valuesCustom(): Array<SLCapability> = values()
        }
    }

    @Throws(LLSDException::class, IOException::class)
    private fun GetCapabilitesOnce(seedURL: String, capURL: String) {
        var isAgni = false
        try {
            isAgni = URL(seedURL).host == "login.agni.lindenlab.com"
        } catch (e: Exception) {
            Debug.Warning(e)
            isAgni = false
        }
        val repairedCapURL = repairCapabilityURL(isAgni, capURL)
        val request = LLSDXMLRequest()
        val capArray = LLSDArray()
        for (capability in SLCapability.values()) {
            capArray.add(LLSDString(capability.name))
        }
        val response = request.PerformRequest(repairedCapURL, capArray)
        for (capability in SLCapability.values()) {
            if (response.keyExists(capability.name)) {
                val repaired = repairCapabilityURL(isAgni, response.byKey(capability.name).asString())
                this.caps[capability] = repaired
                Debug.Log("GetCapabilities: ${capability.name} = $repaired")
            } else {
                Debug.Log("GetCapabilities: ${capability.name} not supported")
            }
        }
    }

    private fun repairCapabilityURL(isAgni: Boolean, url: String): String {
        if (!isAgni) {
            return url
        }
        return try {
            val host = URL(url).host
            if (host.contains(".") || !host.startsWith("sim")) {
                url
            } else {
                val repaired = url.replace(host, "$host.agni.lindenlab.com")
                Debug.Printf("Repaired capability URL to %s", repaired)
                repaired
            }
        } catch (e: Exception) {
            Debug.Warning(e)
            url
        }
    }

    open fun GetCapabilites(seedURL: String, capURL: String) {
        for (i in 0 until 1) {
            try {
                GetCapabilitesOnce(seedURL, capURL)
                return
            } catch (e: Exception) {
                e.printStackTrace()
            }
        }
    }

    open fun getCapability(capability: SLCapability): String? {
        return this.caps[capability]
    }

    /**
     * Base URL for HTTP texture fetches (`?texture_id=`).
     *
     * Beyond 3.4.2, which only knew GetTexture: current Second Life
     * viewers fetch every asset through the ViewerAsset capability (the
     * viewer's LLViewerRegion::getViewerAssetUrl(), used by lltexturefetch.cpp)
     * and the grid has retired the per-asset GetTexture/GetMesh caps.
     * GetTexture is kept for OpenSimulator grids that predate ViewerAsset.
     */
    open fun getTextureFetchURL(): String? {
        val url = this.caps[SLCapability.ViewerAsset]
        return url ?: this.caps[SLCapability.GetTexture]
    }

    /**
     * Base URL for HTTP mesh fetches (`?mesh_id=`).
     */
    open fun getMeshFetchURL(): String? {
        var url = this.caps[SLCapability.ViewerAsset]
        if (url == null) {
            url = this.caps[SLCapability.GetMesh2]
        }
        return url ?: this.caps[SLCapability.GetMesh]
    }

    @Throws(NoSuchCapabilityException::class)
    open fun getCapabilityOrThrow(capability: SLCapability): String {
        return this.caps[capability] ?: throw NoSuchCapabilityException(capability)
    }

    companion object {
        @JvmStatic
        fun repairURL(seedURL: String, url: String): String {
            return try {
                if (URL(seedURL).host.endsWith(".lindenlab.com")) {
                    repairCapabilityURLStatic(true, url)
                } else {
                    url
                }
            } catch (e: Exception) {
                Debug.Warning(e)
                url
            }
        }

        @JvmStatic
        private fun repairCapabilityURLStatic(isAgni: Boolean, url: String): String {
            if (!isAgni) {
                return url
            }
            return try {
                val host = URL(url).host
                if (host.contains(".") || !host.startsWith("sim")) {
                    url
                } else {
                    val repaired = url.replace(host, "$host.agni.lindenlab.com")
                    Debug.Printf("Repaired capability URL to %s", repaired)
                    repaired
                }
            } catch (e: Exception) {
                Debug.Warning(e)
                url
            }
        }
    }
}
