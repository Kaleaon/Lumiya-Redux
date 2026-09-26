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

enum class RLVCommands {
    version(RLVCmdVersion.class),
    versionnew(RLVCmdVersion.class),
    versionnum(RLVCmdVersion.class),
    clear(RLVCmdClear.class),
    detach(RLVCmdDetach.class),
    sendchat(RLVCmdSendChat.class),
    recvchat(RLVCmdRecvChat.class),
    sendim(RLVCmdSendIM.class),
    recvim(RLVCmdRecvIM.class),
    tplm(RLVCmdTeleportLandmark.class),
    tploc(RLVCmdTeleportLocation.class),
    sittp(RLVCmdTeleportSit.class),
    tplure(RLVCmdTeleportLure.class),
    tpto(RLVCmdTeleportTo.class),
    accepttp(RLVCmdAcceptTeleport.class),
    showinv(RLVCmdShowInventory.class),
    viewnote(RLVCmdViewNotecard.class),
    edit(RLVCmdEditObjects.class),
    rez(RLVCmdRezObjects.class),
    unsit(RLVCmdUnsit.class),
    sit(RLVCmdSit.class),
    remoutfit(RLVCmdRemoveOutfit.class),
    getoutfit(RLVCmdGetOutfit.class),
    addoutfit(RLVCmdAddOutfit.class),
    getattach(RLVCmdGetAttach.class),
    getstatus(RLVCmdGetStatus.class),
    sendchannel(RLVCmdSendChannel.class),
    redirchat(RLVCmdRedirChat.class)

    private var handler: Class<? extends RLVCommand> = null

    constructor(cls: Class) {
        this.handler = cls
    }

    fun getCommand(str: String): RLVCommands {
        try {
            return valueOf(str)
        } catch (e: IllegalArgumentException) {
        return null
        }
    }

    /* renamed from: values, reason: to resolve conflict with enum method */
    fun valuesCustom(): Array<RLVCommands> {
        return values()
    }

    fun getHandler(): RLVCommand {
        try {
            return this.handler.newInstance()
        } catch (e: IllegalAccessException) {
        return null
        } catch (e2: IllegalArgumentException) {
        return null
        } catch (e3: InstantiationException) {
        return null
        }
    }
}
