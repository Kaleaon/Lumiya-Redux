package com.lumiyaviewer.lumiya.slproto;

import android.os.SystemClock;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.eventbus.EventBus;
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthReply;
import com.lumiyaviewer.lumiya.slproto.caps.SLCapEventQueue;
import com.lumiyaviewer.lumiya.slproto.handler.SLMessageRouter;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import com.lumiyaviewer.lumiya.slproto.messages.CompletePingCheck;
import com.lumiyaviewer.lumiya.slproto.messages.PacketAck;
import com.lumiyaviewer.lumiya.slproto.messages.SLMessageHandler;
import com.lumiyaviewer.lumiya.slproto.messages.StartPingCheck;
import com.lumiyaviewer.lumiya.slproto.modules.SLIdleHandler;
import java.io.IOException;
import java.nio.Buffer;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.nio.channels.CancelledKeyException;
import java.nio.channels.DatagramChannel;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicInteger;

public class SLCircuit extends SLMessageHandler {
   private static final int DEFAULT_IDLE_INTERVAL = 1000;
   private static final int FAST_IDLE_INTERVAL = 100;
   private static final int MESSAGE_MAX_RETRIES = 3;
   private static final int MESSAGE_TIMEOUT_MILLIS = 5000;
   private static final long NEED_PING_TIMEOUT = 10000L;
   private static final long PING_INTERVAL = 5000L;
   private static final int TRACK_HANDLED_PACKETS = 1024;
   private static final int UNANSWERED_PINGS = 3;
   SLAuthReply authReply;
   public SLCircuitInfo circuitInfo;
   private DatagramChannel datagramChannel;
   protected final EventBus eventBus = EventBus.getInstance();
   protected SLGridConnection gridConn;
   private Queue<Integer> handledPackets;
   private List<SLIdleHandler> idleHandlers;
   private byte lastPingID;
   private long lastPingSent;
   private long lastReceivedPacketMillis = 0L;
   private int lastReceivedSeqnum;
   private AtomicInteger lastSeqNum;
   private SLMessageRouter messageRouter;
   private ConcurrentLinkedQueue<SLMessage> outgoingQueue;
   private List<Integer> pendingAcks;
   private int pingSentCount;
   private List<Integer> receivedAcks;
   private ByteBuffer rxBuffer;
   private SelectionKey selectionKey;
   Selector selector;
   private ByteBuffer tempBuffer;
   private boolean timedOut;
   private ByteBuffer txBuffer;
   private ConcurrentLinkedQueue<SLMessage> unackedQueue;

   SLCircuit(SLGridConnection gridConnection, SLCircuitInfo circuitInfo, SLAuthReply authReply, SLCircuit circuit) throws IOException {
      this.lastPingSent = 0L;
      this.pingSentCount = 0;
      this.lastPingID = 0;
      this.timedOut = false;
      this.messageRouter = new SLMessageRouter();
      this.idleHandlers = new LinkedList<>();
      this.gridConn = gridConnection;
      this.circuitInfo = circuitInfo;
      this.authReply = authReply;
      this.selector = gridConnection.getSelector();
      if (circuit != null) {
         this.lastReceivedPacketMillis = circuit.lastReceivedPacketMillis;
         this.lastSeqNum = circuit.lastSeqNum;
         this.outgoingQueue = circuit.outgoingQueue;
         this.unackedQueue = circuit.unackedQueue;
         this.pendingAcks = circuit.pendingAcks;
         this.handledPackets = circuit.handledPackets;
         this.lastReceivedSeqnum = circuit.lastReceivedSeqnum;
         this.receivedAcks = circuit.receivedAcks;
         this.txBuffer = circuit.txBuffer;
         this.tempBuffer = circuit.tempBuffer;
         this.rxBuffer = circuit.rxBuffer;
         this.datagramChannel = circuit.datagramChannel;
         this.selectionKey = circuit.selectionKey;
         this.selectionKey.attach(this);
      } else {
         this.lastReceivedPacketMillis = SystemClock.elapsedRealtime();
         this.lastSeqNum = new AtomicInteger(0);
         this.outgoingQueue = new ConcurrentLinkedQueue<>();
         this.unackedQueue = new ConcurrentLinkedQueue<>();
         this.pendingAcks = Collections.synchronizedList(new LinkedList<>());
         this.handledPackets = new LinkedList<>();
         this.lastReceivedSeqnum = 0;
         this.receivedAcks = new ArrayList<>();
         this.txBuffer = ByteBuffer.allocate(65536);
         this.tempBuffer = ByteBuffer.allocate(65536);
         this.rxBuffer = ByteBuffer.allocate(65536);
         this.datagramChannel = DatagramChannel.open();
         this.datagramChannel.configureBlocking(false);
         this.datagramChannel.connect(circuitInfo.socketAddress);
         this.selectionKey = this.datagramChannel.register(this.selector, 1);
         this.selectionKey.attach(this);
      }
   }

