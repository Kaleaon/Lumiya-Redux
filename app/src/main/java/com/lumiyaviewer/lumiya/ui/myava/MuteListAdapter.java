package com.lumiyaviewer.lumiya.ui.myava;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.ImageView;
import android.widget.TextView;
import com.google.common.collect.ImmutableList;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteListEntry;
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteType;
import com.lumiyaviewer.lumiya.ui.common.SwipeDismissListViewTouchListener;
import java.util.Collection;
import java.util.List;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

class MuteListAdapter extends BaseAdapter {

    private final LayoutInflater layoutInflater;

    @Nonnull
    private ImmutableList<MuteListEntry> muteList = ImmutableList.of();

    MuteListAdapter(Context context) {
        this.layoutInflater = LayoutInflater.from(context);
    }

    @Override
    public int getCount() {
        return this.muteList.size();
    }

    @Override
    public MuteListEntry getItem(int i) {
        if (i < 0 || i >= this.muteList.size()) {
            return null;
        }
        return this.muteList.get(i);
    }

    @Override
    public long getItemId(int i) {
        return 0L;
    }

    @Override
    public View getView(int i, View view, ViewGroup viewGroup) {
        int i2;
        MuteListEntry item = getItem(i);
        if (item != null) {
            if (view == null) {
                view = this.layoutInflater.inflate(R.layout.mute_list_item, viewGroup, false);
            }
            if (view != null) {
                ((TextView) view.findViewById(R.id.muteName)).setText(item.name);
                switch (item.type) {
                    case AGENT:
                    case GROUP:
                        i2 = R.drawable.inv_human;
                        break;
                    case BY_NAME:
                    case OBJECT:
                        i2 = R.drawable.inv_object;
                        break;
                    case EXTERNAL:
                    default:
                        i2 = R.drawable.inv_link;
                        break;
                }
                ((ImageView) view.findViewById(R.id.muteTypeIcon)).setImageResource(i2);
                SwipeDismissListViewTouchListener.restoreViewState(view);
                return view;
            }
        }
        return null;
    }

    @Override
    public boolean hasStableIds() {
        return false;
    }

    void setData(@Nullable List<MuteListEntry> list) {
        this.muteList = list != null ? ImmutableList.copyOf((Collection) list) : ImmutableList.of();
        notifyDataSetChanged();
    }
}
