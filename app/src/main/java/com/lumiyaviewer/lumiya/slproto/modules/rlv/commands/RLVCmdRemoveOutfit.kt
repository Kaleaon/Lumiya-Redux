package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType
import java.util.UUID

open class RLVCmdRemoveOutfit : RLVCmdGenericRestriction() {
    public RLVCmdRemoveOutfit() {
        super(RLVRestrictionType.remoutfit, true)
    }
    protected void HandleForce(RLVController rlvController, UUID uuid, String str) {
        SLAvatarAppearance avatarAppearance = rlvController.getModules().avatarAppearance
        for (wearableType in SLWearableType.values()) {
            if (!wearableType.isBodyPart()) {
                String name = wearableType.getName()
                if (str.equals("") || name.equalsIgnoreCase(str)) {
                    avatarAppearance.ForceTakeItemOff(wearableType)
                }
            }
        }
    }
}
