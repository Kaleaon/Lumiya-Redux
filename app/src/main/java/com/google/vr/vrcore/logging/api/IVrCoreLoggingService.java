package com.google.vr.vrcore.logging.api;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;

public interface IVrCoreLoggingService extends IInterface {

    public static abstract class Stub extends Binder implements IVrCoreLoggingService {
        private static final String DESCRIPTOR = "com.google.vr.vrcore.logging.api.IVrCoreLoggingService";
        static final int TRANSACTION_log = 2;
        static final int TRANSACTION_logBatched = 3;

        private static class Proxy implements IVrCoreLoggingService {
            private IBinder mRemote;

            Proxy(IBinder mRemote) {
                this.mRemote = mRemote;
            }

            @Override
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            @Override
            public void log(VREventParcelable vrEventParcelable) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    if (vrEventParcelable == null) {
                        obtain.writeInt(0);
                    } else {
                        obtain.writeInt(1);
                        vrEventParcelable.writeToParcel(obtain, 0);
                    }
                    this.mRemote.transact(2, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }

            @Override
            public void logBatched(VREventParcelable[] vrEventParcelables) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeTypedArray(vrEventParcelables, 0);
                    this.mRemote.transact(3, obtain, null, 1);
                } finally {
                    obtain.recycle();
                }
            }
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IVrCoreLoggingService asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            return (queryLocalInterface != null && (queryLocalInterface instanceof IVrCoreLoggingService)) ? (IVrCoreLoggingService) queryLocalInterface : new Proxy(iBinder);
        }

        @Override
        public IBinder asBinder() {
            return this;
        }

        @Override
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            switch (i) {
                case 2:
                    parcel.enforceInterface(DESCRIPTOR);
                    log(parcel.readInt() == 0 ? null : VREventParcelable.CREATOR.createFromParcel(parcel));
                    return true;
                case 3:
                    parcel.enforceInterface(DESCRIPTOR);
                    logBatched((VREventParcelable[]) parcel.createTypedArray(VREventParcelable.CREATOR));
                    return true;
                case 1598968902:
                    parcel2.writeString(DESCRIPTOR);
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    void log(VREventParcelable vrEventParcelable) throws RemoteException;

    void logBatched(VREventParcelable[] vrEventParcelables) throws RemoteException;
}
