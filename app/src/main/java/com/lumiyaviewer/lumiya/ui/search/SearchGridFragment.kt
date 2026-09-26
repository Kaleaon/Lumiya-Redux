package com.lumiyaviewer.lumiya.ui.search

import android.os.Bundle
import androidx.recyclerview.widget.RecyclerView
import android.view.KeyEvent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.EditText
import android.widget.RadioGroup
import com.lumiyaviewer.lumiya.databinding.SearchFragmentBinding
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.SearchGridResult
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.modules.search.SearchGridQuery
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.profiles.GroupProfileFragment
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.ui.search.SearchGridAdapter
import de.greenrobot.dao.query.LazyList
import java.util.UUID

open class SearchGridFragment : FragmentWithTitle(), LoadableMonitor.OnLoadableDataChangedListener, SearchGridAdapter.OnSearchResultClickListener {

    private SearchGridAdapter adapter
    private SearchFragmentBinding binding
    private SubscriptionData<SearchGridQuery, LazyList<SearchGridResult>> searchResults = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private LoadableMonitor loadableMonitor = LoadableMonitor(this.searchResults).withDataChangedListener(this)

    private fun beginSearch() {
        SearchGridQuery.SearchType searchType
        UserManager userManager = ActivityUtils.getUserManager(getArguments())
        String trim = this.binding.searchString.getText().toString().trim()
        if (trim.isEmpty() || userManager == null) {
            return
        }
        when (this.binding.radiogroupSearchType.getCheckedRadioButtonId()) {
            R.id.radio_people -> {
                searchType = SearchGridQuery.SearchType.People
                }
            R.id.radio_places -> {
                searchType = SearchGridQuery.SearchType.Places
                }
            R.id.radio_groups -> {
                searchType = SearchGridQuery.SearchType.Groups
                }
            else -> {
                searchType = SearchGridQuery.SearchType.People
                }
        }
        this.searchResults.subscribe(userManager.getSearchManager().searchResults(), SearchGridQuery.create(UUID.randomUUID(), trim, searchType))
    }

    @JvmStatic
    fun newInstance(uuid: UUID): SearchGridFragment {
        SearchGridFragment searchGridFragment = SearchGridFragment()
        Bundle bundle = Bundle()
        ActivityUtils.setActiveAgentID(bundle, uuid)
        searchGridFragment.setArguments(bundle)
        return searchGridFragment
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View {
        super.onCreateView(layoutInflater, viewGroup, bundle)
        this.binding = SearchFragmentBinding.inflate(layoutInflater, viewGroup, false)
        this.adapter = SearchGridAdapter(layoutInflater.getContext(), ActivityUtils.getActiveAgentID(getArguments()), this)
        this.binding.searchResultsList.setAdapter(this.adapter)
        setTitle(getString(R.string.search), null)
        this.binding.searchString.setOnEditorActionListener((textView, actionId, keyEvent) -> onSearchTextAction(actionId, keyEvent))
        this.binding.startSearchButton.setOnClickListener(v -> onSearchButtonClicked())
        this.loadableMonitor.setLoadingLayout((LoadingLayout) this.binding.getRoot().findViewById(R.id.loading_layout), getString(R.string.enter_text_to_search), getString(R.string.search_fail))
        return this.binding.getRoot()
    }

    override fun onDestroyView() {
        this.binding = null
        super.onDestroyView()
    }

    override fun onLoadableDataChanged() {
        internal fun if(null: this.adapter !=):  {
            LazyList<SearchGridResult> data = this.searchResults.getData()
            this.adapter.setData(data)
            this.loadableMonitor.setEmptyMessage(data != null ? data.isEmpty() : false, getString(R.string.nothing_found))
        }
    }

    open fun onSearchButtonClicked() {
        beginSearch()
    }

    override fun onSearchResultClicked(searchGridResult: SearchGridResult) {
        UUID activeAgentID = ActivityUtils.getActiveAgentID(getArguments())
        internal fun if(null: searchGridResult == null || activeAgentID ==):  {
            return
        }
        when (SearchGridQuery.SearchType.values()[searchGridResult.getItemType()]) {
            Groups -> {
                DetailsActivity.showEmbeddedDetails(getActivity(), GroupProfileFragment.class, GroupProfileFragment.makeSelection(ChatterID.getGroupChatterID(activeAgentID, searchGridResult.getItemUUID())))
                }
            People -> {
                DetailsActivity.showEmbeddedDetails(getActivity(), UserProfileFragment.class, UserProfileFragment.makeSelection(ChatterID.getUserChatterID(activeAgentID, searchGridResult.getItemUUID())))
                }
            Places -> {
                DetailsActivity.showEmbeddedDetails(getActivity(), ParcelInfoFragment.class, ParcelInfoFragment.makeSelection(activeAgentID, searchGridResult.getItemUUID()))
                }
        }
    }

    open fun onSearchTextAction(i: Int, keyEvent: KeyEvent): Boolean {
        if (i != 3 && (keyEvent == null || keyEvent.getAction() != 0 || keyEvent.getKeyCode() != 66)) {
            return false
        }
        beginSearch()
        return true
    }
}
