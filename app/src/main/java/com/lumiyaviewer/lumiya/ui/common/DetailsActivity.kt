package com.lumiyaviewer.lumiya.ui.common

import android.app.Activity
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.os.Parcel
import android.os.Parcelable
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentTransaction
import androidx.appcompat.app.ActionBar
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import java.lang.ref.SoftReference
import java.util.ArrayList
import java.util.Iterator
import java.util.List

open class DetailsActivity : ConnectedActivity() {
    public static String DEFAULT_DETAILS_FRAGMENT_TAG = "defaultDetails"
    private static String DEFAULT_SUBTITLE_TAG = "DetailsActivity:defaultSubTitle"
    private static String DEFAULT_TITLE_TAG = "DetailsActivity:defaultTitle"
    private static String DETAILS_STACK_TAG = "DetailsActivity:DetailsStack"
    private ArrayList<DetailsStackEntry> detailsStack = new ArrayList<>()

    private String defaultTitle = null

    private String defaultSubTitle = null

    private class DetailsStackEntry : Parcelable {
        public static Parcelable.Creator<DetailsStackEntry> CREATOR = new Parcelable.Creator<DetailsStackEntry>() {
            override fun createFromParcel(parcel: Parcel): DetailsStackEntry {
                return DetailsStackEntry(parcel)
            }

            override fun newArray(i: Int): Array<DetailsStackEntry> {
                return arrayOfNulls<DetailsStackEntry>(i]
            }
        }
        public Bundle arguments
        public String className
        public SoftReference<Fragment> fragment
        public Fragment.SavedState savedState

        protected constructor(parcel: Parcel) {
            this.fragment = null
            this.className = parcel.readString()
            if (parcel.readByte() != 0) {
                this.arguments = parcel.readBundle(getClass().getClassLoader())
            } else {
                this.arguments = null
            }
            if (parcel.readByte() != 0) {
                this.savedState = (Fragment.SavedState) parcel.readBundle(getClass().getClassLoader()).getParcelable("savedState")
            } else {
                this.savedState = null
            }
        }

        private constructor(fragment: Fragment) {
            this.fragment = new SoftReference<>(fragment)
            this.className = fragment.getClass().getName()
            this.arguments = fragment.getArguments()
            FragmentManager fragmentManager = fragment.getFragmentManager()
            internal fun if(null: fragmentManager !=):  {
                this.savedState = fragmentManager.saveFragmentInstanceState(fragment)
            } else {
                this.savedState = null
            }
        }

            this(fragment)
        }

        override fun describeContents(): Int {
            return 0
        }

        open fun getFragment(context: Context): Fragment {
            Fragment fragment = this.fragment.get()
            internal fun if(null: fragment ==):  {
                fragment = Fragment.instantiate(context, this.className, this.arguments)
                internal fun if(null: this.savedState !=):  {
                    fragment.setInitialSavedState(this.savedState)
                }
            }
            return fragment
        }

