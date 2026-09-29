package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType
import java.util.UUID

open class RLVCmdUnsit : RLVCmdGenericRestriction(RLVRestrictionType.unsit, false) {
    @Suppress("FunctionName")
    override fun HandleForce(rlvController: RLVController, uuid: UUID, str: String?) {
        rlvController.getModules().avatarControl.ForceStand()
    }
}
