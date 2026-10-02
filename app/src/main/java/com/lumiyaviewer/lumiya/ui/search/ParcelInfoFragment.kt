package com.lumiyaviewer.lumiya.ui.search

import android.app.AlertDialog
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.swiperefreshlayout.widget.SwipeRefreshLayout
import com.google.common.base.Strings
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.databinding.ParcelInfoBinding
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLMessage
import com.lumiyaviewer.lumiya.slproto.messages.ParcelInfoReply
import com.lumiyaviewer.lumiya.slproto.types.LLVector3
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.ui.chat.profiles.GroupProfileFragment
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.ReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

open class ParcelInfoFragment : FragmentWithTitle(),
    ReloadableFragment,
    LoadableMonitor.OnLoadableDataChangedListener,
    ChatterNameRetriever.OnChatterNameUpdated {

    private var binding: ParcelInfoBinding? = null
    private val parcelInfoReply = SubscriptionData<UUID, ParcelInfoReply>(UIThreadExecutor.getInstance())
    private val loadableMonitor = LoadableMonitor(this.parcelInfoReply).withDataChangedListener(this)
    private var ownerNameRetriever: ChatterNameRetriever? = null
    private var ownerGroupNameRetriever: ChatterNameRetriever? = null

    override fun setFragmentArgs(intent: android.content.Intent?, bundle: Bundle?) {
        arguments = bundle
    }

    private fun showParcelInfo(uuid: UUID) {
        val userManager = ActivityUtils.getUserManager(arguments) ?: return
        Debug.Printf("ParcelInfo: subscribing for UUID %s", uuid)
        this.parcelInfoReply.subscribe(userManager.parcelInfoData(), uuid)
    }

    override fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
        val currentBinding = binding ?: return
        val gRetriever = ownerGroupNameRetriever
        val uRetriever = ownerNameRetriever
        if (chatterNameRetriever != uRetriever && chatterNameRetriever != gRetriever) {
            return
        }
        val chatterNameRetriever2 = if (gRetriever?.getResolvedName() != null) gRetriever else uRetriever ?: return
        val resolvedName = chatterNameRetriever2.getResolvedName()
        currentBinding.parcelOwnerName.text = if (resolvedName != null) resolvedName else getString(R.string.name_loading_title)
        currentBinding.parcelOwnerPic.visibility = View.VISIBLE
        currentBinding.parcelOwnerPic.setChatterID(chatterNameRetriever2.chatterID, resolvedName)
    }

    override fun onCreateView(inflater: LayoutInflater, container: ViewGroup?, savedInstanceState: Bundle?): View {
        super.onCreateView(inflater, container, savedInstanceState)
        val currentBinding = ParcelInfoBinding.inflate(inflater, container, false)
        this.binding = currentBinding
        this.loadableMonitor.setLoadingLayout(
            currentBinding.root.findViewById<LoadingLayout>(R.id.loading_layout),
            getString(R.string.no_parcel_selected),
            getString(R.string.failed_to_load_parcel_data)
        )
        this.loadableMonitor.setSwipeRefreshLayout(
            currentBinding.root.findViewById<SwipeRefreshLayout>(R.id.swipe_refresh_layout)
        )
        currentBinding.parcelImageView.setAlignTop(true)
        currentBinding.parcelImageView.setVerticalFit(true)
        currentBinding.parcelOwnerProfileButton.setOnClickListener { onParcelOwnerProfileClick() }
        currentBinding.parcelTeleportButton.setOnClickListener { onParcelTeleportButton() }
        return currentBinding.root
    }

    override fun onDestroyView() {
        this.binding = null
        super.onDestroyView()
    }

    override fun onLoadableDataChanged() {
        val currentBinding = binding ?: return
        val data = this.parcelInfoReply.getData() ?: return
        val activeAgentID = ActivityUtils.getActiveAgentID(arguments) ?: return

        ownerNameRetriever?.dispose()
        ownerNameRetriever = null
        ownerGroupNameRetriever?.dispose()
        ownerGroupNameRetriever = null

        val name = SLMessage.stringFromVariableOEM(data.Data_Field.Name)
        setTitle(name, null)
        currentBinding.parcelDetailsName.text = name

        var desc = SLMessage.stringFromVariableOEM(data.Data_Field.Desc).trim()
        if (Strings.isNullOrEmpty(desc)) {
            desc = getString(R.string.asset_no_description)
        }
        currentBinding.parcelDetailsDesc.text = desc

        if (UUIDPool.ZeroUUID == data.Data_Field.OwnerID) {
            currentBinding.parcelOwnerName.setText(R.string.group_owned)
            currentBinding.parcelOwnerPic.visibility = View.GONE
        } else {
            ownerNameRetriever = ChatterNameRetriever(
                ChatterID.getUserChatterID(activeAgentID, data.Data_Field.OwnerID),
                this,
                UIThreadExecutor.getSerialInstance()
            )
            ownerGroupNameRetriever = ChatterNameRetriever(
                ChatterID.getGroupChatterID(activeAgentID, data.Data_Field.OwnerID),
                this,
                UIThreadExecutor.getSerialInstance()
            )
        }
        currentBinding.parcelImageView.setAssetID(data.Data_Field.SnapshotID)
        currentBinding.parcelSimName.text = SLMessage.stringFromVariableOEM(data.Data_Field.SimName)
        currentBinding.parcelLocation.text = getString(
            R.string.parcel_location_format,
            data.Data_Field.GlobalX % 256.0f,
            data.Data_Field.GlobalY % 256.0f,
            data.Data_Field.GlobalZ
        )
    }

    open fun onParcelOwnerProfileClick() {
        val activeAgentID = ActivityUtils.getActiveAgentID(arguments) ?: return
        val data = this.parcelInfoReply.getData() ?: return
        val currentActivity = activity ?: return

        val gRetriever = ownerGroupNameRetriever
        val uRetriever = ownerNameRetriever

        if (gRetriever?.getResolvedName() != null) {
            DetailsActivity.showEmbeddedDetails(
                currentActivity,
                GroupProfileFragment::class.java,
                GroupProfileFragment.makeSelection(gRetriever.chatterID)
            )
        } else if (uRetriever == null || uRetriever.getResolvedName() == null) {
            DetailsActivity.showEmbeddedDetails(
                currentActivity,
                UserProfileFragment::class.java,
                UserProfileFragment.makeSelection(ChatterID.getUserChatterID(activeAgentID, data.Data_Field.OwnerID))
            )
        } else {
            DetailsActivity.showEmbeddedDetails(
                currentActivity,
                UserProfileFragment::class.java,
                UserProfileFragment.makeSelection(uRetriever.chatterID)
            )
        }
    }

    open fun onParcelTeleportButton() {
        val userManager = ActivityUtils.getUserManager(arguments)
        val data = this.parcelInfoReply.getData()
        val currentActivity = activity
        if (data == null || userManager == null || currentActivity == null) {
            return
        }
        val pos = LLVector3(data.Data_Field.GlobalX, data.Data_Field.GlobalY, data.Data_Field.GlobalZ)
        AlertDialog.Builder(currentActivity)
            .setMessage(getString(R.string.teleport_parcel_confirm_title))
            .setCancelable(true)
            .setPositiveButton("Yes") { _, _ ->
                userManager.userCircuit?.teleportToLocation(
                    SLMessage.stringFromVariableOEM(data.Data_Field.SimName),
                    pos
                )
            }
            .setNegativeButton("No", null)
            .show()
    }

    companion object {
        private const val PARCEL_UUID_KEY = "parcelUUID"

        @JvmStatic
        fun makeSelection(agentId: UUID, parcelId: UUID): Bundle {
            val bundle = Bundle()
            ActivityUtils.setActiveAgentID(bundle, agentId)
            bundle.putString(PARCEL_UUID_KEY, parcelId.toString())
            return bundle
        }
    }
}
