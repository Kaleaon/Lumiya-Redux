package com.lumiyaviewer.lumiya.slproto.modules.rlv

import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdAcceptTeleport
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdAddOutfit
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdClear
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdDetach
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdEditObjects
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdGetAttach
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdGetOutfit
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdGetStatus
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdRecvChat
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdRecvIM
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdRedirChat
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdRemoveOutfit
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdRezObjects
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdSendChannel
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdSendChat
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdSendIM
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdShowInventory
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdSit
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdTeleportLandmark
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdTeleportLocation
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdTeleportLure
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdTeleportSit
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdTeleportTo
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdUnsit
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdVersion
import com.lumiyaviewer.lumiya.slproto.modules.rlv.commands.RLVCmdViewNotecard

enum class RLVCommands(private val handler: Class<out RLVCommand>) {
    version(RLVCmdVersion::class.java),
    versionnew(RLVCmdVersion::class.java),
    versionnum(RLVCmdVersion::class.java),
    clear(RLVCmdClear::class.java),
    detach(RLVCmdDetach::class.java),
    sendchat(RLVCmdSendChat::class.java),
    recvchat(RLVCmdRecvChat::class.java),
    sendim(RLVCmdSendIM::class.java),
    recvim(RLVCmdRecvIM::class.java),
    tplm(RLVCmdTeleportLandmark::class.java),
    tploc(RLVCmdTeleportLocation::class.java),
    sittp(RLVCmdTeleportSit::class.java),
    tplure(RLVCmdTeleportLure::class.java),
    tpto(RLVCmdTeleportTo::class.java),
    accepttp(RLVCmdAcceptTeleport::class.java),
    showinv(RLVCmdShowInventory::class.java),
    viewnote(RLVCmdViewNotecard::class.java),
    edit(RLVCmdEditObjects::class.java),
    rez(RLVCmdRezObjects::class.java),
    unsit(RLVCmdUnsit::class.java),
    sit(RLVCmdSit::class.java),
    remoutfit(RLVCmdRemoveOutfit::class.java),
    getoutfit(RLVCmdGetOutfit::class.java),
    addoutfit(RLVCmdAddOutfit::class.java),
    getattach(RLVCmdGetAttach::class.java),
    getstatus(RLVCmdGetStatus::class.java),
    sendchannel(RLVCmdSendChannel::class.java),
    redirchat(RLVCmdRedirChat::class.java);

    /* renamed from: values, reason: to resolve conflict with enum method */
    fun valuesCustom(): Array<RLVCommands> {
        return values()
    }

    fun getHandler(): RLVCommand? {
        return try {
            this.handler.newInstance()
        } catch (e: IllegalAccessException) {
            null
        } catch (e2: IllegalArgumentException) {
            null
        } catch (e3: InstantiationException) {
            null
        }
    }

    companion object {
        @JvmStatic
        fun getCommand(str: String): RLVCommands? {
            return try {
                valueOf(str)
            } catch (e: IllegalArgumentException) {
                null
            }
        }
    }
}
