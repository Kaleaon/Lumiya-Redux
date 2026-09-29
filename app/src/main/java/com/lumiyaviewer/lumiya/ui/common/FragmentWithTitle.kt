package com.lumiyaviewer.lumiya.ui.common

import android.os.Bundle
import androidx.fragment.app.FragmentActivity
import com.lumiyaviewer.lumiya.Debug

open class FragmentWithTitle : StateAwareFragment(), FragmentHasTitle {
    companion object {
        private const val FRAGMENT_SUBTITLE_TAG = "FragmentWithTitle:fragmentSubTitle"
        private const val FRAGMENT_TITLE_TAG = "FragmentWithTitle:fragmentTitle"
    }

    private var fragmentTitle: String? = null

    private var fragmentSubTitle: String? = null

    override fun getSubTitle(): String? {
        return this.fragmentSubTitle
    }

    override fun getTitle(): String? {
        return this.fragmentTitle
    }

    override fun onCreate(bundle: Bundle?) {
        super.onCreate(bundle)
        if (bundle != null) {
            this.fragmentTitle = bundle.getString(FRAGMENT_TITLE_TAG)
            this.fragmentSubTitle = bundle.getString(FRAGMENT_SUBTITLE_TAG)
        }
    }

    override fun onDetach() {
        super.onDetach()
        val activity: FragmentActivity? = activity
        if (activity is DetailsActivity) {
            activity.onFragmentTitleUpdated()
        }
    }

    override fun onHiddenChanged(z: Boolean) {
        super.onHiddenChanged(z)
        val activity: FragmentActivity? = activity
        if (activity is DetailsActivity) {
            activity.onFragmentTitleUpdated()
        }
    }

    override fun onSaveInstanceState(bundle: Bundle) {
        super.onSaveInstanceState(bundle)
        bundle.putString(FRAGMENT_TITLE_TAG, this.fragmentTitle)
        bundle.putString(FRAGMENT_SUBTITLE_TAG, this.fragmentSubTitle)
    }

    override fun onStart() {
        super.onStart()
        val activity: FragmentActivity? = activity
        if (activity is DetailsActivity) {
            activity.onFragmentTitleUpdated()
        }
    }

    open fun setTitle(fragmentTitle: String?, fragmentSubTitle: String?) {
        this.fragmentTitle = fragmentTitle
        this.fragmentSubTitle = fragmentSubTitle
        val activity: FragmentActivity? = activity
        Debug.Printf("updateTitle: title '%s', subTitle '%s', activity %s, fragment %s", fragmentTitle, fragmentSubTitle, activity, this)
        if (activity is DetailsActivity) {
            activity.onFragmentTitleUpdated()
        }
    }
}
