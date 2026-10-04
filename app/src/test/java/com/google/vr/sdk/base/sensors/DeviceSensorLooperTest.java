package com.google.vr.sdk.base.sensors;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertTrue;

import android.hardware.Sensor;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Handler;
import android.os.Looper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34)
public class DeviceSensorLooperTest {

    private static class RecordingSensorManager extends SensorManager {
        final List<Integer> registeredRates = new ArrayList<>();
        final List<Sensor> registeredSensors = new ArrayList<>();

        @Override
        public Sensor getDefaultSensor(int type) {
            return null;
        }

        @Override
        public boolean registerListener(SensorEventListener listener, Sensor sensor, int samplingPeriodUs, Handler handler) {
            registeredRates.add(samplingPeriodUs);
            registeredSensors.add(sensor);
            return true;
        }

        @Override
        public void unregisterListener(SensorEventListener listener) {}

        @Override
        protected void unregisterListenerImpl(SensorEventListener listener, Sensor sensor) {}

        @Override
        protected boolean registerListenerImpl(SensorEventListener listener, Sensor sensor, int delayUs, Handler handler, int maxReportLatencyUs, int reservedFlags) {
            registeredRates.add(delayUs);
            registeredSensors.add(sensor);
            return true;
        }

        @Override
        protected List<Sensor> getFullSensorList() {
            return Collections.emptyList();
        }

        @Override
        protected boolean flushImpl(SensorEventListener listener) {
            return false;
        }

        @Override
        protected boolean initDataFetcher() {
            return false;
        }
    }

    @Test
    public void testDefaultConstructorUsesSensorDelayGame() throws Exception {
        RecordingSensorManager sensorManager = new RecordingSensorManager();
        DeviceSensorLooper looper = new DeviceSensorLooper(sensorManager);

        assertEquals(SensorManager.SENSOR_DELAY_GAME, looper.getCustomSensorDelay());
        assertEquals(DeviceSensorLooper.DEFAULT_SAMPLING_PERIOD_US, looper.getCustomSensorDelay());

        looper.start();

        CountDownLatch latch = new CountDownLatch(1);
        new Handler(Looper.getMainLooper()).postDelayed(latch::countDown, 100);
        latch.await(1, TimeUnit.SECONDS);

        looper.stop();

        assertTrue("Expected sensor listener registrations", sensorManager.registeredRates.size() >= 1);
        for (int rate : sensorManager.registeredRates) {
            assertEquals(SensorManager.SENSOR_DELAY_GAME, rate);
        }
    }

    @Test
    public void testCustomConstructorUsesConfiguredSamplingDelay() throws Exception {
        RecordingSensorManager sensorManager = new RecordingSensorManager();
        int customDelayUs = 15000;
        DeviceSensorLooper looper = new DeviceSensorLooper(sensorManager, customDelayUs);

        assertEquals(customDelayUs, looper.getCustomSensorDelay());

        looper.start();

        CountDownLatch latch = new CountDownLatch(1);
        new Handler(Looper.getMainLooper()).postDelayed(latch::countDown, 100);
        latch.await(1, TimeUnit.SECONDS);

        looper.stop();

        assertTrue("Expected sensor listener registrations", sensorManager.registeredRates.size() >= 1);
        for (int rate : sensorManager.registeredRates) {
            assertEquals(customDelayUs, rate);
        }
    }
}
