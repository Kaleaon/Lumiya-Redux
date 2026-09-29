package com.lumiyaviewer.lumiya.ui.settings

import android.annotation.SuppressLint
import android.app.AlertDialog
import android.app.ProgressDialog
import android.content.DialogInterface
import android.content.Intent
import android.content.SharedPreferences
import android.net.Uri
import android.os.AsyncTask
import android.os.Build
import android.os.Bundle
import android.os.StatFs
import androidx.fragment.app.FragmentActivity
import androidx.preference.Preference
import androidx.preference.PreferenceFragmentCompat
import androidx.preference.PreferenceScreen
import android.widget.ArrayAdapter
import com.google.common.base.Objects
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.FragmentHasTitle
import com.lumiyaviewer.lumiya.ui.media.NotificationSounds
import com.lumiyaviewer.lumiya.ui.notify.NotificationChannels
import com.lumiyaviewer.lumiya.utils.FileUtils
import java.io.File

open class SettingsFragment : PreferenceFragmentCompat(), FragmentHasTitle {
    private var requestedRingtonePreference: RingtonePreference? = null

    internal inner class ClearCacheTask : AsyncTask<Void, Void, Void>() {
        private var cacheDirs: ImmutableList<File>? = null
        private var progressDialog: ProgressDialog? = null

        override fun doInBackground(vararg voidArr: Void?): Void? {
            val dirs = this.cacheDirs
            if (dirs != null) {
                for (dir in dirs) {
                    FileUtils.clearFolder(dir)
                }
            }
            return null
        }

        private fun onCancelClearCache() {
            cancel(false)
        }

        override fun onPostExecute(r2: Void?) {
            this.progressDialog?.dismiss()
            if (GlobalOptions.getInstance().isCacheDirUsed()) {
                this@SettingsFragment.askForRestart()
            }
        }

        override fun onPreExecute() {
            this.cacheDirs = GlobalOptions.getInstance().getAvailableCacheDirs()
            this.progressDialog = ProgressDialog.show(
                this@SettingsFragment.context, null, this@SettingsFragment.getString(R.string.clearing_cache), true, true
            ) { onCancelClearCache() }
        }
    }

    private fun askForRestart() {
        val builder = AlertDialog.Builder(context)
        builder.setMessage(R.string.restart_after_changing_cache_location)
        builder.setCancelable(true)
        builder.setNegativeButton("No") { dialogInterface, _ -> dialogInterface.cancel() }
        builder.setPositiveButton("Yes") { dialogInterface, _ ->
            dialogInterface.dismiss()
            LumiyaApp.restartApp()
        }
        builder.create().show()
    }

    @SuppressLint("DefaultLocale")
    private fun handleCacheLocationPreference(cacheLocationPreference: CacheLocationPreference) {
        var selectedIndex = -1
        val availableCacheDirs = GlobalOptions.getInstance().getAvailableCacheDirs()
        val baseCacheDir = GlobalOptions.getInstance().getBaseCacheDir()
        val strArr = Array(availableCacheDirs.size) { "" }
        for (i in 0 until availableCacheDirs.size) {
            if (Objects.equal(availableCacheDirs[i], baseCacheDir)) {
                selectedIndex = i
            }
            val statFs = StatFs(availableCacheDirs[i].absolutePath)
            val freeBytes = if (Build.VERSION.SDK_INT >= 18) {
                statFs.blockSizeLong * statFs.availableBlocksLong
            } else {
                @Suppress("DEPRECATION")
                (statFs.availableBlocks * statFs.blockSize).toLong()
            }
            strArr[i] = String.format(
                "%s (%.1f Gb free)",
                CacheLocationPreference.makeDisplayableCacheLocation(availableCacheDirs[i].absolutePath),
                freeBytes / 1.0737418E9f
            )
        }
        val arrayAdapter = ArrayAdapter(requireContext(), android.R.layout.select_dialog_singlechoice, strArr)
        val builder = AlertDialog.Builder(context)
        builder.setTitle(R.string.select_cache_location)
        builder.setSingleChoiceItems(arrayAdapter, selectedIndex) { dialogInterface, i4 ->
            val newDir = File(availableCacheDirs[i4].toString())
            val edit = cacheLocationPreference.sharedPreferences!!.edit()
            edit.putString(cacheLocationPreference.key, availableCacheDirs[i4].toString())
            edit.commit()
            dialogInterface.dismiss()
            updatePreferencesDisplay()
            if (!Objects.equal(baseCacheDir, newDir) && GlobalOptions.getInstance().isCacheDirUsed()) {
                askForRestart()
            }
        }
        builder.setCancelable(true)
        builder.create().show()
    }

