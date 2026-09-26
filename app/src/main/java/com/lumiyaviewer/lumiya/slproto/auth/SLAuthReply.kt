package com.lumiyaviewer.lumiya.slproto.auth

import com.google.common.collect.ImmutableList
import com.google.vr.cardboard.VrSettingsProviderContract
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.io.IOException
import java.util.Collection
import java.util.LinkedList
import java.util.List
import java.util.UUID
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlPullParserException

class SLAuthReply {
    var agentAppearanceService: String = ""
    var agentID: UUID = null
    var circuitCode: Int = 0
    var friends: ImmutableList<Friend> = null
    var fromTeleport: Boolean = false
    var gridName: String = ""
    var inventoryRoot: UUID = null
    var isIndeterminate: Boolean = false
    var isTemporary: Boolean = false
    var loginURL: String = ""
    var message: String = ""
    /** Multi-factor hash to save and send on later logins; null if the grid sent none. */
    var mfaHash: String = ""
    var nextMethod: String = ""
    var nextURL: String = ""
    var secureSessionID: UUID = null
    var seedCapability: String = ""
    var sessionID: UUID = null
    var simAddress: String = ""
    var simPort: Int = 0
    var success: Boolean = false
    /** Failure reason code, e.g. "key", "presence", "mfa_challenge"; null on success. */
    var reason: String = ""

    /** Login reason code asking for a multi-factor code (lllogininstance.cpp). */
    @JvmStatic var REASON_MFA_CHALLENGE: String = "mfa_challenge"

    open class Friend {
        public int rightsGiven
        public int rightsHas

        public UUID uuid

        fun Friend(uuid: UUID, rightsGiven: Int, rightsHas: Int): public {
            this.uuid = uuid
            this.rightsGiven = rightsGiven
            this.rightsHas = rightsHas
        }
    }

    constructor(authReply: SLAuthReply, fromTeleport: Boolean, isTemporary: Boolean, uuid: UUID, simAddress: String, simPort: Int, seedCapability: String) {
        this.gridName = authReply.gridName
        this.loginURL = authReply.loginURL
        this.sessionID = authReply.sessionID
        this.secureSessionID = authReply.secureSessionID
        this.agentID = if (uuid == null) authReply.agentID else uuid
        this.circuitCode = authReply.circuitCode
        this.simAddress = simAddress
        this.simPort = simPort
        this.seedCapability = seedCapability
        this.success = authReply.success
        this.message = authReply.message
        this.agentAppearanceService = authReply.agentAppearanceService
        this.inventoryRoot = authReply.inventoryRoot
        this.friends = authReply.friends
        this.isIndeterminate = authReply.isIndeterminate
        this.nextMethod = authReply.nextMethod
        this.nextURL = authReply.nextURL
        this.fromTeleport = fromTeleport
        this.isTemporary = isTemporary
        this.reason = authReply.reason
        this.mfaHash = authReply.mfaHash
    }

