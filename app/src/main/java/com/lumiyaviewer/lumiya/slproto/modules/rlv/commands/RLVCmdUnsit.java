package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands;

import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType;
import java.util.UUID;

public class RLVCmdUnsit extends RLVCmdGenericRestriction {
    public RLVCmdUnsit() {
        super(RLVRestrictionType.unsit, false);
    }

    @Override
    protected void HandleForce(RLVController rlvController, UUID uuid, String str) {
        rlvController.getModules().avatarControl.ForceStand();
    }
}
