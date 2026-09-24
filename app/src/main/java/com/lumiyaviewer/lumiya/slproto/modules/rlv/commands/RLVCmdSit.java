package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType;
import java.util.UUID;

public class RLVCmdSit extends RLVCmdGenericRestriction {
    public RLVCmdSit() {
        super(RLVRestrictionType.sit, false);
    }

    @Override
    protected void HandleForce(RLVController rlvController, UUID uuid, String str) {
        if (str != null) {
            try {
                rlvController.getModules().avatarControl.ForceSitOnObject(UUID.fromString(str));
            } catch (Exception e) {
                Debug.Warning(e);
            }
        }
    }
}
