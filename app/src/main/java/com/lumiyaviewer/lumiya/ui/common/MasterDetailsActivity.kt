package com.lumiyaviewer.lumiya.ui.common

import com.lumiyaviewer.lumiya.LumiyaApp

import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R

abstract class MasterDetailsActivity : DetailsActivity() {
    companion object {
        const val FROM_SAME_ACTIVITY = "fromSameActivity"
        private const val IMPLICIT_DETAILS_TAG = "MasterDetailsActivityIsImplicitDetails"
        const val INTENT_SELECTION_KEY = "selection"
        const val WEAK_SELECTION_KEY = "weakSelection"
    }

    private var isSplitScreen = false

    protected abstract fun getDetailsFragmentFactory(): FragmentActivityFactory

    protected open fun getNewDetailsFragmentArguments(bundle: Bundle?, bundle2: Bundle?): Bundle? {
        return bundle2
    }

    protected open fun isAlwaysImplicitFragment(cls: Class<out Fragment>): Boolean {
        return false
    }

    override fun isRootDetailsFragment(cls: Class<out Fragment>): Boolean {
        return getDetailsFragmentFactory().getFragmentClass().isAssignableFrom(cls)
    }

    fun isSplitScreen(): Boolean {
        return this.isSplitScreen
    }

    override fun onCreate(bundle: Bundle?) {
        super.onCreate(bundle)
        this.isSplitScreen = LumiyaApp.isSplitScreenNeeded(this)
        if (this.isSplitScreen) {
            setContentView(R.layout.split_two_panels)
        } else {
            setContentView(R.layout.split_one_panel)
        }
        Debug.Printf(
            "MasterDetailsActivity: hasSelectorView = %b, sel fragment %b, hasDetailsView = %b, details fragment %b",
            findViewById<android.view.View>(R.id.selector) != null,
            supportFragmentManager.findFragmentById(R.id.selector) != null,
            findViewById<android.view.View>(R.id.details) != null,
            supportFragmentManager.findFragmentById(R.id.details) != null
        )
        Debug.Printf("MasterDetailsActivity: intent = %s", intent)
        val beginTransaction = supportFragmentManager.beginTransaction()
        val fragmentById = supportFragmentManager.findFragmentById(R.id.selector)
        val fragmentById2 = supportFragmentManager.findFragmentById(R.id.details)

        var hasExplicitDetails: Boolean
        val arguments3 = fragmentById2?.arguments
        if (fragmentById2 == null || arguments3 == null) {
            hasExplicitDetails = false
        } else {
            Debug.Printf("MasterDetailsActivity: implicit details tag = %b", arguments3.getBoolean(IMPLICIT_DETAILS_TAG, false))
            hasExplicitDetails = !arguments3.getBoolean(IMPLICIT_DETAILS_TAG, false)
        }
        Debug.Printf("MasterDetailsActivity: hasExplicitDetails = %b", hasExplicitDetails)

        var strongSelection: Bundle? = null
        if (!hasExplicitDetails && bundle == null) {
            val extra = intent.getBundleExtra(INTENT_SELECTION_KEY)
            if (extra != null) {
                strongSelection = extra
                hasExplicitDetails = true
            }
        }

        var hasSelection: Boolean
        var selectionArgs: Bundle?
        if (hasExplicitDetails || bundle != null || !this.isSplitScreen) {
            hasSelection = hasExplicitDetails
            selectionArgs = strongSelection
        } else {
            val weakExtra = intent.getBundleExtra(WEAK_SELECTION_KEY)
            if (weakExtra == null) {
                hasSelection = hasExplicitDetails
                selectionArgs = strongSelection
            } else {
                selectionArgs = weakExtra
                hasSelection = true
            }
        }

        val selectorVisible = if (!this.isSplitScreen) !hasSelection else true
        if (selectorVisible) {
            Debug.Printf("MasterDetailsActivity: existing fragment %s", fragmentById?.toString() ?: "null")
            if (fragmentById != null) {
                Debug.Printf("MasterDetailsActivity: existing fragment is %s", if (fragmentById.isVisible) "visible" else "not visible")
                if (fragmentById.isDetached) {
                    beginTransaction.attach(fragmentById)
                } else if (fragmentById.isHidden) {
                    beginTransaction.show(fragmentById)
                }
            } else {
                beginTransaction.add(R.id.selector, onCreateMasterFragment(intent, selectionArgs))
            }
        } else if (fragmentById != null && !fragmentById.isDetached) {
            beginTransaction.detach(fragmentById)
        }

        val detailsVisible = if (!this.isSplitScreen) hasSelection else true
        Debug.Printf(
            "MasterDetailsActivity: selectorVisible %b, detailsVisible %b, hasExplicitDetails %b",
            selectorVisible, detailsVisible, hasSelection
        )
        if (detailsVisible) {
            if (fragmentById2 == null) {
                Debug.Printf("MasterDetailsActivity: creating new details fragment")
                // 3.4.2 guards the whole creation: a details fragment that cannot
                // be created is logged and the activity continues without it.
                try {
                    val masterArguments = fragmentById?.arguments
                    val newDetailsFragmentArguments = getNewDetailsFragmentArguments(masterArguments, selectionArgs)
                    val fragment = getDetailsFragmentFactory().getFragmentClass().getDeclaredConstructor().newInstance()
                    if (fragment is ReloadableFragment) {
                        fragment.arguments = Bundle()
                        fragment.setFragmentArgs(intent, newDetailsFragmentArguments)
                    } else {
                        fragment.arguments = newDetailsFragmentArguments
                    }
                    if (!hasSelection) {
                        val detailsArguments = fragment.arguments
                        if (detailsArguments != null) {
                            detailsArguments.putBoolean(IMPLICIT_DETAILS_TAG, true)
                        }
                    }
                    Debug.Printf("MasterDetailsActivity: adding new details fragment: %s", fragment)
                    beginTransaction.add(R.id.details, fragment, DEFAULT_DETAILS_FRAGMENT_TAG)
                } catch (e: Exception) {
                    Debug.Warning(e)
                }
            } else {
                Debug.Printf("MasterDetailsActivity: not creating new details fragment. existing is detached: %b (%s)", fragmentById2.isDetached, fragmentById2)
                if (fragmentById2.isDetached) {
                    beginTransaction.attach(fragmentById2)
                }
            }
        } else if (fragmentById2 != null && !fragmentById2.isDetached) {
            beginTransaction.remove(fragmentById2)
        }

        if (beginTransaction.isEmpty) {
            return
        }
        beginTransaction.commit()
    }

