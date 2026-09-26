package com.lumiyaviewer.lumiya.ui.settings

import android.annotation.SuppressLint
import android.app.AlertDialog
import android.app.ProgressDialog
import android.content.DialogInterface
import android.content.Intent
import android.content.SharedPreferences
import android.net.Uri
import android.os.AsyncTask
import android.os.Bundle
import android.os.StatFs
import androidx.fragment.app.FragmentActivity
import androidx.preference.Preference
import androidx.preference.PreferenceFragmentCompat
import androidx.preference.PreferenceScreen
import androidx.recyclerview.widget.RecyclerView
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
import com.lumiyaviewer.lumiya.ui.settings.SettingsFragment
import com.lumiyaviewer.lumiya.utils.FileUtils
import java.io.File
import java.util.Iterator

open class SettingsFragment : PreferenceFragmentCompat(), FragmentHasTitle {
    private static String PREF_RESOURCE_KEY = "prefResourceId"
    private RingtonePreference requestedRingtonePreference = null

    internal open class ClearCacheTask : AsyncTask<Void, Void, Void>() {
        private ImmutableList<File> cacheDirs
        private ProgressDialog progressDialog

        private constructor() {
            this.progressDialog = null
        }

            this()
        }

        override fun doInBackground(vararg voidArr: Unit) {
            internal fun if(null: this.cacheDirs !=):  {
                Iterator<File> it = this.cacheDirs.iterator()
                while (it.hasNext()) {
                    FileUtils.clearFolder(it.next())
                }
            }
            return null
        }


        override fun onPostExecute(r2: Unit) {
            internal fun if(null: this.progressDialog !=):  {
                this.progressDialog.dismiss()
            }
            if (GlobalOptions.getInstance().isCacheDirUsed()) {
                SettingsFragment.this.askForRestart()
            }
        }

        override protected fun onPreExecute() {
            this.cacheDirs = GlobalOptions.getInstance().getAvailableCacheDirs()
            this.progressDialog = ProgressDialog.show(SettingsFragment.this.getContext(), null, SettingsFragment.this.getString(R.string.clearing_cache), true, true, new DialogInterface.OnCancelListener() {
                    ClearCacheTask.this.m870x7613bcc1(dialogInterface)
                }

                override fun onCancel(dialogInterface: DialogInterface) {