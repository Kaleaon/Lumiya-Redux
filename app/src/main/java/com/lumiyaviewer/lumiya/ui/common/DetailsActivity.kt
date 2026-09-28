package com.lumiyaviewer.lumiya.ui.common

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.os.Parcel
import android.os.Parcelable
import androidx.annotation.NonNull
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentTransaction
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import java.lang.ref.SoftReference
import java.util.ArrayList

open class DetailsActivity : ConnectedActivity() {
    companion object {
        const val DEFAULT_DETAILS_FRAGMENT_TAG = "defaultDetails"
        private const val DEFAULT_SUBTITLE_TAG = "DetailsActivity:defaultSubTitle"
        private const val DEFAULT_TITLE_TAG = "DetailsActivity:defaultTitle"
        private const val DETAILS_STACK_TAG = "DetailsActivity:DetailsStack"

        @JvmStatic
        fun showDetails(activity: Activity?, fragmentActivityFactory: FragmentActivityFactory, bundle: Bundle) {
            if (activity == null) return
            if (showEmbeddedDetails(activity, fragmentActivityFactory.getFragmentClass(), bundle)) {
                return
            }
            activity.startActivity(fragmentActivityFactory.createIntent(activity, bundle))
        }

        @JvmStatic
        fun showEmbeddedDetails(activity: Activity, cls: Class<out Fragment>, bundle: Bundle): Boolean {
            if (activity !is DetailsActivity || !activity.acceptsDetailFragment(cls)) {
                return false
            }
            activity.showDetailsFragment(cls, activity.intent, bundle)
            return true
        }
    }

    private val detailsStack = ArrayList<DetailsStackEntry>()

    private var defaultTitle: String? = null

    private var defaultSubTitle: String? = null

    private class DetailsStackEntry : Parcelable {
        val arguments: Bundle?
        val className: String
        val fragment: SoftReference<Fragment>?
        val savedState: Fragment.SavedState?

        constructor(parcel: Parcel) {
            this.fragment = null
            this.className = parcel.readString()!!
            this.arguments = if (parcel.readByte().toInt() != 0) {
                parcel.readBundle(javaClass.classLoader)
            } else {
                null
            }
            this.savedState = if (parcel.readByte().toInt() != 0) {
                parcel.readBundle(javaClass.classLoader)?.getParcelable("savedState")
            } else {
                null
            }
        }

        constructor(fragment: Fragment) {
            this.fragment = SoftReference(fragment)
            this.className = fragment.javaClass.name
            this.arguments = fragment.arguments
            val fragmentManager = fragment.fragmentManager
            this.savedState = if (fragmentManager != null) {
                fragmentManager.saveFragmentInstanceState(fragment)
            } else {
                null
            }
        }

        override fun describeContents(): Int {
            return 0
        }

        fun getFragment(context: Context): Fragment {
            var fragment = this.fragment?.get()
            if (fragment == null) {
                fragment = Fragment.instantiate(context, this.className, this.arguments)
                if (this.savedState != null) {
                    fragment.setInitialSavedState(this.savedState)
                }
            }
            return fragment
        }

        override fun writeToParcel(parcel: Parcel, i: Int) {
            parcel.writeString(this.className)
            if (this.arguments != null) {
                parcel.writeByte(1.toByte())
                parcel.writeBundle(this.arguments)
            } else {
                parcel.writeByte(0.toByte())
            }
            if (this.savedState == null) {
                parcel.writeByte(0.toByte())
                return
            }
            parcel.writeByte(1.toByte())
            val bundle = Bundle()
            bundle.putParcelable("savedState", this.savedState)
            parcel.writeBundle(bundle)
        }

        companion object {
            @JvmField
            val CREATOR = object : Parcelable.Creator<DetailsStackEntry> {
                override fun createFromParcel(parcel: Parcel): DetailsStackEntry {
                    return DetailsStackEntry(parcel)
                }

                override fun newArray(i: Int): Array<DetailsStackEntry?> {
                    return arrayOfNulls(i)
                }
            }
        }
    }

