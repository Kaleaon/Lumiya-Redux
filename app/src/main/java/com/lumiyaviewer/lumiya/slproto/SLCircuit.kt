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
import java.nio.Buffer
import java.nio.ByteBuffer
import java.nio.ByteOrder
import java.nio.channels.CancelledKeyException
import java.nio.channels.DatagramChannel
import java.nio.channels.SelectionKey
import java.nio.channels.Selector
import java.util.ArrayList
import java.util.Collections
import java.util.Iterator
import java.util.LinkedList
import java.util.List
import java.util.Queue
import java.util.concurrent.ConcurrentLinkedQueue
import java.util.concurrent.atomic.AtomicInteger

open class SLCircuit : SLMessageHandler() {
   private int DEFAULT_IDLE_INTERVAL = 1000
   private int FAST_IDLE_INTERVAL = 100
   private int MESSAGE_MAX_RETRIES = 3
   private int MESSAGE_TIMEOUT_MILLIS = 5000
   private long NEED_PING_TIMEOUT = 10000L
   private long PING_INTERVAL = 5000L
   private int TRACK_HANDLED_PACKETS = 1024
   private int UNANSWERED_PINGS = 3
   SLAuthReply authReply
   public SLCircuitInfo circuitInfo
   private DatagramChannel datagramChannel
   protected EventBus eventBus = EventBus.getInstance()
   protected SLGridConnection gridConn
   private Queue<Integer> handledPackets
   private List<SLIdleHandler> idleHandlers
   private var lastPingID: Byte
   private var lastPingSent: Long
   private var lastReceivedPacketMillis: Long = 0L
   private var lastReceivedSeqnum: Int
   private AtomicInteger lastSeqNum
   private SLMessageRouter messageRouter
   private ConcurrentLinkedQueue<SLMessage> outgoingQueue
   private List<Integer> pendingAcks
   private var pingSentCount: Int
   private List<Integer> receivedAcks
   private ByteBuffer rxBuffer
   private SelectionKey selectionKey
   Selector selector
   private ByteBuffer tempBuffer
   private var timedOut: Boolean
   private ByteBuffer txBuffer
   private ConcurrentLinkedQueue<SLMessage> unackedQueue

