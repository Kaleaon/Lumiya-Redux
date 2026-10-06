package com.lumiyaviewer.lumiya.slproto.auth

import com.google.common.collect.ImmutableList
import com.google.vr.cardboard.VrSettingsProviderContract
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.io.IOException
import java.util.LinkedList
import java.util.UUID
import org.xmlpull.v1.XmlPullParser
import org.xmlpull.v1.XmlPullParserException

class SLAuthReply {
    @JvmField var agentAppearanceService: String? = ""
    @JvmField var agentID: UUID? = null
    @JvmField var circuitCode: Int = 0
    @JvmField var friends: ImmutableList<Friend>? = null
    @JvmField var fromTeleport: Boolean = false
    @JvmField var gridName: String = ""
    @JvmField var inventoryRoot: UUID? = null
    @JvmField var isIndeterminate: Boolean = false
    @JvmField var isTemporary: Boolean = false
    @JvmField var loginURL: String = ""
    @JvmField var message: String? = ""
    /** Multi-factor hash to save and send on later logins; null if the grid sent none. */
    @JvmField var mfaHash: String? = null
    @JvmField var nextMethod: String? = null
    @JvmField var nextURL: String? = null
    @JvmField var secureSessionID: UUID? = null
    @JvmField var seedCapability: String? = ""
    @JvmField var sessionID: UUID? = null
    @JvmField var simAddress: String? = ""
    @JvmField var simPort: Int = 0
    @JvmField var success: Boolean = false
    /** Failure reason code, e.g. "key", "presence", "mfa_challenge"; null on success. */
    @JvmField var reason: String? = null

    companion object {
        /** Login reason code asking for a multi-factor code (lllogininstance.cpp). */
        const val REASON_MFA_CHALLENGE: String = "mfa_challenge"
    }

    class Friend @JvmOverloads constructor(
        @JvmField val uuid: UUID,
        @JvmField val rightsGiven: Int,
        @JvmField val rightsHas: Int
    )

