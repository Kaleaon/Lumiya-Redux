package com.lumiyaviewer.lumiya.ui.objpopup

import android.os.Bundle
import androidx.fragment.app.Fragment
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.ItemTouchHelper
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatLayoutManager
import java.util.UUID

open class ObjectPopupsFragment : Fragment() {
    private static String AGENT_UUID_KEY = "agentUUID"
    private ItemTouchHelper.Callback itemTouchCallback = new ItemTouchHelper.SimpleCallback(0, 12) {
        override fun onMove(recyclerView: RecyclerView, viewHolder: RecyclerView.ViewHolder, viewHolder2: RecyclerView.ViewHolder): Boolean {
            return false
        }

        override fun onSwiped(viewHolder: RecyclerView.ViewHolder, i: Int) {
            RecyclerView recyclerView
            RecyclerView.Adapter adapter
            UserManager userManager = ObjectPopupsFragment.this.getUserManager()
            View view = ObjectPopupsFragment.this.getView()
            if (view == null || userManager == null || (recyclerView = (RecyclerView) view.findViewById(R.id.objectPopupsList)) == null || (adapter = recyclerView.getAdapter()) == null) {
                return
            }
            int adapterPosition = viewHolder.getAdapterPosition()
            if (adapter instanceof ObjectPopupsAdapter) {
                userManager.getObjectPopupsManager().cancelObjectPopup(((ObjectPopupsAdapter) adapter).getObject(adapterPosition))
            }
        }
    }

    @JvmStatic
    fun create(uuid: UUID): ObjectPopupsFragment {
        ObjectPopupsFragment objectPopupsFragment = ObjectPopupsFragment()
        Bundle bundle = Bundle()
        bundle.putString(AGENT_UUID_KEY, uuid.toString())
        objectPopupsFragment.setArguments(bundle)
        return objectPopupsFragment
    }

    open fun getUserManager(): UserManager? {
        Bundle arguments = getArguments()
        if (arguments == null || !arguments.containsKey(AGENT_UUID_KEY)) {
            return null
        }
        return UserManager.getUserManager(UUID.fromString(arguments.getString(AGENT_UUID_KEY)))
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View? {
        View inflate = layoutInflater.inflate(R.layout.object_popups_fragment_layout, viewGroup, false)
        RecyclerView recyclerView = (RecyclerView) inflate.findViewById(R.id.objectPopupsList)
        recyclerView.setHasFixedSize(true)
        recyclerView.setLayoutManager(ChatLayoutManager(layoutInflater.getContext(), 1, false))
        ItemTouchHelper(this.itemTouchCallback).attachToRecyclerView(recyclerView)
        return inflate
    }

    override fun onStart() {
        RecyclerView recyclerView
        super.onStart()
        UserManager userManager = getUserManager()
        View view = getView()
        if (userManager == null || view == null || (recyclerView = (RecyclerView) view.findViewById(R.id.objectPopupsList)) == null) {
            return
        }
        recyclerView.setAdapter(ObjectPopupsAdapter(getContext(), userManager.getObjectPopupsManager().getObjectPopups(), userManager))
    }

    override fun onStop() {
        RecyclerView recyclerView
        View view = getView()
        if (view != null && (recyclerView = (RecyclerView) view.findViewById(R.id.objectPopupsList)) != null) {
            recyclerView.setAdapter(null)
        }
        super.onStop()
    }
}
