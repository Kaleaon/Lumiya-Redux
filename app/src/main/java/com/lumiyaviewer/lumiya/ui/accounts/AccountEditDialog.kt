package com.lumiyaviewer.lumiya.ui.accounts

import android.content.Context
import android.os.Bundle
import androidx.appcompat.app.AppCompatDialog
import android.text.Editable
import android.text.TextWatcher
import android.text.method.PasswordTransformationMethod
import android.text.method.SingleLineTransformationMethod
import android.view.View
import android.widget.Button
import android.widget.EditText
import android.widget.Spinner
import android.widget.SpinnerAdapter
import android.widget.TextView
import android.widget.Toast
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.auth.SLAuth
import com.lumiyaviewer.lumiya.ui.grids.GridList
import java.util.UUID

internal class AccountEditDialog(
    context: Context,
    private var editAccount: AccountList.AccountInfo?
) : AppCompatDialog(context), View.OnClickListener, TextWatcher {

    private var onAccountEditResultListener: OnAccountEditResultListener? = null
    private val gridList = GridList(context)

    interface OnAccountEditResultListener {
        fun onAccountEditCancelled()
        fun onAccountEdited(accountInfo: AccountList.AccountInfo, isNew: Boolean)
    }

    private fun prepare() {
        gridList.loadGrids()
        val account = editAccount
        if (account != null) {
            (findViewById<TextView>(R.id.loginNameText))?.setText(account.loginName)
            (findViewById<Spinner>(R.id.spinnerGrid))?.setSelection(gridList.getGridIndex(account.gridUUID))
            if (account.passwordHash == "") {
                findViewById<View>(R.id.loginPasswordText)?.tag = null
                (findViewById<TextView>(R.id.loginPasswordText))?.setText("")
                (findViewById<TextView>(R.id.loginPasswordText))?.inputType = 129
                (findViewById<EditText>(R.id.loginPasswordText))?.transformationMethod = PasswordTransformationMethod.getInstance()
            } else {
                findViewById<View>(R.id.loginPasswordText)?.tag = null
                (findViewById<TextView>(R.id.loginPasswordText))?.setText("(Saved password)")
                (findViewById<TextView>(R.id.loginPasswordText))?.inputType = 1
                (findViewById<EditText>(R.id.loginPasswordText))?.transformationMethod = SingleLineTransformationMethod.getInstance()
                findViewById<View>(R.id.loginPasswordText)?.tag = 1
            }
            (findViewById<Button>(R.id.okButton))?.setText(R.string.save_changes)
            setTitle(R.string.edit_account_dialog_title)
        } else {
            findViewById<View>(R.id.loginPasswordText)?.tag = null
            (findViewById<TextView>(R.id.loginNameText))?.setText("")
            (findViewById<TextView>(R.id.loginPasswordText))?.setText("")
            (findViewById<TextView>(R.id.loginPasswordText))?.inputType = 129
            (findViewById<EditText>(R.id.loginPasswordText))?.transformationMethod = PasswordTransformationMethod.getInstance()
            (findViewById<Spinner>(R.id.spinnerGrid))?.setSelection(0)
            (findViewById<Button>(R.id.okButton))?.setText(R.string.add_new_account)
            setTitle(R.string.new_account_dialog_title)
        }
        (findViewById<TextView>(R.id.loginNameText))?.requestFocus()
    }

    override fun afterTextChanged(editable: Editable?) {}

    override fun beforeTextChanged(charSequence: CharSequence?, start: Int, count: Int, after: Int) {
        val textView = findViewById<TextView>(R.id.loginPasswordText) ?: return
        if (textView.tag != null) {
            textView.tag = null
            textView.inputType = 129
            (findViewById<EditText>(R.id.loginPasswordText))?.transformationMethod = PasswordTransformationMethod.getInstance()
            textView.text = ""
        }
    }

    override fun onClick(view: View) {
        when (view.id) {
            R.id.okButton -> {
                val loginName = (findViewById<TextView>(R.id.loginNameText))?.text?.toString() ?: ""
                val password = (findViewById<TextView>(R.id.loginPasswordText))?.text?.toString() ?: ""
                val selectedItem = (findViewById<Spinner>(R.id.spinnerGrid))?.selectedItem
                val gridUUID: UUID? = if (selectedItem is GridList.GridInfo) selectedItem.gridUUID else null
                if (loginName != "") {
                    val keepPassword: Boolean
                    val passwordHash: String
                    when {
                        password == "(Saved password)" -> { keepPassword = true; passwordHash = "" }
                        password == "" -> { keepPassword = false; passwordHash = "" }
                        else -> { keepPassword = false; passwordHash = SLAuth.getPasswordHash(password) }
                    }
                    dismiss()
                    val listener = onAccountEditResultListener
                    if (listener != null) {
                        val existing = editAccount
                        val isNew: Boolean
                        val resultAccount: AccountList.AccountInfo
                        if (existing == null) {
                            isNew = true
                            resultAccount = AccountList.AccountInfo(loginName, passwordHash, gridUUID)
                        } else {
                            isNew = false
                            existing.loginName = loginName
                            existing.gridUUID = gridUUID
                            if (!keepPassword) {
                                existing.passwordHash = passwordHash
                            }
                            resultAccount = existing
                        }
                        listener.onAccountEdited(resultAccount, isNew)
                    }
                } else {
                    Toast.makeText(context, context.getString(R.string.login_name_empty_error), Toast.LENGTH_SHORT).show()
                }
            }
            R.id.cancelButton -> {
                dismiss()
                onAccountEditResultListener?.onAccountEditCancelled()
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setTitle(R.string.new_account_dialog_title)
        setContentView(R.layout.account_edit_dialog)
        findViewById<View>(R.id.okButton)?.setOnClickListener(this)
        findViewById<View>(R.id.cancelButton)?.setOnClickListener(this)
        (findViewById<EditText>(R.id.loginPasswordText))?.addTextChangedListener(this)
        (findViewById<Spinner>(R.id.spinnerGrid))?.adapter = GridList.GridArrayAdapter(context, gridList.getGridList(null, false)) as SpinnerAdapter
        prepare()
    }

    override fun onTextChanged(charSequence: CharSequence?, start: Int, before: Int, count: Int) {}

    fun setOnAccountEditResultListener(listener: OnAccountEditResultListener?) {
        this.onAccountEditResultListener = listener
    }
}
