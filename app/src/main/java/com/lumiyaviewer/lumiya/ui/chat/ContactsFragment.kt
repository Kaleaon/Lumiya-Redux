package com.lumiyaviewer.lumiya.ui.chat

import androidx.fragment.app.FragmentActivity
import com.google.common.base.Strings
import android.os.Bundle
import android.os.Parcelable
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentStatePagerAdapter
import androidx.viewpager.widget.PagerAdapter
import androidx.viewpager.widget.ViewPager
import android.view.LayoutInflater
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import com.google.android.material.tabs.TabLayout
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.StreamingMediaService
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionSingleDataPool
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.ParcelData
import com.lumiyaviewer.lumiya.slproto.users.manager.CurrentLocationInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.contacts.ActiveChattersFragment
import com.lumiyaviewer.lumiya.ui.chat.contacts.FriendListFragment
import com.lumiyaviewer.lumiya.ui.chat.contacts.GroupListFragment
import com.lumiyaviewer.lumiya.ui.chat.contacts.NearbyUsersFragment
import com.lumiyaviewer.lumiya.ui.chat.profiles.ParcelPropertiesFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.render.CardboardActivity

open class ContactsFragment : Fragment() {
    private CurrentLocationInfo currentLocationInfo
    private MenuItem itemLocationDetails = null
    private MenuItem itemPlayMedia = null
    private Subscription subscription

    private enum class ContactListType {
        Active,
        Friends,
        Groups,
        Nearby

    }

    private class ContactsPagerAdapter : FragmentStatePagerAdapter() {

        internal constructor(fragmentManager: FragmentManager) {
            super(fragmentManager, BEHAVIOR_RESUME_ONLY_CURRENT_FRAGMENT)
        }

        override fun getCount(): Int {
            return ContactListType.values().length
        }

        override fun getItem(i: Int): Fragment {
            Fragment nearbyUsersFragment
            when (ContactListType.values()[i]) {
                Active -> {
                    nearbyUsersFragment = ActiveChattersFragment()
                    }
                Friends -> {
                    nearbyUsersFragment = FriendListFragment()
                    }
                Groups -> {
                    nearbyUsersFragment = GroupListFragment()
                    }
                Nearby -> {
                    nearbyUsersFragment = NearbyUsersFragment()
                    }
                else -> {
                    nearbyUsersFragment = null
                    }
            }
            if (nearbyUsersFragment != null) {
                Bundle arguments = ContactsFragment.this.getArguments()
                Bundle makeFragmentArguments = ActivityUtils.makeFragmentArguments(ActivityUtils.getActiveAgentID(arguments), null)
                if (arguments.containsKey(CardboardActivity.VR_MODE_TAG)) {
                    makeFragmentArguments.putBoolean(CardboardActivity.VR_MODE_TAG, arguments.getBoolean(CardboardActivity.VR_MODE_TAG))
                }
                nearbyUsersFragment.setArguments(makeFragmentArguments)
            }
            return nearbyUsersFragment
        }

        override fun getPageTitle(i: Int): CharSequence {
            int nearbyUsers
            ContactListType contactListType = ContactListType.values()[i]
            String name = contactListType.name()
            return (contactListType != ContactListType.Nearby || ContactsFragment.this.currentLocationInfo == null || (nearbyUsers = ContactsFragment.this.currentLocationInfo.nearbyUsers()) == 0) ? name : name + " (" + Integer.toString(nearbyUsers) + ")"
        }

        override fun saveState(): Parcelable {
            return null
        }
    }

    @JvmStatic
    fun newInstance(bundle: Bundle): ContactsFragment {
        ContactsFragment contactsFragment = ContactsFragment()
        contactsFragment.setArguments(bundle)
        return contactsFragment
    }

