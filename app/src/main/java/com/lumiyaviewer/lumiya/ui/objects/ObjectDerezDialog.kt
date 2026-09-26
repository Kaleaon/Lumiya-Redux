package com.lumiyaviewer.lumiya.ui.objects

import android.app.AlertDialog
import android.content.Context
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.types.EDeRezDestination
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import java.util.UUID

object ObjectDerezDialog {

    enum class DerezAction(val derezQuestionId: Int, val deRezDestination: EDeRezDestination) {
        Take(R.string.derez_confirm_take, EDeRezDestination.DRD_TAKE_INTO_AGENT_INVENTORY),
        TakeCopy(R.string.derez_confirm_take_copy, EDeRezDestination.DRD_ACQUIRE_TO_AGENT_INVENTORY),
        Delete(R.string.derez_confirm_delete, EDeRezDestination.DRD_TRASH)
    }

    @JvmStatic
    fun askForObjectDerez(context: Context, derezAction: DerezAction, uuid: UUID, localId: Int) {
        val builder = AlertDialog.Builder(context)
        builder.setMessage(context.getString(derezAction.derezQuestionId))
            .setCancelable(true)
            .setPositiveButton("Yes") { dialog, _ ->
                dialog.dismiss()
                val userManager = UserManager.getUserManager(uuid)
                val activeAgentCircuit = userManager?.activeAgentCircuit
                activeAgentCircuit?.DerezObject(localId, derezAction.deRezDestination)
            }
            .setNegativeButton("No") { dialog, _ -> dialog.cancel() }
        builder.create().show()
    }
}