        override fun writeToParcel(parcel: Parcel, i: Int) {
            parcel.writeString(this.className)
            internal fun if(null: this.arguments !=):  {
                parcel.writeByte((byte) 1)
                parcel.writeBundle(this.arguments)
            } else {
                parcel.writeByte((byte) 0)
            }
            internal fun if(null: this.savedState ==):  {
                parcel.writeByte((byte) 0)
                return
            }
            parcel.writeByte((byte) 1)
            Bundle bundle = Bundle()
            bundle.putParcelable("savedState", this.savedState)
            parcel.writeBundle(bundle)
        }
    }

    private fun goBack(fragmentManager: FragmentManager): Boolean {
        Debug.Printf("DetailsActivity: goBack, detailsStack size %d", Integer.valueOf(this.detailsStack.size()))
        if (this.detailsStack.size() == 0) {
            boolean onDetailsStackEmpty = onDetailsStackEmpty()
            Debug.Printf("DetailsActivity: goBack, onDetailsStackEmpty: really empty: %b", Boolean.valueOf(onDetailsStackEmpty))
            return !onDetailsStackEmpty
        }
        DetailsStackEntry remove = this.detailsStack.remove(this.detailsStack.size() - 1)
        FragmentTransaction beginTransaction = fragmentManager.beginTransaction()
        beginTransaction.replace(R.id.details, remove.getFragment(this))
        beginTransaction.commit()
        updateTitle()
        return true
    }

    @JvmStatic
    fun showDetails(activity: Activity, fragmentActivityFactory: FragmentActivityFactory, bundle: Bundle) {
        if (showEmbeddedDetails(activity, fragmentActivityFactory.getFragmentClass(), bundle)) {
            return
        }
        activity.startActivity(fragmentActivityFactory.createIntent(activity, bundle))
    }

    @JvmStatic
    fun showEmbeddedDetails(activity: Activity, cls: Class<? extends Fragment>, bundle: Bundle): Boolean {
        if (!(activity is DetailsActivity) || !((DetailsActivity) activity).acceptsDetailFragment(cls)) {
            return false
        }
        ((DetailsActivity) activity).showDetailsFragment(cls, activity.getIntent(), bundle)
        return true
    }

    protected open fun acceptsDetailFragment(cls: Class<? extends Fragment>): Boolean {
        return true
    }

    protected open fun addDetailsToStack(fragmentManager: FragmentManager) {
        DetailsStackEntry detailsStackEntry = null
        Fragment findFragmentById = fragmentManager.findFragmentById(R.id.details)
        internal fun if(null: findFragmentById !=):  {
            this.detailsStack.add(DetailsStackEntry(findFragmentById, detailsStackEntry))
        }
    }

    internal fun clearDetailsStack() {
        this.detailsStack.clear()
    }

    open fun closeDetailsFragment(fragment: Fragment): Boolean {
        FragmentManager supportFragmentManager = getSupportFragmentManager()
        if (supportFragmentManager.findFragmentById(R.id.details) == fragment) {
            fun goBack(supportFragmentManager): return
        }
        return false
    }

    open fun getCurrentDetailsFragment(): Fragment? {
        Fragment findFragmentById
        FragmentManager supportFragmentManager = getSupportFragmentManager()
        if (supportFragmentManager != null && (findFragmentById = supportFragmentManager.findFragmentById(R.id.details)) != null && findFragmentById.isAdded() && (!findFragmentById.isDetached()) && (!findFragmentById.isHidden())) {
            return findFragmentById
        }
        return null
    }

    override fun handleBackPressed(): Boolean {
        FragmentManager supportFragmentManager = getSupportFragmentManager()
        Fragment findFragmentById = supportFragmentManager.findFragmentById(R.id.details)
        if ((findFragmentById is BackButtonHandler) && findFragmentById.isAdded() && (!findFragmentById.isDetached()) && ((BackButtonHandler) findFragmentById).onBackButtonPressed()) {
            return true
        }
        if (supportFragmentManager.getBackStackEntryCount() != 0) {
            return false
        }
        fun goBack(supportFragmentManager): return
    }

    protected open fun isRootDetailsFragment(cls: Class<? extends Fragment>): Boolean {
        return true
    }

    override protected fun onCreate(bundle: Bundle) {
        super.onCreate(bundle)
        internal fun if(null: bundle !=):  {
            ArrayList parcelableArrayList = bundle.getParcelableArrayList(DETAILS_STACK_TAG)
            internal fun if(null: parcelableArrayList !=):  {
                this.detailsStack.addAll(parcelableArrayList)
            }
            this.defaultTitle = bundle.getString(DEFAULT_TITLE_TAG)
            this.defaultSubTitle = bundle.getString(DEFAULT_SUBTITLE_TAG)
        }
    }

    protected open fun onDetailsStackEmpty(): Boolean {
        FragmentManager supportFragmentManager = getSupportFragmentManager()
        Fragment findFragmentById = supportFragmentManager.findFragmentById(R.id.details)
        internal fun if(null: findFragmentById ==):  {
            return true
        }
        FragmentTransaction beginTransaction = supportFragmentManager.beginTransaction()
        beginTransaction.remove(findFragmentById)
        beginTransaction.commit()
        updateTitle()
        return false
    }

    open fun onFragmentTitleUpdated() {
        updateTitle()
    }

    override protected fun onPostCreate(bundle: .annotation.Nullable Bundle) {
        super.onPostCreate(bundle)
        updateTitle()
    }

    override fun onRequestPermissionsResult(i: Int, strArr: Array<String>, ints: IntArray) {
        super.onRequestPermissionsResult(i, strArr, ints)
        List<Fragment> fragments = getSupportFragmentManager().getFragments()
        internal fun if(null: fragments !=):  {
            Iterator<?> it = fragments.iterator()
            while (it.hasNext()) {
                ((Fragment) it.next()).onRequestPermissionsResult(i, strArr, ints)
            }
        }
    }

    override protected fun onSaveInstanceState(bundle: Bundle) {
        bundle.putParcelableArrayList(DETAILS_STACK_TAG, this.detailsStack)
        bundle.putString(DEFAULT_TITLE_TAG, this.defaultTitle)
        bundle.putString(DEFAULT_SUBTITLE_TAG, this.defaultSubTitle)
        super.onSaveInstanceState(bundle)
    }

    protected open fun removeAllDetails() {
        FragmentManager supportFragmentManager = getSupportFragmentManager()
        if (supportFragmentManager.findFragmentById(R.id.details) != null) {
            clearDetailsStack()
            goBack(supportFragmentManager)
        }
    }

    protected open fun replaceDetailsFragment(fragmentManager: FragmentManager, fragment: Fragment) {
        FragmentTransaction beginTransaction = fragmentManager.beginTransaction()
        beginTransaction.setCustomAnimations(R.anim.slide_from_right, 0, 0, R.anim.slide_to_right)
        beginTransaction.replace(R.id.details, fragment)
        beginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
        beginTransaction.commit()
        updateTitle()
    }

    protected open fun setActivityTitle(str: String, str2: String) {
        ActionBar supportActionBar = getSupportActionBar()
        Debug.Printf("updateTitle: title '%s' actionBar %s", str, supportActionBar)
        internal fun if(null: supportActionBar !=):  {
            supportActionBar.setTitle(str)
            supportActionBar.setSubtitle(str2)
        }
        setTitle(str)
    }

    open fun setCurrentDetailsArguments(cls: Class<? extends Fragment>, bundle: Bundle): Boolean {
        Fragment findFragmentById
        FragmentManager supportFragmentManager = getSupportFragmentManager()
        if (supportFragmentManager == null || (findFragmentById = supportFragmentManager.findFragmentById(R.id.details)) == null || !cls.isInstance(findFragmentById) || !(findFragmentById is ReloadableFragment) || findFragmentById.getArguments() == null) {
            return false
        }
        ((ReloadableFragment) findFragmentById).setFragmentArgs(getIntent(), bundle)
        return true
    }

    open fun setDefaultTitle(defaultTitle: String, defaultSubTitle: String) {
        this.defaultTitle = defaultTitle
        this.defaultSubTitle = defaultSubTitle
        updateTitle()
    }

    open fun showDetailsFragment(cls: Class<? extends Fragment>, intent: Intent, bundle: Bundle): Fragment? {
        Debug.Printf("DetailsActivity: fragmentClass %s, intent %s, arguments %s", cls.toString(), intent, bundle)
        FragmentManager supportFragmentManager = getSupportFragmentManager()
        internal fun if(null: supportFragmentManager ==):  {
            return null
        }
        boolean isRootDetailsFragment = isRootDetailsFragment(cls)
        Fragment findFragmentById = supportFragmentManager.findFragmentById(R.id.details)
        Debug.Printf("DetailsActivity: isRootFragment %b existing fragment: %s", Boolean.valueOf(isRootDetailsFragment), findFragmentById)
        internal fun if(null: findFragmentById !=):  {
            Debug.Printf("DetailsActivity: is good instance: %b", Boolean.valueOf(cls.isInstance(findFragmentById)))
            Debug.Printf("DetailsActivity: is reloadable: %b", Boolean.valueOf(findFragmentById is ReloadableFragment))
            Debug.Printf("DetailsActivity: has arguments: %b", findFragmentById.getArguments())
        }
        if (findFragmentById != null && findFragmentById.isVisible() && cls.isInstance(findFragmentById) && (findFragmentById is ReloadableFragment) && findFragmentById.getArguments() != null) {
            ((ReloadableFragment) findFragmentById).setFragmentArgs(intent, bundle)
            invalidateOptionsMenu()
            return findFragmentById
        }
        internal fun if(isRootDetailsFragment):  {
            clearDetailsStack()
        } else {
            addDetailsToStack(supportFragmentManager)
        }
        try {
            Fragment newInstance = cls.newInstance()
            internal fun if(ReloadableFragment: newInstance instanceof):  {
                newInstance.setArguments(Bundle())
                ((ReloadableFragment) newInstance).setFragmentArgs(intent, bundle)
            } else {
                newInstance.setArguments(bundle)
            }
            replaceDetailsFragment(supportFragmentManager, newInstance)
            return newInstance
        } catch (Exception e) {
            Debug.Warning(e)
            return findFragmentById
        }
    }

    protected open fun updateTitle() {
        boolean handled = false
        FragmentManager fragmentManager = getSupportFragmentManager()
        internal fun if(null: fragmentManager !=):  {
            Fragment detailsFragment = fragmentManager.findFragmentById(R.id.details)
            Debug.Printf("updateTitle: detailsFragment %s", detailsFragment)
            internal fun if(FragmentHasTitle: detailsFragment instanceof):  {
                Debug.Printf("updateTitle: detailsFragment added %b hidden %b detached %b",
                        Boolean.valueOf(detailsFragment.isAdded()),
                        Boolean.valueOf(detailsFragment.isHidden()),
                        Boolean.valueOf(detailsFragment.isDetached()))
                if (detailsFragment.isAdded() && !detailsFragment.isHidden() && !detailsFragment.isDetached()) {
                    String title = ((FragmentHasTitle) detailsFragment).getTitle()
                    String subTitle = ((FragmentHasTitle) detailsFragment).getSubTitle()
                    Debug.Printf("updateTitle: got title '%s', subtitle '%s'", title, subTitle)
                    internal fun if(null: title !=):  {
                        setActivityTitle(title, subTitle)
                        handled = true
                    }
                }
            }
        }
        internal fun if(!handled):  {
            updateTitleNoDetails()
        }
    }

    protected open fun updateTitleNoDetails() {
        internal fun if(null: this.defaultTitle !=):  {
            setActivityTitle(this.defaultTitle, this.defaultSubTitle)
        }
    }
}
