package com.google.vr.vrcore.controller.api;

import android.os.Parcel;
import android.os.Parcelable;

public final class ControllerGyroEvent extends ControllerEvent {
    public static final Parcelable.Creator<ControllerGyroEvent> CREATOR = new Parcelable.Creator<ControllerGyroEvent>() {
        /* JADX WARN: Can't rename method to resolve collision */
        @Override
        public final ControllerGyroEvent createFromParcel(Parcel parcel) {
            return new ControllerGyroEvent(parcel);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override
        public final ControllerGyroEvent[] newArray(int i) {
            return new ControllerGyroEvent[i];
        }
    };
    public float x;
    public float y;
    public float z;

    public ControllerGyroEvent() {
    }

    public ControllerGyroEvent(Parcel parcel) {
        readFromParcel(parcel);
    }

    @Override
    public final void copyFrom(ControllerEvent controllerEvent) {
        if (!(controllerEvent instanceof ControllerGyroEvent)) {
            throw new IllegalStateException("Cannot copy ControllerGyroEvent from non-ControllerGyroEvent instance.");
        }
        super.copyFrom(controllerEvent);
        ControllerGyroEvent controllerGyroEvent = (ControllerGyroEvent) controllerEvent;
        this.x = controllerGyroEvent.x;
        this.y = controllerGyroEvent.y;
        this.z = controllerGyroEvent.z;
    }

    @Override
    public final int describeContents() {
        return 0;
    }

    @Override
    public final int getByteSize() {
        return super.getByteSize() + 12;
    }

    @Override
    public final void readFromParcel(Parcel parcel) {
        super.readFromParcel(parcel);
        this.x = parcel.readFloat();
        this.y = parcel.readFloat();
        this.z = parcel.readFloat();
    }

    @Override
    public final void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeFloat(this.x);
        parcel.writeFloat(this.y);
        parcel.writeFloat(this.z);
    }
}
