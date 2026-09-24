package com.lumiyaviewer.lumiya.ui.avapicker;

import android.content.Context;
import android.os.Bundle;
import androidx.viewpager.widget.PagerAdapter;
import androidx.viewpager.widget.ViewPager;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.FrameLayout;
import android.widget.ListAdapter;
import android.widget.ListView;
import com.google.android.material.tabs.TabLayout;
import com.google.common.base.Predicate;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.manager.ChatterDisplayData;
import com.lumiyaviewer.lumiya.slproto.users.manager.ChatterListType;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.chat.ChatterDisplayInfo;
import com.lumiyaviewer.lumiya.ui.chat.contacts.ChatterListSubscriptionAdapter;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public abstract class AvatarPickerFragment extends FragmentWithTitle implements AdapterView.OnItemClickListener {

    public class AvatarPickerPagerAdapter extends PagerAdapter {
        private final Context context;

        public AvatarPickerPagerAdapter(Context context) {
            this.context = context;
        }

        @Override
        public void destroyItem(ViewGroup viewGroup, int i, Object obj) {
            if (obj instanceof View) {
                if (obj instanceof ListView) {
                    ((ListView) obj).setAdapter((ListAdapter) null);
                }
                viewGroup.removeView((View) obj);
            }
        }

        @Override
        public int getCount() {
            return ContactListType.values().length;
        }

        @Override
        public CharSequence getPageTitle(int i) {
            if (i < 0 || i >= ContactListType.values().length) {
                return null;
            }
            return ContactListType.values()[i].toString();
        }

        @Override
        public Object instantiateItem(ViewGroup viewGroup, int i) {
            if (i < 0 || i >= ContactListType.values().length) {
                return null;
            }
            ContactListType contactListType = ContactListType.values()[i];
            ListView listView = new ListView(this.context);
            listView.setOnItemClickListener(AvatarPickerFragment.this);
            listView.setAdapter(AvatarPickerFragment.this.createListAdapter(AvatarPickerFragment.this.getContext(), ActivityUtils.getUserManager(AvatarPickerFragment.this.getArguments()), contactListType));
            viewGroup.addView(listView);
            return listView;
        }

        @Override
        public boolean isViewFromObject(View view, Object obj) {
            return view == obj;
        }
    }

    private enum ContactListType {
        Recent(R.drawable.ic_tab_card),
        Friends(R.drawable.ic_tab_contacts),
        Nearby(R.drawable.ic_tab_target);

        public final int drawableId;

        ContactListType(int drawableId) {
            this.drawableId = drawableId;
        }

        /* renamed from: values, reason: to resolve conflict with enum method */
        public static ContactListType[] valuesCustom() {
            return values();
        }
    }

    private static class UsersOnlyPredicate implements Predicate<ChatterDisplayData> {
        private UsersOnlyPredicate() {
        }

        /* synthetic */ UsersOnlyPredicate(UsersOnlyPredicate usersOnlyPredicate) {
            this();
        }

        @Override
        public boolean apply(@Nullable ChatterDisplayData chatterDisplayData) {
            return chatterDisplayData != null && (chatterDisplayData.chatterID instanceof ChatterID.ChatterIDUser) && chatterDisplayData.chatterID.isValidUUID();
        }
    }

    @Nonnull
    public ListAdapter createListAdapter(Context context, UserManager userManager, @Nonnull ContactListType contactListType) {
        switch (contactListType) {
            case Friends:
                return new ChatterListSubscriptionAdapter(context, userManager, ChatterListType.Friends);
            case Nearby:
                return new ChatterListSubscriptionAdapter(context, userManager, ChatterListType.Nearby);
            case Recent:
                return new ChatterListSubscriptionAdapter(context, userManager, ChatterListType.Active, new UsersOnlyPredicate(null));
            default:
                throw new IllegalArgumentException("Unknown contact list type");
        }
    }

    protected void createExtraView(LayoutInflater layoutInflater, FrameLayout frameLayout) {
    }

    @Override
    public abstract String getTitle();

    protected abstract void onAvatarSelected(ChatterID chatterID, @Nullable String str);

    @Override
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        View inflate = layoutInflater.inflate(R.layout.avatar_picker, viewGroup, false);
        ViewPager viewPager = (ViewPager) inflate.findViewById(R.id.avatar_picker_pager);
        viewPager.setAdapter(new AvatarPickerPagerAdapter(layoutInflater.getContext()));
        ((TabLayout) inflate.findViewById(R.id.avatar_picker_tabs)).setupWithViewPager(viewPager);
        createExtraView(layoutInflater, (FrameLayout) inflate.findViewById(R.id.avatar_picker_extra_content));
        return inflate;
    }

    @Override
    public void onItemClick(AdapterView<?> adapterView, View view, int i, long j) {
        ChatterID chatterID;
        Object itemAtPosition = adapterView.getItemAtPosition(i);
        if (!(itemAtPosition instanceof ChatterDisplayInfo) || (chatterID = ((ChatterDisplayInfo) itemAtPosition).getChatterID(ActivityUtils.getUserManager(getArguments()))) == null) {
            return;
        }
        onAvatarSelected(chatterID, ((ChatterDisplayInfo) itemAtPosition).getDisplayName());
    }
}
