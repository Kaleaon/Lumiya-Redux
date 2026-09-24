package com.google.vr.vrcore.controller.api;

import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayDeque;

@Deprecated
public class ControllerEventPacket implements Parcelable {
    protected static final int MAX_EVENTS = 16;
    private static final int SERIALIZED_FORMAT_VERSION = 1;
    private int accelEventCount;
    private ControllerAccelEvent[] accelEvents;
    private int buttonEventCount;
    private ControllerButtonEvent[] buttonEvents;
    private int gyroEventCount;
    private ControllerGyroEvent[] gyroEvents;
    private int orientationEventCount;
    private ControllerOrientationEvent[] orientationEvents;
    private int touchEventCount;
    private ControllerTouchEvent[] touchEvents;
    private static ArrayDeque<ControllerEventPacket> pool = new ArrayDeque<>();
    private static Object poolLock = new Object();
    public static final Parcelable.Creator<ControllerEventPacket> CREATOR = new Parcelable.Creator<ControllerEventPacket>() {
        /* JADX WARN: Can't rename method to resolve collision */
        @Override
        public final ControllerEventPacket createFromParcel(Parcel parcel) {
            ControllerEventPacket obtain = ControllerEventPacket.obtain();
            obtain.readFromParcel(parcel);
            return obtain;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override
        public final ControllerEventPacket[] newArray(int i) {
            return new ControllerEventPacket[i];
        }
    };

    public ControllerEventPacket() {
        this.accelEvents = new ControllerAccelEvent[16];
        this.buttonEvents = new ControllerButtonEvent[16];
        this.gyroEvents = new ControllerGyroEvent[16];
        this.orientationEvents = new ControllerOrientationEvent[16];
        this.touchEvents = new ControllerTouchEvent[16];
        for (int i = 0; i < 16; i++) {
            this.accelEvents[i] = new ControllerAccelEvent();
            this.buttonEvents[i] = new ControllerButtonEvent();
            this.gyroEvents[i] = new ControllerGyroEvent();
            this.orientationEvents[i] = new ControllerOrientationEvent();
            this.touchEvents[i] = new ControllerTouchEvent();
        }
        clear();
    }

    protected ControllerEventPacket(Parcel parcel) {
        this();
        readFromParcel(parcel);
    }

    public static ControllerEventPacket obtain() {
        ControllerEventPacket remove;
        synchronized (poolLock) {
            remove = !pool.isEmpty() ? pool.remove() : new ControllerEventPacket();
        }
        return remove;
    }

    public ControllerAccelEvent addAccelEvent() {
        if (this.accelEventCount >= 16) {
            throw new IllegalStateException("ControllerEventPacket capacity exceeded.");
        }
        ControllerAccelEvent[] controllerAccelEventArr = this.accelEvents;
        int accelEventCount = this.accelEventCount;
        this.accelEventCount = accelEventCount + 1;
        return controllerAccelEventArr[accelEventCount];
    }

    public ControllerButtonEvent addButtonEvent() {
        if (this.buttonEventCount >= 16) {
            throw new IllegalStateException("ControllerEventPacket capacity exceeded.");
        }
        ControllerButtonEvent[] controllerButtonEventArr = this.buttonEvents;
        int buttonEventCount = this.buttonEventCount;
        this.buttonEventCount = buttonEventCount + 1;
        return controllerButtonEventArr[buttonEventCount];
    }

    public ControllerGyroEvent addGyroEvent() {
        if (this.gyroEventCount >= 16) {
            throw new IllegalStateException("ControllerEventPacket capacity exceeded.");
        }
        ControllerGyroEvent[] controllerGyroEventArr = this.gyroEvents;
        int gyroEventCount = this.gyroEventCount;
        this.gyroEventCount = gyroEventCount + 1;
        return controllerGyroEventArr[gyroEventCount];
    }

    public ControllerOrientationEvent addOrientationEvent() {
        if (this.orientationEventCount >= 16) {
            throw new IllegalStateException("ControllerEventPacket capacity exceeded.");
        }
        ControllerOrientationEvent[] controllerOrientationEventArr = this.orientationEvents;
        int orientationEventCount = this.orientationEventCount;
        this.orientationEventCount = orientationEventCount + 1;
        return controllerOrientationEventArr[orientationEventCount];
    }

    public ControllerTouchEvent addTouchEvent() {
        if (this.touchEventCount >= 16) {
            throw new IllegalStateException("ControllerEventPacket capacity exceeded.");
        }
        ControllerTouchEvent[] controllerTouchEventArr = this.touchEvents;
        int touchEventCount = this.touchEventCount;
        this.touchEventCount = touchEventCount + 1;
        return controllerTouchEventArr[touchEventCount];
    }

    protected int calculateParcelByteLength() {
        int i = 24;
        for (int j = 0; j < this.accelEventCount; j++) {
            i += this.accelEvents[j].getByteSize();
        }
        for (int k = 0; k < this.buttonEventCount; k++) {
            i += this.buttonEvents[k].getByteSize();
        }
        for (int m = 0; m < this.gyroEventCount; m++) {
            i += this.gyroEvents[m].getByteSize();
        }
        for (int n = 0; n < this.orientationEventCount; n++) {
            i += this.orientationEvents[n].getByteSize();
        }
        for (int i6 = 0; i6 < this.touchEventCount; i6++) {
            i += this.touchEvents[i6].getByteSize();
        }
        return i;
    }

    protected void checkIsValidEventCount(int i) {
        if (i < 0 || i >= 16) {
            throw new IllegalArgumentException(new StringBuilder(32).append("Invalid event count: ").append(i).toString());
        }
    }

    public void clear() {
        this.accelEventCount = 0;
        this.buttonEventCount = 0;
        this.gyroEventCount = 0;
        this.orientationEventCount = 0;
        this.touchEventCount = 0;
    }

    public void copyFrom(ControllerEventPacket controllerEventPacket) {
        this.accelEventCount = controllerEventPacket.accelEventCount;
        this.buttonEventCount = controllerEventPacket.buttonEventCount;
        this.gyroEventCount = controllerEventPacket.gyroEventCount;
        this.orientationEventCount = controllerEventPacket.orientationEventCount;
        this.touchEventCount = controllerEventPacket.touchEventCount;
        for (int i = 0; i < 16; i++) {
            this.accelEvents[i].copyFrom(controllerEventPacket.accelEvents[i]);
            this.buttonEvents[i].copyFrom(controllerEventPacket.buttonEvents[i]);
            this.gyroEvents[i].copyFrom(controllerEventPacket.gyroEvents[i]);
            this.orientationEvents[i].copyFrom(controllerEventPacket.orientationEvents[i]);
            this.touchEvents[i].copyFrom(controllerEventPacket.touchEvents[i]);
        }
    }

    @Override
    public int describeContents() {
        return 0;
    }

    public ControllerAccelEvent getAccelEvent(int i) {
        if (i >= 0 && i < this.accelEventCount) {
            return this.accelEvents[i];
        }
        throw new IndexOutOfBoundsException();
    }

    public int getAccelEventCount() {
        return this.accelEventCount;
    }

    public ControllerButtonEvent getButtonEvent(int i) {
        if (i >= 0 && i < this.buttonEventCount) {
            return this.buttonEvents[i];
        }
        throw new IndexOutOfBoundsException();
    }

    public int getButtonEventCount() {
        return this.buttonEventCount;
    }

    public ControllerGyroEvent getGyroEvent(int i) {
        if (i >= 0 && i < this.gyroEventCount) {
            return this.gyroEvents[i];
        }
        throw new IndexOutOfBoundsException();
    }

    public int getGyroEventCount() {
        return this.gyroEventCount;
    }

    public ControllerOrientationEvent getOrientationEvent(int i) {
        if (i >= 0 && i < this.orientationEventCount) {
            return this.orientationEvents[i];
        }
        throw new IndexOutOfBoundsException();
    }

    public int getOrientationEventCount() {
        return this.orientationEventCount;
    }

    public ControllerTouchEvent getTouchEvent(int i) {
        if (i >= 0 && i < this.touchEventCount) {
            return this.touchEvents[i];
        }
        throw new IndexOutOfBoundsException();
    }

    public int getTouchEventCount() {
        return this.touchEventCount;
    }

    public void readFromParcel(Parcel parcel) {
        parcel.readInt();
        this.accelEventCount = parcel.readInt();
        checkIsValidEventCount(this.accelEventCount);
        for (int i = 0; i < this.accelEventCount; i++) {
            this.accelEvents[i].readFromParcel(parcel);
        }
        this.buttonEventCount = parcel.readInt();
        checkIsValidEventCount(this.buttonEventCount);
        for (int j = 0; j < this.buttonEventCount; j++) {
            this.buttonEvents[j].readFromParcel(parcel);
        }
        this.gyroEventCount = parcel.readInt();
        checkIsValidEventCount(this.gyroEventCount);
        for (int k = 0; k < this.gyroEventCount; k++) {
            this.gyroEvents[k].readFromParcel(parcel);
        }
        this.orientationEventCount = parcel.readInt();
        checkIsValidEventCount(this.orientationEventCount);
        for (int m = 0; m < this.orientationEventCount; m++) {
            this.orientationEvents[m].readFromParcel(parcel);
        }
        this.touchEventCount = parcel.readInt();
        checkIsValidEventCount(this.touchEventCount);
        for (int n = 0; n < this.touchEventCount; n++) {
            this.touchEvents[n].readFromParcel(parcel);
        }
    }

    public void recycle() {
        clear();
        synchronized (poolLock) {
            if (!pool.contains(this)) {
                pool.add(this);
            }
        }
    }

    @Override
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeInt(1);
        parcel.writeInt(this.accelEventCount);
        for (int j = 0; j < this.accelEventCount; j++) {
            this.accelEvents[j].writeToParcel(parcel, i);
        }
        parcel.writeInt(this.buttonEventCount);
        for (int k = 0; k < this.buttonEventCount; k++) {
            this.buttonEvents[k].writeToParcel(parcel, i);
        }
        parcel.writeInt(this.gyroEventCount);
        for (int m = 0; m < this.gyroEventCount; m++) {
            this.gyroEvents[m].writeToParcel(parcel, i);
        }
        parcel.writeInt(this.orientationEventCount);
        for (int n = 0; n < this.orientationEventCount; n++) {
            this.orientationEvents[n].writeToParcel(parcel, i);
        }
        parcel.writeInt(this.touchEventCount);
        for (int i6 = 0; i6 < this.touchEventCount; i6++) {
            this.touchEvents[i6].writeToParcel(parcel, i);
        }
    }
}