   private void DumpDebugBuffer(String var1, ByteBuffer byteBuffer) {
      StringBuilder stringBuilder = new StringBuilder();
      stringBuilder.append(var1).append(": ");

      for (int var3 = 0; var3 < byteBuffer.limit(); var3++) {
         stringBuilder.append(Integer.toHexString(byteBuffer.get(var3) & 255));
      }

      Debug.Log(stringBuilder.toString());
   }

   private void ProcessResends() {
      Iterator iterator = this.unackedQueue.iterator();
      boolean var1 = false;

      while (iterator.hasNext()) {
         SLMessage message = (SLMessage)iterator.next();
         if (System.currentTimeMillis() >= message.sentTimeMillis + 5000L) {
            iterator.remove();
            message.retries++;
            if (message.retries > 3) {
               message.handleMessageTimeout();
            } else {
               message.isResent = true;
               message.sentTimeMillis = System.currentTimeMillis();
               this.outgoingQueue.add(message);
               var1 = true;
            }
         }
      }

      if (var1) {
         this.UpdateSelectorOps();
         this.selector.wakeup();
      }

      this.TryProcessIdle();
   }

   public void CloseCircuit() {
      this.selectionKey.cancel();

      try {
         this.datagramChannel.close();
      } catch (IOException e) {
         e.printStackTrace();
      }

      this.selector.wakeup();
      this.ProcessCloseCircuit();
   }

   public void DefaultEventQueueHandler(SLCapEventQueue.CapsEventType capsEventType, LLSDNode llsdNode) {
      if (!this.messageRouter.handleEventQueueMessage(capsEventType, llsdNode)) {
         Debug.Log("Unhandled event queue msg: type = " + capsEventType);
      }
   }

   @Override
   public void DefaultMessageHandler(SLMessage message) {
      this.messageRouter.handleMessage(message);
   }

   public void HandleMessage(SLMessage message) {
      message.Handle(this);
   }

   @Override
   public void HandlePacketAck(PacketAck packetAck) {
      Iterator iterator = packetAck.Packets_Fields.iterator();

      while (iterator.hasNext()) {
         this.ProcessReceivedAck(((PacketAck.Packets)iterator.next()).ID);
      }
   }

   @Override
   public void HandleStartPingCheck(StartPingCheck startPingCheck) {
      CompletePingCheck completePingCheck = new CompletePingCheck();
      completePingCheck.PingID_Field.PingID = startPingCheck.PingID_Field.PingID;
      this.SendMessage(completePingCheck);
   }

   protected void InvokeProcessIdle() {
      this.ProcessIdle();
      Iterator iterator = this.idleHandlers.iterator();

      while (iterator.hasNext()) {
         ((SLIdleHandler)iterator.next()).ProcessIdle();
      }
   }

   public void ProcessCloseCircuit() {
   }

   public void ProcessIdle() {
   }

   public void ProcessNetworkError() {
   }

