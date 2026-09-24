package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands;

import com.lumiyaviewer.lumiya.slproto.avatar.SLAttachmentPoint;
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType;
import java.util.UUID;

public class RLVCmdDetach extends RLVCmdGenericRestriction {
    public RLVCmdDetach() {
        super(RLVRestrictionType.detach, true);
    }

    @Override
    protected void HandleForce(RLVController rlvController, UUID uuid, String str) {
        UUID attachmentUUID;
        SLAvatarAppearance avatarAppearance = rlvController.getModules().avatarAppearance;
        for (int i = 0; i < 56; i++) {
            if (SLAttachmentPoint.attachmentPoints[i] != null) {
                String lowerCase = SLAttachmentPoint.attachmentPoints[i].name.toLowerCase();
                if ((str.equals("") || lowerCase.equalsIgnoreCase(str)) && (attachmentUUID = avatarAppearance.getAttachmentUUID(i)) != null && rlvController.getRestrictions().isAllowed(RLVRestrictionType.detach, lowerCase, attachmentUUID)) {
                    avatarAppearance.DetachItemFromPoint(i);
                }
            }
        }
    }
}
