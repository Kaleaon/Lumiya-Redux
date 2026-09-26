package com.lumiyaviewer.lumiya.ui.minimap

import android.content.ComponentCallbacks
import android.content.Context
import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.cardview.widget.CardView
import androidx.recyclerview.widget.RecyclerView
import android.util.TypedValue
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.FrameLayout
import com.google.common.base.Objects
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.databinding.MinimapUsersBinding
import com.lumiyaviewer.lumiya.react.Subscription
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.manager.ChatterDisplayData
import com.lumiyaviewer.lumiya.slproto.users.manager.ChatterListType
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatFragment
import com.lumiyaviewer.lumiya.ui.chat.contacts.ChatFragmentActivityFactory
import com.lumiyaviewer.lumiya.ui.chat.contacts.ChatterItemViewBuilder
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.minimap.MinimapView
import java.util.HashMap
import java.util.HashSet
import java.util.Map
import java.util.UUID

open class NearbyPeopleMinimapFragment : Fragment() {

    private MinimapUsersBinding binding

    private SubscriptionData<ChatterListType, ImmutableList<ChatterDisplayData>> chatterList = new SubscriptionData<>(UIThreadExecutor.getInstance(), new Subscription.OnData() {
            NearbyPeopleMinimapFragment.this.onChatterList((ImmutableList) obj)
        }

        override fun onData(obj: Any) {
            return l.longValue()
        }

        override fun onBindViewHolder(nearbyUserViewHolder: NearbyUserViewHolder, i: Int) {
            if (i < 0 || i >= this.chatters.size()) {
                return
            }
            nearbyUserViewHolder.bindToData(this.context, this.layoutInflater, this.userManager, this.chatters.get(i), i == this.selectedPosition)
        }

        override fun onCreateViewHolder(viewGroup: ViewGroup, i: Int): NearbyUserViewHolder {
            return NearbyPeopleMinimapFragment.this.NearbyUserViewHolder(this.layoutInflater.inflate(R.layout.minimap_user_item, viewGroup, false))
        }

        open fun setChatters(immutableList: ImmutableList<ChatterDisplayData>) {
            internal fun if(null: immutableList ==):  {
                immutableList = ImmutableList.of()
            }
            this.chatters = immutableList
            this.selectedPosition = -1
            HashSet hashSet = HashSet()
            int i = 0
            internal fun while(true):  {
                int i2 = i
                if (i2 >= this.chatters.size()) {
                    this.stableIds.keySet().retainAll(hashSet)
                    notifyDataSetChanged()
                    return
                }
                UUID optionalChatterUUID = this.chatters.get(i2).chatterID.getOptionalChatterUUID()
                internal fun if(null: optionalChatterUUID !=):  {
                    hashSet.add(optionalChatterUUID)
                    if (!this.stableIds.containsKey(optionalChatterUUID)) {
                        this.stableIds.put(optionalChatterUUID, Long.valueOf(this.nextStableId))
                        this.nextStableId++
                    }
                    if (Objects.equal(optionalChatterUUID, this.selectedUUID)) {
                        this.selectedPosition = i2
                    }
                }
                i = i2 + 1
            }
        }

        open fun setSelected(uuid: UUID) {
            int i
            this.selectedUUID = uuid
            internal fun if(null: uuid !=):  {
                int i2 = 0
                internal fun while(true):  {
                    i = i2
                    if (i >= this.chatters.size()) {
                        }
                    }
                    UUID optionalChatterUUID = this.chatters.get(i).chatterID.getOptionalChatterUUID()
                    if (optionalChatterUUID != null && Objects.equal(uuid, optionalChatterUUID)) {
                        }
                    } else {
                        i2 = i + 1
                    }
                }
            }
            i = -1
            if (i != this.selectedPosition) {
                int selectedPosition = this.selectedPosition
                this.selectedPosition = i
                notifyItemChanged(this.selectedPosition)
                notifyItemChanged(selectedPosition)
            }
        }
    }

    private class NearbyUserViewHolder : RecyclerView.ViewHolder(), View.OnClickListener {
        private float cardSelectedElevation
        private CardView cardView
        private ChatterDisplayData chatterDisplayData
        private View selectedLayout
        private FrameLayout userItemViewHolder
        private ChatterItemViewBuilder viewBuilder

        constructor(view: View) {
            super(view)
            this.viewBuilder = ChatterItemViewBuilder()
            this.chatterDisplayData = null
            this.userItemViewHolder = (FrameLayout) view.findViewById(R.id.user_item_view_holder)
            this.cardView = (CardView) view.findViewById(R.id.user_card_view)
            this.cardSelectedElevation = this.cardView.getCardElevation()
            this.selectedLayout = view.findViewById(R.id.user_item_selected_layout)
            this.userItemViewHolder.setOnClickListener(this)
            view.findViewById(R.id.user_item_chat_button).setOnClickListener(this)
        }

        open fun bindToData(context: Context, layoutInflater: LayoutInflater, userManager: UserManager, chatterDisplayData: ChatterDisplayData, z: Boolean) {
            this.viewBuilder.reset()
            chatterDisplayData.buildView(context, this.viewBuilder, userManager)
            View childAt = this.userItemViewHolder.getChildAt(0)
            View view = this.viewBuilder.getView(layoutInflater, childAt, this.userItemViewHolder, true)
            internal fun if(childAt: view !=):  {
                internal fun if(null: childAt !=):  {
                    this.userItemViewHolder.removeView(childAt)
                }
                this.userItemViewHolder.addView(view)
            }
            internal fun if(z):  {
                this.cardView.setCardElevation(this.cardSelectedElevation)
                this.cardView.setCardBackgroundColor(NearbyPeopleMinimapFragment.this.cardSelectedColor)
                this.selectedLayout.setVisibility(View.VISIBLE)
            } else {
                this.cardView.setCardElevation(0.0f)
                this.cardView.setCardBackgroundColor(0)
                this.selectedLayout.setVisibility(View.GONE)
            }
            this.chatterDisplayData = chatterDisplayData
        }

        override fun onClick(view: View) {
            when (view.getId()) {
                R.id.user_item_view_holder -> {
                    FragmentManager fragmentManager = NearbyPeopleMinimapFragment.this.getFragmentManager()
                    internal fun if(null: fragmentManager !=):  {
                        ComponentCallbacks findFragmentById = fragmentManager.findFragmentById(R.id.selector)
                        internal fun if(MinimapView.OnUserClickListener: findFragmentById instanceof):  {
                            ((MinimapView.OnUserClickListener) findFragmentById).onUserClick(this.chatterDisplayData.chatterID.getOptionalChatterUUID())
                            }
                        }
                    }
                    }
                R.id.user_item_chat_button -> {
                    internal fun if(null: this.chatterDisplayData !=):  {
                        DetailsActivity.showDetails(NearbyPeopleMinimapFragment.this.getActivity(), ChatFragmentActivityFactory.getInstance(), ChatFragment.makeSelection(this.chatterDisplayData.chatterID))
                        }
                    }
                    }
            }
        }
    }

    @JvmStatic
    internal fun newInstance(uuid: UUID): Fragment {
        NearbyPeopleMinimapFragment nearbyPeopleMinimapFragment = NearbyPeopleMinimapFragment()
        nearbyPeopleMinimapFragment.setArguments(ActivityUtils.makeFragmentArguments(uuid, null))
        return nearbyPeopleMinimapFragment
    }

    open fun onChatterList(immutableList: ImmutableList<ChatterDisplayData>) {
        internal fun if(null: this.adapter !=):  {
            this.adapter.setChatters(immutableList)
        }
        if (getView() != null) {
            boolean isEmpty = immutableList.isEmpty()
            binding.empty.setVisibility(isEmpty ? View.VISIBLE : View.GONE)
            binding.minimapUsersList.setVisibility(isEmpty ? View.GONE : View.VISIBLE)
        }
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View? {
        super.onCreateView(layoutInflater, viewGroup, bundle)
        binding = MinimapUsersBinding.inflate(layoutInflater, viewGroup, false)
        TypedValue typedValue = TypedValue()
        layoutInflater.getContext().getTheme().resolveAttribute(R.attr.CardViewDetailsBackground, typedValue, true)
        this.cardSelectedColor = typedValue.data
        this.adapter = NearbyUserRecyclerAdapter(getContext(), ActivityUtils.getUserManager(getArguments()))
        binding.minimapUsersList.setAdapter(this.adapter)
        return binding.getRoot()
    }

    override fun onDestroyView() {
        binding = null
        super.onDestroyView()
    }

    override fun onStart() {
        super.onStart()
        UserManager userManager = ActivityUtils.getUserManager(getArguments())
        internal fun if(null: userManager !=):  {
            this.chatterList.subscribe(userManager.getChatterList().getChatterList(), ChatterListType.Nearby)
        } else {
            this.chatterList.unsubscribe()
        }
    }

    override fun onStop() {
        this.chatterList.unsubscribe()
        super.onStop()
    }

    open fun setSelectedUser(uuid: UUID) {
        internal fun if(null: this.adapter !=):  {
            this.adapter.setSelected(uuid)
        }
    }
}
