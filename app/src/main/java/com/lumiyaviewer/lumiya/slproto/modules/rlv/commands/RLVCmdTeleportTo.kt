package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.util.UUID

open class RLVCmdTeleportTo : RLVCommand {
    fun Handle(rlvController: RLVController, uuid: UUID, rlvCommands: RLVCommands, str: String, str2: String) {
        if (!str.equals("force") || str2 == null) {
            return
        }
        var split: Array<String> = str2.split("/")
        if (split.length >= 3) {
            try {
                rlvController.teleportToGlobalPos(uuid, LLVector3(Float.parseFloat(split[0]), Float.parseFloat(split[1]), Float.parseFloat(split[2])))
            } catch (e: NumberFormatException) {
                Debug.Warning(e)
            }
        }
    }
}