    private fun goBack(fragmentManager: FragmentManager): Boolean {
        Debug.Printf("DetailsActivity: goBack, detailsStack size %d", this.detailsStack.size)
        if (this.detailsStack.size == 0) {
            val onDetailsStackEmpty = onDetailsStackEmpty()
            Debug.Printf("DetailsActivity: goBack, onDetailsStackEmpty: really empty: %b", onDetailsStackEmpty)
            return !onDetailsStackEmpty
        }
        val remove = this.detailsStack.removeAt(this.detailsStack.size - 1)
        val beginTransaction = fragmentManager.beginTransaction()
        beginTransaction.replace(R.id.details, remove.getFragment(this))
        beginTransaction.commit()
        updateTitle()
        return true
    }

    protected open fun acceptsDetailFragment(cls: Class<out Fragment>): Boolean {
        return true
    }

    protected open fun addDetailsToStack(fragmentManager: FragmentManager) {
        val findFragmentById = fragmentManager.findFragmentById(R.id.details)
        if (findFragmentById != null) {
            this.detailsStack.add(DetailsStackEntry(findFragmentById))
        }
    }

    fun clearDetailsStack() {
        this.detailsStack.clear()
    }

    open fun closeDetailsFragment(fragment: Fragment): Boolean {
        val supportFragmentManager = supportFragmentManager
        if (supportFragmentManager.findFragmentById(R.id.details) === fragment) {
            return goBack(supportFragmentManager)
        }
        return false
    }

    open fun getCurrentDetailsFragment(): Fragment? {
        val supportFragmentManager = supportFragmentManager
        val findFragmentById = supportFragmentManager.findFragmentById(R.id.details)
        if (findFragmentById != null && findFragmentById.isAdded && !findFragmentById.isDetached && !findFragmentById.isHidden) {
            return findFragmentById
        }
        return null
    }

    override fun handleBackPressed(): Boolean {
        val supportFragmentManager = supportFragmentManager
        val findFragmentById = supportFragmentManager.findFragmentById(R.id.details)
        if (findFragmentById is BackButtonHandler && findFragmentById.isAdded && !findFragmentById.isDetached && findFragmentById.onBackButtonPressed()) {
            return true
        }
        if (supportFragmentManager.backStackEntryCount != 0) {
            return false
        }
        return goBack(supportFragmentManager)
    }

    protected open fun isRootDetailsFragment(cls: Class<out Fragment>): Boolean {
        return true
    }

    override fun onCreate(bundle: Bundle?) {
        super.onCreate(bundle)
        if (bundle != null) {
            val parcelableArrayList = bundle.getParcelableArrayList<DetailsStackEntry>(DETAILS_STACK_TAG)
            if (parcelableArrayList != null) {
                this.detailsStack.addAll(parcelableArrayList)
            }
            this.defaultTitle = bundle.getString(DEFAULT_TITLE_TAG)
            this.defaultSubTitle = bundle.getString(DEFAULT_SUBTITLE_TAG)
        }
    }

    protected open fun onDetailsStackEmpty(): Boolean {
        val supportFragmentManager = supportFragmentManager
        val findFragmentById = supportFragmentManager.findFragmentById(R.id.details) ?: return true
        val beginTransaction = supportFragmentManager.beginTransaction()
        beginTransaction.remove(findFragmentById)
        beginTransaction.commit()
        updateTitle()
        return false
    }

    fun onFragmentTitleUpdated() {
        updateTitle()
    }

    override fun onPostCreate(bundle: Bundle?) {
        super.onPostCreate(bundle)
        updateTitle()
    }

    override fun onRequestPermissionsResult(i: Int, strArr: Array<String>, ints: IntArray) {
        super.onRequestPermissionsResult(i, strArr, ints)
        val fragments = supportFragmentManager.fragments
        for (fragment in fragments) {
            fragment.onRequestPermissionsResult(i, strArr, ints)
        }
    }

    override fun onSaveInstanceState(bundle: Bundle) {
        bundle.putParcelableArrayList(DETAILS_STACK_TAG, this.detailsStack)
        bundle.putString(DEFAULT_TITLE_TAG, this.defaultTitle)
        bundle.putString(DEFAULT_SUBTITLE_TAG, this.defaultSubTitle)
        super.onSaveInstanceState(bundle)
    }

    protected fun removeAllDetails() {
        val supportFragmentManager = supportFragmentManager
        if (supportFragmentManager.findFragmentById(R.id.details) != null) {
            clearDetailsStack()
            goBack(supportFragmentManager)
        }
    }

