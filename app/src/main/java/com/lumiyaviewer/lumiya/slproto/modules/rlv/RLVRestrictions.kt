package com.lumiyaviewer.lumiya.slproto.modules.rlv

import com.lumiyaviewer.lumiya.Debug
import java.util.EnumMap
import java.util.LinkedList
import java.util.UUID

open class RLVRestrictions {
    private val restrictions: MutableMap<RLVRestrictionType, RLVRestrictionList> = EnumMap(RLVRestrictionType::class.java)

    private class RLVRestrictionList {

        private val restMap: MutableMap<String, HashSet<UUID>> = HashMap()

        fun addRestriction(uuid: UUID, str: String) {
            var hashSet = this.restMap[str]
            if (hashSet == null) {
                hashSet = HashSet()
                this.restMap[str] = hashSet
            }
            hashSet.add(uuid)
        }

        fun getTargets(): MutableSet<String> {
            return this.restMap.keys
        }

        fun hasRestrictionsByObject(uuid: UUID?): Boolean {
            if (uuid == null) {
                return !this.restMap.isEmpty()
            }
            for (entry in this.restMap.entries) {
                if (entry.value.contains(uuid)) {
                    return true
                }
            }
            return false
        }

        /**
         * Whether an action is allowed under this behaviour's restrictions.
         * restMap maps an option ("" = the behaviour with no option) to the
         * objects that imposed it.
         *
         * @param matchType how options are interpreted for this behaviour
         * @param option    the option being checked (e.g. an agent UUID string)
         * @param objectID  object the action concerns (TargetSpecifiesRestriction)
         * @param sourceID  object asking, for "secure" behaviours (TargetNoExceptions)
         */
        fun isAllowed(matchType: RLVRestrictionType.RLVRuleMatchType?, option: String?, objectID: UUID?, sourceID: UUID?): Boolean {
            if (matchType == null) {
                return true
            }
            val target = option ?: ""
            if (matchType == RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesAllowance) {
                if (this.restMap.containsKey("")) {
                    return true
                }
                return target.isNotEmpty() && this.restMap.containsKey(target)
            }
            if (this.restMap.isEmpty()) {
                return true
            }
            return when (matchType) {
                RLVRestrictionType.RLVRuleMatchType.TargetNoExceptions -> {
                    // Secure variant: only allowed when every restriction was set
                    // by the asking object alone.
                    if (this.restMap.isEmpty()) {
                        return true
                    }
                    if (sourceID == null) {
                        return false
                    }
                    for (sources in this.restMap.values) {
                        if (sources.size != 1 || !sources.contains(sourceID)) {
                            return false
                        }
                    }
                    true
                }
                RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesException -> {
                    // "" restricts; an option lists an exception to it.
                    if (!this.restMap.containsKey("")) {
                        return true
                    }
                    target.isNotEmpty() && this.restMap.containsKey(target)
                }
                RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesRestriction -> {
                    // An option restricts that target; "" restricts all but the
                    // objects that set it.
                    if (target.isNotEmpty() && this.restMap.containsKey(target)) {
                        return false
                    }
                    if (!this.restMap.containsKey("")) {
                        return true
                    }
                    if (objectID == null) {
                        return false
                    }
                    this.restMap[""]?.contains(objectID) ?: false
                }
                else -> true
            }
        }

        fun isEmpty(): Boolean {
            return this.restMap.isEmpty()
        }

        fun removeAllForObject(uuid: UUID) {
            val toRemove = HashSet<String>()
            for (entry in this.restMap.entries) {
                entry.value.remove(uuid)
                if (entry.value.isEmpty()) {
                    toRemove.add(entry.key)
                }
            }
            for (key in toRemove) {
                this.restMap.remove(key)
            }
        }

        fun removeRestriction(uuid: UUID, str: String) {
            val hashSet = this.restMap[str]
            if (hashSet != null) {
                hashSet.remove(uuid)
                if (hashSet.isEmpty()) {
                    this.restMap.remove(str)
                }
            }
        }
    }

    @Synchronized
    fun addRestriction(rlvRestrictionType: RLVRestrictionType, uuid: UUID, str: String?) {
        val target = str ?: ""
        Debug.Printf("RLV: adding restriction '%s' for object %s, target '%s'", rlvRestrictionType.toString(), uuid, target)
        var rlvRestrictionList = this.restrictions[rlvRestrictionType]
        if (rlvRestrictionList == null) {
            rlvRestrictionList = RLVRestrictionList()
            this.restrictions[rlvRestrictionType] = rlvRestrictionList
        }
        rlvRestrictionList.addRestriction(uuid, target.lowercase())
    }

    @Synchronized
    fun getRestrictionsByObject(uuid: UUID?): MutableList<RLVRestrictionType> {
        val linkedList = LinkedList<RLVRestrictionType>()
        for (entry in this.restrictions.entries) {
            if (entry.value.hasRestrictionsByObject(uuid)) {
                linkedList.add(entry.key)
            }
        }
        return linkedList
    }

    @Synchronized
    fun getTargetsForRestriction(rlvRestrictionType: RLVRestrictionType): MutableSet<String>? {
        val rlvRestrictionList = this.restrictions[rlvRestrictionType] ?: return null
        return rlvRestrictionList.getTargets()
    }

    @Synchronized
    fun isAllowed(rlvRestrictionType: RLVRestrictionType, str: String?, uuid: UUID?): Boolean {
        return isAllowed(rlvRestrictionType, str, uuid, null)
    }

    @Synchronized
    fun isAllowed(rlvRestrictionType: RLVRestrictionType, str: String?, uuid: UUID?, uuid2: UUID?): Boolean {
        val target = str ?: ""
        val rlvRestrictionList = this.restrictions[rlvRestrictionType]
        if (rlvRestrictionList != null) {
            return rlvRestrictionList.isAllowed(rlvRestrictionType.getRuleMatchType(), target.lowercase(), uuid, uuid2)
        }
        return rlvRestrictionType.getRuleMatchType() != RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesAllowance
    }

    @Synchronized
    fun removeRestriction(rlvRestrictionType: RLVRestrictionType, uuid: UUID, str: String?) {
        val target = str ?: ""
        Debug.Printf("RLV: removing restriction '%s' for object %s, target '%s'", rlvRestrictionType.toString(), uuid, target)
        val rlvRestrictionList = this.restrictions[rlvRestrictionType]
        if (rlvRestrictionList != null) {
            rlvRestrictionList.removeRestriction(uuid, target.lowercase())
            if (rlvRestrictionList.isEmpty()) {
                this.restrictions.remove(rlvRestrictionType)
            }
        }
    }

    @Synchronized
    fun removeRestrictions(uuid: UUID, set: MutableSet<RLVRestrictionType>) {
        Debug.Printf("RLV: removing %d restrictions for object %s", set.size, uuid)
        for (rlvRestrictionType in set) {
            val rlvRestrictionList = this.restrictions[rlvRestrictionType]
            if (rlvRestrictionList != null) {
                rlvRestrictionList.removeAllForObject(uuid)
                if (rlvRestrictionList.isEmpty()) {
                    this.restrictions.remove(rlvRestrictionType)
                }
            }
        }
    }
}
