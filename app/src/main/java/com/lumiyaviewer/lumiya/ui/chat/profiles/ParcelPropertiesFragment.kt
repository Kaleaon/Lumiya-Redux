package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.app.ProgressDialog
import android.content.DialogInterface
import android.content.Intent
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import androidx.appcompat.app.AlertDialog
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.Toast
import com.google.common.base.Strings
import com.google.common.logging.nano.Vr
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.StreamingMediaService
import com.lumiyaviewer.lumiya.databinding.ParcelPropertiesFragmentBinding
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.ChatterNameDisplayer
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID
import java.util.concurrent.ExecutorService
import java.util.concurrent.Executors
import java.util.concurrent.Future
import java.util.concurrent.atomic.AtomicInteger

open class ParcelPropertiesFragment : FragmentWithTitle() {
    public static String PARCEL_DATA_KEY = "parcelData"

    private ParcelPropertiesFragmentBinding binding

    private ParcelData parcelData = null
    private UserManager userManager = null
    private ChatterNameDisplayer ownerNameDisplayer = ChatterNameDisplayer()
    private ExecutorService homeLocationExecutor = Executors.newSingleThreadExecutor(runnable -> {
        Thread thread = Thread(runnable, "SetHomeLocation")
        thread.setDaemon(true)
        return thread
    })
    private Handler mainHandler = Handler(Looper.getMainLooper())
    private Future<?> setHomeFuture
    private ProgressDialog setHomeProgressDialog
    private AtomicInteger setHomeGeneration = AtomicInteger()
    private SubscriptionData<SubscriptionSingleKey, Boolean> isPlayingMedia = SubscriptionData<>(UIThreadExecutor.getInstance(), Subscription.OnData() {
            ParcelPropertiesFragment.this.onIsPlayingMedia((Boolean) obj)
        }

        override fun onData(obj: Any) {
                DetailsActivity.showEmbeddedDetails(getActivity(), UserProfileFragment.class, UserProfileFragment.makeSelection(this.ownerNameDisplayer.getChatterID()))
            }
        }
    }

    open fun onParcelMediaPlay() {
        if (this.parcelData == null || !(!Strings.isNullOrEmpty(this.parcelData.getMediaURL())) || this.userManager == null) {
            return
        }
        Intent intent = Intent(getContext(), (Class<?>) StreamingMediaService.class)
        intent.setAction("com.lumiyaviewer.lumiya.ACTION_PLAY_MEDIA")
        ActivityUtils.setActiveAgentID(intent, this.userManager.getUserID())
        intent.putExtra(PARCEL_DATA_KEY, this.parcelData)
        intent.putExtra(StreamingMediaService.MEDIA_URL_KEY, this.parcelData.getMediaURL())
        intent.putExtra(StreamingMediaService.LOCATION_NAME_KEY, this.parcelData.getName())
        StreamingMediaService.startServiceCompat(getContext(), intent)
    }

    open fun onParcelMediaStop() {
        Intent intent = Intent(getContext(), (Class<?>) StreamingMediaService.class)
        intent.setAction("com.lumiyaviewer.lumiya.ACTION_STOP_MEDIA")
        StreamingMediaService.startServiceCompat(getContext(), intent)
    }

    open fun onSetHomeButton() {
        if (this.agentCircuit.getData() != null) {
            AlertDialog.Builder(getContext()).setMessage(R.string.set_home_confirm_title).setCancelable(true).setPositiveButton("Yes", DialogInterface.OnClickListener() {
                    ParcelPropertiesFragment.this.m515x74bdcccf(dialogInterface, i)
                }

                override fun onClick(dialogInterface: DialogInterface, i: Int) {