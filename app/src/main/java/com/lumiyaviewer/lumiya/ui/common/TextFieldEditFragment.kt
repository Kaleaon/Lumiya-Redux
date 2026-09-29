package com.lumiyaviewer.lumiya.ui.common

import android.app.AlertDialog
import android.content.Context
import android.os.Bundle
import android.text.Editable
import android.text.TextWatcher
import android.view.LayoutInflater
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.TextView
import com.google.common.base.Objects
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.users.ChatterID

abstract class TextFieldEditFragment : ChatterFragment(), BackButtonHandler {
    private var undoMenuItem: MenuItem? = null
    private var originalText: String = ""
    private var hasChanged = false

    private fun closeFragment() {
        val activity = activity
        if (activity is DetailsActivity) {
            activity.closeDetailsFragment(this)
        }
    }

    protected abstract fun getFieldHint(context: Context): String

    override fun onBackButtonPressed(): Boolean {
        val view = view ?: return false
        val charSequence = (view.findViewById<TextView>(R.id.field_edit_text)).text.toString()
        if (Objects.equal(charSequence, this.originalText)) {
            return false
        }
        val builder = AlertDialog.Builder(context)
        builder.setMessage(getString(R.string.save_changes_question)).setCancelable(true)
            .setPositiveButton("Yes") { dialogInterface, _ ->
                dialogInterface.dismiss()
                val userManager = this.userManager
                val chatterID = this.chatterID
                if (userManager != null && chatterID != null) {
                    val activeAgentCircuit = userManager.getActiveAgentCircuit()
                    if (activeAgentCircuit != null) {
                        saveEditedText(activeAgentCircuit, chatterID, charSequence)
                    }
                }
                closeFragment()
            }
            .setNegativeButton("No") { dialogInterface, _ ->
                dialogInterface.cancel()
                closeFragment()
            }
        builder.create().show()
        return true
    }

    override fun onCreate(bundle: Bundle?) {
        super.onCreate(bundle)
        setHasOptionsMenu(true)
    }

    override fun onCreateOptionsMenu(menu: Menu, menuInflater: MenuInflater) {
        super.onCreateOptionsMenu(menu, menuInflater)
        menuInflater.inflate(R.menu.user_notes_edit_menu, menu)
        this.undoMenuItem = menu.findItem(R.id.item_undo)
        this.undoMenuItem?.isVisible = this.hasChanged
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup?, bundle: Bundle?): View? {
        val inflate = layoutInflater.inflate(R.layout.user_text_field_edit, viewGroup, false)
        val textView = inflate.findViewById<TextView>(R.id.field_edit_text)
        textView.hint = getFieldHint(layoutInflater.context)
        textView.addTextChangedListener(object : TextWatcher {
            override fun afterTextChanged(editable: Editable?) {
                val z = !Objects.equal(textView.text.toString(), this@TextFieldEditFragment.originalText)
                if (z != this@TextFieldEditFragment.hasChanged) {
                    this@TextFieldEditFragment.hasChanged = z
                    this@TextFieldEditFragment.undoMenuItem?.isVisible = this@TextFieldEditFragment.hasChanged
                }
            }

            override fun beforeTextChanged(charSequence: CharSequence?, i: Int, i2: Int, i3: Int) {
            }

            override fun onTextChanged(charSequence: CharSequence?, i: Int, i2: Int, i3: Int) {
            }
        })
        return inflate
    }

    override fun onOptionsItemSelected(menuItem: MenuItem): Boolean {
        return when (menuItem.itemId) {
            R.id.item_undo -> {
                val view = view
                if (view != null && !Objects.equal(view.findViewById<TextView>(R.id.field_edit_text).text.toString(), this.originalText)) {
                    val builder = AlertDialog.Builder(context)
                    builder.setMessage(getString(R.string.discard_changes_question)).setCancelable(true)
                        .setPositiveButton("Yes") { dialogInterface, _ ->
                            view.findViewById<TextView>(R.id.field_edit_text).setText(this.originalText)
                            dialogInterface.dismiss()
                        }
                        .setNegativeButton("No") { dialogInterface, _ ->
                            dialogInterface.cancel()
                        }
                    builder.create().show()
                }
                true
            }
            else -> super.onOptionsItemSelected(menuItem)
        }
    }

    protected abstract fun saveEditedText(agentCircuit: SLAgentCircuit, chatterID: ChatterID, str: String)

    protected fun setOriginalText(originalText: String) {
        this.originalText = originalText
        val view = view
        if (view != null) {
            view.findViewById<TextView>(R.id.field_edit_text).setText(originalText)
        }
    }
}