   public boolean ProcessReceive() throws IOException {
      ((Buffer)this.rxBuffer).clear();
      this.rxBuffer.order(ByteOrder.BIG_ENDIAN);
      if (this.datagramChannel.read(this.rxBuffer) == 0) {
         return false;
      } else {
         ((Buffer)this.rxBuffer).flip();
         this.receivedAcks.clear();
         SLMessage message = SLMessage.Unpack(this.rxBuffer, this.tempBuffer, this.receivedAcks);
         SLMessage message2;
         if (message != null) {
            boolean var1;
            label81: {
               this.lastReceivedPacketMillis = SystemClock.elapsedRealtime();
               this.pingSentCount = 0;
               if (message.seqNum - this.lastReceivedSeqnum <= 0) {
                  Debug.Printf("Detected incoming out of order: seqNum = %d", message.seqNum);
                  if (message instanceof PacketAck || !(message instanceof StartPingCheck ^ true)) {
                     var1 = false;
                     break label81;
                  }

                  if (message instanceof CompletePingCheck ^ true && this.handledPackets.contains(message.seqNum)) {
                     Debug.Printf("Detected incoming duplicate: seqNum = %d", message.seqNum);
                     var1 = true;
                     break label81;
                  }
               }

               var1 = false;
            }

            if (var1) {
               message2 = null;
            } else {
               while (this.handledPackets.size() >= 1024 && this.handledPackets.poll() != null) {
               }

               this.handledPackets.add(message.seqNum);
               this.lastReceivedSeqnum = message.seqNum;
               if (!(message instanceof PacketAck) && !(message instanceof StartPingCheck)) {
                  message2 = message;
               } else {
                  message.Handle(this);
                  message2 = null;
               }
            }
         } else {
            Debug.Log("message discarded!");
            message2 = null;
         }

         Iterator iterator = this.receivedAcks.iterator();

         while (iterator.hasNext()) {
            this.ProcessReceivedAck((Integer)iterator.next());
         }

         if (message != null && message.isReliable) {
            iterator = this.pendingAcks.iterator();

            boolean var5;
            while (true) {
               if (!iterator.hasNext()) {
                  var5 = false;
                  break;
               }

               if ((Integer)iterator.next() == message.seqNum) {
                  var5 = true;
                  break;
               }
            }

            if (!var5) {
               this.pendingAcks.add(message.seqNum);
            }
         }

         if (message2 != null) {
            this.HandleMessage(message2);
         }

         return true;
      }
   }

   public void ProcessReceivedAck(int var1) {
      Iterator iterator = this.unackedQueue.iterator();

      while (iterator.hasNext()) {
         SLMessage message = (SLMessage)iterator.next();
         if (message.seqNum == var1) {
            iterator.remove();
            message.handleMessageAcknowledged();
         }
      }

      Iterator iterator2 = this.outgoingQueue.iterator();

      while (iterator2.hasNext()) {
         SLMessage message2 = (SLMessage)iterator2.next();
         if (message2.seqNum == var1) {
            iterator2.remove();
            message2.handleMessageAcknowledged();
         }
      }
   }

   public void ProcessTimeout() {
   }

   public boolean ProcessTransmit() throws IOException {
      SLMessage message = this.outgoingQueue.peek();
      if (message != null) {
         message.Pack(this.txBuffer, this.tempBuffer);
         int var2 = message.AppendPendingAcks(this.txBuffer, this.pendingAcks);
         ((Buffer)this.txBuffer).flip();
         if (this.datagramChannel.write(this.txBuffer) != 0) {
            this.outgoingQueue.remove(message);
            if (var2 >= this.pendingAcks.size()) {
               this.pendingAcks.clear();
            } else {
               for (int var1 = 0; var1 < var2; var1++) {
                  this.pendingAcks.remove(0);
               }
            }

            if (message.isReliable) {
               this.unackedQueue.add(message);
            }

            return true;
         }
      } else if (!this.pendingAcks.isEmpty()) {
         PacketAck packetAck = new PacketAck();
         packetAck.seqNum = this.lastSeqNum.incrementAndGet();
         Iterator iterator = this.pendingAcks.iterator();

         int var6;
         for (var6 = 0; iterator.hasNext() && packetAck.CalcPayloadSize() < 1018; var6++) {
            PacketAck.Packets packets = new PacketAck.Packets();
            packets.ID = (Integer)iterator.next();
            packetAck.Packets_Fields.add(packets);
         }

         packetAck.Pack(this.txBuffer, this.tempBuffer);
         ((Buffer)this.txBuffer).flip();
         if (this.datagramChannel.write(this.txBuffer) != 0) {
            if (var6 >= this.pendingAcks.size()) {
               this.pendingAcks.clear();
            } else {
               for (int var7 = 0; var7 < var6; var7++) {
                  this.pendingAcks.remove(0);
               }
            }

            return true;
         }
      }

      return false;
   }

