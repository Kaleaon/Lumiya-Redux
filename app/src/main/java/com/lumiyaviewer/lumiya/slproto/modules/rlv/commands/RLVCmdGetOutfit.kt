package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import java.util.UUID

open class RLVCmdGetOutfit : RLVCommand {
    fun Handle(rlvController: RLVController, uuid: UUID, rlvCommands: RLVCommands, str: String, str2: String) {
        try {
            var parseInt: Int = Integer.parseInt(str)
            var avatarAppearance: SLAvatarAppearance = rlvController.getModules().avatarAppearance
            var str3: String = ""
            for (wearableType in new Array<SLWearableType>{SLWearableType.WT_GLOVES, SLWearableType.WT_JACKET, SLWearableType.WT_PANTS, SLWearableType.WT_SHIRT, SLWearableType.WT_SHOES, SLWearableType.WT_SKIRT, SLWearableType.WT_SOCKS, SLWearableType.WT_UNDERPANTS, SLWearableType.WT_UNDERSHIRT, SLWearableType.WT_SKIN, SLWearableType.WT_EYES, SLWearableType.WT_HAIR, SLWearableType.WT_SHAPE, SLWearableType.WT_ALPHA, SLWearableType.WT_TATTOO}) {
                if (!wearableType.isBodyPart()) {
                    var name: String = wearableType.getName()
                    if (str2.equals("") || name.equalsIgnoreCase(str2)) {
                        str3 = if (avatarAppearance.hasWornWearable(wearableType)) str3 + "1" else str3 + "0"
                    }
                }
            }
            rlvController.sayOnChannel(parseInt, str3)
        } catch (e: NumberFormatException) {
            Debug.Warning(e)
        }
    }
}
