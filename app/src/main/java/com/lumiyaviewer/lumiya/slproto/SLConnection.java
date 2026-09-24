package com.lumiyaviewer.lumiya.slproto;

import com.lumiyaviewer.lumiya.Debug;
import java.io.IOException;
import java.nio.channels.CancelledKeyException;
import java.nio.channels.ClosedSelectorException;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.util.ConcurrentModificationException;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.Timer;

public class SLConnection implements Runnable {
    private static final int DEFAULT_IDLE_INTERVAL = 1000;
    private Selector selector;
    private volatile Timer timer;
    private Thread workingThread;

    public SLConnection() {
        System.setProperty("java.net.preferIPv4Stack", "true");
        System.setProperty("java.net.preferIPv6Addresses", "false");
        try {
            this.selector = Selector.open();
        } catch (IOException e) {
            e.printStackTrace();
        }
        this.workingThread = null;
        this.timer = null;
    }

    public void AddCircuit(SLCircuit circuit) {
        synchronized (this) {
            if (this.workingThread == null) {
                this.workingThread = new Thread(this, "SLConnection");
                this.workingThread.start();
            }
        }
    }

    public Selector getSelector() {
        return this.selector;
    }

    public Timer getTimer() {
        Timer timer;
        synchronized (this) {
            if (this.timer == null) {
                this.timer = new Timer("SLConnectionTimer", true);
            }
            timer = this.timer;
        }
        return timer;
    }

    @Override
    public void run() {
        int idleInterval;
        Debug.Log("working thread started");
        while (!this.selector.keys().isEmpty()) {
            int i2 = 1000;
            try {
                for (SelectionKey selectionKey : this.selector.keys()) {
                    try {
                        SLCircuit circuit = (SLCircuit) selectionKey.attachment();
                        if (circuit != null) {
                            if (selectionKey.isValid()) {
                                circuit.ProcessWakeup();
                                idleInterval = circuit.getIdleInterval();
                                if (idleInterval < i2) {
                                }
                            }
                            idleInterval = i2;
                        } else {
                            idleInterval = i2;
                        }
                        i2 = idleInterval;
                    } catch (ConcurrentModificationException e) {
                    } catch (NoSuchElementException e2) {
                    }
                }
                Iterator<SelectionKey> it = this.selector.selectedKeys().iterator();
                while (it.hasNext()) {
                    try {
                        SelectionKey next = it.next();
                        it.remove();
                        SLCircuit circuit2 = (SLCircuit) next.attachment();
                        if (circuit2 != null) {
                            if (next.isValid() && next.isReadable()) {
                                circuit2.ProcessReceive();
                            }
                            if (next.isValid() && next.isWritable()) {
                                circuit2.ProcessTransmit();
                            }
                            if (next.isValid()) {
                                circuit2.UpdateSelectorOps();
                                circuit2.TryProcessIdle();
                            }
                        }
                    } catch (CancelledKeyException e3) {
                    } catch (ClosedSelectorException e4) {
                    } catch (ConcurrentModificationException e5) {
                    } catch (NoSuchElementException e6) {
                    }
                }
                this.selector.select(i2);
            } catch (IOException e7) {
                e7.printStackTrace();
                for (SelectionKey selectionKey2 : this.selector.keys()) {
                    try {
                        SLCircuit circuit3 = (SLCircuit) selectionKey2.attachment();
                        if (circuit3 != null && selectionKey2.isValid()) {
                            circuit3.ProcessNetworkError();
                        }
                    } catch (CancelledKeyException e8) {
                    } catch (ClosedSelectorException e9) {
                    } catch (ConcurrentModificationException e10) {
                    } catch (NoSuchElementException e11) {
                    }
                }
            }
        }
        Debug.Log("working thread exiting");
        synchronized (this) {
            this.workingThread = null;
            if (this.timer != null) {
                this.timer.cancel();
                this.timer = null;
            }
        }
    }
}