   public void ProcessWakeup() {
      this.ProcessResends();
      this.TryProcessIdle();
   }

   public void RegisterMessageHandler(Object var1) {
      synchronized (this) {
         this.messageRouter.registerHandler(var1);
         if (var1 instanceof SLIdleHandler) {
            this.idleHandlers.add((SLIdleHandler)var1);
         }
      }
   }

   public void SendMessage(SLMessage message) {
      message.seqNum = this.lastSeqNum.incrementAndGet();
      message.sentTimeMillis = System.currentTimeMillis();
      message.retries = 0;
      this.outgoingQueue.add(message);
      this.UpdateSelectorOps();
      this.selector.wakeup();
   }

   public void TryProcessIdle() {
      long nowMillis = SystemClock.elapsedRealtime();
      if (nowMillis >= this.lastReceivedPacketMillis + 10000L && nowMillis >= this.lastPingSent + 5000L) {
         if (this.pingSentCount >= 3) {
            if (!this.timedOut) {
               this.timedOut = true;
               Debug.Log("SLCircuit: Total timeout.");
               this.ProcessTimeout();
            }
         } else {
            Debug.Log("SLCircuit: Sending ping ID " + this.lastPingID);
            StartPingCheck startPingCheck = new StartPingCheck();
            int var1 = this.lastSeqNum.get();
            SLMessage message = this.unackedQueue.peek();
            if (message != null) {
               var1 = message.seqNum;
            }

            StartPingCheck.PingID pingID = startPingCheck.PingID_Field;
            byte lastPingID = this.lastPingID;
            this.lastPingID = (byte)(lastPingID + 1);
            pingID.PingID = lastPingID;
            startPingCheck.PingID_Field.OldestUnacked = var1;
            this.SendMessage(startPingCheck);
            this.pingSentCount++;
            this.lastPingSent = nowMillis;
         }
      }
   }

   public void UnregisterMessageHandler(Object var1) {
      synchronized (this) {
         this.messageRouter.unregisterHandler(var1);
         if (var1 instanceof SLIdleHandler) {
            this.idleHandlers.remove((SLIdleHandler)var1);
         }
      }
   }

   public void UpdateSelectorOps() {
      if (this.selectionKey.isValid()) {
         try {
            if (this.outgoingQueue.isEmpty() && this.pendingAcks.isEmpty()) {
               this.selectionKey.interestOps(1);
            } else {
               this.selectionKey.interestOps(5);
            }
         } catch (CancelledKeyException e) {
            Debug.Warning(e);
         }
      }
   }

   public SLAuthReply getAuthReply() {
      return this.authReply;
   }

   public EventBus getEventBus() {
      return this.eventBus;
   }

   public SLGridConnection getGridConnection() {
      return this.gridConn;
   }

   // $VF: Could not create synchronized statement, marking monitor enters and exits
   // Please report this to the Vineflower issue tracker, at https://github.com/Vineflower/vineflower/issues with a copy of the class file (if you have the rights to distribute it!)
   public int getIdleInterval() {
      synchronized (this){} // $VF: monitorenter 
      // $VF: monitorexit
      return 1000;
   }
}
