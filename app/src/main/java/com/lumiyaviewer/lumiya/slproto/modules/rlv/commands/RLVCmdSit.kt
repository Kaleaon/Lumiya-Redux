package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType
import java.util.UUID

open class RLVCmdSit : RLVCmdGenericRestriction(RLVRestrictionType.sit, false) {
    @Suppress("FunctionName")
    override fun HandleForce(rlvController: RLVController, uuid: UUID, str: String?) {
        if (str != null) {
            try {
                rlvController.getModules().avatarControl.ForceSitOnObject(UUID.fromString(str))
            } catch (e: Exception) {
                Debug.Warning(e)
            }
        }
    }
}
