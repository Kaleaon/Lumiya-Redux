package com.lumiyaviewer.lumiya.ui.common

import android.content.Intent
import android.os.Bundle
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

object ActivityUtils {
    const val EXTRA_ACTIVE_AGENT_UUID = "activeAgentUUID"
    const val FRAGMENT_SELECTION_KEY = "fragmentSelection"

    @JvmStatic
    fun getActiveAgentID(intent: Intent?): UUID? {
        val stringExtra = intent?.getStringExtra("activeAgentUUID") ?: return null
        return UUIDPool.getUUID(stringExtra)
    }

    @JvmStatic
    fun getActiveAgentID(bundle: Bundle?): UUID? {
        val string = bundle?.getString("activeAgentUUID") ?: return null
        return UUIDPool.getUUID(string)
    }

    @JvmStatic
    fun getFragmentSelection(bundle: Bundle?): Bundle? {
        if (bundle != null) {
            return bundle.getBundle(FRAGMENT_SELECTION_KEY)
        }
        return null
    }

    @JvmStatic
    fun getUserManager(intent: Intent?): UserManager? {
        val activeAgentID = getActiveAgentID(intent)
        if (activeAgentID != null) {
            return UserManager.getUserManager(activeAgentID)
        }
        return null
    }

    @JvmStatic
    fun getUserManager(bundle: Bundle?): UserManager? {
        val activeAgentID = getActiveAgentID(bundle)
        if (activeAgentID != null) {
            return UserManager.getUserManager(activeAgentID)
        }
        return null
    }

    @JvmStatic
    fun makeFragmentArguments(uuid: UUID?, bundle: Bundle?): Bundle {
        val bundle2 = Bundle()
        if (uuid != null) {
            bundle2.putString("activeAgentUUID", uuid.toString())
        }
        if (bundle != null) {
            bundle2.putBundle(FRAGMENT_SELECTION_KEY, bundle)
        }
        return bundle2
    }

    @JvmStatic
    fun setActiveAgentID(intent: Intent, uuid: UUID?) {
        if (uuid != null) {
            intent.putExtra("activeAgentUUID", uuid.toString())
        }
    }

    @JvmStatic
    fun setActiveAgentID(bundle: Bundle, uuid: UUID?) {
        if (uuid != null) {
            bundle.putString("activeAgentUUID", uuid.toString())
        }
    }

    @JvmStatic
    fun setFragmentSelection(bundle: Bundle?, bundle2: Bundle?) {
        if (bundle != null) {
            if (bundle2 != null) {
                bundle.putBundle(FRAGMENT_SELECTION_KEY, bundle2)
            } else {
                bundle.remove(FRAGMENT_SELECTION_KEY)
            }
        }
    }
}
