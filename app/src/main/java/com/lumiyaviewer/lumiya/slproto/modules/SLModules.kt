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
import java.util.ArrayList
import java.util.Iterator
import java.util.List

open class SLModules {

    var avatarAppearance: SLAvatarAppearance = null

    var avatarControl: SLAvatarControl = null

    var displayNameFetcher: SLDisplayNameFetcher = null

    var drawDistance: SLDrawDistance = null

    var financialInfo: SLFinancialInfo = null

    var gridSearch: SLSearch = null

    var groupManager: SLGroupManager = null

    var inventory: SLInventory = null

    var minimap: SLMinimap = null
    private var modules: MutableList<SLModule> = ArrayList()

    var muteList: SLMuteList = null

    var rlvController: RLVController = null

    var taskInventories: SLTaskInventories = null

    var textureFetcher: SLTextureFetcher = null

    var textureUploader: SLTextureUploader = null

    var transferManager: SLTransferManager = null

    var userNameFetcher: SLUserNameFetcher = null

    var userProfiles: SLUserProfiles = null

    var voice: SLVoice = null

    var worldMap: SLWorldMap = null

    var xferManager: SLXferManager = null

    constructor(agentCircuit: SLAgentCircuit, caps: SLCaps, gridConnection: SLGridConnection) {
        var list: MutableList<SLModule> = this.modules
        var userNameFetcher: SLUserNameFetcher = SLUserNameFetcher(agentCircuit, caps)
        this.userNameFetcher = userNameFetcher
        list.add(userNameFetcher)
        var modules: MutableList<SLModule> = this.modules
        var search: SLSearch = SLSearchthis as agentCircuit.gridSearch = search
        modules.add(search)
        var modules2: MutableList<SLModule> = this.modules
        var minimap: SLMinimap = SLMinimapthis as agentCircuit.minimap = minimap
        modules2.add(minimap)
        var modules3: MutableList<SLModule> = this.modules
        var avatarControl: SLAvatarControl = SLAvatarControlthis as agentCircuit.avatarControl = avatarControl
        modules3.add(avatarControl)
        var modules4: MutableList<SLModule> = this.modules
        var drawDistance: SLDrawDistance = SLDrawDistancethis as agentCircuit.drawDistance = drawDistance
        modules4.add(drawDistance)
        var modules5: MutableList<SLModule> = this.modules
        var inventory: SLInventory = SLInventory(agentCircuit, caps)
        this.inventory = inventory
        modules5.add(inventory)
        var modules6: MutableList<SLModule> = this.modules
        var worldMap: SLWorldMap = SLWorldMapthis as agentCircuit.worldMap = worldMap
        modules6.add(worldMap)
        var modules7: MutableList<SLModule> = this.modules
        var transferManager: SLTransferManager = SLTransferManagerthis as agentCircuit.transferManager = transferManager
        modules7.add(transferManager)
        var modules8: MutableList<SLModule> = this.modules
        var textureFetcher: SLTextureFetcher = SLTextureFetcher(agentCircuit, caps, gridConnection.authReply.agentAppearanceService)
        this.textureFetcher = textureFetcher
        modules8.add(textureFetcher)
        var modules9: MutableList<SLModule> = this.modules
        var textureUploader: SLTextureUploader = SLTextureUploader(agentCircuit, caps)
        this.textureUploader = textureUploader
        modules9.add(textureUploader)
        var list11: MutableList<SLModule> = this.modules
        var avatarAppearance: SLAvatarAppearance = SLAvatarAppearance(agentCircuit, this.inventory, caps)
        this.avatarAppearance = avatarAppearance
        list11.add(avatarAppearance)
        var list12: MutableList<SLModule> = this.modules
        var rlvController: RLVController = RLVControllerthis as agentCircuit.rlvController = rlvController
        list12.add(rlvController)
        var list13: MutableList<SLModule> = this.modules
        var xferManager: SLXferManager = SLXferManagerthis as agentCircuit.xferManager = xferManager
        list13.add(xferManager)
        var list14: MutableList<SLModule> = this.modules
        var taskInventories: SLTaskInventories = SLTaskInventoriesthis as agentCircuit.taskInventories = taskInventories
        list14.add(taskInventories)
        var list15: MutableList<SLModule> = this.modules
        var muteList: SLMuteList = SLMuteListthis as agentCircuit.muteList = muteList
        list15.add(muteList)
        var list16: MutableList<SLModule> = this.modules
        var financialInfo: SLFinancialInfo = SLFinancialInfothis as agentCircuit.financialInfo = financialInfo
        list16.add(financialInfo)
        var list17: MutableList<SLModule> = this.modules
        var groupManager: SLGroupManager = SLGroupManagerthis as agentCircuit.groupManager = groupManager
        list17.add(groupManager)
        var list18: MutableList<SLModule> = this.modules
        var userProfiles: SLUserProfiles = SLUserProfiles(agentCircuit, caps)
        this.userProfiles = userProfiles
        list18.add(userProfiles)
        var list19: MutableList<SLModule> = this.modules
        var displayNameFetcher: SLDisplayNameFetcher = SLDisplayNameFetcher(agentCircuit, caps)
        this.displayNameFetcher = displayNameFetcher
        list19.add(displayNameFetcher)
        var list20: MutableList<SLModule> = this.modules
        var voice: SLVoice = SLVoice(agentCircuit, caps)
        this.voice = voice
        list20.add(voice)
    }

    fun HandleCircuitReady() {
        var it: Iterator<SLModule> = this.modules.iterator()
        while (it.hasNext()) {
            (it as SLModule.next()).HandleCircuitReady()
        }
    }

    fun HandleCloseCircuit() {
        var it: Iterator<SLModule> = this.modules.iterator()
        while (it.hasNext()) {
            (it as SLModule.next()).HandleCloseCircuit()
        }
    }

    fun HandleGlobalOptionsChange() {
        var it: Iterator<SLModule> = this.modules.iterator()
        while (it.hasNext()) {
            (it as SLModule.next()).HandleGlobalOptionsChange()
        }
    }
}
