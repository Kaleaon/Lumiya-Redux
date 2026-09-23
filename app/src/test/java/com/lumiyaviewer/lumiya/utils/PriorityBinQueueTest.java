package com.lumiyaviewer.lumiya.utils;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertFalse;
import static org.junit.Assert.assertNull;
import static org.junit.Assert.assertSame;
import static org.junit.Assert.assertTrue;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.concurrent.TimeUnit;
import org.junit.Test;

public class PriorityBinQueueTest {
    private static final class Item implements HasPriority {
        private final int priority;

        Item(int priority) {
            this.priority = priority;
        }

        @Override
        public int getPriority() {
            return priority;
        }
    }

    @Test
    public void pollReturnsHighestPriorityWithoutWaiting() throws Exception {
        PriorityBinQueue<Item> queue = new PriorityBinQueue<>(3);
        Item low = new Item(2);
        Item high = new Item(0);
        queue.add(low);
        queue.add(high);

        long started = System.nanoTime();
        assertSame(high, queue.poll(5, TimeUnit.SECONDS));
        assertTrue(TimeUnit.NANOSECONDS.toMillis(System.nanoTime() - started) < 500);
        assertSame(low, queue.poll());
        assertTrue(queue.isEmpty());
    }

    @Test
    public void timedPollExpiresAndDrainHonorsLimit() throws Exception {
        PriorityBinQueue<Item> queue = new PriorityBinQueue<>(2);
        assertNull(queue.poll(10, TimeUnit.MILLISECONDS));

        Item first = new Item(0);
        Item second = new Item(1);
        queue.addAll(Arrays.asList(first, second));
        List<Item> drained = new ArrayList<>();
        assertEquals(1, queue.drainTo(drained, 1));
        assertEquals(1, drained.size());
        assertSame(first, drained.get(0));
        assertFalse(queue.contains(first));
        assertTrue(queue.contains(second));
    }
}
