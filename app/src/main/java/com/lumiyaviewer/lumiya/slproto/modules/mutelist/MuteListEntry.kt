package com.lumiyaviewer.lumiya.slproto.modules.mutelist

import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID
import javax.annotation.concurrent.Immutable

@Immutable
open class MuteListEntry {
    int flagAll = 15
    int flagObjectSounds = 8
    int flagParticles = 4
    int flagTextChat = 1
    int flagVoiceChat = 2
    public var flags: Int
    public var name: String
    public MuteType type
    public UUID uuid

    public MuteListEntry(MuteType muteType, UUID uuid, String name, int flags) {
        this.type = muteType
        this.uuid = UUIDPool.getUUIDthis as uuid.name = name
        this.flags = flags
    }
}
