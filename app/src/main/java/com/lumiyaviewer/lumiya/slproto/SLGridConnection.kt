package com.lumiyaviewer.lumiya.slproto

import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.res.textures.TextureCache
import com.lumiyaviewer.lumiya.slproto.auth.SLAuth
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthParams
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply
import com.lumiyaviewer.lumiya.slproto.caps.SLCapEventQueue
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps
import com.lumiyaviewer.lumiya.slproto.events.SLConnectionStateChangedEvent
import com.lumiyaviewer.lumiya.slproto.events.SLDisconnectEvent
import com.lumiyaviewer.lumiya.slproto.events.SLLoginResultEvent
import com.lumiyaviewer.lumiya.slproto.events.SLReconnectingEvent
import com.lumiyaviewer.lumiya.slproto.modules.SLModules
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.io.IOException
import java.util.Collections
import java.util.UUID

class SLGridConnection : SLConnection() {

    enum class ConnectionState {
        Idle, Connecting, Connected;

        companion object {
            @JvmStatic
            fun valuesCustom(): Array<ConnectionState> = entries.toTypedArray()
        }
    }

    class NotConnectedException : Exception("Grid not connected") {
        companion object {
            private const val serialVersionUID = 2164121452714562470L
        }
    }

    var activeAgentUUID: UUID? = null
        private set

    private var agentCircuit: SLAgentCircuit? = null
    private var authParams: SLAuthParams? = null

    @JvmField
    var authReply: SLAuthReply? = null

    @JvmField
    var capEventQueue: SLCapEventQueue? = null

    private var modules: SLModules? = null
    private var userManager: UserManager? = null
    private var _connectionState = ConnectionState.Idle
    private val eventBus = EventBus.getInstance()

    @Volatile
    private var firstConnect = true

    @Volatile
    private var userWantsConnected = false

    @Volatile
    private var hadConnected = false

    @Volatile
    private var isReconnecting = false

    @Volatile
    private var reconnectAttempts = 0

    @Volatile
    private var loginThread: Thread? = null

    private val tempCircuits: MutableMap<SLAuthReply, SLTempCircuit> =
        Collections.synchronizedMap(HashMap())

    @JvmField
    val parcelInfo = SLParcelInfo()

    fun DoConnect(authParams: SLAuthParams, str: String?) {
        try {
            val login = SLAuth().Login(authParams.withLocation(str))
            if (authParams.mfaToken != null) {
                synchronized(this) {
                    if (this.authParams === authParams) {
                        this.authParams = authParams.withoutMfaToken()
                    }
                }
            }
            if (login.isMfaChallenge) {
                setConnectionState(ConnectionState.Idle)
                dropForMfaChallenge(login.message)
                return
            }
            if (!login.success) {
                setConnectionState(ConnectionState.Idle)
                reconnectOrDrop(isLogin = true, fromLogout = false, login.message)
                return
            }
            synchronized(this) {
                if (_connectionState == ConnectionState.Idle) {
                    return
                }
                authReply = login
                activeAgentUUID = login.agentID
                userManager = UserManager.getUserManager(activeAgentUUID)
                userManager?.chatterList?.friendManager?.updateFriendList(login.friends)
                parcelInfo.reset(userManager)
                startCircuit(login, null)
            }
        } catch (e: SLAuth.CertificateVerificationException) {
            setConnectionState(ConnectionState.Idle)
            reconnectOrDrop(isLogin = true, fromLogout = false, e.message)
        } catch (e: Exception) {
            setConnectionState(ConnectionState.Idle)
            reconnectOrDrop(isLogin = true, fromLogout = false, "Failed to connect to login server.")
        }
    }

    private fun dropForMfaChallenge(message: String?) {
        synchronized(this) {
            userWantsConnected = false
            isReconnecting = false
        }
        activeAgentUUID?.let { GridConnectionManager.removeConnection(it, this) }
        eventBus.publish(SLLoginResultEvent.mfaChallenge(message, activeAgentUUID))
    }

