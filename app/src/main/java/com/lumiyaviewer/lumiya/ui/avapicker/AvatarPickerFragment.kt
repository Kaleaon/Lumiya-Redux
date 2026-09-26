package com.lumiyaviewer.lumiya.ui.avapicker

import android.content.Context
import android.os.Bundle
import androidx.viewpager.widget.PagerAdapter
import androidx.viewpager.widget.ViewPager
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.FrameLayout
import android.widget.ListAdapter
import android.widget.ListView
import com.google.android.material.tabs.TabLayout
import com.google.common.base.Predicate
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.ChatterDisplayData
import com.lumiyaviewer.lumiya.slproto.users.manager.ChatterListType
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatterDisplayInfo
import com.lumiyaviewer.lumiya.ui.chat.contacts.ChatterListSubscriptionAdapter
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle

abstract class AvatarPickerFragment : FragmentWithTitle(), AdapterView.OnItemClickListener {

    open class AvatarPickerPagerAdapter : PagerAdapter() {
        private Context context

        constructor(context: Context) {
            this.context = context
        }

        override fun destroyItem(viewGroup: ViewGroup, i: Int, obj: Any) {
            internal fun if(View: obj instanceof):  {
                internal fun if(ListView: obj instanceof):  {
                    ((ListView) obj).setAdapter((ListAdapter) null)
                }
                viewGroup.removeView((View) obj)
            }
        }

        override fun getCount(): Int {
            return ContactListType.values().length
        }

        override fun getPageTitle(i: Int): CharSequence {
            if (i < 0 || i >= ContactListType.values().length) {
                return null
            }
            return ContactListType.values()[i].toString()
        }

        override fun instantiateItem(viewGroup: ViewGroup, i: Int): Any {
            if (i < 0 || i >= ContactListType.values().length) {
                return null
            }
            ContactListType contactListType = ContactListType.values()[i]
            ListView listView = ListView(this.context)
            listView.setOnItemClickListener(AvatarPickerFragment.this)
            listView.setAdapter(AvatarPickerFragment.this.createListAdapter(AvatarPickerFragment.this.getContext(), ActivityUtils.getUserManager(AvatarPickerFragment.this.getArguments()), contactListType))
            viewGroup.addView(listView)
            return listView
        }

        override fun isViewFromObject(view: View, obj: Any): Boolean {
            return view == obj
        }
    }

    private enum class ContactListType {
        Recent(R.drawable.ic_tab_card),
        Friends(R.drawable.ic_tab_contacts),
        Nearby(R.drawable.ic_tab_target)

        public int drawableId

        internal constructor(drawableId: Int) {
            this.drawableId = drawableId
        }

    }

    private class UsersOnlyPredicate : Predicate<ChatterDisplayData> {
        private constructor() {
        }

            this()
        }

        override fun apply(chatterDisplayData: ChatterDisplayData): Boolean {
            return chatterDisplayData != null && (chatterDisplayData.chatterID is ChatterID.ChatterIDUser) && chatterDisplayData.chatterID.isValidUUID()
        }
    }

    open fun createListAdapter(context: Context, userManager: UserManager, contactListType: ContactListType): ListAdapter {
        internal fun switch(contactListType):  {
            Friends -> {
                return ChatterListSubscriptionAdapter(context, userManager, ChatterListType.Friends)
            Nearby -> {
                return ChatterListSubscriptionAdapter(context, userManager, ChatterListType.Nearby)
            Recent -> {
                return ChatterListSubscriptionAdapter(context, userManager, ChatterListType.Active, UsersOnlyPredicate(null))
            else -> {
                throw IllegalArgumentException("Unknown contact list type")
        }
    }

    protected open fun createExtraView(layoutInflater: LayoutInflater, frameLayout: FrameLayout) {
    }

    public abstract String getTitle()

    protected abstract void onAvatarSelected(ChatterID chatterID, @Nullable String str)

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View {
        View inflate = layoutInflater.inflate(R.layout.avatar_picker, viewGroup, false)
        ViewPager viewPager = (ViewPager) inflate.findViewById(R.id.avatar_picker_pager)
        viewPager.setAdapter(AvatarPickerPagerAdapter(layoutInflater.getContext()))
        ((TabLayout) inflate.findViewById(R.id.avatar_picker_tabs)).setupWithViewPager(viewPager)
        createExtraView(layoutInflater, (FrameLayout) inflate.findViewById(R.id.avatar_picker_extra_content))
        return inflate
    }

    override fun onItemClick(adapterView: AdapterView<?>, view: View, i: Int, j: Long) {
        ChatterID chatterID
        Object itemAtPosition = adapterView.getItemAtPosition(i)
        if (!(itemAtPosition is ChatterDisplayInfo) || (chatterID = ((ChatterDisplayInfo) itemAtPosition).getChatterID(ActivityUtils.getUserManager(getArguments()))) == null) {
            return
        }
        onAvatarSelected(chatterID, ((ChatterDisplayInfo) itemAtPosition).getDisplayName())
    }
}
