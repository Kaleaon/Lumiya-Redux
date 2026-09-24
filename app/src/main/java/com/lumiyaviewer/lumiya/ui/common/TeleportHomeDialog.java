package com.lumiyaviewer.lumiya.ui.common;

import android.app.Activity;
import android.content.DialogInterface;
import androidx.appcompat.app.AlertDialog;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.utils.UUIDPool;

public class TeleportHomeDialog {
    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_common_TeleportHomeDialog_956, reason: not valid java name */
    static /* synthetic */ void m555lambda$com_lumiyaviewer_lumiya_ui_common_TeleportHomeDialog_956(Activity activity, UserManager userManager, SLAgentCircuit agentCircuit, DialogInterface dialogInterface, int i) {
        new TeleportProgressDialog(activity, userManager, R.string.teleporting_progress_message).show();
        agentCircuit.TeleportToLandmarkAsset(UUIDPool.ZeroUUID);
        dialogInterface.dismiss();
    }

    public static void show(final Activity activity) {
        final SLAgentCircuit activeAgentCircuit;
        final UserManager userManager = ActivityUtils.getUserManager(activity.getIntent());
        if (userManager == null || (activeAgentCircuit = userManager.getActiveAgentCircuit()) == null || !activeAgentCircuit.getModules().rlvController.canTeleportToLocation()) {
            return;
        }
        new AlertDialog.Builder(activity).setMessage(R.string.teleport_home_confirm_title).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
            private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                TeleportHomeDialog.m555lambda$com_lumiyaviewer_lumiya_ui_common_TeleportHomeDialog_956((Activity) activity, (UserManager) userManager, (SLAgentCircuit) activeAgentCircuit, dialogInterface, i);
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