    @Synchronized
    private fun Reconnect(): Boolean {
        if (!userWantsConnected || !hadConnected ||
            !GlobalOptions.getInstance().autoReconnect ||
            reconnectAttempts >= GlobalOptions.getInstance().maxReconnectAttempts
        ) {
            isReconnecting = false
            return false
        }
        if (_connectionState == ConnectionState.Idle && authParams != null) {
            reconnectAttempts++
            isReconnecting = true
            eventBus.publish(SLReconnectingEvent(reconnectAttempts))
            startConnecting(delay = true, "last")
        }
        return true
    }

    private fun reconnectOrDrop(isLogin: Boolean, fromLogout: Boolean, str: String?) {
        if (Reconnect()) {
            return
        }
        activeAgentUUID?.let { GridConnectionManager.removeConnection(it, this) }
        if (isLogin) {
            eventBus.publish(SLLoginResultEvent(false, str, activeAgentUUID))
        } else {
            eventBus.publish(SLDisconnectEvent(fromLogout, str ?: "Connection lost."))
        }
    }

    private fun setConnectionState(state: ConnectionState) {
        if (_connectionState != state) {
            _connectionState = state
            eventBus.publish(SLConnectionStateChangedEvent(state))
        }
    }

    private fun startCircuit(authReply: SLAuthReply, tempCircuit: SLTempCircuit?) {
        Debug.Log("login reply: ip = ${authReply.simAddress}, port = ${authReply.simPort}, ccode = ${authReply.circuitCode}")
        if (authReply.inventoryRoot != null) {
            Debug.Log("inventory root: ${authReply.inventoryRoot}")
        } else {
            Debug.Log("inventory root is null")
        }
        val caps = SLCaps()
        caps.GetCapabilites(this.authReply!!.loginURL, this.authReply!!.seedCapability)
        try {
            agentCircuit = SLAgentCircuit(this, SLCircuitInfo(authReply), authReply, caps, tempCircuit)
            modules = agentCircuit!!.modules
            try {
                capEventQueue = SLCapEventQueue(
                    caps.getCapabilityOrThrow(SLCaps.SLCapability.EventQueueGet),
                    agentCircuit
                )
            } catch (e: SLCaps.NoSuchCapabilityException) {
                e.printStackTrace()
            }
            parcelInfo.reset(userManager)
            TextureCache.getInstance().setFetcher(modules!!.textureFetcher)
            AddCircuit(agentCircuit)
            agentCircuit!!.SendUseCode()
            firstConnect = false
        } catch (e: IOException) {
            setConnectionState(ConnectionState.Idle)
            reconnectOrDrop(isLogin = true, fromLogout = false, "Failed to connect to the simulator.")
        }
    }

    private fun startConnecting(delay: Boolean, str: String?) {
        loginThread = Thread {
            if (delay) {
                try {
                    Thread.sleep(3000L)
                } catch (e: InterruptedException) {
                    e.printStackTrace()
                }
            }
            DoConnect(authParams!!, str)
            loginThread = null
        }
        setConnectionState(ConnectionState.Connecting)
        loginThread!!.start()
    }

    @Synchronized
    fun CancelConnect() {
        userWantsConnected = false
        isReconnecting = false
        hadConnected = false
        closeConnectionObjects()
    }

    @Synchronized
    fun Connect(authParams: SLAuthParams) {
        if (_connectionState == ConnectionState.Idle) {
            this.authParams = authParams
            userWantsConnected = true
            reconnectAttempts = 0
            isReconnecting = false
            hadConnected = false
            firstConnect = true
            startConnecting(delay = false, authParams.startLocation)
        }
    }

    @Synchronized
    fun Disconnect() {
        userWantsConnected = false
        isReconnecting = false
        hadConnected = false
        if (agentCircuit != null) {
            agentCircuit!!.SendLogoutRequest()
        } else {
            processDisconnect(true, "Logged out")
        }
    }

    @Synchronized
    fun HandleTeleportFinish(authReply: SLAuthReply) {
        agentCircuit?.CloseCircuit()
        agentCircuit = null
        capEventQueue?.stopQueue()
        capEventQueue = null
        this.authReply = authReply
        startCircuit(authReply, tempCircuits.remove(this.authReply))
    }