    open fun onCurrentLocation(currentLocationInfo: CurrentLocationInfo) {
        ViewPager viewPager
        PagerAdapter adapter
        this.currentLocationInfo = currentLocationInfo
        View view = getView()
        if (view != null && (viewPager = (ViewPager) view.findViewById(R.id.contact_list_pager)) != null && (adapter = viewPager.getAdapter()) != null) {
            adapter.notifyDataSetChanged()
        }
        updateOptionsMenu()
    }

    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private fun updateOptionsMenu() {
        boolean z = false
        if (this.currentLocationInfo != null) {
            FragmentActivity activity = getActivity()
            if (activity instanceof DetailsActivity) {
                Fragment currentDetailsFragment = ((DetailsActivity) activity).getCurrentDetailsFragment()
                z = currentDetailsFragment == null || currentDetailsFragment == this
            } else {
                z = false
            }
        }
        if (!z) {
            if (this.itemLocationDetails != null) {
                this.itemLocationDetails.setVisible(false)
            }
            if (this.itemPlayMedia != null) {
                this.itemPlayMedia.setVisible(false)
                return
            }
            return
        }
        if (this.itemLocationDetails != null) {
            this.itemLocationDetails.setVisible(true)
        }
        boolean z2 = this.currentLocationInfo.parcelData() != null && !Strings.isNullOrEmpty(this.currentLocationInfo.parcelData().getMediaURL())
        if (this.itemPlayMedia != null) {
            this.itemPlayMedia.setVisible(z2)
        }
    }

    override fun onCreate(bundle: Bundle) {
        super.onCreate(bundle)
        setHasOptionsMenu(true)
    }

    override fun onCreateOptionsMenu(menu: Menu, menuInflater: MenuInflater) {
        super.onCreateOptionsMenu(menu, menuInflater)
        menuInflater.inflate(R.menu.contact_fragment_menu, menu)
        this.itemLocationDetails = menu.findItem(R.id.item_contacts_location_details)
        this.itemPlayMedia = menu.findItem(R.id.item_contacts_play_parcel_media)
        updateOptionsMenu()
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View {
        super.onCreateView(layoutInflater, viewGroup, bundle)
        View inflate = layoutInflater.inflate(R.layout.contacts, viewGroup, false)
        ViewPager viewPager = (ViewPager) inflate.findViewById(R.id.contact_list_pager)
        viewPager.setAdapter(ContactsPagerAdapter(getChildFragmentManager()))
        ((TabLayout) inflate.findViewById(R.id.contact_list_tabs)).setupWithViewPager(viewPager)
        return inflate
    }

    override fun onOptionsItemSelected(menuItem: MenuItem): Boolean {
        CurrentLocationInfo currentLocationInfoSnapshot
        ParcelData parcelData
        UserManager userManager = ActivityUtils.getUserManager(getArguments())
        when (menuItem.getItemId()) {
            R.id.item_contacts_location_details -> {
                if (userManager != null && (currentLocationInfoSnapshot = userManager.getCurrentLocationInfoSnapshot()) != null && (parcelData = currentLocationInfoSnapshot.parcelData()) != null) {
                    DetailsActivity.showEmbeddedDetails(getActivity(), ParcelPropertiesFragment.class, ParcelPropertiesFragment.makeSelection(userManager.getUserID(), parcelData))
                }
                return true
            R.id.item_contacts_play_parcel_media -> {
                StreamingMediaService.startStreamingMediaService(getContext(), userManager)
                return true
            else -> {
                return super.onOptionsItemSelected(menuItem)
        }
    }

    override fun onPrepareOptionsMenu(menu: Menu) {
        super.onPrepareOptionsMenu(menu)
        updateOptionsMenu()
    }

    override fun onStart() {
        super.onStart()
        UserManager userManager = ActivityUtils.getUserManager(getArguments())
        if (userManager != null) {
            this.subscription = userManager.getCurrentLocationInfo().subscribe(SubscriptionSingleDataPool.getSingleDataKey(), UIThreadExecutor.getInstance(), Subscription.OnData() {
                    ContactsFragment.this.onCurrentLocation((CurrentLocationInfo) obj)
                }

                override fun onData(obj: Any) {