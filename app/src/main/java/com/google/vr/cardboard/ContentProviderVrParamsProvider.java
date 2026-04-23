package com.google.vr.cardboard;

import android.content.ContentProviderClient;
import android.content.ContentValues;
import android.database.Cursor;
import android.database.CursorIndexOutOfBoundsException;
import android.net.Uri;
import android.os.RemoteException;
import android.util.Base64;
import android.util.Log;
import com.google.common.logging.nano.Vr;
import com.google.protobuf.nano.InvalidProtocolBufferNanoException;
import com.google.protobuf.nano.MessageNano;
import com.google.vr.ndk.base.SdkConfigurationReader;
import com.google.vr.vrcore.nano.SdkConfiguration;
import com.google.vrtoolkit.cardboard.proto.nano.CardboardDevice;
import com.google.vrtoolkit.cardboard.proto.nano.Phone;
import com.google.vrtoolkit.cardboard.proto.nano.Preferences;

/* loaded from: classes.dex */
public class ContentProviderVrParamsProvider implements VrParamsProvider {
    private static final String TAG = ContentProviderVrParamsProvider.class.getSimpleName();
    private final ContentProviderClient client;
    private final Uri deviceParamsSettingUri;
    private final Uri phoneParamsSettingUri;
    private final Uri sdkConfigurationParamsSettingUri;
    private final Uri userPrefsUri;

    public ContentProviderVrParamsProvider(ContentProviderClient contentProviderClient, String str) {
        if (contentProviderClient == null) {
            throw new IllegalArgumentException("ContentProviderClient must not be null");
        }
        if (str == null || str.isEmpty()) {
            throw new IllegalArgumentException("Authority key must be non-null and non-empty");
        }
        this.client = contentProviderClient;
        this.deviceParamsSettingUri = VrSettingsProviderContract.createUri(str, VrSettingsProviderContract.DEVICE_PARAMS_SETTING);
        this.userPrefsUri = VrSettingsProviderContract.createUri(str, VrSettingsProviderContract.USER_PREFS_SETTING);
        this.phoneParamsSettingUri = VrSettingsProviderContract.createUri(str, VrSettingsProviderContract.PHONE_PARAMS_SETTING);
        this.sdkConfigurationParamsSettingUri = VrSettingsProviderContract.createUri(str, VrSettingsProviderContract.SDK_CONFIGURATION_PARAMS_SETTING);
    }

    private <T extends MessageNano> T readParams(T t, Uri uri, String str) {
        try {
            Cursor cursor = this.client.query(uri, null, str, null, null);
            if (cursor == null || !cursor.moveToFirst()) {
                String str2 = TAG;
                String valueOf = String.valueOf(uri);
                Log.e(str2, new StringBuilder(String.valueOf(valueOf).length() + 50).append("Invalid params result from ContentProvider query: ").append(valueOf).toString());
                return null;
            }
            try {
                byte[] blob = cursor.getBlob(0);
                if (blob == null) {
                    return null;
                }
                return (T) MessageNano.mergeFrom(t, blob);
            } finally {
                cursor.close();
            }
        } catch (CursorIndexOutOfBoundsException | RemoteException | InvalidProtocolBufferNanoException | IllegalArgumentException e) {
            Log.e(TAG, "Error reading params from ContentProvider", e);
            return null;
        }
    }

    private boolean writeParams(MessageNano messageNano, Uri uri) {
        int delete;
        try {
            if (messageNano != null) {
                ContentValues contentValues = new ContentValues();
                contentValues.put(VrSettingsProviderContract.SETTING_VALUE_KEY, MessageNano.toByteArray(messageNano));
                delete = this.client.update(uri, contentValues, null, null);
            } else {
                delete = this.client.delete(uri, null, null);
            }
            return delete > 0;
        } catch (RemoteException e) {
            Log.e(TAG, "Failed to write params to ContentProvider", e);
            return false;
        } catch (SecurityException e) {
            Log.e(TAG, "Insufficient permissions to write params to ContentProvider", e2);
            return false;
        }
    }

    @Override // com.google.vr.cardboard.VrParamsProvider
    public void close() {
        this.client.release();
    }

    @Override // com.google.vr.cardboard.VrParamsProvider
    public CardboardDevice.DeviceParams readDeviceParams() {
        return (CardboardDevice.DeviceParams) readParams(new CardboardDevice.DeviceParams(), this.deviceParamsSettingUri, null);
    }

    @Override // com.google.vr.cardboard.VrParamsProvider
    public Phone.PhoneParams readPhoneParams() {
        return (Phone.PhoneParams) readParams(new Phone.PhoneParams(), this.phoneParamsSettingUri, null);
    }

    @Override // com.google.vr.cardboard.VrParamsProvider
    public Vr.VREvent.SdkConfigurationParams readSdkConfigurationParams(SdkConfiguration.SdkConfigurationRequest sdkConfigurationRequest) {
        return (Vr.VREvent.SdkConfigurationParams) readParams(SdkConfigurationReader.DEFAULT_PARAMS, this.sdkConfigurationParamsSettingUri, Base64.encodeToString(MessageNano.toByteArray(sdkConfigurationRequest), 0));
    }

    @Override // com.google.vr.cardboard.VrParamsProvider
    public Preferences.UserPrefs readUserPrefs() {
        return (Preferences.UserPrefs) readParams(new Preferences.UserPrefs(), this.userPrefsUri, null);
    }

    @Override // com.google.vr.cardboard.VrParamsProvider
    public boolean updateUserPrefs(Preferences.UserPrefs userPrefs) {
        return writeParams(userPrefs, this.userPrefsUri);
    }

    @Override // com.google.vr.cardboard.VrParamsProvider
    public boolean writeDeviceParams(CardboardDevice.DeviceParams deviceParams) {
        return writeParams(deviceParams, this.deviceParamsSettingUri);
    }
}