    @Synchronized
    fun addTempCircuit(authReply: SLAuthReply) {
        if (!tempCircuits.containsKey(authReply)) {
            try {
                val tempCircuit = SLTempCircuit(this, SLCircuitInfo(authReply), authReply)
                tempCircuits[authReply] = tempCircuit
                AddCircuit(tempCircuit)
                tempCircuit.SendUseCode()
            } catch (e: IOException) {
                e.printStackTrace()
            }
        }
    }

    @Synchronized
    fun closeConnectionObjects() {
        loginThread?.interrupt()
        loginThread = null
        modules = null
        agentCircuit?.CloseCircuit()
        agentCircuit = null
        capEventQueue?.stopQueue()
        capEventQueue = null
        TextureCache.getInstance().setFetcher(null)
        for (circuit in tempCircuits.values) {
            circuit.CloseCircuit()
        }
        tempCircuits.clear()
        setConnectionState(ConnectionState.Idle)
    }

    @Synchronized
    fun forceDisconnect(fromLogoutRequest: Boolean) {
        if (fromLogoutRequest) {
            userWantsConnected = false
            isReconnecting = false
            hadConnected = false
        }
        Debug.Log("GridConnection: forceDisconnect() called, fromLogoutRequest = $fromLogoutRequest")
        when (_connectionState) {
            ConnectionState.Connected -> {
                closeConnectionObjects()
                reconnectOrDrop(isLogin = false, fromLogout = fromLogoutRequest, "Network connection lost.")
            }
            ConnectionState.Connecting -> {
                closeConnectionObjects()
                reconnectOrDrop(isLogin = true, fromLogout = fromLogoutRequest, "Network connection lost.")
            }
            else -> {}
        }
    }

    @Throws(NotConnectedException::class)
    fun getAgentCircuit(): SLAgentCircuit {
        return agentCircuit ?: throw NotConnectedException()
    }

    @Synchronized
    fun getConnectionState(): ConnectionState = _connectionState

    fun getIsReconnecting(): Boolean = isReconnecting

    @Synchronized
    @Throws(NotConnectedException::class)
    fun getModules(): SLModules {
        return modules ?: throw NotConnectedException()
    }

    fun getReconnectAttempt(): Int = reconnectAttempts

    fun isFirstConnect(): Boolean = firstConnect

    @Synchronized
    fun notifyLoginError(str: String?) {
        closeConnectionObjects()
        reconnectOrDrop(isLogin = true, fromLogout = false, str)
    }

    @Synchronized
    fun notifyLoginSuccess() {
        hadConnected = true
        reconnectAttempts = 0
        isReconnecting = false
        setConnectionState(ConnectionState.Connected)
        activeAgentUUID?.let { GridConnectionManager.setConnection(it, this) }
        eventBus.publish(SLLoginResultEvent(true, null, activeAgentUUID))
    }

    @Synchronized
    fun processDisconnect(fromLogout: Boolean, str: String?) {
        if (_connectionState != ConnectionState.Idle) {
            closeConnectionObjects()
            reconnectOrDrop(isLogin = false, fromLogout = fromLogout, str)
        }
    }

    @Synchronized
    fun removeTempCircuit(tempCircuit: SLTempCircuit) {
        val it = tempCircuits.entries.iterator()
        while (it.hasNext()) {
            if (it.next().value === tempCircuit) {
                it.remove()
            }
        }
        tempCircuit.CloseCircuit()
    }

    companion object {
        private const val DEFAULT_SYSTEM_ACCOUNT = "Second Life"
        private var autoresponseEnabled = false
        private var autoresponseText = ""

        @JvmStatic
        fun getAutoresponse(): String? {
            return if (autoresponseEnabled) autoresponseText else null
        }

        @JvmStatic
        fun setAutoresponseInfo(enabled: Boolean, text: String) {
            autoresponseEnabled = enabled
            autoresponseText = text
        }
    }
}
