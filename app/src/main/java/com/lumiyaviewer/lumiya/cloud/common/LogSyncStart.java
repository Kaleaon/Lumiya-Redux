package com.lumiyaviewer.lumiya.cloud.common;

import android.os.Bundle;
import java.util.UUID;

public class LogSyncStart implements Bundleable {
    public final UUID agentUUID;
    public final int appVersionCode;

    public LogSyncStart(int appVersionCode, UUID uuid) {
        this.appVersionCode = appVersionCode;
        this.agentUUID = uuid;
    }

    public LogSyncStart(Bundle bundle) {
        this.appVersionCode = bundle.getInt("appVersionCode");
        this.agentUUID = UUID.fromString(bundle.getString("agentUUID"));
    }

    @Override
    public Bundle toBundle() {
        Bundle bundle = new Bundle();
        bundle.putInt("appVersionCode", this.appVersionCode);
        bundle.putString("agentUUID", this.agentUUID.toString());
        return bundle;
    }
}
