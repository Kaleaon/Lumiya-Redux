package com.lumiyaviewer.lumiya.ui.search;

import android.annotation.SuppressLint;
import android.view.View;
import android.widget.TextView;
import androidx.recyclerview.widget.RecyclerView;
import butterknife.BindView;
import butterknife.ButterKnife;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.dao.SearchGridResult;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.modules.search.SearchGridQuery;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever;
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView;

/* loaded from: classes.dex */
class SearchViewHolder extends RecyclerView.ViewHolder implements ChatterNameRetriever.OnChatterNameUpdated, View.OnClickListener {
    private final SearchGridAdapter adapter;
    private ChatterNameRetriever chatterNameRetriever;

    @BindView(R.id.result_item_name)
    TextView resultItemName;

    @BindView(R.id.result_member_count)
    TextView resultMemberCount;
    private SearchGridResult searchGridResult;

    @BindView(R.id.userPicView)
    ChatterPicView userPicView;

    SearchViewHolder(SearchGridAdapter searchGridAdapter, View view) {
        super(view);
        this.adapter = searchGridAdapter;
        this.chatterNameRetriever = null;
        ButterKnife.bind(this, view);
        view.setOnClickListener(this);
    }

    @SuppressLint({"DefaultLocale", "SetTextI18n"})
    void bindToData(SearchGridResult searchGridResult) {
        this.searchGridResult = searchGridResult;
        this.resultItemName.setText(searchGridResult.getItemName());
        if (searchGridResult.getItemType() == SearchGridQuery.SearchType.Groups.ordinal()) {
            Integer memberCount = searchGridResult.getMemberCount();
            this.resultMemberCount.setVisibility(0);
            this.resultMemberCount.setText(Integer.toString(memberCount != null ? memberCount.intValue() : 0));
        } else {
            this.resultMemberCount.setVisibility(8);
        }
        if (this.chatterNameRetriever != null) {
            this.chatterNameRetriever.dispose();
            this.chatterNameRetriever = null;
        }
        if (searchGridResult.getItemType() == SearchGridQuery.SearchType.Groups.ordinal()) {
            this.userPicView.setChatterID(ChatterID.getGroupChatterID(this.adapter.getAgentUUID(), searchGridResult.getItemUUID()), searchGridResult.getItemName());
            this.userPicView.setVisibility(0);
        } else if (searchGridResult.getItemType() != SearchGridQuery.SearchType.People.ordinal()) {
            this.userPicView.setVisibility(8);
        } else {
            ChatterID.ChatterIDUser userChatterID = ChatterID.getUserChatterID(this.adapter.getAgentUUID(), searchGridResult.getItemUUID());
            this.userPicView.setChatterID(userChatterID, searchGridResult.getItemName());
            this.userPicView.setVisibility(0);
            this.chatterNameRetriever = new ChatterNameRetriever(userChatterID, this, UIThreadExecutor.getInstance(), false);
            this.chatterNameRetriever.subscribe();
        }
    }

    @Override
    public void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
        String resolvedName;
        if (chatterNameRetriever != this.chatterNameRetriever || (resolvedName = chatterNameRetriever.getResolvedName()) == null) {
            return;
        }
        this.resultItemName.setText(resolvedName);
    }

    @Override
    public void onClick(View view) {
        if (this.adapter.getOnSearchResultClickListener() == null || this.searchGridResult == null) {
            return;
        }
        this.adapter.getOnSearchResultClickListener().onSearchResultClicked(this.searchGridResult);
    }

    void onRecycled() {
        this.userPicView.setChatterID(null, null);
        if (this.chatterNameRetriever != null) {
            this.chatterNameRetriever.dispose();
            this.chatterNameRetriever = null;
        }
        this.searchGridResult = null;
    }
}