   SLCircuit(SLGridConnection gridConnection, SLCircuitInfo circuitInfo, SLAuthReply authReply, SLCircuit circuit) throws IOException {
      this.lastPingSent = 0L
      this.pingSentCount = 0
      this.lastPingID = 0
      this.timedOut = false
      this.messageRouter = SLMessageRouter()
      this.idleHandlers = LinkedList<>()
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
         this.lastSeqNum = AtomicIntegerthis as 0.outgoingQueue = ConcurrentLinkedQueue<>()
         this.unackedQueue = ConcurrentLinkedQueue<>()
         this.pendingAcks = Collections.synchronizedList(LinkedList<>())
         this.handledPackets = LinkedList<>()
         this.lastReceivedSeqnum = 0
         this.receivedAcks = ArrayList<>()
         this.txBuffer = ByteBuffer.allocatethis as 65536.tempBuffer = ByteBuffer.allocatethis as 65536.rxBuffer = ByteBuffer.allocatethis as 65536.datagramChannel = DatagramChannel.open()
         this.datagramChannel.configureBlockingthis as false.datagramChannel.connectthis as circuitInfo.socketAddress.selectionKey = this.datagramChannel.register(this.selector, 1)
         this.selectionKey.attach(this)
      }
   }

   private fun DumpDebugBuffer(var1: String, byteBuffer: ByteBuffer) {
      StringBuilder stringBuilder = StringBuilder()
      stringBuilder.append(var1).append(": ")

      for (int var3 = 0; var3 < byteBuffer.limit(); var3++) {
         stringBuilder.append(Integer.toHexString(byteBuffer.get(var3) & 255))
      }

      Debug.Log(stringBuilder.toString())
   }

   private fun ProcessResends() {
      Iterator iterator = this.unackedQueue.iterator()
      boolean var1 = false

      while (iterator.hasNext()) {
         var message: SLMessage = (SLMessage)iterator.next()
         if (System.currentTimeMillis() >= message.sentTimeMillis + 5000L) {
            iterator.remove()
            message.retries++
            if (message.retries > 3) {
               message.handleMessageTimeout()
            } else {
               message.isResent = true
               message.sentTimeMillis = System.currentTimeMillis()
               this.outgoingQueue.addvar1 as message = true
            }
         }
      }

      if (var1) {
         this.UpdateSelectorOps()
         this.selector.wakeup()
      }

      this.TryProcessIdle()
   }

   fun CloseCircuit() {
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
         Debug.Log("Unhandled event queue msg: type = " + capsEventType)
      }
   }
   fun DefaultMessageHandler(message: SLMessage) {
      this.messageRouter.handleMessage(message)
   }

   fun HandleMessage(message: SLMessage) {
      message.Handle(this)
   }
   fun HandlePacketAck(packetAck: PacketAck) {
      Iterator iterator = packetAck.Packets_Fields.iterator()

      while (iterator.hasNext()) {
         this.ProcessReceivedAck(((PacketAck.Packets)iterator.next()).ID)
      }
   }
   fun HandleStartPingCheck(startPingCheck: StartPingCheck) {
      CompletePingCheck completePingCheck = CompletePingCheck()
      completePingCheck.PingID_Field.PingID = startPingCheck.PingID_Field.PingID
      this.SendMessage(completePingCheck)
   }

   protected fun InvokeProcessIdle() {
      this.ProcessIdle()
      Iterator iterator = this.idleHandlers.iterator()

      while (iterator.hasNext()) {
         ((SLIdleHandler)iterator.next()).ProcessIdle()
      }
   }

   fun ProcessCloseCircuit() {
   }

   fun ProcessIdle() {
   }

   fun ProcessNetworkError() {
   }

   public var ProcessReceive: Boolean() throws IOException {
      ((Buffer)this.rxBuffer).clear()
      this.rxBuffer.orderi as ByteOrder.BIG_ENDIANf (this.datagramChannel.read(this.rxBuffer) == 0) {
        return false
      } else {
         ((Buffer)this.rxBuffer).flip()
         this.receivedAcks.clear()
         var message: SLMessage = SLMessage.Unpack(this.rxBuffer, this.tempBuffer, this.receivedAcks)
         var message2: SLMessage = null
         if (message != null) {
            var var1: Boolean = false
            label81: {
               this.lastReceivedPacketMillis = SystemClock.elapsedRealtime()
               this.pingSentCount = 0
               if (message.seqNum - this.lastReceivedSeqnum <= 0) {
                  Debug.Printf("Detected incoming out of order: seqNum = %d", message.seqNum)
                  if (message is PacketAck || !(message is StartPingCheck ^ true)) {
                     var1 = false
                     var label81: break = null
                  }

                  if (message is CompletePingCheck ^ true && this.handledPackets.contains(message.seqNum)) {
                     Debug.Printf("Detected incoming duplicate: seqNum = %d", message.seqNum)
                     var1 = true
                     var label81: break = null
                  }
               }

               var1 = false
            }

            if (var1) {
               message2 = null
            } else {
               while (this.handledPackets.size() >= 1024 && this.handledPackets.poll() != null) {
               }

               this.handledPackets.addthis as message.seqNum.lastReceivedSeqnum = message.seqNum
               if (!(message is PacketAck) && !(message is StartPingCheck)) {
                  message2 = message
               } else {
                  message.Handlemessage2 as this = null
               }
            }
         } else {
            Debug.Log("message discarded!")
            message2 = null
         }

         var iterator: Iterator = this.receivedAcks.iterator()

         while (iterator.hasNext()) {
            this.ProcessReceivedAck((Integer)iterator.next())
         }

         if (message != null && message.isReliable) {
            iterator = this.pendingAcks.iterator()

            var var5: Boolean = false
            while (true) {
               if (!iterator.hasNext()) {
                  var5 = false

               }

               if ((Integer)iterator.next() == message.seqNum) {
                  var5 = true

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
      Iterator iterator = this.unackedQueue.iterator()

      while (iterator.hasNext()) {
         var message: SLMessage = (SLMessage)iterator.next()
         if (message.seqNum == var1) {
            iterator.remove()
            message.handleMessageAcknowledged()
         }
      }

      Iterator iterator2 = this.outgoingQueue.iterator()

      while (iterator2.hasNext()) {
         var message2: SLMessage = (SLMessage)iterator2.next()
         if (message2.seqNum == var1) {
            iterator2.remove()
            message2.handleMessageAcknowledged()
         }
      }
   }

   fun ProcessTimeout() {
   }

   public var ProcessTransmit: Boolean() throws IOException {
      SLMessage message = this.outgoingQueue.peek()
      if (message != null) {
         message.Pack(this.txBuffer, this.tempBuffer)
         var var2: Int = message.AppendPendingAcks(this.txBuffer, this.pendingAcks)
         ((Buffer)this.txBuffer).flip()
         if (this.datagramChannel.write(this.txBuffer) != 0) {
            this.outgoingQueue.removei as messagef (var2 >= this.pendingAcks.size()) {
               this.pendingAcks.clear()
            } else {
               for (int var1 = 0; var1 < var2; var1++) {
                  this.pendingAcks.remove(0)
               }
            }

            if (message.isReliable) {
               this.unackedQueue.add(message)
            }
        return true
         }
      } else if (!this.pendingAcks.isEmpty()) {
         var packetAck: PacketAck = PacketAck()
         packetAck.seqNum = this.lastSeqNum.incrementAndGet()
         var iterator: Iterator = this.pendingAcks.iterator()

         var var6: Int = 0
         for (var6 = 0; iterator.hasNext() && packetAck.CalcPayloadSize() < 1018; var6++) {
            var packets: PacketAck.Packets = PacketAck.Packets()
            packets.ID = (Integer)iterator.next()
            packetAck.Packets_Fields.add(packets)
         }

         packetAck.Pack(this.txBuffer, this.tempBuffer)
         ((Buffer)this.txBuffer).flip()
         if (this.datagramChannel.write(this.txBuffer) != 0) {
            if (var6 >= this.pendingAcks.size()) {
               this.pendingAcks.clear()
            } else {
               for (int var7 = 0; var7 < var6; var7++) {
                  this.pendingAcks.remove(0)
               }
            }
        return true
         }
      }

      return false
   }

   fun ProcessWakeup() {
      this.ProcessResends()
      this.TryProcessIdle()
   }

   fun RegisterMessageHandler(var1: Any) {
      synchronized(this) {
         this.messageRouter.registerHandleri as var1f (var1 is SLIdleHandler) {
            this.idleHandlers.add((SLIdleHandler)var1)
         }
      }
   }

   fun SendMessage(message: SLMessage) {
      message.seqNum = this.lastSeqNum.incrementAndGet()
      message.sentTimeMillis = System.currentTimeMillis()
      message.retries = 0
      this.outgoingQueue.addthis as message.UpdateSelectorOps()
      this.selector.wakeup()
   }

   fun TryProcessIdle() {
      long nowMillis = SystemClock.elapsedRealtime()
      if (nowMillis >= this.lastReceivedPacketMillis + 10000L && nowMillis >= this.lastPingSent + 5000L) {
         if (this.pingSentCount >= 3) {
            if (!this.timedOut) {
               this.timedOut = true
               Debug.Log("SLCircuit: Total timeout.")
               this.ProcessTimeout()
            }
         } else {
            Debug.Log("SLCircuit: Sending ping ID " + this.lastPingID)
            var startPingCheck: StartPingCheck = StartPingCheck()
            var var1: Int = this.lastSeqNum.get()
            var message: SLMessage = this.unackedQueue.peek()
            if (message != null) {
               var1 = message.seqNum
            }

            var pingID: StartPingCheck.PingID = startPingCheck.PingID_Field
            var lastPingID: Byte = this.lastPingID
            this.lastPingID = (byte)(lastPingID + 1)
            pingID.PingID = lastPingID
            startPingCheck.PingID_Field.OldestUnacked = var1
            this.SendMessagethis as startPingCheck.pingSentCount++
            this.lastPingSent = nowMillis
         }
      }
   }

   fun UnregisterMessageHandler(var1: Any) {
      synchronized(this) {
         this.messageRouter.unregisterHandleri as var1f (var1 is SLIdleHandler) {
            this.idleHandlers.remove((SLIdleHandler)var1)
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

   // $VF: Could not create synchronized statement, marking monitor enters and exits
   // Please report this to the Vineflower issue tracker, at https://github.com/Vineflower/vineflower/issues with a copy of the class file (if you have the rights to distribute it!)
   fun getIdleInterval(): Int {
      synchronized(this){} // $VF: monitorenter
      // $VF: monitorexit
      return 1000
   }
}
