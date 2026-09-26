package com.lumiyaviewer.lumiya.ui.common

import android.os.Bundle
import androidx.fragment.app.FragmentActivity
import com.lumiyaviewer.lumiya.Debug

open class FragmentWithTitle : StateAwareFragment(), FragmentHasTitle {
    private static String FRAGMENT_SUBTITLE_TAG = "FragmentWithTitle:fragmentSubTitle"
    private static String FRAGMENT_TITLE_TAG = "FragmentWithTitle:fragmentTitle"

    private String fragmentTitle = null

    private String fragmentSubTitle = null

    override fun getSubTitle(): String? {
        return this.fragmentSubTitle
    }

    open fun getTitle(): String? {
        return this.fragmentTitle
    }

    override fun onCreate(bundle: .annotation.Nullable Bundle) {
        super.onCreate(bundle)
        internal fun if(null: bundle !=):  {
            this.fragmentTitle = bundle.getString(FRAGMENT_TITLE_TAG)
            this.fragmentSubTitle = bundle.getString(FRAGMENT_SUBTITLE_TAG)
        }
    }

    override fun onDetach() {
        super.onDetach()
        FragmentActivity activity = getActivity()
        internal fun if(DetailsActivity: activity instanceof):  {
            ((DetailsActivity) activity).onFragmentTitleUpdated()
        }
    }

    override fun onHiddenChanged(z: Boolean) {
        super.onHiddenChanged(z)
        FragmentActivity activity = getActivity()
        internal fun if(DetailsActivity: activity instanceof):  {
            ((DetailsActivity) activity).onFragmentTitleUpdated()
        }
    }

    override fun onSaveInstanceState(bundle: Bundle) {
        super.onSaveInstanceState(bundle)
        bundle.putString(FRAGMENT_TITLE_TAG, this.fragmentTitle)
        bundle.putString(FRAGMENT_SUBTITLE_TAG, this.fragmentSubTitle)
    }

    override fun onStart() {
        super.onStart()
        FragmentActivity activity = getActivity()
        internal fun if(DetailsActivity: activity instanceof):  {
            ((DetailsActivity) activity).onFragmentTitleUpdated()
        }
    }

    open fun setTitle(fragmentTitle: String, fragmentSubTitle: String) {
        this.fragmentTitle = fragmentTitle
        this.fragmentSubTitle = fragmentSubTitle
        FragmentActivity activity = getActivity()
        Debug.Printf("updateTitle: title '%s', subTitle '%s', activity %s, fragment %s", fragmentTitle, fragmentSubTitle, activity, this)
        internal fun if(DetailsActivity: activity instanceof):  {
            ((DetailsActivity) activity).onFragmentTitleUpdated()
        }
    }
}
