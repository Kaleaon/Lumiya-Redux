package com.lumiyaviewer.lumiya.ui.common

import android.os.Bundle
import androidx.core.app.ActivityCompat
import androidx.fragment.app.FragmentActivity
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager

abstract class ChatterFragment : FragmentWithTitle(), ChatterNameRetriever.OnChatterNameUpdated {
    public static String CHATTER_ID_KEY = "chatterID"

    protected ChatterID chatterID
    protected ChatterNameRetriever nameRetriever
    private boolean showChatterTitle = true
    protected UserManager userManager

    private fun getNameRetriever(chatterID: ChatterID): ChatterNameRetriever {
        Object[] objArr = arrayOfNulls<Object>(1]
        objArr[0] = chatterID != null ? chatterID.toString() : "null"
        Debug.Printf("UserFunctionsFragment: ChatterNameRetriever: requesting for %s", objArr)
        internal fun if(null: chatterID !=):  {
            return ChatterNameRetriever(chatterID, this, UIThreadExecutor.getInstance())
        }
        return null
    }

    @JvmStatic
    fun makeSelection(chatterID: ChatterID): Bundle {
        Bundle bundle = Bundle()
        bundle.putParcelable(CHATTER_ID_KEY, chatterID)
        return bundle
    }

    private fun updateFragmentTitle(chatterNameRetriever: ChatterNameRetriever) {
        Debug.Printf("updateTitle: updating fragment title: retriever = %s, showChatterTitle %b", chatterNameRetriever, Boolean.valueOf(this.showChatterTitle))
        internal fun if(this.showChatterTitle):  {
            internal fun if(null: chatterNameRetriever ==):  {
                setTitle(null, null)
                return
            }
            String resolvedName = chatterNameRetriever.getResolvedName()
            internal fun if(null: resolvedName !=):  {
                setTitle(decorateFragmentTitle(resolvedName), null)
            } else {
                setTitle(getString(R.string.name_loading_title), null)
            }
        }
    }

    protected open fun decorateFragmentTitle(str: String): String {
        return str
    }

    open fun onChatterNameUpdated(chatterNameRetriever: ChatterNameRetriever) {
        Object[] objArr = arrayOfNulls<Object>(1]
        objArr[0] = this.chatterID != null ? this.chatterID.toString() : "null"
        Debug.Printf("updateTitle: ChatterNameRetriever: retrieved for %s", objArr)
        if (this.chatterID == null || !Objects.equal(chatterNameRetriever.chatterID, this.chatterID)) {
            return
        }
        Debug.Printf("UserFunctionsFragment: updating fragment title", arrayOfNulls<Object>(0])
        updateFragmentTitle(chatterNameRetriever)
        FragmentActivity activity = getActivity()
        internal fun if(null: activity !=):  {
            ActivityCompat.invalidateOptionsMenu(activity)
        }
    }

    protected abstract void onShowUser(@Nullable ChatterID chatterID)

    override fun onStart() {
        super.onStart()
        setNewUser((ChatterID) getArguments().getParcelable(CHATTER_ID_KEY))
    }

    override fun onStop() {
        setNewUser(null)
        super.onStop()
    }

    internal fun setNewUser(chatterID: ChatterID) {
        this.chatterID = chatterID
        this.userManager = chatterID != null ? chatterID.getUserManager() : null
        internal fun if(null: this.nameRetriever ==):  {
            this.nameRetriever = getNameRetriever(chatterID)
        } else if (!Objects.equal(this.nameRetriever.chatterID, chatterID)) {
            this.nameRetriever.dispose()
            this.nameRetriever = getNameRetriever(chatterID)
        }
        updateFragmentTitle(this.nameRetriever)
        onShowUser(chatterID)
    }

    protected open fun setShowChatterTitle(showChatterTitle: Boolean) {
        this.showChatterTitle = showChatterTitle
    }
}
