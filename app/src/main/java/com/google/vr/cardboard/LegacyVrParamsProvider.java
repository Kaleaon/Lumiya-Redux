package com.google.vr.cardboard;

import com.google.common.logging.nano.Vr;
import com.google.vr.vrcore.nano.SdkConfiguration;
import com.google.vrtoolkit.cardboard.proto.nano.CardboardDevice;
import com.google.vrtoolkit.cardboard.proto.nano.Phone;
import com.google.vrtoolkit.cardboard.proto.nano.Preferences;

public final class LegacyVrParamsProvider implements VrParamsProvider {
    private static final String TAG = LegacyVrParamsProvider.class.getSimpleName();

    @Override
    public final void close() {
    }

    @Override
    public final CardboardDevice.DeviceParams readDeviceParams() {
        return ConfigUtils.readDeviceParamsFromExternalStorage();
    }

    @Override
    public final Phone.PhoneParams readPhoneParams() {
        Phone.PhoneParams readPhoneParamsFromExternalStorage = ConfigUtils.readPhoneParamsFromExternalStorage();
        return readPhoneParamsFromExternalStorage != null ? readPhoneParamsFromExternalStorage : PhoneParams.getPpiOverride();
    }

    @Override
    public final Vr.VREvent.SdkConfigurationParams readSdkConfigurationParams(SdkConfiguration.SdkConfigurationRequest sdkConfigurationRequest) {
        return null;
    }

    @Override
    public final Preferences.UserPrefs readUserPrefs() {
        return null;
    }

    @Override
    public final boolean updateUserPrefs(Preferences.UserPrefs userPrefs) {
        return false;
    }

    @Override
    public final boolean writeDeviceParams(CardboardDevice.DeviceParams deviceParams) {
        return deviceParams != null ? ConfigUtils.writeDeviceParamsToExternalStorage(deviceParams) : ConfigUtils.removeDeviceParamsFromExternalStorage();
    }
}
