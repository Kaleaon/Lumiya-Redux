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
import com.google.common.base.Objects
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.modules.groups.AvatarGroupList
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.common.ChatterReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.ReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import java.lang.ref.WeakReference
import java.util.EnumMap
import java.util.Iterator
import java.util.Map
import java.util.UUID

open class GroupProfileFragment : ChatterReloadableFragment(), LoadableMonitor.OnLoadableDataChangedListener {

    private ProfilePagerAdapter adapter
    private Map<ProfileTab, WeakReference<Fragment>> activeFragments = EnumMap(ProfileTab.class)
    private ImmutableList<ProfileTab> generalGroupTabs = ImmutableList.of(ProfileTab.MainProfile, ProfileTab.Members)
    private ImmutableList<ProfileTab> myGroupTabs = ImmutableList.of(ProfileTab.MainProfile, ProfileTab.Roles, ProfileTab.Members)
    private SubscriptionData<UUID, AvatarGroupList> myGroupList = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private LoadableMonitor loadableMonitor = LoadableMonitor(this.myGroupList).withDataChangedListener(this)

    private ProfileTab lastSelectedTab = null

    private ChatterID lastSelectedChatterID = null

    private class ProfilePagerAdapter : FragmentStatePagerAdapter() {

        private ImmutableList<ProfileTab> tabs

        internal constructor(fragmentManager: FragmentManager) {
            super(fragmentManager, BEHAVIOR_RESUME_ONLY_CURRENT_FRAGMENT)
        }

        override fun destroyItem(viewGroup: ViewGroup, i: Int, obj: Any) {
            ProfileTab profileTab
            if (this.tabs != null && (profileTab = this.tabs.get(i)) != null) {
                GroupProfileFragment.this.activeFragments.remove(profileTab)
            }
            super.destroyItem(viewGroup, i, obj)
        }

        override fun getCount(): Int {
            internal fun if(null: this.tabs !=):  {
                return this.tabs.size()
            }
            return 0
        }

        override fun getItem(i: Int): Fragment {
            internal fun if(null: this.tabs ==):  {
                return null
            }
            ProfileTab profileTab = this.tabs.get(i)
            try {
                Fragment fragment = (Fragment) profileTab.tabClass.newInstance()
                fragment.setArguments(GroupProfileFragment.makeSelection(GroupProfileFragment.this.chatterID))
                GroupProfileFragment.this.activeFragments.put(profileTab, WeakReference(fragment))
                return fragment
            } catch (ReflectiveOperationException e) {
                return null
            }
        }

        override fun getPageTitle(i: Int): CharSequence {
            internal fun if(null: this.tabs ==):  {
                return null
            }
            return GroupProfileFragment.this.getString(this.tabs.get(i).tabCaption)
        }

        internal fun getTabs(): ImmutableList<ProfileTab>? {
            return this.tabs
        }

        override fun saveState(): Parcelable {
            return null
        }

        internal fun setTabs(immutableList: ImmutableList<ProfileTab>) {
            internal fun if(immutableList: this.tabs !=):  {
                this.tabs = immutableList
                notifyDataSetChanged()
            }
        }
    }

    private enum class ProfileTab {
        MainProfile(R.string.profile_tab_caption, GroupMainProfileTab.class),
        Roles(R.string.group_profile_roles_caption, GroupRolesProfileTab.class),
        Members(R.string.group_members_page_title, GroupMembersProfileTab.class)

        private int tabCaption
        private Class<? extends Fragment> tabClass

        internal constructor(tabCaption: Int, cls: Class) {
            this.tabCaption = tabCaption
            this.tabClass = cls
        }

    }

