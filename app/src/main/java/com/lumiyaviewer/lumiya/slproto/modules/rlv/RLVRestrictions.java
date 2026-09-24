package com.lumiyaviewer.lumiya.slproto.modules.rlv;

import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.slproto.modules.rlv.RLVRestrictionType;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

public class RLVRestrictions {
    private Map<RLVRestrictionType, RLVRestrictionList> restrictions = new EnumMap(RLVRestrictionType.class);

    private static class RLVRestrictionList {

        private Map<String, HashSet<UUID>> restMap;

        private RLVRestrictionList() {
            this.restMap = new HashMap();
        }

        /* synthetic */ RLVRestrictionList(RLVRestrictionList rLVRestrictionList) {
            this();
        }

        public void addRestriction(UUID uuid, String str) {
            HashSet<UUID> hashSet = this.restMap.get(str);
            if (hashSet == null) {
                hashSet = new HashSet<>();
                this.restMap.put(str, hashSet);
            }
            hashSet.add(uuid);
        }

        public Set<String> getTargets() {
            return this.restMap.keySet();
        }

        public boolean hasRestrictionsByObject(UUID uuid) {
            if (uuid == null) {
                return !this.restMap.isEmpty();
            }
            Iterator<Map.Entry<String, HashSet<UUID>>> it = this.restMap.entrySet().iterator();
            while (it.hasNext()) {
                if (((HashSet) ((Map.Entry) it.next()).getValue()).contains(uuid)) {
                    return true;
                }
            }
            return false;
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
        public boolean isAllowed(RLVRestrictionType.RLVRuleMatchType matchType, String option, UUID objectID, UUID sourceID) {
            if (matchType == RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesAllowance) {
                if (this.restMap.containsKey("")) {
                    return true;
                }
                return !option.equals("") && this.restMap.containsKey(option);
            }
            if (this.restMap.isEmpty()) {
                return true;
            }
            switch (matchType) {
                case TargetNoExceptions:
                    // Secure variant: only allowed when every restriction was set
                    // by the asking object alone.
                    if (this.restMap.isEmpty()) {
                        return true;
                    }
                    if (sourceID == null) {
                        return false;
                    }
                    for (HashSet<UUID> sources : this.restMap.values()) {
                        if (sources.size() != 1 || !sources.contains(sourceID)) {
                            return false;
                        }
                    }
                    return true;
                case TargetSpecifiesException:
                    // "" restricts; an option lists an exception to it.
                    if (!this.restMap.containsKey("")) {
                        return true;
                    }
                    return !option.equals("") && this.restMap.containsKey(option);
                case TargetSpecifiesRestriction:
                    // An option restricts that target; "" restricts all but the
                    // objects that set it.
                    if (this.restMap.containsKey(option)) {
                        return false;
                    }
                    if (!this.restMap.containsKey("")) {
                        return true;
                    }
                    if (objectID == null) {
                        return false;
                    }
                    return !this.restMap.get("").contains(objectID);
                default:
                    return true;
            }
        }

        public boolean isEmpty() {
            return this.restMap.isEmpty();
        }

        public void removeAllForObject(UUID uuid) {
            HashSet hashSet = new HashSet();
            Iterator<Map.Entry<String, HashSet<UUID>>> it = this.restMap.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry entry = (Map.Entry) it.next();
                ((HashSet) entry.getValue()).remove(uuid);
                if (((HashSet) entry.getValue()).isEmpty()) {
                    hashSet.add((String) entry.getKey());
                }
            }
            Iterator it2 = hashSet.iterator();
            while (it2.hasNext()) {
                this.restMap.remove((String) it2.next());
            }
        }

        public void removeRestriction(UUID uuid, String str) {
            HashSet<UUID> hashSet = this.restMap.get(str);
            if (hashSet != null) {
                hashSet.remove(uuid);
                if (hashSet.isEmpty()) {
                    this.restMap.remove(str);
                }
            }
        }
    }

    public synchronized void addRestriction(RLVRestrictionType rLVRestrictionType, UUID uuid, String str) {
        if (str == null) {
            str = "";
        }
        Debug.Printf("RLV: adding restriction '%s' for object %s, target '%s'", rLVRestrictionType.toString(), uuid, str);
        RLVRestrictionList rLVRestrictionList = this.restrictions.get(rLVRestrictionType);
        if (rLVRestrictionList == null) {
            rLVRestrictionList = new RLVRestrictionList(null);
            this.restrictions.put(rLVRestrictionType, rLVRestrictionList);
        }
        rLVRestrictionList.addRestriction(uuid, str.toLowerCase());
    }

    public synchronized List<RLVRestrictionType> getRestrictionsByObject(UUID uuid) {
        LinkedList linkedList;
        linkedList = new LinkedList();
        Iterator<Map.Entry<RLVRestrictionType, RLVRestrictionList>> it = this.restrictions.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            if (((RLVRestrictionList) entry.getValue()).hasRestrictionsByObject(uuid)) {
                linkedList.add((RLVRestrictionType) entry.getKey());
            }
        }
        return linkedList;
    }

    public synchronized Set<String> getTargetsForRestriction(RLVRestrictionType rLVRestrictionType) {
        RLVRestrictionList rLVRestrictionList = this.restrictions.get(rLVRestrictionType);
        if (rLVRestrictionList == null) {
            return null;
        }
        return rLVRestrictionList.getTargets();
    }

    public synchronized boolean isAllowed(RLVRestrictionType rLVRestrictionType, String str, UUID uuid) {
        return isAllowed(rLVRestrictionType, str, uuid, null);
    }

    public synchronized boolean isAllowed(RLVRestrictionType rLVRestrictionType, String str, UUID uuid, UUID uuid2) {
        if (str == null) {
            str = "";
        }
        RLVRestrictionList rLVRestrictionList = this.restrictions.get(rLVRestrictionType);
        if (rLVRestrictionList != null) {
            return rLVRestrictionList.isAllowed(rLVRestrictionType.getRuleMatchType(), str.toLowerCase(), uuid, uuid2);
        }
        return rLVRestrictionType.getRuleMatchType() != RLVRestrictionType.RLVRuleMatchType.TargetSpecifiesAllowance;
    }

    public synchronized void removeRestriction(RLVRestrictionType rLVRestrictionType, UUID uuid, String str) {
        if (str == null) {
            str = "";
        }
        Debug.Printf("RLV: removing restriction '%s' for object %s, target '%s'", rLVRestrictionType.toString(), uuid, str);
        RLVRestrictionList rLVRestrictionList = this.restrictions.get(rLVRestrictionType);
        if (rLVRestrictionList != null) {
            rLVRestrictionList.removeRestriction(uuid, str.toLowerCase());
            if (rLVRestrictionList.isEmpty()) {
                this.restrictions.remove(rLVRestrictionType);
            }
        }
    }

    public synchronized void removeRestrictions(UUID uuid, Set<RLVRestrictionType> set) {
        Debug.Printf("RLV: removing %d restrictions for object %s", Integer.valueOf(set.size()), uuid);
        for (RLVRestrictionType rLVRestrictionType : set) {
            RLVRestrictionList rLVRestrictionList = this.restrictions.get(rLVRestrictionType);
            if (rLVRestrictionList != null) {
                rLVRestrictionList.removeAllForObject(uuid);
                if (rLVRestrictionList.isEmpty()) {
                    this.restrictions.remove(rLVRestrictionType);
                }
            }
        }
    }
}
