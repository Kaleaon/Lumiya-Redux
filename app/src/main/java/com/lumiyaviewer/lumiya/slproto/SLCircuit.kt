package com.lumiyaviewer.lumiya.slproto

import android.os.SystemClock
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply
import com.lumiyaviewer.lumiya.slproto.caps.SLCapEventQueue
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageRouter
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.lumiya.slproto.messages.CompletePingCheck
import com.lumiyaviewer.lumiya.slproto.messages.PacketAck
import com.lumiyaviewer.lumiya.slproto.messages.SLMessageHandler
import com.lumiyaviewer.lumiya.slproto.messages.StartPingCheck
import com.lumiyaviewer.lumiya.slproto.modules.SLIdleHandler
import java.io.IOException
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.channels.CancelledKeyException
import java.nio.channels.DatagramChannel
import java.nio.channels.SelectionKey
import java.nio.channels.Selector
import java.util.ArrayList
import java.util.Collections
import java.util.LinkedList
import java.util.Queue
import java.util.concurrent.ConcurrentLinkedQueue
import java.util.concurrent.atomic.AtomicInteger

open class SLCircuit internal constructor(gridConnection: SLGridConnection, circuitInfo: SLCircuitInfo, authReply: SLAuthReply, circuit: SLCircuit?) : SLMessageHandler() {
    var authReply: SLAuthReply
    var circuitInfo: SLCircuitInfo
    private var datagramChannel: DatagramChannel
    protected val eventBus: EventBus = EventBus.getInstance()
    protected var gridConn: SLGridConnection
    private var handledPackets: Queue<Int>
    private var idleHandlers: MutableList<SLIdleHandler> = LinkedList()
    private var lastPingID: Byte = 0
    private var lastPingSent: Long = 0L
    private var lastReceivedPacketMillis: Long = 0L
    private var lastReceivedSeqnum: Int = 0
    private var lastSeqNum: AtomicInteger
    private var messageRouter: SLMessageRouter = SLMessageRouter()
    private var outgoingQueue: ConcurrentLinkedQueue<SLMessage>
    private var pendingAcks: MutableList<Int>
    private var pingSentCount: Int = 0
    private var receivedAcks: MutableList<Int>
    private var rxBuffer: ByteBuffer
    private var selectionKey: SelectionKey
    var selector: Selector
    private var tempBuffer: ByteBuffer
    private var timedOut: Boolean = false
    private var txBuffer: ByteBuffer
    private var unackedQueue: ConcurrentLinkedQueue<SLMessage>
    @Volatile var isBackgroundState: Boolean = false

    companion object {
        private const val DEFAULT_IDLE_INTERVAL = 1000
        private const val FAST_IDLE_INTERVAL = 100
        private const val BACKGROUND_IDLE_INTERVAL = 10000
        private const val MESSAGE_MAX_RETRIES = 3
        private const val MESSAGE_TIMEOUT_MILLIS = 5000
        private const val NEED_PING_TIMEOUT = 10000L
        private const val PING_INTERVAL = 5000L
        private const val BACKGROUND_NEED_PING_TIMEOUT = 120000L
        private const val BACKGROUND_PING_INTERVAL = 120000L
        private const val TRACK_HANDLED_PACKETS = 1024
        private const val UNANSWERED_PINGS = 3
    }

