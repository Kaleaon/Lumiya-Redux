package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands;

import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType;
import java.util.HashSet;
import java.util.UUID;

public class RLVCmdClear implements RLVCommand {
    @Override
    public void Handle(RLVController rlvController, UUID uuid, RLVCommands rlvCommands, String str, String str2) {
        HashSet hashSet = new HashSet();
        for (RLVRestrictionType rlvRestrictionType : RLVRestrictionType.values()) {
            if (str == "") {
                hashSet.add(rlvRestrictionType);
            } else if (rlvRestrictionType.toString().contains(str)) {
                hashSet.add(rlvRestrictionType);
            }
        }
        rlvController.getRestrictions().removeRestrictions(uuid, hashSet);
    }
}
