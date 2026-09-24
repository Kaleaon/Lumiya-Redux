package com.lumiyaviewer.lumiya.ui.accounts;

import android.content.Context;
import android.os.Bundle;
import androidx.appcompat.app.AppCompatDialog;
import android.text.Editable;
import android.text.TextWatcher;
import android.text.method.PasswordTransformationMethod;
import android.text.method.SingleLineTransformationMethod;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import android.widget.Toast;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.slproto.auth.SLAuth;
import com.lumiyaviewer.lumiya.ui.accounts.AccountList;
import com.lumiyaviewer.lumiya.ui.grids.GridList;
import java.util.UUID;

class AccountEditDialog extends AppCompatDialog implements View.OnClickListener, TextWatcher {
    private AccountList.AccountInfo editAccount;
    private GridList gridList;
    private OnAccountEditResultListener onAccountEditResultListener;

    interface OnAccountEditResultListener {
        void onAccountEditCancelled();

        void onAccountEdited(AccountList.AccountInfo accountInfo, boolean z);
    }

    AccountEditDialog(Context context, AccountList.AccountInfo accountInfo) {
        super(context);
        this.onAccountEditResultListener = null;
        this.editAccount = null;
        this.gridList = null;
        this.gridList = new GridList(context);
        this.editAccount = accountInfo;
    }

    private void prepare() {
        this.gridList.loadGrids();
        if (this.editAccount != null) {
            ((TextView) findViewById(R.id.loginNameText)).setText(this.editAccount.getLoginName());
            ((Spinner) findViewById(R.id.spinnerGrid)).setSelection(this.gridList.getGridIndex(this.editAccount.getGridUUID()));
            if (this.editAccount.getPasswordHash().equals("")) {
                findViewById(R.id.loginPasswordText).setTag(null);
                ((TextView) findViewById(R.id.loginPasswordText)).setText("");
                ((TextView) findViewById(R.id.loginPasswordText)).setInputType(129);
                ((EditText) findViewById(R.id.loginPasswordText)).setTransformationMethod(PasswordTransformationMethod.getInstance());
            } else {
                findViewById(R.id.loginPasswordText).setTag(null);
                ((TextView) findViewById(R.id.loginPasswordText)).setText("(Saved password)");
                ((TextView) findViewById(R.id.loginPasswordText)).setInputType(1);
                ((EditText) findViewById(R.id.loginPasswordText)).setTransformationMethod(SingleLineTransformationMethod.getInstance());
                findViewById(R.id.loginPasswordText).setTag(1);
            }
            ((Button) findViewById(R.id.okButton)).setText(R.string.save_changes);
            setTitle(R.string.edit_account_dialog_title);
        } else {
            findViewById(R.id.loginPasswordText).setTag(null);
            ((TextView) findViewById(R.id.loginNameText)).setText("");
            ((TextView) findViewById(R.id.loginPasswordText)).setText("");
            ((TextView) findViewById(R.id.loginPasswordText)).setInputType(129);
            ((EditText) findViewById(R.id.loginPasswordText)).setTransformationMethod(PasswordTransformationMethod.getInstance());
            ((Spinner) findViewById(R.id.spinnerGrid)).setSelection(0);
            ((Button) findViewById(R.id.okButton)).setText(R.string.add_new_account);
            setTitle(R.string.new_account_dialog_title);
        }
        ((TextView) findViewById(R.id.loginNameText)).requestFocus();
    }

    @Override
    public void afterTextChanged(Editable editable) {
    }

    @Override
    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        TextView textView = (TextView) findViewById(R.id.loginPasswordText);
        if (textView.getTag() != null) {
            textView.setTag(null);
            textView.setInputType(129);
            ((EditText) findViewById(R.id.loginPasswordText)).setTransformationMethod(PasswordTransformationMethod.getInstance());
            textView.setText("");
        }
    }

    @Override
    public void onClick(View view) {
        boolean z;
        AccountList.AccountInfo accountInfo;
        boolean z2 = false;
        switch (view.getId()) {
            case R.id.okButton:
                String charSequence = ((TextView) findViewById(R.id.loginNameText)).getText().toString();
                String text = ((TextView) findViewById(R.id.loginPasswordText)).getText().toString();
                String str = "";
                Object selectedItem = ((Spinner) findViewById(R.id.spinnerGrid)).getSelectedItem();
                UUID gridUUID = selectedItem instanceof GridList.GridInfo ? ((GridList.GridInfo) selectedItem).getGridUUID() : null;
                if (!charSequence.equals("")) {
                    if (text.equals("(Saved password)")) {
                        z = true;
                    } else if (text.equals("")) {
                        str = "";
                        z = false;
                    } else {
                        str = SLAuth.getPasswordHash(text);
                        z = false;
                    }
                    dismiss();
                    if (this.onAccountEditResultListener != null) {
                        AccountList.AccountInfo editAccount = this.editAccount;
                        if (editAccount == null) {
                            z2 = true;
                            accountInfo = new AccountList.AccountInfo(charSequence, str, gridUUID);
                        } else {
                            editAccount.setLoginName(charSequence);
                            editAccount.setGridUUID(gridUUID);
                            if (z) {
                                accountInfo = editAccount;
                            } else {
                                editAccount.setPasswordHash(str);
                                accountInfo = editAccount;
                            }
                        }
                        this.onAccountEditResultListener.onAccountEdited(accountInfo, z2);
                        break;
                    }
                } else {
                    Toast.makeText(getContext(), getContext().getString(R.string.login_name_empty_error), Toast.LENGTH_SHORT).show();
                    break;
                }
                break;
            case R.id.cancelButton:
                dismiss();
                if (this.onAccountEditResultListener != null) {
                    this.onAccountEditResultListener.onAccountEditCancelled();
                    break;
                }
                break;
        }
    }

    @Override
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        setTitle(R.string.new_account_dialog_title);
        setContentView(R.layout.account_edit_dialog);
        findViewById(R.id.okButton).setOnClickListener(this);
        findViewById(R.id.cancelButton).setOnClickListener(this);
        ((EditText) findViewById(R.id.loginPasswordText)).addTextChangedListener(this);
        ((Spinner) findViewById(R.id.spinnerGrid)).setAdapter((SpinnerAdapter) new GridList.GridArrayAdapter(getContext(), this.gridList.getGridList(null, false)));
        prepare();
    }

    @Override
    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }

    void setOnAccountEditResultListener(OnAccountEditResultListener onAccountEditResultListener) {
        this.onAccountEditResultListener = onAccountEditResultListener;
    }
}
