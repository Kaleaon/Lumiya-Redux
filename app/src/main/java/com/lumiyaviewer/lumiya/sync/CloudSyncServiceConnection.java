package com.lumiyaviewer.lumiya.sync;

import com.lumiyaviewer.lumiya.compat.PlatformCompat;
import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.ServiceConnection;
import android.content.pm.PackageManager;
import android.content.pm.ResolveInfo;
import android.net.Uri;
import android.os.Bundle;
import android.os.Handler;
import android.os.IBinder;
import android.os.Message;
import android.os.Messenger;
import androidx.core.app.NotificationCompat;
import com.google.common.base.Strings;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.cloud.common.Bundleable;
import com.lumiyaviewer.lumiya.cloud.common.CloudSyncMessenger;
import com.lumiyaviewer.lumiya.cloud.common.LogMessagesCompleted;
import com.lumiyaviewer.lumiya.cloud.common.LogMessagesFlushed;
import com.lumiyaviewer.lumiya.cloud.common.LogSyncStart;
import com.lumiyaviewer.lumiya.cloud.common.LogSyncStatus;
import com.lumiyaviewer.lumiya.cloud.common.MessageType;
import com.lumiyaviewer.lumiya.licensing.LicenseChecker;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import java.util.List;
import java.util.concurrent.atomic.AtomicBoolean;
import javax.annotation.Nullable;

public class CloudSyncServiceConnection implements ServiceConnection {

    private static final int REQUIRED_PLUGIN_VERSION = 1;
    private final Context context;

    @Nullable
    private Messenger toPluginMessenger;
    private final UserManager userManager;
    private final Handler mainThreadHandler = new Handler();
    private final AtomicBoolean syncingStarted = new AtomicBoolean(false);
    private final Handler fromPluginHandler = new Handler() {

        @Override
        public void handleMessage(Message message) {
            if (message.what == 100 && (message.obj instanceof Bundle)) {
                Bundle bundle = (Bundle) message.obj;
                if (bundle.containsKey("message") && bundle.containsKey("messageType")) {
                    try {
                        switch (MessageType.valueOf(bundle.getString("messageType"))) {
                            case LogMessagesCompleted:
                                CloudSyncServiceConnection.this.onLogMessagesCompleted(new LogMessagesCompleted(bundle.getBundle("message")));
                                break;
                            case LogMessagesFlushed:
                                CloudSyncServiceConnection.this.onLogMessagesFlushed(new LogMessagesFlushed(bundle.getBundle("message")));
                                break;
                            case LogSyncStatus:
                                CloudSyncServiceConnection.this.onLogSyncStatus(new LogSyncStatus(bundle.getBundle("message")));
                                break;
                        }
                    } catch (Exception e) {
                        Debug.Warning(e);
                    }
                }
            }
        }
    };
    private final Messenger fromPluginMessenger = new Messenger(this.fromPluginHandler);

    public CloudSyncServiceConnection(Context context, UserManager userManager) {
        this.context = context;
        this.userManager = userManager;
    }

    public static boolean checkPluginInstalled(Context context) {
        Intent intent = new Intent();
        intent.setComponent(new ComponentName("com.lumiyaviewer.lumiya.cloud", "com.lumiyaviewer.lumiya.cloud.DriveSyncService"));
        List<ResolveInfo> queryIntentServices = context.getPackageManager().queryIntentServices(intent, 0);
        return queryIntentServices != null && queryIntentServices.size() > 0;
    }

    public void onLogMessagesCompleted(LogMessagesCompleted logMessagesCompleted) {
        Debug.Printf("LumiyaCloud: written messages until %d for agent %s", Long.valueOf(logMessagesCompleted.lastWrittenMessageID), logMessagesCompleted.agentUUID);
        if (this.userManager.getUserID().equals(logMessagesCompleted.agentUUID)) {
            this.userManager.getSyncManager().onMessagesWritten(logMessagesCompleted.lastWrittenMessageID);
        }
    }

    public void onLogMessagesFlushed(LogMessagesFlushed logMessagesFlushed) {
        Debug.Printf("LumiyaCloud: flushed some messages for agent %s", logMessagesFlushed.agentUUID);
        if (this.userManager.getUserID().equals(logMessagesFlushed.agentUUID)) {
            this.userManager.getSyncManager().onMessagesFlushed(logMessagesFlushed.messageIDs);
        }
    }

