package com.lumiyaviewer.lumiya.slproto.modules.rlv

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType
import java.util.EnumMap
import java.util.HashMap
import java.util.HashSet
import java.util.Iterator
import java.util.LinkedList
import java.util.List
import java.util.Map
import java.util.Set
import java.util.UUID

open class RLVRestrictions {
    private var restrictions: MutableMap<RLVRestrictionType, RLVRestrictionList> = EnumMap(RLVRestrictionType.class)

    private open class RLVRestrictionList {

        private Map<String, HashSet<UUID>> restMap

        fun RLVRestrictionList(): private {
            this.restMap = HashMap()
        }

        /* synthetic */ RLVRestrictionList(RLVRestrictionList rlvRestrictionList) {
            this()
        }

        fun addRestriction(uuid: UUID, str: String) {
            var hashSet: HashSet<UUID> = this.restMap.get(str)
            if (hashSet == null) {
                hashSet = HashSet<>()
                this.restMap.put(str, hashSet)
            }
            hashSet.add(uuid)
        }

        fun getTargets(): MutableSet<String> {
            return this.restMap.keySet()
        }

        fun hasRestrictionsByObject(uuid: UUID): Boolean {
            if (uuid == null) {
                return !this.restMap.isEmpty()
            }
            Iterator<Map.Entry<String, HashSet<UUID>>> it = this.restMap.entrySet().iterator()
            while (it.hasNext()) {
                if (((HashSet) ((Map.Entry) it.next()).getValue()).contains(uuid)) {
        return true
                }
            }
        return false
        }

        /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
        /* JADX WARN: Removed duplicated region for block: B:18:0x003b A[RETURN] */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
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
        fun isAllowed(matchType: RLVRestrictionType.RLVRuleMatchType, option: String, objectID: UUID, sourceID: UUID): Boolean {
            if (matchType == RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesAllowance) {
                if (this.restMap.containsKey("")) {
        return true
                }
                return !option.equals("") && this.restMap.containsKey(option)
            }
            if (this.restMap.isEmpty()) {
        return true
            }
            when (matchType) {
                TargetNoExceptions ->
                    // Secure variant: only allowed when every restriction was set
                    // by the asking object alone.
                    if (this.restMap.isEmpty()) {
        return true
                    }
                    if (sourceID == null) {
        return false
                    }
                    for (sources in this.restMap.values()) {
                        if (sources.size() != 1 || !sources.contains(sourceID)) {
        return false
                        }
                    }
        return true
                TargetSpecifiesException ->
                    // "" restricts; an option lists an exception to it.
                    if (!this.restMap.containsKey("")) {
        return true
                    }
                    return !option.equals("") && this.restMap.containsKey(option)
                TargetSpecifiesRestriction ->
                    // An option restricts that target; "" restricts all but the
                    // objects that set it.
                    if (this.restMap.containsKey(option)) {
        return false
                    }
                    if (!this.restMap.containsKey("")) {
        return true
                    }
                    if (objectID == null) {
        return false
                    }
                    return !this.restMap.get("").contains(objectID)
                else ->
        return true
            }
        }

        fun isEmpty(): Boolean {
            return this.restMap.isEmpty()
        }

        fun removeAllForObject(uuid: UUID) {
            var hashSet: HashSet = HashSet()
            Iterator<Map.Entry<String, HashSet<UUID>>> it = this.restMap.entrySet().iterator()
            while (it.hasNext()) {
                var entry: Map.Entry = (Map.Entry) it.next()
                (entry as HashSet.getValue()).remove(uuid)
                if ((entry as HashSet.getValue()).isEmpty()) {
                    hashSet.add(entry as String.getKey())
                }
            }
            var iterator: Iterator = hashSet.iterator()
            while (iterator.hasNext()) {
                this.restMap.remove(iterator as String.next())
            }
        }

