package com.lumiyaviewer.lumiya.ui.settings

import android.content.Context
import android.content.Intent
import android.net.Uri
import android.util.AttributeSet
import androidx.appcompat.app.AlertDialog
import androidx.preference.CheckBoxPreference
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.licensing.LicenseChecker
import com.lumiyaviewer.lumiya.sync.CloudSyncServiceConnection

class GoogleDriveSyncPreference : CheckBoxPreference {
    constructor(context: Context) : super(context)

    constructor(context: Context, attrs: AttributeSet?) : super(context, attrs)

    constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int) : super(context, attrs, defStyleAttr)

    constructor(context: Context, attrs: AttributeSet?, defStyleAttr: Int, defStyleRes: Int) :
        super(context, attrs, defStyleAttr, defStyleRes)

    override fun onClick() {
        super.onClick()
        if (!isChecked || CloudSyncServiceConnection.checkPluginInstalled(context)) {
            return
        }
        AlertDialog.Builder(context)
            .setTitle(R.string.enable_google_drive)
            .setMessage(context.getString(R.string.enable_google_drive_message, LicenseChecker.APP_STORE_NAME))
            .setPositiveButton("Yes") { dialog, _ ->
                dialog.dismiss()
                val intent = Intent(Intent.ACTION_VIEW)
                intent.data = Uri.parse(LicenseChecker.CLOUD_PLUGIN_URL)
                context.startActivity(intent)
            }
            .setNegativeButton("No") { dialog, _ -> dialog.cancel() }
            .setCancelable(true)
            .create()
            .show()
    }
}