    init {
        this.lastPingSent = 0L
        this.pingSentCount = 0
        this.lastPingID = 0
        this.timedOut = false
        this.messageRouter = SLMessageRouter()
        this.idleHandlers = LinkedList()
        this.gridConn = gridConnection
        this.circuitInfo = circuitInfo
        this.authReply = authReply
        this.selector = gridConnection.getSelector()
        if (circuit != null) {
            this.lastReceivedPacketMillis = circuit.lastReceivedPacketMillis
            this.lastSeqNum = circuit.lastSeqNum
            this.outgoingQueue = circuit.outgoingQueue
            this.unackedQueue = circuit.unackedQueue
            this.pendingAcks = circuit.pendingAcks
            this.handledPackets = circuit.handledPackets
            this.lastReceivedSeqnum = circuit.lastReceivedSeqnum
            this.receivedAcks = circuit.receivedAcks
            this.txBuffer = circuit.txBuffer
            this.tempBuffer = circuit.tempBuffer
            this.rxBuffer = circuit.rxBuffer
            this.datagramChannel = circuit.datagramChannel
            this.selectionKey = circuit.selectionKey
            this.selectionKey.attach(this)
        } else {
            this.lastReceivedPacketMillis = SystemClock.elapsedRealtime()
            this.lastSeqNum = AtomicInteger(0)
            this.outgoingQueue = ConcurrentLinkedQueue()
            this.unackedQueue = ConcurrentLinkedQueue()
            this.pendingAcks = Collections.synchronizedList(LinkedList())
            this.handledPackets = LinkedList()
            this.lastReceivedSeqnum = 0
            this.receivedAcks = ArrayList()
            this.txBuffer = ByteBuffer.allocate(65536)
            this.tempBuffer = ByteBuffer.allocate(65536)
            this.rxBuffer = ByteBuffer.allocate(65536)
            this.datagramChannel = DatagramChannel.open()
            this.datagramChannel.configureBlocking(false)
            this.datagramChannel.connect(circuitInfo.socketAddress)
            this.selectionKey = this.datagramChannel.register(this.selector, 1)
            this.selectionKey.attach(this)
        }
    }

    private fun DumpDebugBuffer(var1: String, byteBuffer: ByteBuffer) {
        val stringBuilder = StringBuilder()
        stringBuilder.append(var1).append(": ")
        for (var3 in 0 until byteBuffer.limit()) {
            stringBuilder.append(Integer.toHexString(byteBuffer.get(var3).toInt() and 255))
        }
        Debug.Log(stringBuilder.toString())
    }

    private fun ProcessResends() {
        val iterator = this.unackedQueue.iterator()
        var var1 = false
        while (iterator.hasNext()) {
            val message: SLMessage = iterator.next()
            if (System.currentTimeMillis() >= message.sentTimeMillis + 5000L) {
                iterator.remove()
                message.retries++
                if (message.retries > 3) {
                    message.handleMessageTimeout()
                } else {
                    message.isResent = true
                    message.sentTimeMillis = System.currentTimeMillis()
                    this.outgoingQueue.add(message)
                    var1 = true
                }
            }
        }
        if (var1) {
            this.UpdateSelectorOps()
            this.selector.wakeup()
        }
        this.TryProcessIdle()
    }

    open fun CloseCircuit() {
        this.selectionKey.cancel()
        try {
            this.datagramChannel.close()
        } catch (e: IOException) {
            e.printStackTrace()
        }
        this.selector.wakeup()
        this.ProcessCloseCircuit()
    }

    fun DefaultEventQueueHandler(capsEventType: SLCapEventQueue.CapsEventType, llsdNode: LLSDNode) {
        if (!this.messageRouter.handleEventQueueMessage(capsEventType, llsdNode)) {
            Debug.Log("Unhandled event queue msg: type = $capsEventType")
        }
    }

    override fun DefaultMessageHandler(message: SLMessage) {
        this.messageRouter.handleMessage(message)
    }

    open fun HandleMessage(message: SLMessage) {
        message.Handle(this)
    }

    override fun HandlePacketAck(packetAck: PacketAck) {
        val iterator = packetAck.Packets_Fields.iterator()
        while (iterator.hasNext()) {
            this.ProcessReceivedAck(iterator.next().ID)
        }
    }

    override fun HandleStartPingCheck(startPingCheck: StartPingCheck) {
        val completePingCheck = CompletePingCheck()
        completePingCheck.PingID_Field.PingID = startPingCheck.PingID_Field.PingID
        this.SendMessage(completePingCheck)
    }

    protected fun InvokeProcessIdle() {
        this.ProcessIdle()
        val iterator = this.idleHandlers.iterator()
        while (iterator.hasNext()) {
            iterator.next().ProcessIdle()
        }
    }

    open fun ProcessCloseCircuit() {
    }

    open fun ProcessIdle() {
    }

