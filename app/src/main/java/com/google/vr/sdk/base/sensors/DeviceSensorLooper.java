package com.google.vr.sdk.base.sensors;

import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Build;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.util.Log;
import java.util.ArrayList;
import java.util.Iterator;

public class DeviceSensorLooper implements SensorEventProvider {
    private static final String LOG_TAG = DeviceSensorLooper.class.getSimpleName();
    private boolean isRunning;
    private final ArrayList<SensorEventListener> registeredListeners = new ArrayList<>();
    private SensorEventListener sensorEventListener;
    private Looper sensorLooper;
    private SensorManager sensorManager;

    public DeviceSensorLooper(SensorManager sensorManager) {
        this.sensorManager = sensorManager;
    }

    public Sensor getUncalibratedGyro() {
        if (Build.MANUFACTURER.equals("HTC")) {
            return null;
        }
        return this.sensorManager.getDefaultSensor(16);
    }

    @Override
    public void registerListener(SensorEventListener sensorEventListener) {
        synchronized (this.registeredListeners) {
            this.registeredListeners.add(sensorEventListener);
        }
    }

    @Override
    public void start() {
        if (this.isRunning) {
            return;
        }
        this.sensorEventListener = new SensorEventListener() {
            @Override
            public void onAccuracyChanged(Sensor sensor, int i) {
                synchronized (DeviceSensorLooper.this.registeredListeners) {
                    Iterator it = DeviceSensorLooper.this.registeredListeners.iterator();
                    while (it.hasNext()) {
                        ((SensorEventListener) it.next()).onAccuracyChanged(sensor, i);
                    }
                }
            }

            @Override
            public void onSensorChanged(SensorEvent sensorEvent) {
                synchronized (DeviceSensorLooper.this.registeredListeners) {
                    Iterator it = DeviceSensorLooper.this.registeredListeners.iterator();
                    while (it.hasNext()) {
                        ((SensorEventListener) it.next()).onSensorChanged(sensorEvent);
                    }
                }
            }
        };
        HandlerThread handlerThread = new HandlerThread("sensor") {
            @Override
            protected void onLooperPrepared() {
                Handler handler = new Handler(Looper.myLooper());
                DeviceSensorLooper.this.sensorManager.registerListener(DeviceSensorLooper.this.sensorEventListener, DeviceSensorLooper.this.sensorManager.getDefaultSensor(1), 0, handler);
                Sensor uncalibratedGyro = DeviceSensorLooper.this.getUncalibratedGyro();
                if (uncalibratedGyro == null) {
                    Log.i(DeviceSensorLooper.LOG_TAG, "Uncalibrated gyroscope unavailable, default to regular gyroscope.");
                    uncalibratedGyro = DeviceSensorLooper.this.sensorManager.getDefaultSensor(4);
                }
                DeviceSensorLooper.this.sensorManager.registerListener(DeviceSensorLooper.this.sensorEventListener, uncalibratedGyro, 0, handler);
            }
        };
        handlerThread.start();
        this.sensorLooper = handlerThread.getLooper();
        this.isRunning = true;
    }

    @Override
    public void stop() {
        if (this.isRunning) {
            this.sensorManager.unregisterListener(this.sensorEventListener);
            this.sensorEventListener = null;
            this.sensorLooper.quit();
            this.sensorLooper = null;
            this.isRunning = false;
        }
    }

    @Override
    public void unregisterListener(SensorEventListener sensorEventListener) {
        synchronized (this.registeredListeners) {
            this.registeredListeners.remove(sensorEventListener);
        }
    }
}
