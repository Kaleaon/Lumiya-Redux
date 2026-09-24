package com.lumiyaviewer.lumiya.utils.wlist;

import com.google.common.collect.Lists;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.utils.Identifiable;
import com.lumiyaviewer.lumiya.utils.wlist.ChunkedList;
import java.util.AbstractList;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Queue;
import java.util.RandomAccess;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.Executor;
import java.util.concurrent.atomic.AtomicBoolean;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public class ChunkedListLoader<E extends Identifiable<Long>> extends AbstractList<E> implements ChunkedList.ChunkFactory<E>, RandomAccess {

    @Nonnull
    private final Executor executor;

    @Nonnull
    private final EventListener listener;

    @Nonnull
    private final Executor listenerExecutor;
    private long loadAboveTopmostId;
    private long loadBelowLastId;
    private final boolean startFromStart;
    private final int windowSize;
    private final Queue<E> addedElements = new ConcurrentLinkedQueue();
    private final AtomicBoolean updatePosted = new AtomicBoolean();
    private final AtomicBoolean loadRequested = new AtomicBoolean();
    private final AtomicBoolean reloadRequested = new AtomicBoolean();
    private final AtomicBoolean reloadAccepted = new AtomicBoolean();
    private final Object lock = new Object();
    private boolean loadAboveWanted = false;

    @Nullable
    private LoadResult<E> loadAboveResult = null;
    private boolean loadBelowWanted = false;

    @Nullable
    private LoadResult<E> loadBelowResult = null;
    private final Map<Long, E> updatedElements = new HashMap();
    private final Runnable loadMoreData = new Runnable() {
        @Override
        public void run() {
            boolean z;
            long j;
            boolean z2;
            boolean z3 = false;
            long j2;
            boolean z4 = true;
            Debug.Printf("ChatView: processing loadMoreData(), reloadRequested %b", Boolean.valueOf(ChunkedListLoader.this.reloadRequested.get()));
            ChunkedListLoader.this.loadRequested.set(false);
            synchronized (ChunkedListLoader.this.lock) {
                z = (ChunkedListLoader.this.loadAboveWanted && ChunkedListLoader.this.loadAboveResult == null) ? !ChunkedListLoader.this.reloadRequested.get() : false;
                j = ChunkedListLoader.this.loadAboveTopmostId;
            }
            if (z) {
                LoadResult<E> loadInBackground = ChunkedListLoader.this.loadInBackground(ChunkedListLoader.this.windowSize, j, false);
                synchronized (ChunkedListLoader.this.lock) {
                    ChunkedListLoader.this.loadAboveResult = loadInBackground;
                }
                z2 = true;
            } else {
                z2 = false;
            }
            synchronized (ChunkedListLoader.this.lock) {
                z3 = (ChunkedListLoader.this.loadBelowWanted && ChunkedListLoader.this.loadBelowResult == null) ? !ChunkedListLoader.this.reloadRequested.get() : false;
                j2 = ChunkedListLoader.this.loadBelowLastId;
            }
            if (z3) {
                LoadResult<E> loadInBackground2 = ChunkedListLoader.this.loadInBackground(ChunkedListLoader.this.windowSize, j2, true);
                synchronized (ChunkedListLoader.this.lock) {
                    ChunkedListLoader.this.loadBelowResult = loadInBackground2;
                }
                z2 = true;
            }
            if (ChunkedListLoader.this.reloadRequested.getAndSet(false)) {
                ChunkedListLoader.this.reloadAccepted.set(true);
            } else {
                z4 = z2;
            }
            if (z4) {
                ChunkedListLoader.this.postUpdate();
            }
        }
    };
    private final Runnable processUpdate = new Runnable() {
        @Override
        public void run() {
            LoadResult loadResult;
            int i;
            LoadResult loadResult2;
            int i2;
            Identifiable identifiable;
            boolean z;
            ChunkedListLoader.this.updatePosted.set(false);
            Debug.Printf("ChatView: processUpdate, reloadAccepted: %b", Boolean.valueOf(ChunkedListLoader.this.reloadAccepted.get()));
            if (ChunkedListLoader.this.reloadAccepted.getAndSet(false)) {
                synchronized (ChunkedListLoader.this.lock) {
                    ChunkedListLoader.this.loadAboveWanted = false;
                    ChunkedListLoader.this.loadAboveResult = null;
                    ChunkedListLoader.this.loadBelowResult = null;
                    ChunkedListLoader.this.loadBelowWanted = false;
                }
                ChunkedListLoader.this.hasAbove = true;
                ChunkedListLoader.this.hasBelow = true;
                ChunkedListLoader.this.addedElements.clear();
                ChunkedListLoader.this.items.clear();
                ChunkedListLoader.this.listener.onListReloaded();
                return;
            }
            synchronized (ChunkedListLoader.this.lock) {
                loadResult = ChunkedListLoader.this.loadAboveResult;
                if (loadResult != null) {
                    ChunkedListLoader.this.loadAboveResult = null;
                    ChunkedListLoader.this.loadAboveWanted = false;
                }
            }
            if (loadResult != null) {
                i = loadResult.entries.size() + 0;
                ChunkedListLoader.this.items.addChunkAtStart(Lists.reverse(loadResult.entries));
                ChunkedListLoader.this.hasAbove = loadResult.hasMore;
                if (loadResult.fromId == Long.MAX_VALUE) {
                    ChunkedListLoader.this.hasBelow = false;
                }
            } else {
                i = 0;
            }
            if (i != 0) {
                ChunkedListLoader.this.listener.onListItemsAdded(0, i);
            }
            int size = ChunkedListLoader.this.items.size();
            synchronized (ChunkedListLoader.this.lock) {
                loadResult2 = ChunkedListLoader.this.loadBelowResult;
                if (loadResult2 != null) {
                    ChunkedListLoader.this.loadBelowResult = null;
                    ChunkedListLoader.this.loadBelowWanted = false;
                }
            }
            if (loadResult2 != null) {
                i2 = loadResult2.entries.size();
                ChunkedListLoader.this.items.addChunkAtEnd(loadResult2.entries);
                ChunkedListLoader.this.hasBelow = loadResult2.hasMore;
                if (loadResult2.fromId == 0) {
                    ChunkedListLoader.this.hasAbove = false;
                }
            } else {
                i2 = 0;
            }
            boolean z2 = false;
            int i3 = i2;
            while (true) {
                Identifiable identifiable2 = (Identifiable) ChunkedListLoader.this.addedElements.poll();
                if (identifiable2 == null) {
                    break;
                }
                long longValue = ChunkedListLoader.this.items.size() > 0 ? ((Long) ((Identifiable) ChunkedListLoader.this.items.get(ChunkedListLoader.this.items.size() - 1)).getId()).longValue() : -1L;
                Debug.Printf("ChatView: added element: id %d, lastId %d, hasBelow %b", identifiable2.getId(), Long.valueOf(longValue), Boolean.valueOf(ChunkedListLoader.this.hasBelow));
                if (ChunkedListLoader.this.hasBelow || ((Long) identifiable2.getId()).longValue() <= longValue) {
                    z = z2;
                } else {
                    ChunkedListLoader.this.items.addElement((E) identifiable2, ChunkedListLoader.this.windowSize, ChunkedListLoader.this);
                    i3++;
                    z = true;
                }
                z2 = z;
                i3 = i3;
            }
            if (i3 != 0) {
                ChunkedListLoader.this.listener.onListItemsAdded(size, i3);
            }
            if (z2) {
                ChunkedListLoader.this.listener.onListItemAddedAtEnd();
            }
            while (true) {
                synchronized (ChunkedListLoader.this.lock) {
                    Iterator it = ChunkedListLoader.this.updatedElements.entrySet().iterator();
                    if (it.hasNext()) {
                        identifiable = (Identifiable) ((Map.Entry) it.next()).getValue();
                        it.remove();
                    } else {
                        identifiable = null;
                    }
                }
                if (identifiable == null) {
                    return;
                }
                int replaceElement = ChunkedListLoader.this.items.replaceElement((E) identifiable, ChunkedListLoader.this.chatMessageComparator);
                Debug.Printf("ChunkedListLoader: replace: replacedIndex is %d", Integer.valueOf(replaceElement));
                if (replaceElement >= 0) {
                    ChunkedListLoader.this.listener.onListItemChanged(replaceElement);
                }
            }
        }
    };
    private final Comparator<E> chatMessageComparator = new Comparator() {
        private final /* synthetic */ int $m$0(Object obj, Object obj2) {
            int signum;
            signum = Long.signum(((Long) ((Identifiable) obj).getId()).longValue() - ((Long) ((Identifiable) obj2).getId()).longValue());
            return signum;
        }

        @Override
        public final int compare(Object obj, Object obj2) {
            return $m$0(obj, obj2);
        }
    };

    @Nonnull
    private ChunkedList<E> items = new ChunkedList<>();
    private boolean hasAbove = true;
    private boolean hasBelow = true;

    public interface EventListener {
        @Nonnull
        Executor getListEventsExecutor();

        void onListItemAddedAtEnd();

        void onListItemChanged(int i);

        void onListItemsAdded(int i, int i2);

        void onListItemsRemoved(int i, int i2);

        void onListReloaded();
    }

    protected static class LoadResult<E> {
        public final List<E> entries;
        final long fromId;
        final boolean hasMore;

        public LoadResult(List<E> list, boolean z, long j) {
            this.entries = list;
            this.hasMore = z;
            this.fromId = j;
        }
    }

    public ChunkedListLoader(int i, @Nonnull Executor executor, boolean z, @Nonnull EventListener eventListener) {
        this.windowSize = i;
        this.executor = executor;
        this.startFromStart = z;
        this.listener = eventListener;
        this.listenerExecutor = eventListener.getListEventsExecutor();
    }

    public void postUpdate() {
        if (!this.updatePosted.compareAndSet(false, true)) {
            Debug.Printf("ChatView: processUpdate () already requested", new Object[0]);
        } else {
            Debug.Printf("ChatView: requesting processUpdate ()", new Object[0]);
            this.listenerExecutor.execute(this.processUpdate);
        }
    }

    public void addElement(E e) {
        Debug.Printf("ChatView: addElement: adding element with id %d", e.getId());
        this.addedElements.add(e);
        postUpdate();
    }

    @Override
    public List<E> createEmptyChunk() {
        return new ArrayList(this.windowSize);
    }

    @Override
    public E get(int i) {
        return this.items.get(i);
    }

    public boolean hasMoreItemsAtBottom() {
        return this.hasBelow;
    }

    protected LoadResult<E> loadInBackground(int i, long j, boolean z) {
        return new LoadResult<>(new ArrayList(0), false, j);
    }

    public void reload() {
        this.reloadRequested.set(true);
        if (this.loadRequested.compareAndSet(false, true)) {
            this.executor.execute(this.loadMoreData);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:47:0x00d9  */
    /* JADX WARN: Removed duplicated region for block: B:54:? A[RETURN, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void setVisibleRange(int i, int i2) {
        Object obj;
        boolean z = false;
        boolean z2 = false;
        int iRemoveElementsBefore;
        boolean z3 = false;
        synchronized (this.lock) {
            Object[] objArr = new Object[5];
            objArr[0] = Integer.valueOf(i);
            objArr[1] = Integer.valueOf(i2);
            objArr[2] = Integer.valueOf(this.items.size());
            objArr[3] = (this.loadAboveWanted || this.loadAboveResult != null) ? "no" : "yes";
            objArr[4] = (this.loadBelowWanted || this.loadBelowResult != null) ? "no" : "yes";
            Debug.Printf("ChatView: new visible range %d, %d size %d above possible %s below possible %s", objArr);
        }
        if (this.items.size() > 0) {
            if (i <= 0 && this.hasAbove) {
                synchronized (this.lock) {
                    if (this.loadAboveWanted || this.loadAboveResult != null) {
                        z = false;
                    } else {
                        this.loadAboveTopmostId = ((Long) this.items.get(0).getId()).longValue();
                        this.loadAboveWanted = true;
                        Debug.Printf("ChatView: requesting load above id %d", Long.valueOf(this.loadAboveTopmostId));
                        z = true;
                    }
                }
            } else if (i > 0) {
                synchronized (this.lock) {
                    if (!this.loadAboveWanted) {
                        z2 = this.loadAboveResult == null;
                    }
                }
                if (!z2 || (iRemoveElementsBefore = this.items.removeElementsBefore(i)) == 0) {
                    z = false;
                } else {
                    this.hasAbove = true;
                    this.listener.onListItemsRemoved(0, iRemoveElementsBefore);
                    z = false;
                }
            }
            if (i2 >= this.items.size() - 1 && this.hasBelow) {
                obj = this.lock;
                synchronized (obj) {
                    if (!this.loadBelowWanted && this.loadBelowResult == null) {
                        this.loadBelowLastId = ((Long) this.items.get(this.items.size() - 1).getId()).longValue();
                        this.loadBelowWanted = true;
                        Debug.Printf("ChatView: requesting load below id %d", Long.valueOf(this.loadBelowLastId));
                        z = true;
                    }
                }
            } else if (i2 >= 0 && i2 < this.items.size() - 1) {
                synchronized (this.lock) {
                    if (!this.loadBelowWanted) {
                        z3 = this.loadBelowResult == null;
                    }
                }
                if (z3) {
                    int size = this.items.size();
                    int iRemoveElementsAfter = this.items.removeElementsAfter(i2);
                    if (iRemoveElementsAfter != 0) {
                        this.hasBelow = true;
                        this.listener.onListItemsRemoved(size - iRemoveElementsAfter, iRemoveElementsAfter);
                    }
                }
            }
        } else if (this.startFromStart) {
            if (this.hasBelow) {
                obj = this.lock;
                synchronized (obj) {
                    if (this.loadBelowWanted || this.loadBelowResult != null) {
                        z = false;
                    } else {
                        this.loadBelowLastId = 0L;
                        this.loadBelowWanted = true;
                        Debug.Printf("ChatView: requesting load below id %d", Long.valueOf(this.loadBelowLastId));
                        z = true;
                    }
                }
            }
            z = false;
        } else {
            if (this.hasAbove) {
                obj = this.lock;
                synchronized (obj) {
                    if (this.loadAboveWanted || this.loadAboveResult != null) {
                        z = false;
                    } else {
                        this.loadAboveTopmostId = Long.MAX_VALUE;
                        this.loadAboveWanted = true;
                        Debug.Printf("ChatView: requesting load above id %d", Long.valueOf(this.loadAboveTopmostId));
                        z = true;
                    }
                }
            }
            z = false;
        }
        if (z) {
            if (!this.loadRequested.compareAndSet(false, true)) {
                Debug.Printf("ChatView: loadMoreData() already requested", new Object[0]);
            } else {
                Debug.Printf("ChatView: requesting loadMoreData ()", new Object[0]);
                this.executor.execute(this.loadMoreData);
            }
        }
    }

    @Override
    public int size() {
        return this.items.size();
    }

    public void updateElement(E e) {
        Debug.Printf("ChatView: addElement: updated element with id %d", e.getId());
        synchronized (this.lock) {
            this.updatedElements.put((Long) e.getId(), e);
        }
        postUpdate();
    }
}
