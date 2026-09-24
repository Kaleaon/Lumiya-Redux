package com.google.vr.sdk.base.testing.sensors;

import android.hardware.SensorEventListener;
import com.google.vr.sdk.base.sensors.Clock;
import com.google.vr.sdk.base.sensors.SensorEventProvider;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

public class SensorEventProviderFromRecordedData implements SensorEventProvider {
    private final List<SensorEventAndTime> events;
    private ListIterator<SensorEventAndTime> eventsIterator = null;
    private EventClock eventClock = new EventClock();
    private final List<SensorEventListener> registeredListeners = new ArrayList();

    private static class EventClock implements Clock {
        private long currentTimeNs;

        private EventClock() {
        }

        @Override
        public long nanoTime() {
            return this.currentTimeNs;
        }

        public void setTimeNs(long currentTimeNs) {
            this.currentTimeNs = currentTimeNs;
        }
    }

    public SensorEventProviderFromRecordedData(List<SensorEventAndTime> list) {
        this.events = list;
    }

    public boolean atEnd() {
        return !this.eventsIterator.hasNext();
    }

    public Clock getClock() {
        return this.eventClock;
    }

    public boolean next() {
        if (atEnd()) {
            return false;
        }
        SensorEventAndTime next = this.eventsIterator.next();
        this.eventClock.setTimeNs(next.timeNs);
        synchronized (this.registeredListeners) {
            Iterator<SensorEventListener> it = this.registeredListeners.iterator();
            while (it.hasNext()) {
                it.next().onSensorChanged(next.event);
            }
        }
        return true;
    }

    @Override
    public void registerListener(SensorEventListener sensorEventListener) {
        synchronized (this.registeredListeners) {
            this.registeredListeners.add(sensorEventListener);
        }
    }

    public void reset() {
        this.eventsIterator = this.events.listIterator();
    }

    @Override
    public void start() {
        reset();
        next();
    }

    @Override
    public void stop() {
    }

    @Override
    public void unregisterListener(SensorEventListener sensorEventListener) {
        synchronized (this.registeredListeners) {
            this.registeredListeners.remove(sensorEventListener);
        }
    }
}
