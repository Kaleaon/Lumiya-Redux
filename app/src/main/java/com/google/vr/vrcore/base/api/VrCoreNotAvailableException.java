package com.google.vr.vrcore.base.api;

public final class VrCoreNotAvailableException extends Exception {
    public final int errorCode;

    public VrCoreNotAvailableException(int errorCode) {
        super(VrCoreUtils.getConnectionResultString(errorCode));
        this.errorCode = errorCode;
    }
}