    protected open fun replaceDetailsFragment(fragmentManager: FragmentManager, fragment: Fragment) {
        val beginTransaction = fragmentManager.beginTransaction()
        beginTransaction.setCustomAnimations(R.anim.slide_from_right, 0, 0, R.anim.slide_to_right)
        beginTransaction.replace(R.id.details, fragment)
        beginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
        beginTransaction.commit()
        updateTitle()
    }

    protected fun setActivityTitle(str: String?, str2: String?) {
        val supportActionBar = supportActionBar
        Debug.Printf("updateTitle: title '%s' actionBar %s", str, supportActionBar)
        if (supportActionBar != null) {
            supportActionBar.title = str
            supportActionBar.subtitle = str2
        }
        title = str
    }

    open fun setCurrentDetailsArguments(cls: Class<out Fragment>, bundle: Bundle): Boolean {
        val supportFragmentManager = supportFragmentManager
        val findFragmentById = supportFragmentManager.findFragmentById(R.id.details)
        if (findFragmentById == null || !cls.isInstance(findFragmentById) || findFragmentById !is ReloadableFragment || findFragmentById.arguments == null) {
            return false
        }
        findFragmentById.setFragmentArgs(intent, bundle)
        return true
    }

    fun setDefaultTitle(defaultTitle: String?, defaultSubTitle: String?) {
        this.defaultTitle = defaultTitle
        this.defaultSubTitle = defaultSubTitle
        updateTitle()
    }

    open fun showDetailsFragment(cls: Class<out Fragment>, intent: Intent, bundle: Bundle): Fragment? {
        Debug.Printf("DetailsActivity: fragmentClass %s, intent %s, arguments %s", cls.toString(), intent, bundle)
        val supportFragmentManager = supportFragmentManager
        val isRootDetailsFragment = isRootDetailsFragment(cls)
        var findFragmentById = supportFragmentManager.findFragmentById(R.id.details)
        Debug.Printf("DetailsActivity: isRootFragment %b existing fragment: %s", isRootDetailsFragment, findFragmentById)
        if (findFragmentById != null) {
            Debug.Printf("DetailsActivity: is good instance: %b", cls.isInstance(findFragmentById))
            Debug.Printf("DetailsActivity: is reloadable: %b", findFragmentById is ReloadableFragment)
            Debug.Printf("DetailsActivity: has arguments: %s", findFragmentById.arguments)
        }
        if (findFragmentById != null && findFragmentById.isVisible && cls.isInstance(findFragmentById) && findFragmentById is ReloadableFragment && findFragmentById.arguments != null) {
            findFragmentById.setFragmentArgs(intent, bundle)
            invalidateOptionsMenu()
            return findFragmentById
        }
        if (isRootDetailsFragment) {
            clearDetailsStack()
        } else {
            addDetailsToStack(supportFragmentManager)
        }
        try {
            val newInstance = cls.getDeclaredConstructor().newInstance()
            if (newInstance is ReloadableFragment) {
                newInstance.arguments = Bundle()
                newInstance.setFragmentArgs(intent, bundle)
            } else {
                newInstance.arguments = bundle
            }
            replaceDetailsFragment(supportFragmentManager, newInstance)
            return newInstance
        } catch (e: Exception) {
            Debug.Warning(e)
            return findFragmentById
        }
    }

    protected open fun updateTitle() {
        var handled = false
        val fragmentManager = supportFragmentManager
        val detailsFragment = fragmentManager.findFragmentById(R.id.details)
        Debug.Printf("updateTitle: detailsFragment %s", detailsFragment)
        if (detailsFragment is FragmentHasTitle) {
            Debug.Printf(
                "updateTitle: detailsFragment added %b hidden %b detached %b",
                detailsFragment.isAdded, detailsFragment.isHidden, detailsFragment.isDetached
            )
            if (detailsFragment.isAdded && !detailsFragment.isHidden && !detailsFragment.isDetached) {
                val title = detailsFragment.getTitle()
                val subTitle = detailsFragment.getSubTitle()
                Debug.Printf("updateTitle: got title '%s', subtitle '%s'", title, subTitle)
                if (title != null) {
                    setActivityTitle(title, subTitle)
                    handled = true
                }
            }
        }
        if (!handled) {
            updateTitleNoDetails()
        }
    }

    protected open fun updateTitleNoDetails() {
        if (this.defaultTitle != null) {
            setActivityTitle(this.defaultTitle, this.defaultSubTitle)
        }
    }
}
