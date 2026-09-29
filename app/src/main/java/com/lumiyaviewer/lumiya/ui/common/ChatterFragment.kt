package com.lumiyaviewer.lumiya.ui.common

import android.os.Bundle
import androidx.core.app.ActivityCompat
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager

abstract class ChatterFragment : FragmentWithTitle(), ChatterNameRetriever.OnChatterNameUpdated {
    companion object {
        const val CHATTER_ID_KEY = "chatterID"

        @JvmStatic
        fun makeSelection(chatterID: ChatterID?): Bundle {
            val bundle = Bundle()
            bundle.putParcelable(CHATTER_ID_KEY, chatterID)
            return bundle
        }
    }

    protected var chatterID: ChatterID? = null
    protected var nameRetriever: ChatterNameRetriever? = null
    private var showChatterTitle = true
    protected var userManager: UserManager? = null

    private fun getNameRetriever(chatterID: ChatterID?): ChatterNameRetriever? {
        Debug.Printf("UserFunctionsFragment: ChatterNameRetriever: requesting for %s", chatterID?.toString() ?: "null")
        if (chatterID != null) {
            return ChatterNameRetriever(chatterID, this, UIThreadExecutor.getInstance())
        }
        return null
    }

    private fun updateFragmentTitle(chatterNameRetriever: ChatterNameRetriever?) {
        Debug.Printf("updateTitle: updating fragment title: retriever = %s, showChatterTitle %b", chatterNameRetriever, this.showChatterTitle)
        if (this.showChatterTitle) {
            if (chatterNameRetriever == null) {
                setTitle(null, null)
                return
            }
            val resolvedName = chatterNameRetriever.getResolvedName()
            if (resolvedName != null) {
                setTitle(decorateFragmentTitle(resolvedName), null)
            } else {
                setTitle(getString(R.string.name_loading_title), null)
            }
        }
    }

    protected open fun decorateFragmentTitle(str: String): String {
        return str
    }

    override fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
        Debug.Printf("updateTitle: ChatterNameRetriever: retrieved for %s", this.chatterID?.toString() ?: "null")
        if (this.chatterID == null || !Objects.equal(chatterNameRetriever.chatterID, this.chatterID)) {
            return
        }
        Debug.Printf("UserFunctionsFragment: updating fragment title")
        updateFragmentTitle(chatterNameRetriever)
        val activity = activity
        if (activity != null) {
            ActivityCompat.invalidateOptionsMenu(activity)
        }
    }

    protected abstract fun onShowUser(chatterID: ChatterID?)

    override fun onStart() {
        super.onStart()
        setNewUser(arguments?.getParcelable<ChatterID>(CHATTER_ID_KEY))
    }

    override fun onStop() {
        setNewUser(null)
        super.onStop()
    }

    fun setNewUser(chatterID: ChatterID?) {
        this.chatterID = chatterID
        this.userManager = chatterID?.getUserManager()
        val nameRetriever = this.nameRetriever
        if (nameRetriever == null) {
            this.nameRetriever = getNameRetriever(chatterID)
        } else if (!Objects.equal(nameRetriever.chatterID, chatterID)) {
            nameRetriever.dispose()
            this.nameRetriever = getNameRetriever(chatterID)
        }
        updateFragmentTitle(this.nameRetriever)
        onShowUser(chatterID)
    }

    protected open fun setShowChatterTitle(showChatterTitle: Boolean) {
        this.showChatterTitle = showChatterTitle
    }
}
