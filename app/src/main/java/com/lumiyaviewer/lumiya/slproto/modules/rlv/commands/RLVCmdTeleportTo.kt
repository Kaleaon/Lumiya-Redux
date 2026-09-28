package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import java.util.UUID

open class RLVCmdTeleportTo : RLVCommand {
    @Suppress("FunctionName")
    override fun Handle(controller: RLVController, objectId: UUID, commands: RLVCommands, option: String, parameter: String?) {
        if (option != "force" || parameter == null) {
            return
        }
        val split = parameter.split("/")
        if (split.size >= 3) {
            try {
                controller.teleportToGlobalPos(objectId, LLVector3(split[0].toFloat(), split[1].toFloat(), split[2].toFloat()))
            } catch (e: NumberFormatException) {
                Debug.Warning(e)
            }
        }
    }
}
