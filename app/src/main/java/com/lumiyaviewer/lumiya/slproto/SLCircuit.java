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

   SLCircuit(SLGridConnection var1, SLCircuitInfo var2, SLAuthReply var3, SLCircuit var4) throws IOException {
      this.lastPingSent = 0L;
      this.pingSentCount = 0;
      this.lastPingID = 0;
      this.timedOut = false;
      this.messageRouter = new SLMessageRouter();
      this.idleHandlers = new LinkedList<>();
      this.gridConn = var1;
      this.circuitInfo = var2;
      this.authReply = var3;
      this.selector = var1.getSelector();
      if (var4 != null) {
         this.lastReceivedPacketMillis = var4.lastReceivedPacketMillis;
         this.lastSeqNum = var4.lastSeqNum;
         this.outgoingQueue = var4.outgoingQueue;
         this.unackedQueue = var4.unackedQueue;
         this.pendingAcks = var4.pendingAcks;
         this.handledPackets = var4.handledPackets;
         this.lastReceivedSeqnum = var4.lastReceivedSeqnum;
         this.receivedAcks = var4.receivedAcks;
         this.txBuffer = var4.txBuffer;
         this.tempBuffer = var4.tempBuffer;
         this.rxBuffer = var4.rxBuffer;
         this.datagramChannel = var4.datagramChannel;
         this.selectionKey = var4.selectionKey;
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
         this.datagramChannel.connect(var2.socketAddress);
         this.selectionKey = this.datagramChannel.register(this.selector, 1);
         this.selectionKey.attach(this);
      }
   }

   private void DumpDebugBuffer(String var1, ByteBuffer var2) {
      StringBuilder var4 = new StringBuilder();
      var4.append(var1).append(": ");

      for (int var3 = 0; var3 < var2.limit(); var3++) {
         var4.append(Integer.toHexString(var2.get(var3) & 255));
      }

      Debug.Log(var4.toString());
   }

   private void ProcessResends() {
      Iterator var3 = this.unackedQueue.iterator();
      boolean var1 = false;

      while (var3.hasNext()) {
         SLMessage var2 = (SLMessage)var3.next();
         if (System.currentTimeMillis() >= var2.sentTimeMillis + 5000L) {
            var3.remove();
            var2.retries++;
            if (var2.retries > 3) {
               var2.handleMessageTimeout();
            } else {
               var2.isResent = true;
               var2.sentTimeMillis = System.currentTimeMillis();
               this.outgoingQueue.add(var2);
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
      } catch (IOException var2) {
         var2.printStackTrace();
      }

      this.selector.wakeup();
      this.ProcessCloseCircuit();
   }

   public void DefaultEventQueueHandler(SLCapEventQueue.CapsEventType var1, LLSDNode var2) {
      if (!this.messageRouter.handleEventQueueMessage(var1, var2)) {
         Debug.Log("Unhandled event queue msg: type = " + var1);
      }
   }

   @Override
   public void DefaultMessageHandler(SLMessage var1) {
      this.messageRouter.handleMessage(var1);
   }

   public void HandleMessage(SLMessage var1) {
      var1.Handle(this);
   }

   @Override
   public void HandlePacketAck(PacketAck var1) {
      Iterator var2 = var1.Packets_Fields.iterator();

      while (var2.hasNext()) {
         this.ProcessReceivedAck(((PacketAck.Packets)var2.next()).ID);
      }
   }

   @Override
   public void HandleStartPingCheck(StartPingCheck var1) {
      CompletePingCheck var2 = new CompletePingCheck();
      var2.PingID_Field.PingID = var1.PingID_Field.PingID;
      this.SendMessage(var2);
   }

   protected void InvokeProcessIdle() {
      this.ProcessIdle();
      Iterator var1 = this.idleHandlers.iterator();

      while (var1.hasNext()) {
         ((SLIdleHandler)var1.next()).ProcessIdle();
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
         SLMessage var3 = SLMessage.Unpack(this.rxBuffer, this.tempBuffer, this.receivedAcks);
         SLMessage var2;
         if (var3 != null) {
            boolean var1;
            label81: {
               this.lastReceivedPacketMillis = SystemClock.elapsedRealtime();
               this.pingSentCount = 0;
               if (var3.seqNum - this.lastReceivedSeqnum <= 0) {
                  Debug.Printf("Detected incoming out of order: seqNum = %d", var3.seqNum);
                  if (var3 instanceof PacketAck || !(var3 instanceof StartPingCheck ^ true)) {
                     var1 = false;
                     break label81;
                  }

                  if (var3 instanceof CompletePingCheck ^ true && this.handledPackets.contains(var3.seqNum)) {
                     Debug.Printf("Detected incoming duplicate: seqNum = %d", var3.seqNum);
                     var1 = true;
                     break label81;
                  }
               }

               var1 = false;
            }

            if (var1) {
               var2 = null;
            } else {
               while (this.handledPackets.size() >= 1024 && this.handledPackets.poll() != null) {
               }

               this.handledPackets.add(var3.seqNum);
               this.lastReceivedSeqnum = var3.seqNum;
               if (!(var3 instanceof PacketAck) && !(var3 instanceof StartPingCheck)) {
                  var2 = var3;
               } else {
                  var3.Handle(this);
                  var2 = null;
               }
            }
         } else {
            Debug.Log("message discarded!");
            var2 = null;
         }

         Iterator var4 = this.receivedAcks.iterator();

         while (var4.hasNext()) {
            this.ProcessReceivedAck((Integer)var4.next());
         }

         if (var3 != null && var3.isReliable) {
            var4 = this.pendingAcks.iterator();

            boolean var5;
            while (true) {
               if (!var4.hasNext()) {
                  var5 = false;
                  break;
               }

               if ((Integer)var4.next() == var3.seqNum) {
                  var5 = true;
                  break;
               }
            }

            if (!var5) {
               this.pendingAcks.add(var3.seqNum);
            }
         }

         if (var2 != null) {
            this.HandleMessage(var2);
         }

         return true;
      }
   }

   public void ProcessReceivedAck(int var1) {
      Iterator var2 = this.unackedQueue.iterator();

      while (var2.hasNext()) {
         SLMessage var3 = (SLMessage)var2.next();
         if (var3.seqNum == var1) {
            var2.remove();
            var3.handleMessageAcknowledged();
         }
      }

      Iterator var5 = this.outgoingQueue.iterator();

      while (var5.hasNext()) {
         SLMessage var4 = (SLMessage)var5.next();
         if (var4.seqNum == var1) {
            var5.remove();
            var4.handleMessageAcknowledged();
         }
      }
   }

   public void ProcessTimeout() {
   }

   public boolean ProcessTransmit() throws IOException {
      SLMessage var3 = this.outgoingQueue.peek();
      if (var3 != null) {
         var3.Pack(this.txBuffer, this.tempBuffer);
         int var2 = var3.AppendPendingAcks(this.txBuffer, this.pendingAcks);
         ((Buffer)this.txBuffer).flip();
         if (this.datagramChannel.write(this.txBuffer) != 0) {
            this.outgoingQueue.remove(var3);
            if (var2 >= this.pendingAcks.size()) {
               this.pendingAcks.clear();
            } else {
               for (int var1 = 0; var1 < var2; var1++) {
                  this.pendingAcks.remove(0);
               }
            }

            if (var3.isReliable) {
               this.unackedQueue.add(var3);
            }

            return true;
         }
      } else if (!this.pendingAcks.isEmpty()) {
         PacketAck var8 = new PacketAck();
         var8.seqNum = this.lastSeqNum.incrementAndGet();
         Iterator var5 = this.pendingAcks.iterator();

         int var6;
         for (var6 = 0; var5.hasNext() && var8.CalcPayloadSize() < 1018; var6++) {
            PacketAck.Packets var4 = new PacketAck.Packets();
            var4.ID = (Integer)var5.next();
            var8.Packets_Fields.add(var4);
         }

         var8.Pack(this.txBuffer, this.tempBuffer);
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

   public void SendMessage(SLMessage var1) {
      var1.seqNum = this.lastSeqNum.incrementAndGet();
      var1.sentTimeMillis = System.currentTimeMillis();
      var1.retries = 0;
      this.outgoingQueue.add(var1);
      this.UpdateSelectorOps();
      this.selector.wakeup();
   }

   public void TryProcessIdle() {
      long var3 = SystemClock.elapsedRealtime();
      if (var3 >= this.lastReceivedPacketMillis + 10000L && var3 >= this.lastPingSent + 5000L) {
         if (this.pingSentCount >= 3) {
            if (!this.timedOut) {
               this.timedOut = true;
               Debug.Log("SLCircuit: Total timeout.");
               this.ProcessTimeout();
            }
         } else {
            Debug.Log("SLCircuit: Sending ping ID " + this.lastPingID);
            StartPingCheck var5 = new StartPingCheck();
            int var1 = this.lastSeqNum.get();
            SLMessage var6 = this.unackedQueue.peek();
            if (var6 != null) {
               var1 = var6.seqNum;
            }

            StartPingCheck.PingID var7 = var5.PingID_Field;
            byte var2 = this.lastPingID;
            this.lastPingID = (byte)(var2 + 1);
            var7.PingID = var2;
            var5.PingID_Field.OldestUnacked = var1;
            this.SendMessage(var5);
            this.pingSentCount++;
            this.lastPingSent = var3;
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
         } catch (CancelledKeyException var2) {
            Debug.Warning(var2);
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
