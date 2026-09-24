package com.lumiyaviewer.lumiya.ui.search;

import android.os.Bundle;
import androidx.recyclerview.widget.RecyclerView;
import android.view.KeyEvent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.RadioGroup;
import butterknife.BindView;
import butterknife.ButterKnife;
import butterknife.OnClick;
import butterknife.OnEditorAction;
import butterknife.Unbinder;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.dao.SearchGridResult;
import com.lumiyaviewer.lumiya.react.SubscriptionData;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.modules.search.SearchGridQuery;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import com.lumiyaviewer.lumiya.ui.chat.profiles.GroupProfileFragment;
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment;
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils;
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity;
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle;
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout;
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor;
import com.lumiyaviewer.lumiya.ui.search.SearchGridAdapter;
import de.greenrobot.dao.query.LazyList;
import java.util.UUID;

public class SearchGridFragment extends FragmentWithTitle implements LoadableMonitor.OnLoadableDataChangedListener, SearchGridAdapter.OnSearchResultClickListener {

    private SearchGridAdapter adapter;

    @BindView(R.id.radiogroup_search_type)
    RadioGroup radioGroupSearchType;

    @BindView(R.id.search_results_list)
    RecyclerView searchResultsList;

    @BindView(R.id.search_string)
    EditText searchString;
    private Unbinder unbinder;
    private final SubscriptionData<SearchGridQuery, LazyList<SearchGridResult>> searchResults = new SubscriptionData<>(UIThreadExecutor.getInstance());
    private final LoadableMonitor loadableMonitor = new LoadableMonitor(this.searchResults).withDataChangedListener(this);

    private void beginSearch() {
        SearchGridQuery.SearchType searchType;
        UserManager userManager = ActivityUtils.getUserManager(getArguments());
        String trim = this.searchString.getText().toString().trim();
        if (trim.isEmpty() || userManager == null) {
            return;
        }
        switch (this.radioGroupSearchType.getCheckedRadioButtonId()) {
            case R.id.radio_people:
                searchType = SearchGridQuery.SearchType.People;
                break;
            case R.id.radio_places:
                searchType = SearchGridQuery.SearchType.Places;
                break;
            case R.id.radio_groups:
                searchType = SearchGridQuery.SearchType.Groups;
                break;
            default:
                searchType = SearchGridQuery.SearchType.People;
                break;
        }
        this.searchResults.subscribe(userManager.getSearchManager().searchResults(), SearchGridQuery.create(UUID.randomUUID(), trim, searchType));
    }

    public static SearchGridFragment newInstance(UUID uuid) {
        SearchGridFragment searchGridFragment = new SearchGridFragment();
        Bundle bundle = new Bundle();
        ActivityUtils.setActiveAgentID(bundle, uuid);
        searchGridFragment.setArguments(bundle);
        return searchGridFragment;
    }

    @Override
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        super.onCreateView(layoutInflater, viewGroup, bundle);
        View inflate = layoutInflater.inflate(R.layout.search_fragment, viewGroup, false);
        this.unbinder = ButterKnife.bind(this, inflate);
        this.adapter = new SearchGridAdapter(layoutInflater.getContext(), ActivityUtils.getActiveAgentID(getArguments()), this);
        this.searchResultsList.setAdapter(this.adapter);
        setTitle(getString(R.string.search), null);
        this.loadableMonitor.setLoadingLayout((LoadingLayout) inflate.findViewById(R.id.loading_layout), getString(R.string.enter_text_to_search), getString(R.string.search_fail));
        return inflate;
    }

    @Override
    public void onDestroyView() {
        this.unbinder.unbind();
        super.onDestroyView();
    }

    @Override
    public void onLoadableDataChanged() {
        if (this.adapter != null) {
            LazyList<SearchGridResult> data = this.searchResults.getData();
            this.adapter.setData(data);
            this.loadableMonitor.setEmptyMessage(data != null ? data.isEmpty() : false, getString(R.string.nothing_found));
        }
    }

    @OnClick({R.id.start_search_button})
    public void onSearchButtonClicked() {
        beginSearch();
    }

    @Override
    public void onSearchResultClicked(SearchGridResult searchGridResult) {
        UUID activeAgentID = ActivityUtils.getActiveAgentID(getArguments());
        if (searchGridResult == null || activeAgentID == null) {
            return;
        }
        switch (SearchGridQuery.SearchType.values()[searchGridResult.getItemType()]) {
            case Groups:
                DetailsActivity.showEmbeddedDetails(getActivity(), GroupProfileFragment.class, GroupProfileFragment.makeSelection(ChatterID.getGroupChatterID(activeAgentID, searchGridResult.getItemUUID())));
                break;
            case People:
                DetailsActivity.showEmbeddedDetails(getActivity(), UserProfileFragment.class, UserProfileFragment.makeSelection(ChatterID.getUserChatterID(activeAgentID, searchGridResult.getItemUUID())));
                break;
            case Places:
                DetailsActivity.showEmbeddedDetails(getActivity(), ParcelInfoFragment.class, ParcelInfoFragment.makeSelection(activeAgentID, searchGridResult.getItemUUID()));
                break;
        }
    }

    @OnEditorAction({R.id.search_string})
    public boolean onSearchTextAction(int i, KeyEvent keyEvent) {
        if (i != 3 && (keyEvent == null || keyEvent.getAction() != 0 || keyEvent.getKeyCode() != 66)) {
            return false;
        }
        beginSearch();
        return true;
    }
}
