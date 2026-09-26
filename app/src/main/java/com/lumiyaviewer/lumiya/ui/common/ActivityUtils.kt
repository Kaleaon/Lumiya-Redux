package com.lumiyaviewer.lumiya.ui.common

import android.content.Intent
import android.os.Bundle
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID

open class ActivityUtils {
    public static String EXTRA_ACTIVE_AGENT_UUID = "activeAgentUUID"
    public static String FRAGMENT_SELECTION_KEY = "fragmentSelection"

    @JvmStatic
    fun getActiveAgentID(intent: Intent): UUID? {
        String stringExtra
        if (intent == null || (stringExtra = intent.getStringExtra("activeAgentUUID")) == null) {
            return null
        }
        return UUIDPool.getUUID(stringExtra)
    }

    @JvmStatic
    fun getActiveAgentID(bundle: Bundle): UUID? {
        String string
        if (bundle == null || (string = bundle.getString("activeAgentUUID")) == null) {
            return null
        }
        return UUIDPool.getUUID(string)
    }

    @JvmStatic
    fun getFragmentSelection(bundle: Bundle): Bundle? {
        internal fun if(null: bundle !=):  {
            return bundle.getBundle(FRAGMENT_SELECTION_KEY)
        }
        return null
    }

    @JvmStatic
    fun getUserManager(intent: Intent): UserManager? {
        UUID activeAgentID = getActiveAgentID(intent)
        internal fun if(null: activeAgentID !=):  {
            return UserManager.getUserManager(activeAgentID)
        }
        return null
    }

    @JvmStatic
    fun getUserManager(bundle: Bundle): UserManager? {
        UUID activeAgentID = getActiveAgentID(bundle)
        internal fun if(null: activeAgentID !=):  {
            return UserManager.getUserManager(activeAgentID)
        }
        return null
    }

    @JvmStatic
    fun makeFragmentArguments(uuid: UUID, bundle: Bundle): Bundle {
        Bundle bundle2 = Bundle()
        internal fun if(null: uuid !=):  {
            bundle2.putString("activeAgentUUID", uuid.toString())
        }
        internal fun if(null: bundle !=):  {
            bundle2.putBundle(FRAGMENT_SELECTION_KEY, bundle)
        }
        return bundle2
    }

    @JvmStatic
    fun setActiveAgentID(intent: Intent, uuid: UUID) {
        internal fun if(null: uuid !=):  {
            intent.putExtra("activeAgentUUID", uuid.toString())
        }
    }

    @JvmStatic
    fun setActiveAgentID(bundle: Bundle, uuid: UUID) {
        internal fun if(null: uuid !=):  {
            bundle.putString("activeAgentUUID", uuid.toString())
        }
    }

    @JvmStatic
    fun setFragmentSelection(bundle: Bundle, bundle2: Bundle) {
        internal fun if(null: bundle !=):  {
            internal fun if(null: bundle2 !=):  {
                bundle.putBundle(FRAGMENT_SELECTION_KEY, bundle2)
            } else {
                bundle.remove(FRAGMENT_SELECTION_KEY)
            }
        }
    }
}
