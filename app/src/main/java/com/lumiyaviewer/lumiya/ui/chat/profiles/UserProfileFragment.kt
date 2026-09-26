package com.lumiyaviewer.lumiya.ui.chat.profiles

import android.content.ComponentCallbacks
import android.os.Bundle
import android.os.Parcelable
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentStatePagerAdapter
import androidx.viewpager.widget.ViewPager
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.google.android.material.tabs.TabLayout
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.common.ChatterReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.ReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.UserFunctionsFragment
import java.lang.ref.WeakReference
import java.util.EnumMap
import java.util.Iterator
import java.util.Map

open class UserProfileFragment : UserFunctionsFragment() {
    private Map<ProfileTab, WeakReference<Fragment>> activeFragments = EnumMap(ProfileTab.class)

    private class ProfilePagerAdapter : FragmentStatePagerAdapter() {
        internal constructor(fragmentManager: FragmentManager) {
            super(fragmentManager)
        }

        override fun destroyItem(viewGroup: ViewGroup, i: Int, obj: Any) {
            ProfileTab profileTab = ProfileTab.values()[i]
            internal fun if(null: profileTab !=):  {
                UserProfileFragment.this.activeFragments.remove(profileTab)
            }
            super.destroyItem(viewGroup, i, obj)
        }

        override fun getCount(): Int {
            return ProfileTab.values().length
        }

        override fun getItem(i: Int): Fragment {
            ProfileTab profileTab = ProfileTab.values()[i]
            try {
                Fragment fragment = (Fragment) profileTab.tabClass.newInstance()
                fragment.setArguments(UserProfileFragment.makeSelection(UserProfileFragment.this.chatterID))
                UserProfileFragment.this.activeFragments.put(profileTab, WeakReference(fragment))
                return fragment
            } catch (ReflectiveOperationException e) {
                return null
            }
        }

        override fun getPageTitle(i: Int): CharSequence {
            return UserProfileFragment.this.getString(ProfileTab.values()[i].tabCaption)
        }

        override fun saveState(): Parcelable {
            return null
        }
    }

    private enum class ProfileTab {
        MainProfile(R.string.profile_tab_caption, UserMainProfileTab.class),
        Picks(R.string.profile_picks_caption, UserPicksProfileTab.class),
        Groups(R.string.profile_groups_caption, UserGroupsProfileTab.class),
        FirstLife(R.string.profile_1st_caption, UserFirstLifeProfileTab.class)

        private int tabCaption
        private Class<? extends Fragment> tabClass

        internal constructor(tabCaption: Int, cls: Class) {
            this.tabCaption = tabCaption
            this.tabClass = cls
        }

    }

    @JvmStatic
    fun makeSelection(chatterID: ChatterID): Bundle {
        return UserFunctionsFragment.makeSelection(chatterID)
    }

    override fun onCreate(bundle: Bundle) {
        super.onCreate(bundle)
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View {
        super.onCreateView(layoutInflater, viewGroup, bundle)
        View inflate = layoutInflater.inflate(R.layout.user_profile_new, viewGroup, false)
        ViewPager viewPager = (ViewPager) inflate.findViewById(R.id.user_profile_pager)
        viewPager.setAdapter(ProfilePagerAdapter(getChildFragmentManager()))
        ((TabLayout) inflate.findViewById(R.id.user_profile_tabs)).setupWithViewPager(viewPager)
        return inflate
    }

    override protected fun onShowUser(chatterID: ChatterID) {
        Iterator<?> it = this.activeFragments.values().iterator()
        while (it.hasNext()) {
            ComponentCallbacks componentCallbacks = (Fragment) ((WeakReference) it.next()).get()
            internal fun if(ReloadableFragment: componentCallbacks instanceof):  {
                ((ReloadableFragment) componentCallbacks).setFragmentArgs(getActivity() != null ? getActivity().getIntent() : null, ChatterReloadableFragment.makeSelection(chatterID))
            }
        }
    }
}
