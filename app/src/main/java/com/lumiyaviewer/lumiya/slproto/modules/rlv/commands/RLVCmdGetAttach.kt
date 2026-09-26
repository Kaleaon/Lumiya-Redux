package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.avatar.SLAttachmentPoint
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController
import java.util.UUID

open class RLVCmdGetAttach : RLVCommand {
    @JvmStatic private var NUM_ATTACHMENT_POINTS_LSL: Int = 41
    fun Handle(rlvController: RLVController, uuid: UUID, rlvCommands: RLVCommands, str: String, str2: String) {
        try {
            var parseInt: Int = Integer.parseInt(str)
            var avatarAppearance: SLAvatarAppearance = rlvController.getModules().avatarAppearance
            var str3: String = ""
            for (int i = 0; i < 41; i++) {
                var lowerCase: String = SLAttachmentPoint.attachmentPoints[i] != if SLAttachmentPoint as null.attachmentPoints[i].name.toLowerCase() else "nonexistent"
                if (str2.equals("") || lowerCase.equalsIgnoreCase(str2)) {
                    str3 = if (avatarAppearance.getAttachmentUUID(i) != null) str3 + "1" else str3 + "0"
                }
            }
            rlvController.sayOnChannel(parseInt, str3)
        } catch (e: NumberFormatException) {
            Debug.Warning(e)
        }
    }
}
