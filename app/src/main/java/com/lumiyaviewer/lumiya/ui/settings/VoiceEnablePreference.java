package com.lumiyaviewer.lumiya.ui.settings;

import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import androidx.appcompat.app.AlertDialog;
import androidx.preference.CheckBoxPreference;
import android.util.AttributeSet;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.licensing.LicenseChecker;
import com.lumiyaviewer.lumiya.voiceintf.VoicePluginServiceConnection;

public class VoiceEnablePreference extends CheckBoxPreference {
    public VoiceEnablePreference(Context context) {
        super(context);
        initVoicePrefCapability();
    }

    public VoiceEnablePreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        initVoicePrefCapability();
    }

    public VoiceEnablePreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        initVoicePrefCapability();
    }

    public VoiceEnablePreference(Context context, AttributeSet attributeSet, int i, int i2) {
        super(context, attributeSet, i, i2);
        initVoicePrefCapability();
    }

    private void initVoicePrefCapability() {
        boolean isPluginSupported = VoicePluginServiceConnection.isPluginSupported();
        setEnabled(isPluginSupported);
        if (isPluginSupported) {
            return;
        }
        setChecked(false);
        setSummary(getContext().getString(R.string.voice_not_supported));
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_settings_VoiceEnablePreference_2130, reason: not valid java name */
    /* synthetic */ void m872xef85dc(DialogInterface dialogInterface, int i) {
        dialogInterface.dismiss();
        Intent intent = new Intent("android.intent.action.VIEW");
        intent.setData(Uri.parse(LicenseChecker.VOICE_PLUGIN_URL));
        getContext().startActivity(intent);
    }

    @Override
    protected void onClick() {
        VoicePluginServiceConnection.setInstallOfferDisplayed(true);
        super.onClick();
        if (!isChecked() || VoicePluginServiceConnection.checkPluginInstalled(getContext())) {
            return;
        }
        new AlertDialog.Builder(getContext()).setTitle(R.string.enable_voice).setMessage(getContext().getString(R.string.enable_voice_plugin_message, LicenseChecker.APP_STORE_NAME)).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                VoiceEnablePreference.this.m872xef85dc(dialogInterface, i);
            }

            @Override
            public final void onClick(DialogInterface dialogInterface, int i) {
                $m$0(dialogInterface, i);
            }
        }).setNegativeButton("No", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                dialogInterface.cancel();
            }

            @Override
            public final void onClick(DialogInterface dialogInterface, int i) {
                $m$0(dialogInterface, i);
            }
        }).setCancelable(true).create().show();
    }
}
