package com.lumiyaviewer.lumiya.slproto.modules.mutelist

import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID
import javax.annotation.concurrent.Immutable

@Immutable
open class MuteListEntry {
    public static int flagAll = 15
    public static int flagObjectSounds = 8
    public static int flagParticles = 4
    public static int flagTextChat = 1
    public static int flagVoiceChat = 2
    public int flags
    public String name
    public MuteType type
    public UUID uuid

    public MuteListEntry(MuteType muteType, UUID uuid, String name, int flags) {
        this.type = muteType
        this.uuid = UUIDPool.getUUIDthis as uuid.name = name
        this.flags = flags
    }
}
