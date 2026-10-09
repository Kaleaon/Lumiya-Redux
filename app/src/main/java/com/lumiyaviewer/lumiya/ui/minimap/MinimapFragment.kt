package com.lumiyaviewer.lumiya.ui.minimap

import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.fragment.app.Fragment
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.modules.SLMinimap
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import java.util.UUID

open class MinimapFragment : Fragment(), MinimapView.OnUserClickListener {

    companion object {
        const val MAP_LOAD_TIMEOUT_MS: Long = 10000L

        @JvmStatic
        fun newInstance(uuid: UUID): Fragment {
            val minimapFragment = MinimapFragment()
            minimapFragment.arguments = ActivityUtils.makeFragmentArguments(uuid, null)
            return minimapFragment
        }
    }

    private val timeoutHandler = Handler(Looper.getMainLooper())
    private var isMapLoaded = false

    private val timeoutRunnable = Runnable {
        if (!isMapLoaded) {
            val view = view
            if (view != null) {
                val skeletonGrid = view.findViewById<SkeletonTileGridView>(R.id.skeletonTileGridView)
                val emptyState = view.findViewById<EmptyStateView>(R.id.emptyStateView)

                skeletonGrid?.visibility = View.GONE
                emptyState?.visibility = View.VISIBLE
            }
        }
    }

    private val minimapBitmapSubscription = SubscriptionData<SubscriptionSingleKey, SLMinimap.MinimapBitmap>(
        UIThreadExecutor.getInstance(),
        Subscription.OnData { obj ->
            if (obj is SLMinimap.MinimapBitmap) {
                onMinimapBitmap(obj)
            }
        }
    )

    private val userLocationsSubscription = SubscriptionData<SubscriptionSingleKey, SLMinimap.UserLocations>(
        UIThreadExecutor.getInstance(),
        Subscription.OnData { obj ->
            if (obj is SLMinimap.UserLocations) {
                onUserLocations(obj)
            }
        }
    )

    private val mapLoadingProgressSubscription = SubscriptionData<SubscriptionSingleKey, SLMinimap.MapLoadingProgress>(
        UIThreadExecutor.getInstance(),
        Subscription.OnData { obj ->
            if (obj is SLMinimap.MapLoadingProgress) {
                onMapLoadingProgress(obj)
            }
        }
    )

    private fun onMinimapBitmap(minimapBitmap: SLMinimap.MinimapBitmap) {
        val view = view
        if (view != null) {
            view.findViewById<MinimapView>(R.id.minimapView)?.setMinimapBitmap(minimapBitmap)
        }
    }

    private fun onUserLocations(userLocations: SLMinimap.UserLocations) {
        val view = view
        if (view != null) {
            view.findViewById<MinimapView>(R.id.minimapView)?.setUserLocations(userLocations)
        }
    }

    private fun onMapLoadingProgress(progress: SLMinimap.MapLoadingProgress) {
        val view = view ?: return
        val skeletonGrid = view.findViewById<SkeletonTileGridView>(R.id.skeletonTileGridView)
        val emptyState = view.findViewById<EmptyStateView>(R.id.emptyStateView)

        skeletonGrid?.updateProgress(progress)

        if (progress.isComplete) {
            isMapLoaded = true
            timeoutHandler.removeCallbacks(timeoutRunnable)
            emptyState?.visibility = View.GONE
        }
    }

    override fun onCreateView(
        inflater: LayoutInflater,
        container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        val view = inflater.inflate(R.layout.minimap_fragment, container, false)
        val minimapView = view.findViewById<MinimapView>(R.id.minimapView)
        minimapView?.setOnUserClickListener(this)

        val emptyStateView = view.findViewById<EmptyStateView>(R.id.emptyStateView)
        emptyStateView?.setOnRetryClickListener {
            retryLoading()
        }

        return view
    }

    private fun retryLoading() {
        val view = view ?: return
        val skeletonGrid = view.findViewById<SkeletonTileGridView>(R.id.skeletonTileGridView)
        val emptyState = view.findViewById<EmptyStateView>(R.id.emptyStateView)

        emptyState?.visibility = View.GONE
        skeletonGrid?.resetGrid()
        skeletonGrid?.visibility = View.VISIBLE

        isMapLoaded = false
        timeoutHandler.removeCallbacks(timeoutRunnable)
        timeoutHandler.postDelayed(timeoutRunnable, MAP_LOAD_TIMEOUT_MS)

        val userManager = ActivityUtils.getUserManager(arguments)
        if (userManager != null) {
            mapLoadingProgressSubscription.subscribe(userManager.getMapLoadingProgressPool(), SubscriptionSingleKey.Value)
            minimapBitmapSubscription.subscribe(userManager.getMinimapBitmapPool(), SubscriptionSingleKey.Value)
        }
    }

    override fun onStart() {
        super.onStart()
        isMapLoaded = false

        val view = view
        if (view != null) {
            val skeletonGrid = view.findViewById<SkeletonTileGridView>(R.id.skeletonTileGridView)
            val emptyState = view.findViewById<EmptyStateView>(R.id.emptyStateView)
            emptyState?.visibility = View.GONE
            skeletonGrid?.resetGrid()
            skeletonGrid?.visibility = View.VISIBLE
        }

        val userManager = ActivityUtils.getUserManager(arguments)
        if (userManager != null) {
            minimapBitmapSubscription.subscribe(userManager.getMinimapBitmapPool(), SubscriptionSingleKey.Value)
            userLocationsSubscription.subscribe(userManager.getUserLocationsPool(), SubscriptionSingleKey.Value)
            mapLoadingProgressSubscription.subscribe(userManager.getMapLoadingProgressPool(), SubscriptionSingleKey.Value)
        } else {
            minimapBitmapSubscription.unsubscribe()
            userLocationsSubscription.unsubscribe()
            mapLoadingProgressSubscription.unsubscribe()
        }

        timeoutHandler.removeCallbacks(timeoutRunnable)
        timeoutHandler.postDelayed(timeoutRunnable, MAP_LOAD_TIMEOUT_MS)
    }

    override fun onStop() {
        timeoutHandler.removeCallbacks(timeoutRunnable)
        minimapBitmapSubscription.unsubscribe()
        userLocationsSubscription.unsubscribe()
        mapLoadingProgressSubscription.unsubscribe()
        super.onStop()
    }

    override fun onUserClick(uuid: UUID) {
        val fragmentManager = parentFragmentManager
        val detailsFragment = fragmentManager.findFragmentById(R.id.details)
        if (detailsFragment is NearbyPeopleMinimapFragment) {
            detailsFragment.setSelectedUser(uuid)
        }
        val view = view
        if (view != null) {
            view.findViewById<MinimapView>(R.id.minimapView)?.setSelectedUser(uuid)
        }
    }
}
