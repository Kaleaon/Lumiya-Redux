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

open class UserProfileFragment : UserFunctionsFragment() {
    private val activeFragments: MutableMap<ProfileTab, WeakReference<Fragment>> = EnumMap(ProfileTab::class.java)

    private inner class ProfilePagerAdapter(fragmentManager: FragmentManager) : FragmentStatePagerAdapter(fragmentManager) {

        override fun destroyItem(viewGroup: ViewGroup, i: Int, obj: Any) {
            val profileTab = ProfileTab.values().getOrNull(i)
            if (profileTab != null) {
                this@UserProfileFragment.activeFragments.remove(profileTab)
            }
            super.destroyItem(viewGroup, i, obj)
        }

        override fun getCount(): Int {
            return ProfileTab.values().size
        }

        override fun getItem(i: Int): Fragment {
            val profileTab = ProfileTab.values()[i]
            val fragment = profileTab.tabClass.getDeclaredConstructor().newInstance()
            fragment.arguments = UserProfileFragment.makeSelection(this@UserProfileFragment.chatterID)
            this@UserProfileFragment.activeFragments[profileTab] = WeakReference(fragment)
            return fragment
        }

        override fun getPageTitle(i: Int): CharSequence {
            return this@UserProfileFragment.getString(ProfileTab.values()[i].tabCaption)
        }

        override fun saveState(): Parcelable? {
            return null
        }
    }

    private enum class ProfileTab(val tabCaption: Int, val tabClass: Class<out Fragment>) {
        MainProfile(R.string.profile_tab_caption, UserMainProfileTab::class.java),
        Picks(R.string.profile_picks_caption, UserPicksProfileTab::class.java),
        Groups(R.string.profile_groups_caption, UserGroupsProfileTab::class.java),
        FirstLife(R.string.profile_1st_caption, UserFirstLifeProfileTab::class.java)
    }

    override fun onCreate(bundle: Bundle?) {
        super.onCreate(bundle)
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup?, bundle: Bundle?): View {
        super.onCreateView(layoutInflater, viewGroup, bundle)
        val inflate = layoutInflater.inflate(R.layout.user_profile_new, viewGroup, false)
        val viewPager = inflate.findViewById<ViewPager>(R.id.user_profile_pager)
        viewPager.adapter = ProfilePagerAdapter(childFragmentManager)
        inflate.findViewById<TabLayout>(R.id.user_profile_tabs).setupWithViewPager(viewPager)
        return inflate
    }

    override fun onShowUser(chatterID: ChatterID?) {
        for (weakRef in this.activeFragments.values) {
            val componentCallbacks: ComponentCallbacks? = weakRef.get()
            if (componentCallbacks is ReloadableFragment) {
                componentCallbacks.setFragmentArgs(activity?.intent, ChatterReloadableFragment.makeSelection(chatterID))
            }
        }
    }

    companion object {
        @JvmStatic
        fun makeSelection(chatterID: ChatterID?): Bundle {
            return UserFunctionsFragment.makeSelection(chatterID)
        }
    }
}