    public SLAuthReply(String gridName, String loginURL, XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        this.gridName = gridName
        this.loginURL = loginURL
        var z: Boolean = false
        var str3: String = null
        var str4: String = null
        var uuid: UUID = null
        var uuid2: UUID = null
        var uuid3: UUID = null
        var i: Int = 0
        var str5: String = null
        var i2: Int = 0
        var str6: String = null
        var z2: Boolean = false
        var str7: String = ""
        var str8: String = null
        var uuid4: UUID = null
        var reason: String = null
        var mfaHash: String = null
        var of: MutableList<Friend> = ImmutableList.of()
        xmlPullParser.nextTag()
        xmlPullParser.require(2, null, "methodResponse")
        xmlPullParser.nextTag()
        if (skipUntilTag(xmlPullParser, "params")) {
            if (skipUntilTag(xmlPullParser, "param")) {
                if (skipUntilTag(xmlPullParser, VrSettingsProviderContract.SETTING_VALUE_KEY)) {
                    if (skipUntilTag(xmlPullParser, "struct")) {
                        while (skipUntilTag(xmlPullParser, "member")) {
                            if (!skipUntilTag(xmlPullParser, "name")) {
                                throw XmlPullParserException("Not found name", xmlPullParser, null)
                            }
                            var innerText: String = getInnerText(xmlPullParser)
                            finishTag(xmlPullParser)
                            if (skipUntilTag(xmlPullParser, VrSettingsProviderContract.SETTING_VALUE_KEY)) {
                                if (innerText.equalsIgnoreCase("session_id")) {
                                    uuid = UUIDPool.getUUID(getSimpleValue(xmlPullParser))
                                } else if (innerText.equalsIgnoreCase("secure_session_id")) {
                                    uuid2 = UUIDPool.getUUID(getSimpleValue(xmlPullParser))
                                } else if (innerText.equalsIgnoreCase("agent_id")) {
                                    uuid3 = UUIDPool.getUUID(getSimpleValue(xmlPullParser))
                                } else if (innerText.equalsIgnoreCase("circuit_code")) {
                                    i = Integer.decode(getSimpleValue(xmlPullParser))
                                } else if (innerText.equalsIgnoreCase("sim_ip")) {
                                    str5 = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("sim_port")) {
                                    i2 = Integer.decode(getSimpleValue(xmlPullParser))
                                } else if (innerText.equalsIgnoreCase("seed_capability")) {
                                    str6 = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("login")) {
                                    var simpleValue: String = getSimpleValue(xmlPullParser)
                                    z2 = simpleValue.equalsIgnoreCase("true")
                                    z = simpleValue.equalsIgnoreCase("indeterminate")
                                } else if (innerText.equalsIgnoreCase("next_url")) {
                                    str3 = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("next_method")) {
                                    str4 = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("reason")) {
                                    reason = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("mfa_hash")) {
                                    mfaHash = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("message")) {
                                    str7 = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("agent_appearance_service")) {
                                    str8 = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("inventory-root")) {
                                    uuid4 = getInventoryRootValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("buddy-list")) {
                                    of = parseBuddyList(xmlPullParser)
                                }
                                finishTag(xmlPullParser)
                            }
                            finishTag(xmlPullParser)
                        }
                        finishTag(xmlPullParser)
                    }
                    finishTag(xmlPullParser)
                }
                finishTag(xmlPullParser)
            }
            finishTag(xmlPullParser)
        }
        this.sessionID = uuid
        this.secureSessionID = uuid2
        this.agentID = uuid3
        this.circuitCode = i
        this.simAddress = str5
        this.simPort = i2
        this.seedCapability = str6
        this.success = z2
        this.message = str7
        this.agentAppearanceService = str8
        this.inventoryRoot = uuid4
        this.friends = ImmutableList.copyOf(of as Collection)
        this.fromTeleport = false
        this.isTemporary = false
        this.isIndeterminate = z
        this.nextURL = str3
        this.nextMethod = str4
        this.reason = reason
        this.mfaHash = mfaHash
    }

    fun isMfaChallenge(): Boolean {
        return !this.success && REASON_MFA_CHALLENGE.equals(this.reason)
    }

    private void finishTag(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        while (xmlPullParser.getEventType() != 1) {
            if (xmlPullParser.getEventType() == 3) {
                xmlPullParser.next()
                return
            } else if (xmlPullParser.getEventType() == 2) {
                skipTag(xmlPullParser)
            } else {
                xmlPullParser.next()
            }
        }
    }

    private String getInnerText(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        if (xmlPullParser.getEventType() != 4) {
            return ""
        }
        var text: String = xmlPullParser.getText()
        xmlPullParser.next()
        return text
    }

    private UUID getInventoryRootValue(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        var uuid: UUID = null
        if (skipUntilTag(xmlPullParser, "array")) {
            if (skipUntilTag(xmlPullParser, "data")) {
                while (skipUntilTag(xmlPullParser, VrSettingsProviderContract.SETTING_VALUE_KEY)) {
                    if (skipUntilTag(xmlPullParser, "struct")) {
                        while (skipUntilTag(xmlPullParser, "member")) {
                            if (skipUntilTag(xmlPullParser, "name")) {
                                var innerText: String = getInnerText(xmlPullParser)
                                finishTag(xmlPullParser)
                                if (skipUntilTag(xmlPullParser, VrSettingsProviderContract.SETTING_VALUE_KEY)) {
                                    if (innerText.equalsIgnoreCase("folder_id")) {
                                        uuid = UUID.fromString(getSimpleValue(xmlPullParser))
                                    }
                                    finishTag(xmlPullParser)
                                }
                            }
                            finishTag(xmlPullParser)
                        }
                        finishTag(xmlPullParser)
                    }
                    finishTag(xmlPullParser)
                }
                finishTag(xmlPullParser)
            }
            finishTag(xmlPullParser)
        }
        return uuid
    }

