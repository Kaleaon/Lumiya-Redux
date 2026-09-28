package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import java.util.UUID

open class RLVCmdGetOutfit : RLVCommand {
    @Suppress("FunctionName")
    override fun Handle(controller: RLVController, objectId: UUID, commands: RLVCommands, option: String, parameter: String?) {
        try {
            val parseInt = option.toInt()
            val avatarAppearance = controller.getModules().avatarAppearance
            var str3 = ""
            for (wearableType in arrayOf(SLWearableType.WT_GLOVES, SLWearableType.WT_JACKET, SLWearableType.WT_PANTS, SLWearableType.WT_SHIRT, SLWearableType.WT_SHOES, SLWearableType.WT_SKIRT, SLWearableType.WT_SOCKS, SLWearableType.WT_UNDERPANTS, SLWearableType.WT_UNDERSHIRT, SLWearableType.WT_SKIN, SLWearableType.WT_EYES, SLWearableType.WT_HAIR, SLWearableType.WT_SHAPE, SLWearableType.WT_ALPHA, SLWearableType.WT_TATTOO)) {
                if (!wearableType.isBodyPart()) {
                    val name = wearableType.getName()
                    if (parameter == "" || name.equals(parameter, ignoreCase = true)) {
                        str3 = if (avatarAppearance.hasWornWearable(wearableType)) str3 + "1" else str3 + "0"
                    }
                }
            }
            controller.sayOnChannel(parseInt, str3)
        } catch (e: NumberFormatException) {
            Debug.Warning(e)
        }
    }
}
