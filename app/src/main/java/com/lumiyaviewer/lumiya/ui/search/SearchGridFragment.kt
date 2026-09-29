package com.lumiyaviewer.lumiya.ui.search

import android.os.Bundle
import android.view.KeyEvent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.dao.SearchGridResult
import com.lumiyaviewer.lumiya.databinding.SearchFragmentBinding
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.modules.search.SearchGridQuery
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.ui.chat.profiles.GroupProfileFragment
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import de.greenrobot.dao.query.LazyList
import java.util.UUID

open class SearchGridFragment : FragmentWithTitle(),
    LoadableMonitor.OnLoadableDataChangedListener,
    SearchGridAdapter.OnSearchResultClickListener {

    private SearchGridAdapter adapter
    private SearchFragmentBinding binding
    private SubscriptionData<SearchGridQuery, LazyList<SearchGridResult>> searchResults = SubscriptionData<>(UIThreadExecutor.getInstance())
    private LoadableMonitor loadableMonitor = LoadableMonitor(this.searchResults).withDataChangedListener(this)

    private fun beginSearch() {
        val userManager = ActivityUtils.getUserManager(arguments) ?: return
        val currentBinding = binding ?: return
        val searchText = currentBinding.searchString.text.toString().trim()
        if (searchText.isEmpty()) return

        val searchType = when (currentBinding.radiogroupSearchType.checkedRadioButtonId) {
            R.id.radio_places -> SearchGridQuery.SearchType.Places
            R.id.radio_groups -> SearchGridQuery.SearchType.Groups
            else -> SearchGridQuery.SearchType.People
        }
        searchResults.subscribe(
            userManager.getSearchManager().searchResults(),
            SearchGridQuery.create(UUID.randomUUID(), searchText, searchType)
        )
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, state: Bundle?): View {
        super.onCreateView(inflater, container, state)
        val currentBinding = SearchFragmentBinding.inflate(inflater, container, false)
        val agentId = ActivityUtils.getActiveAgentID(arguments)
            ?: error("SearchGridFragment requires an active agent ID")
        binding = currentBinding
        adapter = SearchGridAdapter(inflater.context, agentId, this)
        currentBinding.searchResultsList.adapter = adapter
        setTitle(getString(R.string.search), null)
        currentBinding.searchString.setOnEditorActionListener { _, actionId, event ->
            onSearchTextAction(actionId, event)
        }
        currentBinding.startSearchButton.setOnClickListener { onSearchButtonClicked() }
        loadableMonitor.setLoadingLayout(
            currentBinding.root.findViewById<LoadingLayout>(R.id.loading_layout),
            getString(R.string.enter_text_to_search),
            getString(R.string.search_fail)
        )
        return currentBinding.root
    }

    override fun onDestroyView() {
        adapter = null
        binding = null
        super.onDestroyView()
    }

    override fun onLoadableDataChanged() {
        val data = searchResults.getData() ?: return
        adapter?.setData(data)
        loadableMonitor.setEmptyMessage(data.isEmpty(), getString(R.string.nothing_found))
    }

    open fun onSearchButtonClicked() = beginSearch()

    override fun onSearchResultClicked(result: SearchGridResult) {
        val agentId = ActivityUtils.getActiveAgentID(arguments) ?: return
        val currentActivity = activity ?: return
        val itemId = result.itemUUID ?: return
        when (SearchGridQuery.SearchType.values()[result.itemType]) {
            SearchGridQuery.SearchType.Groups -> DetailsActivity.showEmbeddedDetails(
                currentActivity,
                GroupProfileFragment::class.java,
                GroupProfileFragment.makeSelection(ChatterID.getGroupChatterID(agentId, itemId))
            )
            SearchGridQuery.SearchType.People -> DetailsActivity.showEmbeddedDetails(
                currentActivity,
                UserProfileFragment::class.java,
                UserProfileFragment.makeSelection(ChatterID.getUserChatterID(agentId, itemId))
            )
            SearchGridQuery.SearchType.Places -> DetailsActivity.showEmbeddedDetails(
                currentActivity,
                ParcelInfoFragment::class.java,
                ParcelInfoFragment.makeSelection(agentId, itemId)
            )
        }
    }

    open fun onSearchTextAction(actionId: Int, event: KeyEvent?): Boolean {
        if (actionId != 3 && (event == null || event.action != KeyEvent.ACTION_DOWN || event.keyCode != KeyEvent.KEYCODE_ENTER)) {
            return false
        }
        beginSearch()
        return true
    }

    companion object {
        @JvmStatic
        fun newInstance(agentId: UUID) = SearchGridFragment().apply {
            arguments = Bundle().also { ActivityUtils.setActiveAgentID(it, agentId) }
        }
    }
}