    private fun handleClearCachePreference() {
        val builder = AlertDialog.Builder(context)
        builder.setMessage(R.string.clear_cache_dialog_message)
        builder.setCancelable(true)
        builder.setNegativeButton("No") { dialogInterface, _ -> dialogInterface.cancel() }
        builder.setPositiveButton("Yes") { dialogInterface, _ ->
            dialogInterface.dismiss()
            ClearCacheTask().execute()
        }
        builder.create().show()
    }

    private fun handleRingtonePreference(ringtonePreference: RingtonePreference) {
        val intent = Intent("android.intent.action.RINGTONE_PICKER")
        intent.putExtra("android.intent.extra.ringtone.TYPE", 2)
        intent.putExtra("android.intent.extra.ringtone.SHOW_DEFAULT", true)
        intent.putExtra("android.intent.extra.ringtone.SHOW_SILENT", true)
        intent.putExtra("android.intent.extra.ringtone.DEFAULT_URI", NotificationSounds.getResourceUri(ringtonePreference.getDefaultRawResource()))
        val string = ringtonePreference.sharedPreferences?.getString(ringtonePreference.key, null)
        if (string == null) {
            intent.putExtra("android.intent.extra.ringtone.EXISTING_URI", NotificationSounds.getResourceUri(ringtonePreference.getDefaultRawResource()))
        } else if (string.isEmpty()) {
            intent.putExtra("android.intent.extra.ringtone.EXISTING_URI", null as Uri?)
        } else {
            intent.putExtra("android.intent.extra.ringtone.EXISTING_URI", Uri.parse(string))
        }
        this.requestedRingtonePreference = ringtonePreference
        startActivityForResult(intent, 2)
    }

    private fun updatePreferencesDisplay() {
        val listView = listView ?: return
        val adapter = listView.adapter ?: return
        adapter.notifyDataSetChanged()
    }

    override fun getSubTitle(): String? {
        return null
    }

    override fun getTitle(): String? {
        val preferenceScreen = preferenceScreen ?: return null
        return preferenceScreen.title?.toString()
    }

    @SuppressLint("CommitPrefEdits")
    override fun onActivityResult(requestCode: Int, resultCode: Int, intent: Intent?) {
        if (requestCode != 2 || resultCode != -1 || intent == null || this.requestedRingtonePreference == null) {
            if (requestCode == 11) {
                updatePreferencesDisplay()
                return
            } else {
                super.onActivityResult(requestCode, resultCode, intent)
                return
            }
        }
        val uri = intent.getParcelableExtra<Uri>("android.intent.extra.ringtone.PICKED_URI")
        val uriString = uri?.toString() ?: ""
        val edit = this.requestedRingtonePreference!!.sharedPreferences!!.edit()
        edit.putString(this.requestedRingtonePreference!!.key, uriString)
        edit.commit()
        updatePreferencesDisplay()
    }

    override fun onCreatePreferences(bundle: Bundle?, str: String?) {
        addPreferencesFromResource(requireArguments().getInt(PREF_RESOURCE_KEY))
        val activity = activity
        if (activity is DetailsActivity) {
            activity.onFragmentTitleUpdated()
        }
        val soundOnNotify = findPreference<Preference>("soundOnNotify")
        if (soundOnNotify != null) {
            soundOnNotify.isVisible = !NotificationChannels.getInstance().areNotificationsSystemControlled()
        }
    }

    override fun onDetach() {
        super.onDetach()
        val activity = activity
        if (activity is DetailsActivity) {
            activity.onFragmentTitleUpdated()
        }
    }

    override fun onPreferenceTreeClick(preference: Preference): Boolean {
        if (preference is PreferenceSubPage) {
            val notificationType = preference.getNotificationType()
            if (notificationType != null) {
                val channelByType = NotificationChannels.getInstance().getChannelByType(notificationType)
                if (channelByType != null && NotificationChannels.getInstance().showSystemNotificationSettings(requireContext(), this, channelByType)) {
                    return true
                }
            }
            DetailsActivity.showEmbeddedDetails(requireActivity(), SettingsSubPageFragment::class.java, SettingsFragment.makeSelection(preference.getPageResource()))
            return true
        }
        if (preference is RingtonePreference) {
            handleRingtonePreference(preference)
            return true
        }
        if (preference is CacheLocationPreference) {
            handleCacheLocationPreference(preference)
            return true
        }
        if (preference !is ClearCachePreference) {
            return super.onPreferenceTreeClick(preference)
        }
        handleClearCachePreference()
        return true
    }

    override fun onStart() {
        super.onStart()
        val activity = activity
        if (activity is DetailsActivity) {
            activity.onFragmentTitleUpdated()
        }
    }

    companion object {
        private const val PREF_RESOURCE_KEY = "prefResourceId"

        @JvmStatic
        fun makeSelection(i: Int): Bundle {
            val bundle = Bundle()
            bundle.putInt(PREF_RESOURCE_KEY, i)
            return bundle
        }
    }
}
