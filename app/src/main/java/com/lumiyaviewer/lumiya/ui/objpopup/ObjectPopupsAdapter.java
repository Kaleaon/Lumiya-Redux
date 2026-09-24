package com.lumiyaviewer.lumiya.ui.objpopup;

import android.content.Context;
import androidx.recyclerview.widget.RecyclerView;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import com.lumiyaviewer.lumiya.slproto.chat.generic.ChatEventViewHolder;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.users.manager.SubscribableList;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.common.RecyclerSubscribableListAdapter;

public class ObjectPopupsAdapter extends RecyclerSubscribableListAdapter<SLChatEvent> {
    private final Context context;
    private final LayoutInflater layoutInflater;
    private final UserManager userManager;

    public ObjectPopupsAdapter(Context context, SubscribableList<SLChatEvent> subscribableList, UserManager userManager) {
        super(subscribableList);
        this.context = context;
        this.userManager = userManager;
        this.layoutInflater = LayoutInflater.from(context);
    }

    @Override
    public void bindObjectViewHolder(RecyclerView.ViewHolder viewHolder, SLChatEvent chatEvent) {
        if (viewHolder instanceof ChatEventViewHolder) {
            chatEvent.bindViewHolder((ChatEventViewHolder) viewHolder, this.userManager, null);
        }
    }

    @Override
    protected RecyclerView.ViewHolder createObjectViewHolder(ViewGroup viewGroup, int i) {
        return SLChatEvent.createViewHolder(this.layoutInflater, i, viewGroup, this);
    }

    @Override
    public int getObjectViewType(SLChatEvent chatEvent) {
        return chatEvent.getViewType().ordinal();
    }
}