    public void onLogSyncStatus(LogSyncStatus logSyncStatus) {
        Debug.Printf("LumiyaCloud: got logSyncStatus %s, plugin version %d", logSyncStatus.status, Integer.valueOf(logSyncStatus.pluginVersionCode));
        if (this.toPluginMessenger != null) {
            switch (logSyncStatus.status) {
                case AppVersionRejected:
                    Intent intent = new Intent("android.intent.action.VIEW");
                    intent.setData(Uri.parse(LicenseChecker.APP_STORE_URL));
                    showSyncingError(this.context.getString(R.string.cloud_sync_app_outdated), this.context.getString(R.string.cloud_sync_app_outdated_long), intent);
                    break;
                case GoogleDriveError:
                    Intent intent2 = new Intent("android.intent.action.VIEW");
                    intent2.setData(Uri.parse("https://drive.google.com/"));
                    showSyncingError(this.context.getString(R.string.cloud_sync_drive_error), Strings.isNullOrEmpty(logSyncStatus.errorMessage) ? this.context.getString(R.string.cloud_sync_drive_error_long) : this.context.getString(R.string.cloud_sync_drive_error_message, logSyncStatus.errorMessage), intent2);
                    break;
                case Ready:
                    if (logSyncStatus.pluginVersionCode < 1) {
                        Intent intent3 = new Intent("android.intent.action.VIEW");
                        intent3.setData(Uri.parse(LicenseChecker.CLOUD_PLUGIN_URL));
                        showSyncingError(this.context.getString(R.string.cloud_sync_plugin_outdated), this.context.getString(R.string.cloud_sync_plugin_outdated_long), intent3);
                        break;
                    } else {
                        this.syncingStarted.set(true);
                        this.userManager.getSyncManager().startSyncing(this);
                        break;
                    }
            }
        }
    }

    public void disconnect() {
        this.mainThreadHandler.post(new Runnable() {
            private final /* synthetic */ void $m$0() {
                CloudSyncServiceConnection.this.m393x59c24a30();
            }

            @Override
            public final void run() {
                $m$0();
            }
        });
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_sync_CloudSyncServiceConnection_8286, reason: not valid java name */
    /* synthetic */ void m393x59c24a30() {
        Debug.Printf("LumiyaCloud: disconnecting from sync service", new Object[0]);
        this.context.unbindService(this);
    }

    @Override
    public void onServiceConnected(ComponentName componentName, IBinder iBinder) {
        Debug.Printf("LumiyaCloud: service connected", new Object[0]);
        this.toPluginMessenger = new Messenger(iBinder);
        try {
            sendMessage(MessageType.LogSyncStart, new LogSyncStart(this.context.getPackageManager().getPackageInfo(this.context.getPackageName(), 0).versionCode, this.userManager.getUserID()));
        } catch (PackageManager.NameNotFoundException e) {
            Debug.Warning(e);
        }
    }

    @Override
    public void onServiceDisconnected(ComponentName componentName) {
        Debug.Printf("LumiyaCloud: service disconnected", new Object[0]);
    }

    public boolean sendMessage(MessageType messageType, Bundleable bundleable) {
        if (this.toPluginMessenger != null) {
            return CloudSyncMessenger.sendMessage(this.toPluginMessenger, messageType, bundleable, this.fromPluginMessenger);
        }
        return false;
    }

    public void showSyncingError(String str, String str2, Intent intent) {
        NotificationCompat.Builder builder = new NotificationCompat.Builder(this.context);
        builder.setSmallIcon(R.drawable.ic_cloud_sync_notify).setContentTitle(str).setContentText(str2).setDefaults(0).setOngoing(false).setAutoCancel(true).setContentIntent(PlatformCompat.getActivity(this.context, 0, intent, PendingIntent.FLAG_UPDATE_CURRENT)).setOnlyAlertOnce(true);
        ((NotificationManager) this.context.getSystemService("notification")).notify(R.id.google_drive_problem_notify, builder.build());
    }

    public void stopSyncing() {
        if (!this.syncingStarted.getAndSet(false)) {
            disconnect();
        } else if (this.toPluginMessenger != null) {
            this.userManager.getSyncManager().stopSyncing();
        }
    }
}
