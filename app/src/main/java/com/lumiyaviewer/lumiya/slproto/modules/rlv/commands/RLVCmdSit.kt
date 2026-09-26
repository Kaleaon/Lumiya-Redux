package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType
import java.util.UUID

open class RLVCmdSit : RLVCmdGenericRestriction() {
    public RLVCmdSit() {
        super(RLVRestrictionType.sit, false)
    }
    protected void HandleForce(RLVController rlvController, UUID uuid, String str) {
        if (str != null) {
            try {
                rlvController.getModules().avatarControl.ForceSitOnObject(UUID.fromString(str))
            } catch (e: Exception) {
                Debug.Warning(e)
            }
        }
    }
}
