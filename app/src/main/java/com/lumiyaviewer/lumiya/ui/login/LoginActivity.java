package com.lumiyaviewer.lumiya.ui.login;

import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.preference.PreferenceManager;
import androidx.appcompat.app.AlertDialog;
import android.text.Editable;
import android.text.SpannableStringBuilder;
import android.text.TextWatcher;
import android.text.method.PasswordTransformationMethod;
import android.text.method.SingleLineTransformationMethod;
import android.text.style.URLSpan;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.ViewTreeObserver;
import android.view.inputmethod.InputMethodManager;
import android.widget.AdapterView;
import android.widget.CheckBox;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.SpinnerAdapter;
import android.widget.TextView;
import com.google.common.base.Strings;
import com.google.common.collect.ImmutableList;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.GridConnectionService;
import com.lumiyaviewer.lumiya.LumiyaApp;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.eventbus.EventHandler;
import com.lumiyaviewer.lumiya.slproto.SLGridConnection;
import com.lumiyaviewer.lumiya.slproto.SLURL;
import com.lumiyaviewer.lumiya.slproto.auth.SLAuth;
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthParams;
import com.lumiyaviewer.lumiya.slproto.events.SLLoginResultEvent;
import com.lumiyaviewer.lumiya.slproto.events.SLReconnectingEvent;
import com.lumiyaviewer.lumiya.ui.accounts.AccountList;
import com.lumiyaviewer.lumiya.ui.accounts.ManageAccountsActivity;
import com.lumiyaviewer.lumiya.ui.chat.ChatNewActivity;
import com.lumiyaviewer.lumiya.ui.common.ThemedActivity;
import com.lumiyaviewer.lumiya.ui.grids.GridEditDialog;
import com.lumiyaviewer.lumiya.ui.grids.GridList;
import com.lumiyaviewer.lumiya.ui.grids.ManageGridsActivity;
import com.lumiyaviewer.lumiya.ui.settings.SettingsActivity;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

public class LoginActivity extends ThemedActivity implements View.OnClickListener, TextWatcher, GridEditDialog.OnGridEditResultListener {
    private static final String KEY_CLIENT_ID = "client_id";
    private static final String KEY_LOGIN = "login";
    private static final String KEY_PASSWORD = "password";
    private static final String KEY_SAVE_PASSWORD = "save_password";
    private static final String KEY_SELECTED_GRID = "selected_grid";
    private static final String KEY_TOS_ACCEPTED = "tos_accepted";
    private UUID lastSelectedGridUUID;
    private Intent lastLoginIntent;
    private boolean loggingIn = false;
    private boolean enableAutoClear = false;
    private int lastSelectedGrid = 0;
    private GridList gridList = null;
    private AccountList accountList = null;
    private List<GridList.GridInfo> gridDisplayList = new ArrayList();
    private GridList.GridArrayAdapter gridDisplayAdapter = null;
    private ImmutableList<MenuItem> menuItems = ImmutableList.of();

    private void CheckTOSAndLogin() {
        View currentFocus = getCurrentFocus();
        if (currentFocus != null) {
            ((InputMethodManager) getSystemService("input_method")).hideSoftInputFromWindow(currentFocus.getWindowToken(), 0);
        }
        SharedPreferences preferences = getPreferences(0);
        GridList.GridInfo selectedGrid = getSelectedGrid();
        if (preferences.getBoolean(KEY_TOS_ACCEPTED, false) || (!selectedGrid.isLindenGrid())) {
            DoLogin();
        } else {
            startActivityForResult(new Intent(this, (Class<?>) TOSActivity.class), 5);
        }
    }

