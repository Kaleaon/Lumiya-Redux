package com.google.vr.vrcore.performance.api;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public interface IPerformanceService extends IInterface {

    public static abstract class Stub extends Binder implements IPerformanceService {
        private static final String DESCRIPTOR = "com.google.vr.vrcore.performance.api.IPerformanceService";
        static final int TRANSACTION_getCurrentThrottlingRelativeTemperature = 1;
        static final int TRANSACTION_reportFrameDrops = 2;

        private static class Proxy implements IPerformanceService {
            private IBinder mRemote;

            Proxy(IBinder mRemote) {
                this.mRemote = mRemote;
            }

            @Override
            public IBinder asBinder() {
                return this.mRemote;
            }

            @Override
            public float getCurrentThrottlingRelativeTemperature() throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel parcel = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    this.mRemote.transact(1, obtain, parcel, 0);
                    parcel.readException();
                    return parcel.readFloat();
                } finally {
                    parcel.recycle();
                    obtain.recycle();
                }
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            @Override
            public void reportFrameDrops(long j, long j2, int i) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeLong(j);
                    obtain.writeLong(j2);
                    obtain.writeInt(i);
                    this.mRemote.transact(2, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IPerformanceService asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            return (queryLocalInterface != null && (queryLocalInterface instanceof IPerformanceService)) ? (IPerformanceService) queryLocalInterface : new Proxy(iBinder);
        }

        @Override
        public IBinder asBinder() {
            return this;
        }

        @Override
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            switch (i) {
                case 1:
                    parcel.enforceInterface(DESCRIPTOR);
                    float currentThrottlingRelativeTemperature = getCurrentThrottlingRelativeTemperature();
                    parcel2.writeNoException();
                    parcel2.writeFloat(currentThrottlingRelativeTemperature);
                    return true;
                case 2:
                    parcel.enforceInterface(DESCRIPTOR);
                    reportFrameDrops(parcel.readLong(), parcel.readLong(), parcel.readInt());
                    return true;
                case 1598968902:
                    parcel2.writeString(DESCRIPTOR);
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    float getCurrentThrottlingRelativeTemperature() throws RemoteException;

    void reportFrameDrops(long j, long j2, int i) throws RemoteException;
}