        fun removeRestriction(uuid: UUID, str: String) {
            var hashSet: HashSet<UUID> = this.restMap.get(str)
            if (hashSet != null) {
                hashSet.remove(uuid)
                if (hashSet.isEmpty()) {
                    this.restMap.remove(str)
                }
            }
        }
    }

    fun addRestriction(rlvRestrictionType: RLVRestrictionType, uuid: UUID, str: String) {
        if (str == null) {
            str = ""
        }
        Debug.Printf("RLV: adding restriction '%s' for object %s, target '%s'", rlvRestrictionType.toString(), uuid, str)
        var rlvRestrictionList: RLVRestrictionList = this.restrictions.get(rlvRestrictionType)
        if (rlvRestrictionList == null) {
            rlvRestrictionList = RLVRestrictionListthis as null.restrictions.put(rlvRestrictionType, rlvRestrictionList)
        }
        rlvRestrictionList.addRestriction(uuid, str.toLowerCase())
    }

    fun getRestrictionsByObject(uuid: UUID): MutableList<RLVRestrictionType> {
        var linkedList: LinkedList = null
        linkedList = LinkedList()
        Iterator<Map.Entry<RLVRestrictionType, RLVRestrictionList>> it = this.restrictions.entrySet().iterator()
        while (it.hasNext()) {
            var entry: Map.Entry = (Map.Entry) it.next()
            if ((entry as RLVRestrictionList.getValue()).hasRestrictionsByObject(uuid)) {
                linkedList.add(entry as RLVRestrictionType.getKey())
            }
        }
        return linkedList
    }

    fun getTargetsForRestriction(rlvRestrictionType: RLVRestrictionType): MutableSet<String> {
        var rlvRestrictionList: RLVRestrictionList = this.restrictions.get(rlvRestrictionType)
        if (rlvRestrictionList == null) {
        return null
        }
        return rlvRestrictionList.getTargets()
    }

    fun isAllowed(rlvRestrictionType: RLVRestrictionType, str: String, uuid: UUID): Boolean {
        return isAllowed(rlvRestrictionType, str, uuid, null)
    }

    fun isAllowed(rlvRestrictionType: RLVRestrictionType, str: String, uuid: UUID, uuid2: UUID): Boolean {
        if (str == null) {
            str = ""
        }
        var rlvRestrictionList: RLVRestrictionList = this.restrictions.get(rlvRestrictionType)
        if (rlvRestrictionList != null) {
            return rlvRestrictionList.isAllowed(rlvRestrictionType.getRuleMatchType(), str.toLowerCase(), uuid, uuid2)
        }
        return rlvRestrictionType.getRuleMatchType() != RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesAllowance
    }

    fun removeRestriction(rlvRestrictionType: RLVRestrictionType, uuid: UUID, str: String) {
        if (str == null) {
            str = ""
        }
        Debug.Printf("RLV: removing restriction '%s' for object %s, target '%s'", rlvRestrictionType.toString(), uuid, str)
        var rlvRestrictionList: RLVRestrictionList = this.restrictions.get(rlvRestrictionType)
        if (rlvRestrictionList != null) {
            rlvRestrictionList.removeRestriction(uuid, str.toLowerCase())
            if (rlvRestrictionList.isEmpty()) {
                this.restrictions.remove(rlvRestrictionType)
            }
        }
    }

    fun removeRestrictions(uuid: UUID, set: MutableSet<RLVRestrictionType>) {
        Debug.Printf("RLV: removing %d restrictions for object %s", set.size(), uuid)
        for (rlvRestrictionType in set) {
            var rlvRestrictionList: RLVRestrictionList = this.restrictions.get(rlvRestrictionType)
            if (rlvRestrictionList != null) {
                rlvRestrictionList.removeAllForObject(uuid)
                if (rlvRestrictionList.isEmpty()) {
                    this.restrictions.remove(rlvRestrictionType)
                }
            }
        }
    }
}