    private void DoLogin() {
        boolean z;
        String str;
        String text;
        SLURL slurl;
        SharedPreferences preferences = getPreferences(0);
        String editable = ((EditText) findViewById(R.id.editUserName)).getText().toString();
        String text2 = ((EditText) findViewById(R.id.editPassword)).getText().toString();
        GridList.GridInfo selectedGrid = getSelectedGrid();
        boolean isChecked = ((CheckBox) findViewById(R.id.savePassword)).isChecked();
        String str3 = "";
        if (text2.equals(getString(R.string.saved_password))) {
            str3 = preferences.getString(KEY_PASSWORD, "");
            z = true;
        } else {
            z = false;
        }
        if (z) {
            AccountList.AccountInfo findAccount = this.accountList.findAccount(editable, selectedGrid.getGridUUID());
            if (findAccount != null && !findAccount.getPasswordHash().equals("")) {
                str3 = findAccount.getPasswordHash();
            }
            Debug.Log("Login: using saved hash");
            str = str3;
        } else {
            String passwordHash = SLAuth.getPasswordHash(text2);
            Debug.Log("Login: not using saved hash");
            str = passwordHash;
        }
        this.enableAutoClear = false;
        if (isChecked) {
            ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(SingleLineTransformationMethod.getInstance());
            ((EditText) findViewById(R.id.editPassword)).setText(R.string.saved_password);
        } else {
            ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(PasswordTransformationMethod.getInstance());
            ((EditText) findViewById(R.id.editPassword)).setText("");
        }
        this.enableAutoClear = true;
        String string = preferences.getString(KEY_CLIENT_ID, "");
        String string2 = PreferenceManager.getDefaultSharedPreferences(getBaseContext()).getString("start_location", "last");
        boolean saveUserName = getSaveUserName();
        boolean z2 = isChecked ? saveUserName : false;
        SharedPreferences.Editor edit = preferences.edit();
        edit.putString(KEY_LOGIN, saveUserName ? editable : "");
        edit.putBoolean(KEY_SAVE_PASSWORD, isChecked);
        if (!z || (!z2)) {
            edit.putString(KEY_PASSWORD, z2 ? str : "");
        }
        if (string.equals("")) {
            text = UUID.randomUUID().toString();
            edit.putString(KEY_CLIENT_ID, text);
        } else {
            text = string;
        }
        edit.putString(KEY_SELECTED_GRID, selectedGrid.getGridUUID().toString());
        edit.apply();
        if (saveUserName) {
            this.accountList.findOrAddAccount(editable, z2 ? str : "", selectedGrid.getGridUUID());
        }
        try {
            slurl = new SLURL(getIntent());
        } catch (Exception e) {
            slurl = null;
        }
        String loginStartLocation = slurl != null ? slurl.getLoginStartLocation() : string2;
        Debug.Log("Start location (LoginActivity): " + loginStartLocation);
        Intent intent = new Intent(this, (Class<?>) GridConnectionService.class);
        intent.setAction(GridConnectionService.LOGIN_ACTION);
        intent.putExtra(KEY_LOGIN, editable);
        intent.putExtra(KEY_PASSWORD, str);
        intent.putExtra(KEY_CLIENT_ID, text);
        intent.putExtra("start_location", loginStartLocation);
        intent.putExtra("login_url", selectedGrid.getLoginURL());
        intent.putExtra("grid_name", selectedGrid.getGridName());
        intent.putExtra(SLAuthParams.EXTRA_ALLOW_UNTRUSTED_CERTIFICATES, selectedGrid.getAllowUntrustedCertificates());
        startLogin(intent);
    }

    private void startLogin(Intent intent) {
        // Kept so an MFA challenge can resend the same login with a code:
        // the password field has already been cleared or masked by then.
        this.lastLoginIntent = intent;
        this.loggingIn = true;
        GridConnectionService.startServiceCompat(this, intent);
        showProgressView(true);
        ((TextView) findViewById(R.id.connect_status_text)).setText(R.string.status_logging_in);
    }