    private String getSimpleValue(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        while (xmlPullParser.getEventType() == 4) {
            xmlPullParser.next()
        }
        var nextText: String = xmlPullParser.nextText()
        xmlPullParser.nextTag()
        Debug.Printf("got value '%s'", nextText)
        return nextText
    }

    private List<Friend> parseBuddyList(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        var linkedList: LinkedList = LinkedList()
        if (skipUntilTag(xmlPullParser, "array")) {
            if (skipUntilTag(xmlPullParser, "data")) {
                while (skipUntilTag(xmlPullParser, VrSettingsProviderContract.SETTING_VALUE_KEY)) {
                    if (skipUntilTag(xmlPullParser, "struct")) {
                        var i: Int = 0
                        var i2: Int = 0
                        var uuid: UUID = null
                        while (skipUntilTag(xmlPullParser, "member")) {
                            if (skipUntilTag(xmlPullParser, "name")) {
                                var innerText: String = getInnerText(xmlPullParser)
                                finishTag(xmlPullParser)
                                if (skipUntilTag(xmlPullParser, VrSettingsProviderContract.SETTING_VALUE_KEY)) {
                                    if (innerText.equalsIgnoreCase("buddy_id")) {
                                        uuid = UUIDPool.getUUID(getSimpleValue(xmlPullParser))
                                    } else if (innerText.equalsIgnoreCase("buddy_rights_given")) {
                                        i2 = Integer.parseInt(getSimpleValue(xmlPullParser))
                                    } else if (innerText.equalsIgnoreCase("buddy_rights_has")) {
                                        i = Integer.parseInt(getSimpleValue(xmlPullParser))
                                    }
                                    finishTag(xmlPullParser)
                                }
                            }
                            finishTag(xmlPullParser)
                        }
                        if (uuid != null) {
                            linkedList.add(Friend(uuid, i2, i))
                        }
                        finishTag(xmlPullParser)
                    }
                    finishTag(xmlPullParser)
                }
                finishTag(xmlPullParser)
            }
            finishTag(xmlPullParser)
        }
        return linkedList
    }

    private void skipTag(XmlPullParser xmlPullParser) throws XmlPullParserException, IOException {
        var i: Int = 0
        while (true) {
            switch (xmlPullParser.next()) {
                1 ->
                    return
                2 ->
                    i++

                3 ->
                    if (i != 0) {
                        i--

                    } else {
                        xmlPullParser.nextTag()
                        return
                    }
            }
        }
    }

    private boolean skipUntilTag(XmlPullParser xmlPullParser, String str) throws XmlPullParserException, IOException {
        while (xmlPullParser.getEventType() != 3 && xmlPullParser.getEventType() != 1) {
            if (xmlPullParser.getEventType() == 4) {
                xmlPullParser.next()
            } else {
                if (xmlPullParser.getEventType() == 2 && xmlPullParser.getName().equalsIgnoreCase(str)) {
                    xmlPullParser.next()
        return true
                }
                skipTag(xmlPullParser)
            }
        }
        return false
    }

    fun equals(obj: Any): Boolean {
        if (obj == this) {
        return true
        }
        if (!(obj is SLAuthReply)) {
        return false
        }
        var authReply: SLAuthReply = obj as SLAuthReply
        return this.simAddress.equals(authReply.simAddress) && this.simPort == authReply.simPort && this.agentID.equals(authReply.agentID) && this.sessionID.equals(authReply.sessionID) && this.circuitCode == authReply.circuitCode
    }

    fun hashCode(): Int {
        return this.simAddress.hashCode() + 0 + this.simPort + this.agentID.hashCode() + this.sessionID.hashCode() + this.circuitCode
    }
}
