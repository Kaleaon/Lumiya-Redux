package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import java.util.UUID;

public class RLVCmdTeleportTo implements RLVCommand {
    @Override
    public void Handle(RLVController rlvController, UUID uuid, RLVCommands rlvCommands, String str, String str2) {
        if (!str.equals("force") || str2 == null) {
            return;
        }
        String[] split = str2.split("/");
        if (split.length >= 3) {
            try {
                rlvController.teleportToGlobalPos(uuid, new LLVector3(Float.parseFloat(split[0]), Float.parseFloat(split[1]), Float.parseFloat(split[2])));
            } catch (NumberFormatException e) {
                Debug.Warning(e);
            }
        }
    }
}