    /**
     * The grid wants a multi-factor code (reason "mfa_challenge"). Same flow
     * as the viewer's PromptMFAToken notification: ask for the code, then
     * repeat the login with it in the "token" field.
     */
    private void showMfaPrompt(String message) {
        final Intent loginIntent = this.lastLoginIntent;
        if (loginIntent == null) {
            return;
        }
        View view = getLayoutInflater().inflate(R.layout.mfa_token_dialog, null);
        final EditText tokenText = (EditText) view.findViewById(R.id.mfaTokenText);
        ((TextView) view.findViewById(R.id.mfaTokenMessage)).setText(Strings.isNullOrEmpty(message) ? getString(R.string.mfa_prompt_default_message) : message);
        final AlertDialog dialog = new AlertDialog.Builder(this)
                .setTitle(R.string.mfa_prompt_title)
                .setView(view)
                .setPositiveButton(R.string.mfa_prompt_continue, null)
                .setNegativeButton(R.string.cancel, null)
                .create();
        dialog.setOnShowListener(d -> {
            tokenText.requestFocus();
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
                String token = tokenText.getText().toString().replaceAll("\\s", "");
                if (token.isEmpty()) {
                    tokenText.setError(getString(R.string.mfa_prompt_empty));
                    return;
                }
                dialog.dismiss();
                Intent retry = new Intent(loginIntent);
                retry.putExtra(SLAuthParams.EXTRA_MFA_TOKEN, token);
                startLogin(retry);
            });
        });
        dialog.show();
    }

    private void checkIfGridAvailable() {
        Debug.Log("LoginActivity: checking if grid is available");
        SLGridConnection gridConnection = GridConnectionService.getGridConnection();
        if (gridConnection != null) {
            SLGridConnection.ConnectionState connectionState = gridConnection.getConnectionState();
            UUID activeAgentUUID = gridConnection.getActiveAgentUUID();
            Debug.Log("LoginActivity: connectionState = " + connectionState.toString());
            if (connectionState == SLGridConnection.ConnectionState.Connected && activeAgentUUID != null) {
                Debug.Log("LoginActivity: grid available and connected");
                startChatActivity(activeAgentUUID);
                finish();
                return;
            }
        }
        updateConnectingStatus();
    }

    private boolean getSaveUserName() {
        return !PreferenceManager.getDefaultSharedPreferences(getApplicationContext()).getBoolean("noSaveUserName", false);
    }

    private GridList.GridInfo getSelectedGrid() {
        Object selectedItem = ((Spinner) findViewById(R.id.spinnerGrid)).getSelectedItem();
        return selectedItem instanceof GridList.GridInfo ? (GridList.GridInfo) selectedItem : this.gridList.getDefaultGrid();
    }

    private void loadSavedLogin() {
        SharedPreferences preferences = getPreferences(0);
        if (getSaveUserName()) {
            String string = preferences.getString(KEY_PASSWORD, "");
            ((EditText) findViewById(R.id.editUserName)).setText(preferences.getString(KEY_LOGIN, ""));
            ((CheckBox) findViewById(R.id.savePassword)).setChecked(preferences.getBoolean(KEY_SAVE_PASSWORD, true));
            if (string.equals("")) {
                ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(PasswordTransformationMethod.getInstance());
                ((EditText) findViewById(R.id.editPassword)).setText("");
            } else {
                ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(SingleLineTransformationMethod.getInstance());
                ((EditText) findViewById(R.id.editPassword)).setText(R.string.saved_password);
            }
        } else {
            ((EditText) findViewById(R.id.editUserName)).setText("");
            ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(PasswordTransformationMethod.getInstance());
            ((EditText) findViewById(R.id.editPassword)).setText("");
        }
        this.enableAutoClear = true;
    }

    private boolean progressViewVisible() {
        View findViewById = findViewById(R.id.login_progress_layout);
        return findViewById != null && findViewById.getVisibility() == 0;
    }

    private void setSelectedGrid() {
        try {
            String string = getPreferences(0).getString(KEY_SELECTED_GRID, "");
            if (string.equals("")) {
                return;
            }
            int gridIndex = this.gridList.getGridIndex(UUID.fromString(string));
            ((Spinner) findViewById(R.id.spinnerGrid)).setSelection(gridIndex);
            this.lastSelectedGrid = gridIndex;
            Object selectedItem = ((Spinner) findViewById(R.id.spinnerGrid)).getSelectedItem();
            if (selectedItem instanceof GridList.GridInfo) {
                this.lastSelectedGridUUID = ((GridList.GridInfo) selectedItem).getGridUUID();
            }
        } catch (Exception e) {
        }
    }

    private void showProgressView(boolean z) {
        View findViewById = findViewById(R.id.login_progress_layout);
        View viewById = findViewById(R.id.login_root_view);
        if (findViewById != null && viewById != null) {
            findViewById(R.id.login_progress_layout).setVisibility(z ? View.VISIBLE : View.GONE);
            findViewById(R.id.login_root_view).setVisibility(z ? View.GONE : View.VISIBLE);
        }
        updateMenuItems();
    }

    private void startChatActivity(UUID uuid) {
        Intent intent = new Intent(this, (Class<?>) ChatNewActivity.class);
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP);
        intent.putExtra("activeAgentUUID", uuid.toString());
        startActivity(intent);
    }

    private void updateConnectingStatus() {
        SLGridConnection gridConnection;
        boolean loggingIn = this.loggingIn;
        if (!loggingIn && (gridConnection = GridConnectionService.getGridConnection()) != null && gridConnection.getConnectionState() == SLGridConnection.ConnectionState.Connecting) {
            showProgressView(true);
            if (gridConnection.getIsReconnecting()) {
                ((TextView) findViewById(R.id.connect_status_text)).setText(getString(R.string.status_reconnecting, new Object[]{Integer.valueOf(gridConnection.getReconnectAttempt())}));
                loggingIn = true;
            } else {
                ((TextView) findViewById(R.id.connect_status_text)).setText(R.string.status_logging_in);
                loggingIn = true;
            }
        }
        if (loggingIn) {
            return;
        }
        showProgressView(false);
    }

    private void updateMenuItems() {
        boolean z = !progressViewVisible();
        Iterator<MenuItem> it = this.menuItems.iterator();
        while (it.hasNext()) {
            it.next().setVisible(z);
        }
    }

    @Override
    public void afterTextChanged(Editable editable) {
    }

    @Override
    public void beforeTextChanged(CharSequence charSequence, int i, int i2, int i3) {
        if (this.enableAutoClear) {
            EditText editText = (EditText) findViewById(R.id.editPassword);
            if (editText.getText().toString().equals(getString(R.string.saved_password))) {
                this.enableAutoClear = false;
                editText.setText("");
                editText.setTransformationMethod(PasswordTransformationMethod.getInstance());
                this.enableAutoClear = true;
            }
        }
    }

    @Override
    public SharedPreferences getPreferences(int i) {
        return getSharedPreferences("LoginActivity", i);
    }

    @EventHandler
    public void handleLoginResult(SLLoginResultEvent loginResultEvent) {
        this.loggingIn = false;
        Debug.Printf("LoginProgressActivity: result.success = %b", Boolean.valueOf(loginResultEvent.success));
        if (loginResultEvent.success) {
            startChatActivity(loginResultEvent.activeAgentUUID);
            finish();
            return;
        }
        if (loginResultEvent.mfaRequired && !isFinishing()) {
            showProgressView(false);
            showMfaPrompt(loginResultEvent.message);
            return;
        }
        if (!isFinishing() && progressViewVisible()) {
            String str = Strings.isNullOrEmpty(loginResultEvent.message) ? "Login to Second Life has failed." : loginResultEvent.message;
            AlertDialog.Builder builder = new AlertDialog.Builder(this);
            builder.setTitle("Login failed");
            builder.setMessage(str);
            builder.setCancelable(true);
            builder.create().show();
        }
        showProgressView(false);
    }

    @EventHandler
    public void handleReconnectingEvent(SLReconnectingEvent reconnectingEvent) {
        updateConnectingStatus();
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_login_LoginActivity_5985, reason: not valid java name */
    /* synthetic */ void m646lambda$com_lumiyaviewer_lumiya_ui_login_LoginActivity_5985() {
        if (findViewById(R.id.login_spacer).getHeight() >= 2 || findViewById(R.id.whatsnewText).getVisibility() == 8) {
            return;
        }
        findViewById(R.id.whatsnewText).setVisibility(View.GONE);
    }

    @Override
    protected void onActivityResult(int i, int i2, Intent intent) {
        AccountList.AccountInfo accountInfo;
        Debug.Log("LoginActivity: onActivityResult: requestCode = " + i + ", resultCode = " + i2);
        if (intent != null) {
            Debug.Log("LoginActivity: onActivityResult: data = " + intent.getDataString() + ", " + intent.toString());
        } else {
            Debug.Log("LoginActivity: onActivityResult: data = null");
        }
        switch (i) {
            case 3:
                if (i2 == -1 && intent != null && (accountInfo = (AccountList.AccountInfo) intent.getParcelableExtra("selected_account")) != null) {
                    String passwordHash = accountInfo.getPasswordHash();
                    ((EditText) findViewById(R.id.editUserName)).setText(accountInfo.getLoginName());
                    ((CheckBox) findViewById(R.id.savePassword)).setChecked(!passwordHash.equals(""));
                    this.enableAutoClear = false;
                    if (passwordHash.equals("")) {
                        ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(PasswordTransformationMethod.getInstance());
                        ((EditText) findViewById(R.id.editPassword)).setText("");
                    } else {
                        ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(SingleLineTransformationMethod.getInstance());
                        ((EditText) findViewById(R.id.editPassword)).setText(R.string.saved_password);
                    }
                    this.enableAutoClear = true;
                    if (accountInfo.getGridUUID() != null) {
                        int gridIndex = this.gridList.getGridIndex(accountInfo.getGridUUID());
                        ((Spinner) findViewById(R.id.spinnerGrid)).setSelection(gridIndex);
                        this.lastSelectedGrid = gridIndex;
                        Object selectedItem = ((Spinner) findViewById(R.id.spinnerGrid)).getSelectedItem();
                        if (selectedItem instanceof GridList.GridInfo) {
                            this.lastSelectedGridUUID = ((GridList.GridInfo) selectedItem).getGridUUID();
                        }
                    }
                    SharedPreferences.Editor edit = getPreferences(0).edit();
                    edit.putString(KEY_LOGIN, accountInfo.getLoginName());
                    edit.putBoolean(KEY_SAVE_PASSWORD, !passwordHash.equals(""));
                    edit.putString(KEY_PASSWORD, passwordHash);
                    if (accountInfo.getGridUUID() != null) {
                        edit.putString(KEY_SELECTED_GRID, accountInfo.getGridUUID().toString());
                    }
                    edit.apply();
                    break;
                }
                break;
            case 5:
                if (i2 == -1) {
                    SharedPreferences.Editor editor = getPreferences(0).edit();
                    editor.putBoolean(KEY_TOS_ACCEPTED, true);
                    editor.apply();
                    DoLogin();
                    break;
                }
                break;
        }
    }

    @Override
    public void onClick(View view) {
        switch (view.getId()) {
            case R.id.whatsnewText:
                startActivity(new Intent(this, (Class<?>) WhatsNewActivity.class));
                break;
            case R.id.buttonLogin:
                CheckTOSAndLogin();
                break;
            case R.id.loginCancelButton:
                this.loggingIn = false;
                SLGridConnection gridConnection = GridConnectionService.getGridConnection();
                if (gridConnection != null) {
                    gridConnection.CancelConnect();
                }
                showProgressView(false);
                break;
        }
    }

    @Override
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        SLGridConnection gridConnection = GridConnectionService.getGridConnection();
        if (gridConnection != null) {
            SLGridConnection.ConnectionState connectionState = gridConnection.getConnectionState();
            UUID activeAgentUUID = gridConnection.getActiveAgentUUID();
            Debug.Log("LoginActivity: connectionState = " + connectionState.toString());
            if (connectionState == SLGridConnection.ConnectionState.Connected && activeAgentUUID != null) {
                startChatActivity(activeAgentUUID);
                finish();
                return;
            }
        }
        setContentView(R.layout.login);
        Debug.Log("LoginActivity: created.");
        this.gridList = new GridList(this);
        this.accountList = new AccountList(this);
        this.gridList.getGridList(this.gridDisplayList, true);
        this.enableAutoClear = false;
        findViewById(R.id.buttonLogin).setOnClickListener(this);
        ((EditText) findViewById(R.id.editPassword)).addTextChangedListener(this);
        loadSavedLogin();
        SpannableStringBuilder spannableStringBuilder = new SpannableStringBuilder();
        spannableStringBuilder.append((CharSequence) getString(R.string.whatsnew_caption, new Object[]{LumiyaApp.getAppVersion()}));
        spannableStringBuilder.setSpan(new URLSpan(""), 0, spannableStringBuilder.length(), 33);
        ((TextView) findViewById(R.id.whatsnewText)).setText(spannableStringBuilder, TextView.BufferType.SPANNABLE);
        findViewById(R.id.whatsnewText).setClickable(true);
        findViewById(R.id.whatsnewText).setOnClickListener(this);
        this.gridDisplayAdapter = new GridList.GridArrayAdapter(this, this.gridDisplayList);
        ((Spinner) findViewById(R.id.spinnerGrid)).setAdapter((SpinnerAdapter) this.gridDisplayAdapter);
        setSelectedGrid();
        ((Spinner) findViewById(R.id.spinnerGrid)).setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
            /* JADX WARN: Type inference failed for: r0v2, types: [android.widget.Adapter] */
            @Override
            public void onItemSelected(AdapterView<?> adapterView, View view, int lastSelectedGrid, long j) {
                if (lastSelectedGrid != LoginActivity.this.lastSelectedGrid) {
                    Object item = adapterView.getAdapter().getItem(lastSelectedGrid);
                    if (item instanceof GridList.GridInfo) {
                        GridList.GridInfo gridInfo = (GridList.GridInfo) item;
                        if (gridInfo.getLoginURL() == null) {
                            GridEditDialog gridEditDialog = new GridEditDialog(LoginActivity.this, LoginActivity.this.gridList, null);
                            gridEditDialog.setOnGridEditResultListener(LoginActivity.this);
                            gridEditDialog.show();
                        } else {
                            LoginActivity.this.lastSelectedGrid = lastSelectedGrid;
                            LoginActivity.this.lastSelectedGridUUID = gridInfo.getGridUUID();
                        }
                    }
                }
            }

            @Override
            public void onNothingSelected(AdapterView<?> adapterView) {
            }
        });
        findViewById(R.id.whatsnewText).getViewTreeObserver().addOnGlobalLayoutListener(new ViewTreeObserver.OnGlobalLayoutListener() {
            private final /* synthetic */ void $m$0() {
                LoginActivity.this.m646lambda$com_lumiyaviewer_lumiya_ui_login_LoginActivity_5985();
            }

            @Override
            public final void onGlobalLayout() {
                $m$0();
            }
        });
        checkIfGridAvailable();
        findViewById(R.id.loginCancelButton).setOnClickListener(this);
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.login_menu, menu);
        ImmutableList.Builder builder = ImmutableList.builder();
        builder.add(menu.findItem(R.id.item_manage_accounts));
        builder.add(menu.findItem(R.id.item_settings));
        builder.add(menu.findItem(R.id.item_manage_grids));
        builder.add(menu.findItem(R.id.item_show_password));
        this.menuItems = builder.build();
        return true;
    }

    @Override
    public void onGridAdded(GridList.GridInfo gridInfo, boolean z) {
        if (z) {
            this.gridList.addNewGrid(gridInfo);
        }
        this.gridList.getGridList(this.gridDisplayList, true);
        this.gridDisplayAdapter.notifyDataSetChanged();
        int count = ((Spinner) findViewById(R.id.spinnerGrid)).getAdapter().getCount();
        if (count > 1) {
            ((Spinner) findViewById(R.id.spinnerGrid)).setSelection(count - 2);
            this.lastSelectedGrid = count - 2;
            Object selectedItem = ((Spinner) findViewById(R.id.spinnerGrid)).getSelectedItem();
            if (selectedItem instanceof GridList.GridInfo) {
                this.lastSelectedGridUUID = ((GridList.GridInfo) selectedItem).getGridUUID();
            }
        }
    }

    @Override
    public void onGridDeleted(GridList.GridInfo gridInfo) {
    }

    @Override
    public void onGridEditCancelled() {
        ((Spinner) findViewById(R.id.spinnerGrid)).setSelection(this.lastSelectedGrid);
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem menuItem) {
        switch (menuItem.getItemId()) {
            case R.id.item_settings:
                startActivity(new Intent(this, (Class<?>) SettingsActivity.class));
                return true;
            case R.id.item_manage_accounts:
                startActivityForResult(new Intent(this, (Class<?>) ManageAccountsActivity.class), 3);
                return true;
            case R.id.item_manage_grids:
                startActivity(new Intent(this, (Class<?>) ManageGridsActivity.class));
                return true;
            case R.id.item_show_password:
                EditText editText = (EditText) findViewById(R.id.editPassword);
                editText.setTransformationMethod(SingleLineTransformationMethod.getInstance());
                editText.setInputType(145);
                return true;
            default:
                return super.onOptionsItemSelected(menuItem);
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        Debug.Printf("LoginActivity: Resumed.", new Object[0]);
        checkIfGridAvailable();
        this.gridList.loadGrids();
        this.gridList.getGridList(this.gridDisplayList, true);
        this.gridDisplayAdapter.notifyDataSetChanged();
        if (this.lastSelectedGridUUID != null) {
            ((Spinner) findViewById(R.id.spinnerGrid)).setSelection(this.gridList.getGridIndex(this.lastSelectedGridUUID));
        }
        this.accountList.loadAccounts();
        if (getSaveUserName()) {
            findViewById(R.id.savePassword).setEnabled(true);
            return;
        }
        ((EditText) findViewById(R.id.editUserName)).setText("");
        ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(PasswordTransformationMethod.getInstance());
        ((EditText) findViewById(R.id.editPassword)).setText("");
        findViewById(R.id.savePassword).setEnabled(false);
        ((CheckBox) findViewById(R.id.savePassword)).setChecked(false);
    }

    @Override
    protected void onStart() {
        super.onStart();
        checkIfGridAvailable();
    }

    @Override
    protected void onStop() {
        super.onStop();
    }

    @Override
    public void onTextChanged(CharSequence charSequence, int i, int i2, int i3) {
    }
}
