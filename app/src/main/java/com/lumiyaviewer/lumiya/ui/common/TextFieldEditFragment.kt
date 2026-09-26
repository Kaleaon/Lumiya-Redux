package com.lumiyaviewer.lumiya.ui.common

import android.app.AlertDialog
import android.content.Context
import android.content.DialogInterface
import android.os.Bundle
import androidx.fragment.app.FragmentActivity
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
    private MenuItem undoMenuItem
    private String originalText = ""
    private boolean hasChanged = false

    private fun closeFragment() {
        FragmentActivity activity = getActivity()
        internal fun if(DetailsActivity: activity instanceof):  {
            ((DetailsActivity) activity).closeDetailsFragment(this)
        }
    }

    protected abstract String getFieldHint(Context context)




    override fun onBackButtonPressed(): Boolean {
        View view = getView()
        internal fun if(null: view ==):  {
            return false
        }
        String charSequence = ((TextView) view.findViewById(R.id.field_edit_text)).getText().toString()
        if (Objects.equal(charSequence, this.originalText)) {
            return false
        }
        AlertDialog.Builder builder = new AlertDialog.Builder(getContext())
        builder.setMessage(getString(R.string.save_changes_question)).setCancelable(true).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                TextFieldEditFragment.this.m567x95fa4f00((String) charSequence, dialogInterface, i)
            }

            override fun onClick(dialogInterface: DialogInterface, i: Int) {
            }

            override fun beforeTextChanged(charSequence: CharSequence, i: Int, i2: Int, i3: Int) {
            }

            override fun onTextChanged(charSequence: CharSequence, i: Int, i2: Int, i3: Int) {
            }
        })
        return inflate
    }

    override fun onOptionsItemSelected(menuItem: MenuItem): Boolean {
        when (menuItem.getItemId()) {
            R.id.item_undo -> {
                View view = getView()
                if (view != null && !Objects.equal(((TextView) view.findViewById(R.id.field_edit_text)).getText().toString(), this.originalText)) {
                    AlertDialog.Builder builder = new AlertDialog.Builder(getContext())
                    builder.setMessage(getString(R.string.discard_changes_question)).setCancelable(true).setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                            TextFieldEditFragment.this.m566x95f8ee07((View) view, dialogInterface, i)
                        }

                        override fun onClick(dialogInterface: DialogInterface, i: Int) {