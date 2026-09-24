package com.lumiyaviewer.lumiya.ui.chat;

import androidx.fragment.app.FragmentActivity;
import com.google.common.base.Strings;

import android.os.Bundle;
import android.os.Parcelable;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentStatePagerAdapter;
import androidx.viewpager.widget.PagerAdapter;
import androidx.viewpager.widget.ViewPager;
import android.view.LayoutInflater;
import android.view.Menu;
import android.view.MenuInflater;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewGroup;
import com.google.android.material.tabs.TabLayout;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.StreamingMediaService;
import com.lumiyaviewer.lumiya.react.Subscription;
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.users.ParcelData;
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.chat.contacts.ActiveChattersFragment;
import com.lumiyaviewer.lumiya.ui.chat.contacts.FriendListFragment;
import com.lumiyaviewer.lumiya.ui.chat.contacts.GroupListFragment;
import com.lumiyaviewer.lumiya.ui.chat.contacts.NearbyUsersFragment;
import com.lumiyaviewer.lumiya.ui.chat.profiles.ParcelPropertiesFragment;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.render.CardboardActivity;

public class ContactsFragment extends Fragment {
    private CurrentLocationInfo currentLocationInfo;
    private MenuItem itemLocationDetails = null;
    private MenuItem itemPlayMedia = null;
    private Subscription subscription;

    private enum ContactListType {
        Active,
        Friends,
        Groups,
        Nearby;

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static ContactListType[] valuesCustom() {
            return values();
        }
    }

    private class ContactsPagerAdapter extends FragmentStatePagerAdapter {

        ContactsPagerAdapter(FragmentManager fragmentManager) {
            super(fragmentManager);
        }

        @Override
        public int getCount() {
            return ContactListType.values().length;
        }

        @Override
        public Fragment getItem(int i) {
            Fragment nearbyUsersFragment;
            switch (ContactListType.values()[i]) {
                case Active:
                    nearbyUsersFragment = new ActiveChattersFragment();
                    break;
                case Friends:
                    nearbyUsersFragment = new FriendListFragment();
                    break;
                case Groups:
                    nearbyUsersFragment = new GroupListFragment();
                    break;
                case Nearby:
                    nearbyUsersFragment = new NearbyUsersFragment();
                    break;
                default:
                    nearbyUsersFragment = null;
                    break;
            }
            if (nearbyUsersFragment != null) {
                Bundle arguments = ContactsFragment.this.getArguments();
                Bundle makeFragmentArguments = ActivityUtils.makeFragmentArguments(ActivityUtils.getActiveAgentID(arguments), null);
                if (arguments.containsKey(CardboardActivity.VR_MODE_TAG)) {
                    makeFragmentArguments.putBoolean(CardboardActivity.VR_MODE_TAG, arguments.getBoolean(CardboardActivity.VR_MODE_TAG));
                }
                nearbyUsersFragment.setArguments(makeFragmentArguments);
            }
            return nearbyUsersFragment;
        }

        @Override
        public CharSequence getPageTitle(int i) {
            int nearbyUsers;
            ContactListType contactListType = ContactListType.values()[i];
            String name = contactListType.name();
            return (contactListType != ContactListType.Nearby || ContactsFragment.this.currentLocationInfo == null || (nearbyUsers = ContactsFragment.this.currentLocationInfo.nearbyUsers()) == 0) ? name : name + " (" + Integer.toString(nearbyUsers) + ")";
        }

        @Override
        public Parcelable saveState() {
            return null;
        }
    }

    public static ContactsFragment newInstance(Bundle bundle) {
        ContactsFragment contactsFragment = new ContactsFragment();
        contactsFragment.setArguments(bundle);
        return contactsFragment;
    }

    public void onCurrentLocation(CurrentLocationInfo currentLocationInfo) {
        ViewPager viewPager;
        PagerAdapter adapter;
        this.currentLocationInfo = currentLocationInfo;
        View view = getView();
        if (view != null && (viewPager = (ViewPager) view.findViewById(R.id.contact_list_pager)) != null && (adapter = viewPager.getAdapter()) != null) {
            adapter.notifyDataSetChanged();
        }
        updateOptionsMenu();
    }