    open fun ProcessNetworkError() {
    }

    @Throws(IOException::class)
    fun ProcessReceive(): Boolean {
        this.rxBuffer.clear()
        this.rxBuffer.order(ByteOrder.BIG_ENDIAN)
        if (this.datagramChannel.read(this.rxBuffer) == 0) {
            return false
        } else {
            this.rxBuffer.flip()
            this.receivedAcks.clear()
            val message: SLMessage? = SLMessage.Unpack(this.rxBuffer, this.tempBuffer, this.receivedAcks)
            var message2: SLMessage? = null
            if (message != null) {
                var var1: Boolean
                run {
                    this.lastReceivedPacketMillis = SystemClock.elapsedRealtime()
                    this.pingSentCount = 0
                    if (message.seqNum - this.lastReceivedSeqnum <= 0) {
                        Debug.Printf("Detected incoming out of order: seqNum = %d", message.seqNum)
                        if (message is PacketAck || message is StartPingCheck) {
                            var1 = false
                            return@run
                        }
                        if (message !is CompletePingCheck && this.handledPackets.contains(message.seqNum)) {
                            Debug.Printf("Detected incoming duplicate: seqNum = %d", message.seqNum)
                            var1 = true
                            return@run
                        }
                    }
                    var1 = false
                }
                if (var1) {
                    message2 = null
                } else {
                    while (this.handledPackets.size >= 1024 && this.handledPackets.poll() != null) {
                    }
                    this.handledPackets.add(message.seqNum)
                    this.lastReceivedSeqnum = message.seqNum
                    if (message !is PacketAck && message !is StartPingCheck) {
                        message2 = message
                    } else {
                        message.Handle(this)
                        message2 = null
                    }
                }
            } else {
                Debug.Log("message discarded!")
                message2 = null
            }
            var iterator = this.receivedAcks.iterator()
            while (iterator.hasNext()) {
                this.ProcessReceivedAck(iterator.next())
            }
            if (message != null && message.isReliable) {
                iterator = this.pendingAcks.iterator()
                var var5 = false
                while (iterator.hasNext()) {
                    if (iterator.next() == message.seqNum) {
                        var5 = true
                        break
                    }
                }
                if (!var5) {
                    this.pendingAcks.add(message.seqNum)
                }
            }
            if (message2 != null) {
                this.HandleMessage(message2)
            }
            return true
        }
    }

    fun ProcessReceivedAck(var1: Int) {
        val iterator = this.unackedQueue.iterator()
        while (iterator.hasNext()) {
            val message: SLMessage = iterator.next()
            if (message.seqNum == var1) {
                iterator.remove()
                message.handleMessageAcknowledged()
            }
        }
        val iterator2 = this.outgoingQueue.iterator()
        while (iterator2.hasNext()) {
            val message2: SLMessage = iterator2.next()
            if (message2.seqNum == var1) {
                iterator2.remove()
                message2.handleMessageAcknowledged()
            }
        }
    }

    open fun ProcessTimeout() {
    }

    @Throws(IOException::class)
    fun ProcessTransmit(): Boolean {
        val message = this.outgoingQueue.peek()
        if (message != null) {
            message.Pack(this.txBuffer, this.tempBuffer)
            val var2: Int = message.AppendPendingAcks(this.txBuffer, this.pendingAcks)
            this.txBuffer.flip()
            if (this.datagramChannel.write(this.txBuffer) != 0) {
                this.outgoingQueue.remove(message)
                if (var2 >= this.pendingAcks.size) {
                    this.pendingAcks.clear()
                } else {
                    for (var1 in 0 until var2) {
                        this.pendingAcks.removeAt(0)
                    }
                }
                if (message.isReliable) {
                    this.unackedQueue.add(message)
                }
                return true
            }
        } else if (!this.pendingAcks.isEmpty()) {
            val packetAck = PacketAck()
            packetAck.seqNum = this.lastSeqNum.incrementAndGet()
            val iterator = this.pendingAcks.iterator()
            var var6 = 0
            while (iterator.hasNext() && packetAck.CalcPayloadSize() < 1018) {
                val packets = PacketAck.Packets()
                packets.ID = iterator.next()
                packetAck.Packets_Fields.add(packets)
                var6++
            }
            packetAck.Pack(this.txBuffer, this.tempBuffer)
            this.txBuffer.flip()
            if (this.datagramChannel.write(this.txBuffer) != 0) {
                if (var6 >= this.pendingAcks.size) {
                    this.pendingAcks.clear()
                } else {
                    for (var7 in 0 until var6) {
                        this.pendingAcks.removeAt(0)
                    }
                }
                return true
            }
        }
        return false
    }

