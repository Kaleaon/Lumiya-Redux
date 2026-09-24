package com.google.vr.vrcore.library.api;

import android.os.Binder;
import android.os.IBinder;
import android.os.IInterface;
import android.os.Parcel;
import android.os.RemoteException;
import com.google.vr.vrcore.library.api.IObjectWrapper;
import com.google.vr.vrcore.library.api.IVrNativeLibraryLoader;

public interface IVrCreator extends IInterface {

    public static abstract class Stub extends Binder implements IVrCreator {
        private static final String DESCRIPTOR = "com.google.vr.vrcore.library.api.IVrCreator";
        static final int TRANSACTION_DEPRECATED_newNativeLibraryLoader = 3;
        static final int TRANSACTION_newNativeLibraryLoader = 4;

        private static class Proxy implements IVrCreator {
            private IBinder mRemote;

            Proxy(IBinder mRemote) {
                this.mRemote = mRemote;
            }

            @Override
            public IVrNativeLibraryLoader DEPRECATED_newNativeLibraryLoader(IObjectWrapper objectWrapper) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel parcel = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeStrongBinder(objectWrapper != null ? objectWrapper.asBinder() : null);
                    this.mRemote.transact(3, obtain, parcel, 0);
                    parcel.readException();
                    return IVrNativeLibraryLoader.Stub.asInterface(parcel.readStrongBinder());
                } finally {
                    parcel.recycle();
                    obtain.recycle();
                }
            }

            @Override
            public IBinder asBinder() {
                return this.mRemote;
            }

            public String getInterfaceDescriptor() {
                return Stub.DESCRIPTOR;
            }

            @Override
            public IVrNativeLibraryLoader newNativeLibraryLoader(IObjectWrapper objectWrapper, IObjectWrapper iObjectWrapper) throws RemoteException {
                Parcel obtain = Parcel.obtain();
                Parcel parcel = Parcel.obtain();
                try {
                    obtain.writeInterfaceToken(Stub.DESCRIPTOR);
                    obtain.writeStrongBinder(objectWrapper == null ? null : objectWrapper.asBinder());
                    obtain.writeStrongBinder(iObjectWrapper != null ? iObjectWrapper.asBinder() : null);
                    this.mRemote.transact(4, obtain, parcel, 0);
                    parcel.readException();
                    return IVrNativeLibraryLoader.Stub.asInterface(parcel.readStrongBinder());
                } finally {
                    parcel.recycle();
                    obtain.recycle();
                }
            }
        }

        public Stub() {
            attachInterface(this, DESCRIPTOR);
        }

        public static IVrCreator asInterface(IBinder iBinder) {
            if (iBinder == null) {
                return null;
            }
            IInterface queryLocalInterface = iBinder.queryLocalInterface(DESCRIPTOR);
            return (queryLocalInterface != null && (queryLocalInterface instanceof IVrCreator)) ? (IVrCreator) queryLocalInterface : new Proxy(iBinder);
        }

        @Override
        public IBinder asBinder() {
            return this;
        }

        @Override
        public boolean onTransact(int i, Parcel parcel, Parcel parcel2, int i2) throws RemoteException {
            switch (i) {
                case 3:
                    parcel.enforceInterface(DESCRIPTOR);
                    IVrNativeLibraryLoader DEPRECATED_newNativeLibraryLoader = DEPRECATED_newNativeLibraryLoader(IObjectWrapper.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    parcel2.writeStrongBinder(DEPRECATED_newNativeLibraryLoader != null ? DEPRECATED_newNativeLibraryLoader.asBinder() : null);
                    return true;
                case 4:
                    parcel.enforceInterface(DESCRIPTOR);
                    IVrNativeLibraryLoader newNativeLibraryLoader = newNativeLibraryLoader(IObjectWrapper.Stub.asInterface(parcel.readStrongBinder()), IObjectWrapper.Stub.asInterface(parcel.readStrongBinder()));
                    parcel2.writeNoException();
                    parcel2.writeStrongBinder(newNativeLibraryLoader != null ? newNativeLibraryLoader.asBinder() : null);
                    return true;
                case 1598968902:
                    parcel2.writeString(DESCRIPTOR);
                    return true;
                default:
                    return super.onTransact(i, parcel, parcel2, i2);
            }
        }
    }

    IVrNativeLibraryLoader DEPRECATED_newNativeLibraryLoader(IObjectWrapper objectWrapper) throws RemoteException;

    IVrNativeLibraryLoader newNativeLibraryLoader(IObjectWrapper objectWrapper, IObjectWrapper iObjectWrapper) throws RemoteException;
}