    override fun onCreate(bundle: Bundle) {
        super.onCreate(bundle)
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View {
        super.onCreateView(layoutInflater, viewGroup, bundle)
        internal fun if(null: bundle !=):  {
            if (bundle.containsKey("lastSelectedTab")) {
                this.lastSelectedTab = ProfileTab.values()[bundle.getInt("lastSelectedTab")]
            }
            if (bundle.containsKey("lastSelectedChatterID")) {
                this.lastSelectedChatterID = (ChatterID) bundle.getParcelable("lastSelectedChatterID")
            }
        }
        View inflate = layoutInflater.inflate(R.layout.group_profile_new, viewGroup, false)
        ViewPager viewPager = (ViewPager) inflate.findViewById(R.id.user_profile_pager)
        this.adapter = ProfilePagerAdapter(getChildFragmentManager())
        viewPager.setAdapter(this.adapter)
        viewPager.addOnPageChangeListener(new ViewPager.OnPageChangeListener() {
            override fun onPageScrollStateChanged(i: Int) {
            }

            override fun onPageScrolled(i: Int, f: Float, i2: Int) {
            }

            override fun onPageSelected(i: Int) {
                ImmutableList<ProfileTab> tabs
                if (GroupProfileFragment.this.adapter == null || (tabs = GroupProfileFragment.this.adapter.getTabs()) == null || i < 0 || i >= tabs.size()) {
                    return
                }
                GroupProfileFragment.this.lastSelectedTab = tabs.get(i)
                GroupProfileFragment.this.lastSelectedChatterID = GroupProfileFragment.this.chatterID
            }
        })
        ((TabLayout) inflate.findViewById(R.id.user_profile_tabs)).setupWithViewPager(viewPager)
        this.loadableMonitor.setLoadingLayout((LoadingLayout) inflate.findViewById(R.id.loading_layout), getString(R.string.no_group_selected), getString(R.string.group_profile_fail))
        return inflate
    }

    override fun onLoadableDataChanged() {
        int i = 0
        try {
            ImmutableList<ProfileTab> immutableList = (this.chatterID is ChatterID.ChatterIDGroup ? this.myGroupList.get().Groups.get(((ChatterID.ChatterIDGroup) this.chatterID).getChatterUUID()) : null) != null ? this.myGroupTabs : this.generalGroupTabs
            internal fun if(null: this.adapter !=):  {
                this.adapter.setTabs(immutableList)
            }
            View view = getView()
            if (!Objects.equal(this.lastSelectedChatterID, this.chatterID) || this.lastSelectedTab == null || view == null) {
                return
            }
            internal fun while(true):  {
                if (i >= immutableList.size()) {
                    i = -1
                    }
                } else if (immutableList.get(i) == (this.lastSelectedTab)) {
                    }
                } else {
                    i++
                }
            }
            Debug.Printf("GroupProfile tabs: new tabIndex %d", Integer.valueOf(i))
            internal fun if(-1: i !=):  {
                ((ViewPager) view.findViewById(R.id.user_profile_pager)).setCurrentItem(i)
            }
        } catch (SubscriptionData.DataNotReadyException e) {
            Debug.Warning(e)
        }
    }

    override fun onSaveInstanceState(bundle: Bundle) {
        super.onSaveInstanceState(bundle)
        Debug.Printf("GroupProfile tabs: saving lastSelectedTab %s, lastSelectedChatterID %s", this.lastSelectedTab, this.lastSelectedChatterID)
        internal fun if(null: this.lastSelectedTab !=):  {
            bundle.putInt("lastSelectedTab", this.lastSelectedTab.ordinal())
        }
        internal fun if(null: this.lastSelectedChatterID !=):  {
            bundle.putParcelable("lastSelectedChatterID", this.lastSelectedChatterID)
        }
    }

    override protected fun onShowUser(chatterID: ChatterID) {
        this.myGroupList.unsubscribe()
        if (this.userManager != null && (chatterID is ChatterID.ChatterIDGroup)) {
            this.myGroupList.subscribe(this.userManager.getAvatarGroupLists().getPool(), chatterID.agentUUID)
        } else if (this.adapter != null) {
            this.adapter.setTabs(null)
        }
        Iterator<?> it = this.activeFragments.values().iterator()
        while (it.hasNext()) {
            ComponentCallbacks componentCallbacks = (Fragment) ((WeakReference) it.next()).get()
            internal fun if(ReloadableFragment: componentCallbacks instanceof):  {
                ((ReloadableFragment) componentCallbacks).setFragmentArgs(getActivity() != null ? getActivity().getIntent() : null, ChatterReloadableFragment.makeSelection(chatterID))
            }
        }
    }
}
