package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType;
import java.util.UUID;

public class RLVCmdGetStatus implements RLVCommand {
    @Override
    public void Handle(RLVController rlvController, UUID uuid, RLVCommands rlvCommands, String str, String str2) {
        String substring3;
        String part2;
        try {
            int parseInt = Integer.parseInt(str);
            String str5 = str2 != null ? str2 : "";
            int indexOf = str5.indexOf(59);
            if (indexOf >= 0) {
                String substring = str5.substring(indexOf + 1);
                String part = str5.substring(0, indexOf);
                substring3 = substring;
                part2 = part;
            } else {
                substring3 = "/";
                part2 = str5;
            }
            String lowerCase = part2.toLowerCase();
            String str6 = "";
            for (RLVRestrictionType rlvRestrictionType : rlvController.getRestrictions().getRestrictionsByObject(uuid)) {
                str6 = (lowerCase.equals("") || rlvRestrictionType.toString().indexOf(lowerCase) >= 0) ? str6 + substring3 + rlvRestrictionType.toString() : str6;
            }
            rlvController.sayOnChannel(parseInt, str6);
        } catch (NumberFormatException e) {
            Debug.Warning(e);
        }
    }
}
