package com.lumiyaviewer.lumiya.slproto.modules

import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps
import com.lumiyaviewer.lumiya.slproto.dispnames.SLDisplayNameFetcher
import com.lumiyaviewer.lumiya.slproto.inventory.SLInventory
import com.lumiyaviewer.lumiya.slproto.modules.finance.SLFinancialInfo
import com.lumiyaviewer.lumiya.slproto.modules.groups.SLGroupManager
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.SLMuteList
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.modules.search.SLSearch
import com.lumiyaviewer.lumiya.slproto.modules.texfetcher.SLTextureFetcher
import com.lumiyaviewer.lumiya.slproto.modules.texuploader.SLTextureUploader
import com.lumiyaviewer.lumiya.slproto.modules.transfer.SLTransferManager
import com.lumiyaviewer.lumiya.slproto.modules.voice.SLVoice
import com.lumiyaviewer.lumiya.slproto.modules.xfer.SLXferManager

open class SLModules(agentCircuit: SLAgentCircuit, caps: SLCaps, gridConnection: SLGridConnection) {

    private val modules: MutableList<SLModule> = ArrayList()

    val userNameFetcher: SLUserNameFetcher
    val gridSearch: SLSearch
    val minimap: SLMinimap
    val avatarControl: SLAvatarControl
    val drawDistance: SLDrawDistance
    val inventory: SLInventory
    val worldMap: SLWorldMap
    val transferManager: SLTransferManager
    val textureFetcher: SLTextureFetcher
    val textureUploader: SLTextureUploader
    val avatarAppearance: SLAvatarAppearance
    val rlvController: RLVController
    val xferManager: SLXferManager
    val taskInventories: SLTaskInventories
    val muteList: SLMuteList
    val financialInfo: SLFinancialInfo
    val groupManager: SLGroupManager
    val userProfiles: SLUserProfiles
    val displayNameFetcher: SLDisplayNameFetcher
    val voice: SLVoice

    init {
        userNameFetcher = SLUserNameFetcher(agentCircuit, caps)
        modules.add(userNameFetcher)

        gridSearch = SLSearch(agentCircuit)
        modules.add(gridSearch)

        minimap = SLMinimap(agentCircuit)
        modules.add(minimap)

        avatarControl = SLAvatarControl(agentCircuit)
        modules.add(avatarControl)

        drawDistance = SLDrawDistance(agentCircuit)
        modules.add(drawDistance)

        inventory = SLInventory(agentCircuit, caps)
        modules.add(inventory)

        worldMap = SLWorldMap(agentCircuit)
        modules.add(worldMap)

        transferManager = SLTransferManager(agentCircuit)
        modules.add(transferManager)

        textureFetcher = SLTextureFetcher(agentCircuit, caps, gridConnection.authReply!!.agentAppearanceService)
        modules.add(textureFetcher)

        textureUploader = SLTextureUploader(agentCircuit, caps)
        modules.add(textureUploader)

        avatarAppearance = SLAvatarAppearance(agentCircuit, this.inventory, caps)
        modules.add(avatarAppearance)

        rlvController = RLVController(agentCircuit)
        modules.add(rlvController)

        xferManager = SLXferManager(agentCircuit)
        modules.add(xferManager)

        taskInventories = SLTaskInventories(agentCircuit)
        modules.add(taskInventories)

        muteList = SLMuteList(agentCircuit)
        modules.add(muteList)

        financialInfo = SLFinancialInfo(agentCircuit)
        modules.add(financialInfo)

        groupManager = SLGroupManager(agentCircuit)
        modules.add(groupManager)

        userProfiles = SLUserProfiles(agentCircuit, caps)
        modules.add(userProfiles)

        displayNameFetcher = SLDisplayNameFetcher(agentCircuit, caps)
        modules.add(displayNameFetcher)

        voice = SLVoice(agentCircuit, caps)
        modules.add(voice)
    }

    fun HandleCircuitReady() {
        for (module in this.modules) {
            module.HandleCircuitReady()
        }
    }

    fun HandleCloseCircuit() {
        for (module in this.modules) {
            module.HandleCloseCircuit()
        }
    }

    fun HandleGlobalOptionsChange() {
        for (module in this.modules) {
            module.HandleGlobalOptionsChange()
        }
    }
}
