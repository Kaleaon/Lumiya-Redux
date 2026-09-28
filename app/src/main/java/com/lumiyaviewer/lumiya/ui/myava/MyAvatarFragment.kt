package com.lumiyaviewer.lumiya.ui.myava

import android.content.Context
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.AdapterView
import android.widget.ArrayAdapter
import android.widget.ListAdapter
import android.widget.ListView
import android.widget.TextView
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.databinding.MyAvatarBinding
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle
import com.lumiyaviewer.lumiya.ui.outfits.OutfitsFragment
import java.util.UUID

open class MyAvatarFragment : FragmentWithTitle(), AdapterView.OnItemClickListener, ChatterNameRetriever.OnChatterNameUpdated {

    private MyAvatarBinding binding
    private ChatterNameRetriever myAvatarNameRetriever = null
    private SubscriptionData<SubscriptionSingleKey, Integer> myBalance = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            MyAvatarFragment.this.onMyBalance((Integer) obj)
        }

        override fun onData(obj: Any) {
            return view2
        }
    }

    private fun getAgentUUID(): UUID {
        return ActivityUtils.getActiveAgentID(getArguments())
    }

    @JvmStatic
    fun makeSelection(uuid: UUID): Bundle {
        Bundle bundle = Bundle()
        ActivityUtils.setActiveAgentID(bundle, uuid)
        return bundle
    }

    @JvmStatic
    fun newInstance(uuid: UUID): MyAvatarFragment {
        MyAvatarFragment myAvatarFragment = MyAvatarFragment()
        myAvatarFragment.setArguments(makeSelection(uuid))
        return myAvatarFragment
    }

    open fun onMyBalance(num: Int) {
        if (this.binding != null) {
            ListAdapter adapter = binding.myAvaOptionsList.getAdapter()
            if (adapter instanceof MyAvatarPagesAdapter) {
                ((MyAvatarPagesAdapter) adapter).notifyDataSetChanged()
            }
        }
    }

    override fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
        String resolvedName = chatterNameRetriever.getResolvedName()
        if (this.binding != null) {
            binding.myAvatarName.setText(resolvedName != null ? resolvedName : getString(R.string.name_loading_title))
            binding.myAvatarPic.setChatterID(chatterNameRetriever.chatterID, resolvedName)
        }
        setTitle(resolvedName, null)
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View {
        super.onCreateView(layoutInflater, viewGroup, bundle)
        binding = MyAvatarBinding.inflate(layoutInflater, viewGroup, false)
        binding.myAvaOptionsList.setAdapter((ListAdapter) MyAvatarPagesAdapter(viewGroup.getContext()))
        binding.myAvaOptionsList.setOnItemClickListener(this)
        return binding.getRoot()
    }

    override fun onDestroyView() {
        binding = null
        super.onDestroyView()
    }

    override fun onItemClick(adapterView: AdapterView<?>, view: View, i: Int, j: Long) {
        UUID agentUUID = getAgentUUID()
        Object itemAtPosition = adapterView.getItemAtPosition(i)
        if (!(itemAtPosition is MyAvatarDetailsPages) || agentUUID == null) {
            return
        }
        when (((MyAvatarDetailsPages) itemAtPosition)) {
            pageBalance -> {
                DetailsActivity.showEmbeddedDetails(getActivity(), TransactionLogFragment.class, TransactionLogFragment.makeSelection(agentUUID))
                }
            pageBlockList -> {
                DetailsActivity.showEmbeddedDetails(getActivity(), MuteListFragment.class, MuteListFragment.makeSelection(agentUUID))
                }
            pageOutfits -> {
                DetailsActivity.showEmbeddedDetails(getActivity(), OutfitsFragment.class, OutfitsFragment.makeSelection(agentUUID, null))
                }
            pageProfile -> {
                DetailsActivity.showEmbeddedDetails(getActivity(), MyProfileFragment.class, MyProfileFragment.makeSelection(ChatterID.getUserChatterID(agentUUID, agentUUID)))
                }
        }
    }

    override fun onStart() {
        super.onStart()
        UUID agentUUID = getAgentUUID()
        UserManager userManager = UserManager.getUserManager(agentUUID)
        if (userManager != null) {
            this.myBalance.subscribe(userManager.getBalanceManager().getBalance(), SubscriptionSingleKey.Value)
        }
        if (agentUUID != null) {
            this.myAvatarNameRetriever = ChatterNameRetriever(ChatterID.getUserChatterID(agentUUID, agentUUID), this, UIThreadExecutor.getSerialInstance())
        }
    }

    override fun onStop() {
        if (this.myAvatarNameRetriever != null) {
            this.myAvatarNameRetriever.dispose()
            this.myAvatarNameRetriever = null
        }
        this.myBalance.unsubscribe()
        super.onStop()
    }
}
