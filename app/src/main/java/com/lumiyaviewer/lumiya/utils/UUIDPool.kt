package com.lumiyaviewer.lumiya.utils

import com.google.common.base.Strings
import java.util.UUID

class UUIDPool : InternPool<UUID>() {
    companion object {
        @JvmField
        val ZeroUUID: UUID = UUID(0, 0)

        private val instance = UUIDPool()

        @JvmStatic
        fun getInstance(): UUIDPool = instance

        @JvmStatic
        fun getUUID(mostSig: Long, leastSig: Long): UUID = instance.intern(UUID(mostSig, leastSig))

        @JvmStatic
        fun getUUID(str: String?): UUID? {
            if (Strings.isNullOrEmpty(str)) return null
            return instance.intern(UUID.fromString(str))
        }

        @JvmStatic
        fun getUUID(uuid: UUID): UUID = instance.intern(uuid)

        @JvmStatic
        fun setUUID(uuid: UUID?, mostSig: Long, leastSig: Long): UUID {
            return if (uuid != null && uuid.mostSignificantBits == mostSig && uuid.leastSignificantBits == leastSig) {
                uuid
            } else {
                instance.intern(UUID(mostSig, leastSig))
            }
        }
    }
}
