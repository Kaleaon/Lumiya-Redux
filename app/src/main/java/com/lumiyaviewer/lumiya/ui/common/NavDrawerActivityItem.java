package com.lumiyaviewer.lumiya.ui.common;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import java.util.UUID;

/* loaded from: classes.dex */
class NavDrawerActivityItem extends NavDrawerItem {
    final Class<?> activityClass;

    NavDrawerActivityItem(int i, int i2, int i3, Class<?> cls) {
        super(i, i2, i3);
        this.activityClass = cls;
    }

    @Override
    public void onClick(Context context) {
        UUID activeAgentID;
        Intent intent = new Intent(context, this.activityClass);
        intent.addFlags(131072);
        if ((context instanceof Activity) && (activeAgentID = ActivityUtils.getActiveAgentID(((Activity) context).getIntent())) != null) {
            intent.putExtra("activeAgentUUID", activeAgentID.toString());
        }
        context.startActivity(intent);
    }
}
