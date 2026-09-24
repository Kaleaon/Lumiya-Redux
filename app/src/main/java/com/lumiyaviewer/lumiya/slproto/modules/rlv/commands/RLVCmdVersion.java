package com.lumiyaviewer.lumiya.slproto.modules.rlv.commands;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommand;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVCommands;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVController;
import java.util.UUID;

public class RLVCmdVersion implements RLVCommand {

    private static final int RLV_VERSION_BUILD = 0;
    private static final int RLV_VERSION_MAJOR = 1;
    private static final int RLV_VERSION_MINOR = 10;
    private static final int RLV_VERSION_PATCH = 1;
    private static final int RLVa_VERSION_MAJOR = 1;
    private static final int RLVa_VERSION_MINOR = 10;
    private static final int RLVa_VERSION_PATCH = 1;

    public static String getManualVersionReply() {
        return String.format("RestrainedLove viewer v%d.%d.%d", 1, 10, 1);
    }

    @Override
    public void Handle(RLVController rlvController, UUID uuid, RLVCommands rlvCommands, String str, String str2) {
        try {
            int parseInt = Integer.parseInt(str);
            switch (rlvCommands) {
                case version:
                case versionnew:
                    Object[] objArr = new Object[7];
                    objArr[0] = rlvCommands == RLVCommands.versionnew ? "RestrainedLove" : "RestrainedLife";
                    objArr[1] = 1;
                    objArr[2] = 10;
                    objArr[3] = 1;
                    objArr[4] = 1;
                    objArr[5] = 10;
                    objArr[6] = 1;
                    rlvController.sayOnChannel(parseInt, String.format("%s viewer v%d.%d.%d (RLVa %d.%d.%d)", objArr));
                    break;
                case versionnum:
                    rlvController.sayOnChannel(parseInt, String.format("%d%02d%02d%02d", 1, 10, 1, 0));
                    break;
            }
        } catch (NumberFormatException e) {
            Debug.Warning(e);
        }
    }
}
