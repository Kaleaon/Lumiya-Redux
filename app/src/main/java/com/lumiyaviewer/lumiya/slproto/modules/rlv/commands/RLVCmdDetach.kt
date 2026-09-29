package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.slproto.avatar.SLAttachmentPoint
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType
import java.util.UUID

open class RLVCmdDetach : RLVCmdGenericRestriction(RLVRestrictionType.detach, true) {
    @Suppress("FunctionName")
    override fun HandleForce(rlvController: RLVController, uuid: UUID, str: String?) {
        val avatarAppearance = rlvController.getModules().avatarAppearance
        for (i in 0 until 56) {
            if (SLAttachmentPoint.attachmentPoints[i] != null) {
                val lowerCase = SLAttachmentPoint.attachmentPoints[i]!!.name.lowercase()
                val attachmentUUID = avatarAppearance.getAttachmentUUID(i)
                if ((str == "" || lowerCase.equals(str, ignoreCase = true)) && attachmentUUID != null && rlvController.getRestrictions().isAllowed(RLVRestrictionType.detach, lowerCase, attachmentUUID)) {
                    avatarAppearance.DetachItemFromPoint(i)
                }
            }
        }
    }
}