    protected abstract fun onCreateMasterFragment(intent: Intent, bundle: Bundle?): Fragment

    override fun onDetailsStackEmpty(): Boolean {
        if (this.isSplitScreen) {
            return true
        }
        val supportFragmentManager = supportFragmentManager
        val findFragmentById = supportFragmentManager.findFragmentById(R.id.details)
        if (findFragmentById == null || findFragmentById.isDetached) {
            return true
        }
        Debug.Printf("MasterDetailsFragment: onDetailsStackEmpty has detailsFragment (%s), detached: %b", findFragmentById, findFragmentById.isDetached)
        val beginTransaction = supportFragmentManager.beginTransaction()
        beginTransaction.setCustomAnimations(android.R.anim.fade_in, R.anim.slide_to_right, 0, android.R.anim.fade_out)
        beginTransaction.remove(findFragmentById)
        val fragmentById = supportFragmentManager.findFragmentById(R.id.selector)
        Debug.Printf(
            "MasterDetailsFragment: existing selector %b, detached %b, hidden %b",
            fragmentById != null,
            fragmentById?.isDetached ?: false,
            fragmentById?.isHidden ?: false
        )
        if (fragmentById == null) {
            beginTransaction.add(R.id.selector, onCreateMasterFragment(intent, null))
        } else {
            if (fragmentById.isDetached) {
                beginTransaction.attach(fragmentById)
            }
            if (fragmentById.isHidden) {
                beginTransaction.show(fragmentById)
            }
        }
        beginTransaction.commit()
        updateTitle()
        return false
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        Debug.Printf("MasterDetailsActivity: onNewIntent, intent = %s", intent)
        val bundle = if (intent.hasExtra(INTENT_SELECTION_KEY)) intent.getBundleExtra(INTENT_SELECTION_KEY) else null
        val bundle2 = if (intent.hasExtra(WEAK_SELECTION_KEY)) intent.getBundleExtra(WEAK_SELECTION_KEY) else null
        if (bundle != null) {
            DetailsActivity.showDetails(this, getDetailsFragmentFactory(), bundle)
            return
        }
        if (this.isSplitScreen && bundle2 != null) {
            DetailsActivity.showDetails(this, getDetailsFragmentFactory(), bundle2)
            return
        }
        if (this.isSplitScreen) {
            return
        }
        if (supportFragmentManager.findFragmentById(R.id.details) == null && bundle2 != null && intent.getBooleanExtra(FROM_SAME_ACTIVITY, false)) {
            DetailsActivity.showDetails(this, getDetailsFragmentFactory(), bundle2)
        } else {
            clearDetailsStack()
            onDetailsStackEmpty()
        }
    }

    override fun onSaveInstanceState(bundle: Bundle) {
        super.onSaveInstanceState(bundle)
    }

    override fun replaceDetailsFragment(fragmentManager: FragmentManager, fragment: Fragment) {
        val beginTransaction = fragmentManager.beginTransaction()
        beginTransaction.setCustomAnimations(R.anim.slide_from_right, android.R.anim.fade_out, 0, android.R.anim.fade_out)
        if (!this.isSplitScreen) {
            val findFragmentById = fragmentManager.findFragmentById(R.id.selector)
            if (findFragmentById != null && findFragmentById.isVisible) {
                beginTransaction.hide(findFragmentById)
            }
        }
        beginTransaction.replace(R.id.details, fragment)
        beginTransaction.commit()
        updateTitle()
    }

    override fun showDetailsFragment(cls: Class<out Fragment>, intent: Intent, bundle: Bundle): Fragment? {
        val showDetailsFragment = super.showDetailsFragment(cls, intent, bundle)
        val arguments = showDetailsFragment?.arguments
        if (showDetailsFragment != null && arguments != null) {
            arguments.putBoolean(IMPLICIT_DETAILS_TAG, isAlwaysImplicitFragment(cls))
        }
        return showDetailsFragment
    }

    override fun updateTitleNoDetails() {
        var handled = false
        val findFragmentById = supportFragmentManager.findFragmentById(R.id.selector)
        if (findFragmentById != null && findFragmentById is FragmentHasTitle && findFragmentById.isAdded && !findFragmentById.isDetached) {
            val title = findFragmentById.getTitle()
            val subTitle = findFragmentById.getSubTitle()
            if (title != null) {
                setActivityTitle(title, subTitle)
                handled = true
            }
        }
        if (!handled) {
            super.updateTitleNoDetails()
        }
    }
}
