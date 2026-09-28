package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType
import java.util.UUID

open class RLVCmdRemoveOutfit : RLVCmdGenericRestriction(RLVRestrictionType.remoutfit, true) {
    @Suppress("FunctionName")
    override fun HandleForce(rlvController: RLVController, uuid: UUID, str: String?) {
        val avatarAppearance = rlvController.getModules().avatarAppearance
        for (wearableType in SLWearableType.values()) {
            if (!wearableType.isBodyPart()) {
                val name = wearableType.getName()
                if (str == "" || name.equals(str, ignoreCase = true)) {
                    avatarAppearance.ForceTakeItemOff(wearableType)
                }
            }
        }
    }
}
