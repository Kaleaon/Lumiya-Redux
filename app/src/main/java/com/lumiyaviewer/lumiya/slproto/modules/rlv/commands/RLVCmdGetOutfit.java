package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.assets.SLWearableType;
import com.lumiyaviewer.lumiya.slproto.modules.SLAvatarAppearance;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController;
import java.util.UUID;

public class RLVCmdGetOutfit implements RLVCommand {
    @Override
    public void Handle(RLVController rlvController, UUID uuid, RLVCommands rlvCommands, String str, String str2) {
        try {
            int parseInt = Integer.parseInt(str);
            SLAvatarAppearance avatarAppearance = rlvController.getModules().avatarAppearance;
            String str3 = "";
            for (SLWearableType wearableType : new SLWearableType[]{SLWearableType.WT_GLOVES, SLWearableType.WT_JACKET, SLWearableType.WT_PANTS, SLWearableType.WT_SHIRT, SLWearableType.WT_SHOES, SLWearableType.WT_SKIRT, SLWearableType.WT_SOCKS, SLWearableType.WT_UNDERPANTS, SLWearableType.WT_UNDERSHIRT, SLWearableType.WT_SKIN, SLWearableType.WT_EYES, SLWearableType.WT_HAIR, SLWearableType.WT_SHAPE, SLWearableType.WT_ALPHA, SLWearableType.WT_TATTOO}) {
                if (!wearableType.isBodyPart()) {
                    String name = wearableType.getName();
                    if (str2.equals("") || name.equalsIgnoreCase(str2)) {
                        str3 = avatarAppearance.hasWornWearable(wearableType) ? str3 + "1" : str3 + "0";
                    }
                }
            }
            rlvController.sayOnChannel(parseInt, str3);
        } catch (NumberFormatException e) {
            Debug.Warning(e);
        }
    }
}
