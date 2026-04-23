package com.lumiyaviewer.lumiya.ui.chat.profiles;

import android.content.ComponentCallbacks;
import android.os.Bundle;
import android.os.Parcelable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentStatePagerAdapter;
import androidx.viewpager.widget.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import com.astuetz.PagerSlidingTabStrip;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.ui.common.ChatterReloadableFragment;
import com.lumiyaviewer.lumiya.ui.common.ReloadableFragment;
import com.lumiyaviewer.lumiya.ui.common.UserFunctionsFragment;
import java.lang.ref.WeakReference;
import java.util.EnumMap;
import java.util.Iterator;
import java.util.Map;
import javax.annotation.Nullable;

/* loaded from: classes.dex */
public class UserProfileFragment extends UserFunctionsFragment {
    private final Map<ProfileTab, WeakReference<Fragment>> activeFragments = new EnumMap(ProfileTab.class);

    private class ProfilePagerAdapter extends FragmentStatePagerAdapter {
        ProfilePagerAdapter(FragmentManager fragmentManager) {
            super(fragmentManager);
        }

        @Override // androidx.fragment.app.FragmentStatePagerAdapter, androidx.viewpager.widget.PagerAdapter
        public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
            ProfileTab profileTab = ProfileTab.valuesCustom()[i];
            if (profileTab != null) {
                UserProfileFragment.this.activeFragments.remove(profileTab);
            }
            super.destroyItem(viewGroup, i, obj);
        }

        @Override // androidx.viewpager.widget.PagerAdapter
        public int getCount() {
            return ProfileTab.valuesCustom().length;
        }

        @Override // androidx.fragment.app.FragmentStatePagerAdapter
        public Fragment getItem(int i) {
            ProfileTab profileTab = ProfileTab.valuesCustom()[i];
            try {
                Fragment fragment = (Fragment) profileTab.tabClass.newInstance();
                fragment.setArguments(UserProfileFragment.makeSelection(UserProfileFragment.this.chatterID));
                UserProfileFragment.this.activeFragments.put(profileTab, new WeakReference(fragment));
                return fragment;
            } catch (IllegalAccessException e) {
                return null;
            } catch (InstantiationException e2) {
                return null;
            }
        }

        @Override // androidx.viewpager.widget.PagerAdapter
        public CharSequence getPageTitle(int i) {
            return UserProfileFragment.this.getString(ProfileTab.valuesCustom()[i].tabCaption);
        }

        @Override // androidx.fragment.app.FragmentStatePagerAdapter, androidx.viewpager.widget.PagerAdapter
        public Parcelable saveState() {
            return null;
        }
    }

    private enum ProfileTab {
        MainProfile(R.string.profile_tab_caption, UserMainProfileTab.class),
        Picks(R.string.profile_picks_caption, UserPicksProfileTab.class),
        Groups(R.string.profile_groups_caption, UserGroupsProfileTab.class),
        FirstLife(R.string.profile_1st_caption, UserFirstLifeProfileTab.class);

        private final int tabCaption;
        private final Class<? extends Fragment> tabClass;

        ProfileTab(int i, Class cls) {
            this.tabCaption = i;
            this.tabClass = cls;
        }

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static ProfileTab[] valuesCustom() {
            return values();
        }
    }

    public static Bundle makeSelection(ChatterID chatterID) {
        return UserFunctionsFragment.makeSelection(chatterID);
    }

    @Override // com.lumiyaviewer.lumiya.ui.common.UserFunctionsFragment, com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle, androidx.fragment.app.Fragment
    public void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        super.onCreateView(layoutInflater, viewGroup, bundle);
        View inflate = layoutInflater.inflate(R.layout.user_profile_new, viewGroup, false);
        ViewPager viewPager = (ViewPager) inflate.findViewById(R.id.user_profile_pager);
        viewPager.setAdapter(new ProfilePagerAdapter(getChildFragmentManager()));
        ((PagerSlidingTabStrip) inflate.findViewById(R.id.user_profile_tabs)).setViewPager(viewPager);
        return inflate;
    }

    @Override // com.lumiyaviewer.lumiya.ui.common.ChatterFragment
    protected void onShowUser(@Nullable ChatterID chatterID) {
        Iterator<T> it = this.activeFragments.values().iterator();
        while (it.hasNext()) {
            ComponentCallbacks componentCallbacks = (Fragment) ((WeakReference) it.next()).get();
            if (componentCallbacks instanceof ReloadableFragment) {
                ((ReloadableFragment) componentCallbacks).setFragmentArgs(getActivity() != null ? getActivity().getIntent() : null, ChatterReloadableFragment.makeSelection(chatterID));
            }
        }
    }
}