    /* JADX WARN: Removed duplicated region for block: B:10:0x001b  */
    /* JADX WARN: Removed duplicated region for block: B:23:0x0042  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void updateOptionsMenu() {
        boolean z = false;
        if (this.currentLocationInfo != null) {
            FragmentActivity activity = getActivity();
            if (activity instanceof DetailsActivity) {
                Fragment currentDetailsFragment = ((DetailsActivity) activity).getCurrentDetailsFragment();
                z = currentDetailsFragment == null || currentDetailsFragment == this;
            } else {
                z = false;
            }
        }
        if (!z) {
            if (this.itemLocationDetails != null) {
                this.itemLocationDetails.setVisible(false);
            }
            if (this.itemPlayMedia != null) {
                this.itemPlayMedia.setVisible(false);
                return;
            }
            return;
        }
        if (this.itemLocationDetails != null) {
            this.itemLocationDetails.setVisible(true);
        }
        boolean z2 = this.currentLocationInfo.parcelData() != null && !Strings.isNullOrEmpty(this.currentLocationInfo.parcelData().getMediaURL());
        if (this.itemPlayMedia != null) {
            this.itemPlayMedia.setVisible(z2);
        }
    }

    @Override
    public void onCreate(@Nullable Bundle bundle) {
        super.onCreate(bundle);
        setHasOptionsMenu(true);
    }

    @Override
    public void onCreateOptionsMenu(Menu menu, MenuInflater menuInflater) {
        super.onCreateOptionsMenu(menu, menuInflater);
        menuInflater.inflate(R.menu.contact_fragment_menu, menu);
        this.itemLocationDetails = menu.findItem(R.id.item_contacts_location_details);
        this.itemPlayMedia = menu.findItem(R.id.item_contacts_play_parcel_media);
        updateOptionsMenu();
    }

    @Override
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        super.onCreateView(layoutInflater, viewGroup, bundle);
        View inflate = layoutInflater.inflate(R.layout.contacts, viewGroup, false);
        ViewPager viewPager = (ViewPager) inflate.findViewById(R.id.contact_list_pager);
        viewPager.setAdapter(new ContactsPagerAdapter(getChildFragmentManager()));
        ((TabLayout) inflate.findViewById(R.id.contact_list_tabs)).setupWithViewPager(viewPager);
        return inflate;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        CurrentLocationInfo currentLocationInfoSnapshot;
        ParcelData parcelData;
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        switch (menuItem.getItemId()) {
            case R.id.item_contacts_location_details:
                if (userManager != null && (currentLocationInfoSnapshot = userManager.getCurrentLocationInfoSnapshot()) != null && (parcelData = currentLocationInfoSnapshot.parcelData()) != null) {
                    DetailsActivity.showEmbeddedDetails(getActivity(), ParcelPropertiesFragment.class, ParcelPropertiesFragment.makeSelection(userManager.getUserID(), parcelData));
                }
                return true;
            case R.id.item_contacts_play_parcel_media:
                StreamingMediaService.startStreamingMediaService(getContext(), userManager);
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    @Override
    public void onPrepareOptionsMenu(Menu menu) {
        super.onPrepareOptionsMenu(menu);
        updateOptionsMenu();
    }

    @Override
    public void onStart() {
        super.onStart();
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        if (userManager != null) {
            this.subscription = userManager.getCurrentLocationInfo().subscribe(SubscriptionSingleDataPool.getSingleDataKey(), UIThreadExecutor.getInstance(), new Subscription.OnData() {
                private final /* synthetic */ void $m$0(Object obj) {
                    ContactsFragment.this.onCurrentLocation((CurrentLocationInfo) obj);
                }

                @Override
                public final void onData(Object obj) {
                    $m$0(obj);
                }
            });
        }
    }

    @Override
    public void onStop() {
        if (this.subscription != null) {
            this.subscription.unsubscribe();
            this.subscription = null;
        }
        super.onStop();
    }
}
