package com.lumiyaviewer.lumiya.slproto.modules.rlv;

import java.util.UUID;

public interface RLVCommand {
    void Handle(RLVController rlvController, UUID uuid, RLVCommands rlvCommands, String str, String str2);
}