    constructor(authReply: SLAuthReply, fromTeleport: Boolean, isTemporary: Boolean, uuid: UUID?, simAddress: String?, simPort: Int, seedCapability: String?) {
        this.gridName = authReply.gridName
        this.loginURL = authReply.loginURL
        this.sessionID = authReply.sessionID
        this.secureSessionID = authReply.secureSessionID
        this.agentID = uuid ?: authReply.agentID
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

    @Throws(XmlPullParserException::class, IOException::class)
    constructor(gridName: String, loginURL: String, xmlPullParser: XmlPullParser) {
        this.gridName = gridName
        this.loginURL = loginURL
        var z = false
        var nextURLStr: String? = null
        var nextMethodStr: String? = null
        var sessionUUID: UUID? = null
        var secureSessionUUID: UUID? = null
        var agentUUID: UUID? = null
        var circuit: Int = 0
        var simIPStr: String? = null
        var simPortInt: Int = 0
        var seedCapStr: String? = null
        var isSuccess = false
        var messageStr: String? = ""
        var appearanceServiceStr: String? = null
        var invRootUUID: UUID? = null
        var reasonStr: String? = null
        var mfaHashStr: String? = null
        var friendList: List<Friend> = ImmutableList.of()

        xmlPullParser.nextTag()
        xmlPullParser.require(XmlPullParser.START_TAG, null, "methodResponse")
        xmlPullParser.nextTag()
        if (skipUntilTag(xmlPullParser, "params")) {
            if (skipUntilTag(xmlPullParser, "param")) {
                if (skipUntilTag(xmlPullParser, VrSettingsProviderContract.SETTING_VALUE_KEY)) {
                    if (skipUntilTag(xmlPullParser, "struct")) {
                        while (skipUntilTag(xmlPullParser, "member")) {
                            if (!skipUntilTag(xmlPullParser, "name")) {
                                throw XmlPullParserException("Not found name", xmlPullParser, null)
                            }
                            val innerText = getInnerText(xmlPullParser)
                            finishTag(xmlPullParser)
                            if (skipUntilTag(xmlPullParser, VrSettingsProviderContract.SETTING_VALUE_KEY)) {
                                if (innerText.equalsIgnoreCase("session_id")) {
                                    sessionUUID = UUIDPool.getUUID(getSimpleValue(xmlPullParser))
                                } else if (innerText.equalsIgnoreCase("secure_session_id")) {
                                    secureSessionUUID = UUIDPool.getUUID(getSimpleValue(xmlPullParser))
                                } else if (innerText.equalsIgnoreCase("agent_id")) {
                                    agentUUID = UUIDPool.getUUID(getSimpleValue(xmlPullParser))
                                } else if (innerText.equalsIgnoreCase("circuit_code")) {
                                    circuit = Integer.decode(getSimpleValue(xmlPullParser))
                                } else if (innerText.equalsIgnoreCase("sim_ip")) {
                                    simIPStr = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("sim_port")) {
                                    simPortInt = Integer.decode(getSimpleValue(xmlPullParser))
                                } else if (innerText.equalsIgnoreCase("seed_capability")) {
                                    seedCapStr = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("login")) {
                                    val simpleValue = getSimpleValue(xmlPullParser)
                                    isSuccess = simpleValue.equalsIgnoreCase("true")
                                    z = simpleValue.equalsIgnoreCase("indeterminate")
                                } else if (innerText.equalsIgnoreCase("next_url")) {
                                    nextURLStr = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("next_method")) {
                                    nextMethodStr = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("reason")) {
                                    reasonStr = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("mfa_hash")) {
                                    mfaHashStr = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("message")) {
                                    messageStr = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("agent_appearance_service")) {
                                    appearanceServiceStr = getSimpleValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("inventory-root")) {
                                    invRootUUID = getInventoryRootValue(xmlPullParser)
                                } else if (innerText.equalsIgnoreCase("buddy-list")) {
                                    friendList = parseBuddyList(xmlPullParser)
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
        this.sessionID = sessionUUID
        this.secureSessionID = secureSessionUUID
        this.agentID = agentUUID
        this.circuitCode = circuit
        this.simAddress = simIPStr
        this.simPort = simPortInt
        this.seedCapability = seedCapStr
        this.success = isSuccess
        this.message = messageStr
        this.agentAppearanceService = appearanceServiceStr
        this.inventoryRoot = invRootUUID
        this.friends = ImmutableList.copyOf(friendList)
        this.fromTeleport = false
        this.isTemporary = false
        this.isIndeterminate = z
        this.nextURL = nextURLStr
        this.nextMethod = nextMethodStr
        this.reason = reasonStr
        this.mfaHash = mfaHashStr
    }

    fun isMfaChallenge(): Boolean {
        return !this.success && REASON_MFA_CHALLENGE.equals(this.reason, ignoreCase = true)
    }

    private fun String?.equalsIgnoreCase(other: String?): Boolean {
        return this?.equals(other, ignoreCase = true) == true
    }

    @Throws(XmlPullParserException::class, IOException::class)
    private fun finishTag(xmlPullParser: XmlPullParser) {
        while (xmlPullParser.eventType != XmlPullParser.END_DOCUMENT) {
            if (xmlPullParser.eventType == XmlPullParser.END_TAG) {
                xmlPullParser.next()
                return
            } else if (xmlPullParser.eventType == XmlPullParser.START_TAG) {
                skipTag(xmlPullParser)
            } else {
                xmlPullParser.next()
            }
        }
    }

    @Throws(XmlPullParserException::class, IOException::class)
    private fun getInnerText(xmlPullParser: XmlPullParser): String {
        if (xmlPullParser.eventType != XmlPullParser.TEXT) {
            return ""
        }
        val text = xmlPullParser.text
        xmlPullParser.next()
        return text ?: ""
    }

    @Throws(XmlPullParserException::class, IOException::class)
    private fun getInventoryRootValue(xmlPullParser: XmlPullParser): UUID? {
        var uuid: UUID? = null
        if (skipUntilTag(xmlPullParser, "array")) {
            if (skipUntilTag(xmlPullParser, "data")) {
                while (skipUntilTag(xmlPullParser, VrSettingsProviderContract.SETTING_VALUE_KEY)) {
                    if (skipUntilTag(xmlPullParser, "struct")) {
                        while (skipUntilTag(xmlPullParser, "member")) {
                            if (skipUntilTag(xmlPullParser, "name")) {
                                val innerText = getInnerText(xmlPullParser)
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

    @Throws(XmlPullParserException::class, IOException::class)
    private fun getSimpleValue(xmlPullParser: XmlPullParser): String {
        while (xmlPullParser.eventType == XmlPullParser.TEXT) {
            xmlPullParser.next()
        }
        val nextText = xmlPullParser.nextText()
        xmlPullParser.nextTag()
        Debug.Printf("got value '%s'", nextText)
        return nextText
    }

    @Throws(XmlPullParserException::class, IOException::class)
    private fun parseBuddyList(xmlPullParser: XmlPullParser): List<Friend> {
        val linkedList = LinkedList<Friend>()
        if (skipUntilTag(xmlPullParser, "array")) {
            if (skipUntilTag(xmlPullParser, "data")) {
                while (skipUntilTag(xmlPullParser, VrSettingsProviderContract.SETTING_VALUE_KEY)) {
                    if (skipUntilTag(xmlPullParser, "struct")) {
                        var i = 0
                        var i2 = 0
                        var uuid: UUID? = null
                        while (skipUntilTag(xmlPullParser, "member")) {
                            if (skipUntilTag(xmlPullParser, "name")) {
                                val innerText = getInnerText(xmlPullParser)
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

    @Throws(XmlPullParserException::class, IOException::class)
    private fun skipTag(xmlPullParser: XmlPullParser) {
        var i = 0
        while (true) {
            when (xmlPullParser.next()) {
                XmlPullParser.END_DOCUMENT -> return
                XmlPullParser.START_TAG -> i++
                XmlPullParser.END_TAG -> {
                    if (i != 0) {
                        i--
                    } else {
                        xmlPullParser.nextTag()
                        return
                    }
                }
            }
        }
    }

    @Throws(XmlPullParserException::class, IOException::class)
    private fun skipUntilTag(xmlPullParser: XmlPullParser, str: String): Boolean {
        while (xmlPullParser.eventType != XmlPullParser.END_TAG && xmlPullParser.eventType != XmlPullParser.END_DOCUMENT) {
            if (xmlPullParser.eventType == XmlPullParser.TEXT) {
                xmlPullParser.next()
            } else {
                if (xmlPullParser.eventType == XmlPullParser.START_TAG && str.equalsIgnoreCase(xmlPullParser.name)) {
                    xmlPullParser.next()
                    return true
                }
                skipTag(xmlPullParser)
            }
        }
        return false
    }

    override fun equals(other: Any?): Boolean {
        if (other === this) return true
        if (other !is SLAuthReply) return false
        val authReply = other
        return this.simAddress == authReply.simAddress &&
               this.simPort == authReply.simPort &&
               this.agentID == authReply.agentID &&
               this.sessionID == authReply.sessionID &&
               this.circuitCode == authReply.circuitCode
    }

    override fun hashCode(): Int {
        var result = simAddress?.hashCode() ?: 0
        result = 31 * result + simPort
        result = 31 * result + (agentID?.hashCode() ?: 0)
        result = 31 * result + (sessionID?.hashCode() ?: 0)
        result = 31 * result + circuitCode
        return result
    }
}