    open fun ProcessWakeup() {
        this.ProcessResends()
        this.TryProcessIdle()
    }

    fun RegisterMessageHandler(var1: Any) {
        synchronized(this) {
            this.messageRouter.registerHandler(var1)
            if (var1 is SLIdleHandler) {
                this.idleHandlers.add(var1)
            }
        }
    }

    fun SendMessage(message: SLMessage) {
        message.seqNum = this.lastSeqNum.incrementAndGet()
        message.sentTimeMillis = System.currentTimeMillis()
        message.retries = 0
        this.outgoingQueue.add(message)
        this.UpdateSelectorOps()
        this.selector.wakeup()
    }

    open fun setBackgroundState(inBackground: Boolean) {
        if (this.isBackgroundState != inBackground) {
            this.isBackgroundState = inBackground
            Debug.Printf("SLCircuit: background state changed to %b", inBackground)
            if (!inBackground) {
                this.lastPingSent = SystemClock.elapsedRealtime()
                this.selector.wakeup()
            }
        }
    }

    fun TryProcessIdle() {
        val nowMillis = SystemClock.elapsedRealtime()
        val needPingTimeout = if (isBackgroundState) BACKGROUND_NEED_PING_TIMEOUT else NEED_PING_TIMEOUT
        val pingInterval = if (isBackgroundState) BACKGROUND_PING_INTERVAL else PING_INTERVAL

        if (nowMillis >= this.lastReceivedPacketMillis + needPingTimeout && nowMillis >= this.lastPingSent + pingInterval) {
            if (this.pingSentCount >= 3) {
                if (!this.timedOut) {
                    this.timedOut = true
                    Debug.Log("SLCircuit: Total timeout.")
                    this.ProcessTimeout()
                }
            } else {
                Debug.Log("SLCircuit: Sending ping ID " + this.lastPingID)
                val startPingCheck = StartPingCheck()
                var var1: Int = this.lastSeqNum.get()
                val message = this.unackedQueue.peek()
                if (message != null) {
                    var1 = message.seqNum
                }
                val pingID = startPingCheck.PingID_Field
                val lastPingID: Byte = this.lastPingID
                this.lastPingID = (lastPingID + 1).toByte()
                pingID.PingID = lastPingID
                startPingCheck.PingID_Field.OldestUnacked = var1
                this.SendMessage(startPingCheck)
                this.pingSentCount++
                this.lastPingSent = nowMillis
            }
        }
    }

    fun UnregisterMessageHandler(var1: Any) {
        synchronized(this) {
            this.messageRouter.unregisterHandler(var1)
            if (var1 is SLIdleHandler) {
                this.idleHandlers.remove(var1)
            }
        }
    }

    fun UpdateSelectorOps() {
        if (this.selectionKey.isValid()) {
            try {
                if (this.outgoingQueue.isEmpty() && this.pendingAcks.isEmpty()) {
                    this.selectionKey.interestOps(1)
                } else {
                    this.selectionKey.interestOps(5)
                }
            } catch (e: CancelledKeyException) {
                Debug.Warning(e)
            }
        }
    }

    fun getAuthReply(): SLAuthReply {
        return this.authReply
    }

    fun getEventBus(): EventBus {
        return this.eventBus
    }

    fun getGridConnection(): SLGridConnection {
        return this.gridConn
    }

    open fun getIdleInterval(): Int {
        synchronized(this) {}
        return if (isBackgroundState) BACKGROUND_IDLE_INTERVAL else DEFAULT_IDLE_INTERVAL
    }
}
