package com.lumiyaviewer.lumiya.ui.login

import android.content.Intent
import android.content.SharedPreferences
import android.os.Bundle
import androidx.preference.PreferenceManager
import androidx.appcompat.app.AlertDialog
import android.text.Editable
import android.text.SpannableStringBuilder
import android.text.TextWatcher
import android.text.method.PasswordTransformationMethod
import android.text.method.SingleLineTransformationMethod
import android.text.style.URLSpan
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.view.ViewTreeObserver
import android.view.inputmethod.InputMethodManager
import android.widget.AdapterView
import android.widget.CheckBox
import android.widget.EditText
import android.widget.Spinner
import android.widget.SpinnerAdapter
import android.widget.TextView
import com.google.common.base.Strings
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GridConnectionService
import com.lumiyaviewer.lumiya.LumiyaApp
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.eventbus.EventHandler
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.SLURL
import com.lumiyaviewer.lumiya.slproto.auth.SLAuth
import com.lumiyaviewer.lumiya.slproto.auth.SLAuthParams
import com.lumiyaviewer.lumiya.slproto.events.SLLoginResultEvent
import com.lumiyaviewer.lumiya.slproto.events.SLReconnectingEvent
import com.lumiyaviewer.lumiya.ui.accounts.AccountList
import com.lumiyaviewer.lumiya.ui.accounts.ManageAccountsActivity
import com.lumiyaviewer.lumiya.ui.chat.ChatNewActivity
import com.lumiyaviewer.lumiya.ui.common.ThemedActivity
import com.lumiyaviewer.lumiya.ui.grids.GridEditDialog
import com.lumiyaviewer.lumiya.ui.grids.GridList
import com.lumiyaviewer.lumiya.ui.grids.ManageGridsActivity
import com.lumiyaviewer.lumiya.ui.settings.SettingsActivity
import java.util.ArrayList
import java.util.Iterator
import java.util.List
import java.util.UUID

open class LoginActivity : ThemedActivity(), View.OnClickListener, TextWatcher, GridEditDialog.OnGridEditResultListener {
    private static String KEY_CLIENT_ID = "client_id"
    private static String KEY_LOGIN = "login"
    private static String KEY_PASSWORD = "password"
    private static String KEY_SAVE_PASSWORD = "save_password"
    private static String KEY_SELECTED_GRID = "selected_grid"
    private static String KEY_TOS_ACCEPTED = "tos_accepted"
    private UUID lastSelectedGridUUID
    private Intent lastLoginIntent
    private boolean loggingIn = false
    private boolean enableAutoClear = false
    private int lastSelectedGrid = 0
    private GridList gridList = null
    private AccountList accountList = null
    private List<GridList.GridInfo> gridDisplayList = ArrayList()
    private GridList.GridArrayAdapter gridDisplayAdapter = null
    private ImmutableList<MenuItem> menuItems = ImmutableList.of()

    private fun CheckTOSAndLogin() {
        View currentFocus = getCurrentFocus()
        if (currentFocus != null) {
            ((InputMethodManager) getSystemService("input_method")).hideSoftInputFromWindow(currentFocus.getWindowToken(), 0)
        }
        SharedPreferences preferences = getPreferences(0)
        GridList.GridInfo selectedGrid = getSelectedGrid()
        if (preferences.getBoolean(KEY_TOS_ACCEPTED, false) || (!selectedGrid.isLindenGrid())) {
            DoLogin()
        } else {
            startActivityForResult(Intent(this, (Class<?>) TOSActivity.class), 5)
        }
    }

    private fun DoLogin() {
        boolean z
        String str
        String text
        SLURL slurl
        SharedPreferences preferences = getPreferences(0)
        String editable = ((EditText) findViewById(R.id.editUserName)).getText().toString()
        String text2 = ((EditText) findViewById(R.id.editPassword)).getText().toString()
        GridList.GridInfo selectedGrid = getSelectedGrid()
        boolean isChecked = ((CheckBox) findViewById(R.id.savePassword)).isChecked()
        String str3 = ""
        if (text2 == (getString(R.string.saved_password))) {
            str3 = preferences.getString(KEY_PASSWORD, "")
            z = true
        } else {
            z = false
        }
        if (z) {
            AccountList.AccountInfo findAccount = this.accountList.findAccount(editable, selectedGrid.getGridUUID())
            if (findAccount != null && !findAccount.getPasswordHash() == ("")) {
                str3 = findAccount.getPasswordHash()
            }
            Debug.Log("Login: using saved hash")
            str = str3
        } else {
            String passwordHash = SLAuth.getPasswordHash(text2)
            Debug.Log("Login: not using saved hash")
            str = passwordHash
        }
        this.enableAutoClear = false
        if (isChecked) {
            ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(SingleLineTransformationMethod.getInstance())
            ((EditText) findViewById(R.id.editPassword)).setText(R.string.saved_password)
        } else {
            ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(PasswordTransformationMethod.getInstance())
            ((EditText) findViewById(R.id.editPassword)).setText("")
        }
        this.enableAutoClear = true
        String string = preferences.getString(KEY_CLIENT_ID, "")
        String string2 = PreferenceManager.getDefaultSharedPreferences(getBaseContext()).getString("start_location", "last")
        boolean saveUserName = getSaveUserName()
        boolean z2 = isChecked ? saveUserName : false
        SharedPreferences.Editor edit = preferences.edit()
        edit.putString(KEY_LOGIN, saveUserName ? editable : "")
        edit.putBoolean(KEY_SAVE_PASSWORD, isChecked)
        if (!z || (!z2)) {
            edit.putString(KEY_PASSWORD, z2 ? str : "")
        }
        if (string == ("")) {
            text = UUID.randomUUID().toString()
            edit.putString(KEY_CLIENT_ID, text)
        } else {
            text = string
        }
        edit.putString(KEY_SELECTED_GRID, selectedGrid.getGridUUID().toString())
        edit.apply()
        if (saveUserName) {
            this.accountList.findOrAddAccount(editable, z2 ? str : "", selectedGrid.getGridUUID())
        }
        try {
            slurl = SLURL(getIntent())
        } catch (Exception e) {
            slurl = null
        }
        String loginStartLocation = slurl != null ? slurl.getLoginStartLocation() : string2
        Debug.Log("Start location (LoginActivity): " + loginStartLocation)
        Intent intent = Intent(this, (Class<?>) GridConnectionService.class)
        intent.setAction(GridConnectionService.LOGIN_ACTION)
        intent.putExtra(KEY_LOGIN, editable)
        intent.putExtra(KEY_PASSWORD, str)
        intent.putExtra(KEY_CLIENT_ID, text)
        intent.putExtra("start_location", loginStartLocation)
        intent.putExtra("login_url", selectedGrid.getLoginURL())
        intent.putExtra("grid_name", selectedGrid.getGridName())
        intent.putExtra(SLAuthParams.EXTRA_ALLOW_UNTRUSTED_CERTIFICATES, selectedGrid.getAllowUntrustedCertificates())
        startLogin(intent)
    }

    private fun startLogin(intent: Intent) {
        // Kept so an MFA challenge can resend the same login with a code:
        // the password field has already been cleared or masked by then.
        this.lastLoginIntent = intent
        this.loggingIn = true
        GridConnectionService.startServiceCompat(this, intent)
        showProgressView(true)
        ((TextView) findViewById(R.id.connect_status_text)).setText(R.string.status_logging_in)
    }

    /**
     * The grid wants a multi-factor code (reason "mfa_challenge"). Same flow
     * as the viewer's PromptMFAToken notification: ask for the code, then
     * repeat the login with it in the "token" field.
     */
    private fun showMfaPrompt(message: String) {
        Intent loginIntent = this.lastLoginIntent
        if (loginIntent == null) {
            return
        }
        View view = getLayoutInflater().inflate(R.layout.mfa_token_dialog, null)
        EditText tokenText = (EditText) view.findViewById(R.id.mfaTokenText)
        ((TextView) view.findViewById(R.id.mfaTokenMessage)).setText(Strings.isNullOrEmpty(message) ? getString(R.string.mfa_prompt_default_message) : message)
        AlertDialog dialog = AlertDialog.Builder(this)
                .setTitle(R.string.mfa_prompt_title)
                .setView(view)
                .setPositiveButton(R.string.mfa_prompt_continue, null)
                .setNegativeButton(R.string.cancel, null)
                .create()
        dialog.setOnShowListener(d -> {
            tokenText.requestFocus()
            dialog.getButton(AlertDialog.BUTTON_POSITIVE).setOnClickListener(v -> {
                String token = tokenText.getText().toString().replaceAll("\\s", "")
                if (token.isEmpty()) {
                    tokenText.setError(getString(R.string.mfa_prompt_empty))
                    return
                }
                dialog.dismiss()
                Intent retry = Intent(loginIntent)
                retry.putExtra(SLAuthParams.EXTRA_MFA_TOKEN, token)
                startLogin(retry)
            })
        })
        dialog.show()
    }

    private fun checkIfGridAvailable() {
        Debug.Log("LoginActivity: checking if grid is available")
        SLGridConnection gridConnection = GridConnectionService.getGridConnection()
        if (gridConnection != null) {
            SLGridConnection.ConnectionState connectionState = gridConnection.getConnectionState()
            UUID activeAgentUUID = gridConnection.getActiveAgentUUID()
            Debug.Log("LoginActivity: connectionState = " + connectionState.toString())
            if (connectionState == SLGridConnection.ConnectionState.Connected && activeAgentUUID != null) {
                Debug.Log("LoginActivity: grid available and connected")
                startChatActivity(activeAgentUUID)
                finish()
                return
            }
        }
        updateConnectingStatus()
    }

    private fun getSaveUserName(): Boolean {
        return !PreferenceManager.getDefaultSharedPreferences(getApplicationContext()).getBoolean("noSaveUserName", false)
    }

    private fun getSelectedGrid(): GridList.GridInfo {
        Object selectedItem = ((Spinner) findViewById(R.id.spinnerGrid)).getSelectedItem()
        return selectedItem is GridList.GridInfo ? (GridList.GridInfo) selectedItem : this.gridList.getDefaultGrid()
    }

    private fun loadSavedLogin() {
        SharedPreferences preferences = getPreferences(0)
        if (getSaveUserName()) {
            String string = preferences.getString(KEY_PASSWORD, "")
            ((EditText) findViewById(R.id.editUserName)).setText(preferences.getString(KEY_LOGIN, ""))
            ((CheckBox) findViewById(R.id.savePassword)).setChecked(preferences.getBoolean(KEY_SAVE_PASSWORD, true))
            if (string == ("")) {
                ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(PasswordTransformationMethod.getInstance())
                ((EditText) findViewById(R.id.editPassword)).setText("")
            } else {
                ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(SingleLineTransformationMethod.getInstance())
                ((EditText) findViewById(R.id.editPassword)).setText(R.string.saved_password)
            }
        } else {
            ((EditText) findViewById(R.id.editUserName)).setText("")
            ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(PasswordTransformationMethod.getInstance())
            ((EditText) findViewById(R.id.editPassword)).setText("")
        }
        this.enableAutoClear = true
    }

    private fun progressViewVisible(): Boolean {
        View findViewById = findViewById(R.id.login_progress_layout)
        return findViewById != null && findViewById.getVisibility() == 0
    }

    private fun setSelectedGrid() {
        try {
            String string = getPreferences(0).getString(KEY_SELECTED_GRID, "")
            if (string == ("")) {
                return
            }
            int gridIndex = this.gridList.getGridIndex(UUID.fromString(string))
            ((Spinner) findViewById(R.id.spinnerGrid)).setSelection(gridIndex)
            this.lastSelectedGrid = gridIndex
            Object selectedItem = ((Spinner) findViewById(R.id.spinnerGrid)).getSelectedItem()
            if (selectedItem instanceof GridList.GridInfo) {
                this.lastSelectedGridUUID = ((GridList.GridInfo) selectedItem).getGridUUID()
            }
        } catch (Exception e) {
        }
    }

    private fun showProgressView(z: Boolean) {
        View findViewById = findViewById(R.id.login_progress_layout)
        View viewById = findViewById(R.id.login_root_view)
        if (findViewById != null && viewById != null) {
            findViewById(R.id.login_progress_layout).setVisibility(z ? View.VISIBLE : View.GONE)
            findViewById(R.id.login_root_view).setVisibility(z ? View.GONE : View.VISIBLE)
        }
        updateMenuItems()
    }

    private fun startChatActivity(uuid: UUID) {
        Intent intent = Intent(this, (Class<?>) ChatNewActivity.class)
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
        intent.putExtra("activeAgentUUID", uuid.toString())
        startActivity(intent)
    }

    private fun updateConnectingStatus() {
        SLGridConnection gridConnection
        boolean loggingIn = this.loggingIn
        if (!loggingIn && (gridConnection = GridConnectionService.getGridConnection()) != null && gridConnection.getConnectionState() == SLGridConnection.ConnectionState.Connecting) {
            showProgressView(true)
            if (gridConnection.getIsReconnecting()) {
                ((TextView) findViewById(R.id.connect_status_text)).setText(getString(R.string.status_reconnecting, arrayOfNulls<Object>(]{Integer.valueOf(gridConnection.getReconnectAttempt())}))
                loggingIn = true
            } else {
                ((TextView) findViewById(R.id.connect_status_text)).setText(R.string.status_logging_in)
                loggingIn = true
            }
        }
        if (loggingIn) {
            return
        }
        showProgressView(false)
    }

    private fun updateMenuItems() {
        boolean z = !progressViewVisible()
        Iterator<MenuItem> it = this.menuItems.iterator()
        while (it.hasNext()) {
            it.next().setVisible(z)
        }
    }

    override fun afterTextChanged(editable: Editable) {
    }

    override fun beforeTextChanged(charSequence: CharSequence, i: Int, i2: Int, i3: Int) {
        if (this.enableAutoClear) {
            EditText editText = (EditText) findViewById(R.id.editPassword)
            if (editText.getText().toString() == (getString(R.string.saved_password))) {
                this.enableAutoClear = false
                editText.setText("")
                editText.setTransformationMethod(PasswordTransformationMethod.getInstance())
                this.enableAutoClear = true
            }
        }
    }

    override fun getPreferences(i: Int): SharedPreferences {
        fun getSharedPreferences("LoginActivity", i): return
    }

    @EventHandler
    open fun handleLoginResult(loginResultEvent: SLLoginResultEvent) {
        this.loggingIn = false
        Debug.Printf("LoginProgressActivity: result.success = %b", Boolean.valueOf(loginResultEvent.success))
        if (loginResultEvent.success) {
            startChatActivity(loginResultEvent.activeAgentUUID)
            finish()
            return
        }
        if (loginResultEvent.mfaRequired && !isFinishing()) {
            showProgressView(false)
            showMfaPrompt(loginResultEvent.message)
            return
        }
        if (!isFinishing() && progressViewVisible()) {
            String str = Strings.isNullOrEmpty(loginResultEvent.message) ? "Login to Second Life has failed." : loginResultEvent.message
            AlertDialog.Builder builder = AlertDialog.Builder(this)
            builder.setTitle("Login failed")
            builder.setMessage(str)
            builder.setCancelable(true)
            builder.create().show()
        }
        showProgressView(false)
    }

    @EventHandler
    open fun handleReconnectingEvent(reconnectingEvent: SLReconnectingEvent) {
        updateConnectingStatus()
    }


    override protected fun onActivityResult(i: Int, i2: Int, intent: Intent) {
        super.onActivityResult(i, i2, intent)
        AccountList.AccountInfo accountInfo
        Debug.Log("LoginActivity: onActivityResult: requestCode = " + i + ", resultCode = " + i2)
        if (intent != null) {
            Debug.Log("LoginActivity: onActivityResult: data = " + intent.getDataString() + ", " + intent.toString())
        } else {
            Debug.Log("LoginActivity: onActivityResult: data = null")
        }
        internal fun switch(i):  {
            3 -> {
                if (i2 == -1 && intent != null && (accountInfo = (AccountList.AccountInfo) intent.getParcelableExtra("selected_account")) != null) {
                    String passwordHash = accountInfo.getPasswordHash()
                    ((EditText) findViewById(R.id.editUserName)).setText(accountInfo.getLoginName())
                    ((CheckBox) findViewById(R.id.savePassword)).setChecked(!passwordHash == (""))
                    this.enableAutoClear = false
                    if (passwordHash == ("")) {
                        ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(PasswordTransformationMethod.getInstance())
                        ((EditText) findViewById(R.id.editPassword)).setText("")
                    } else {
                        ((EditText) findViewById(R.id.editPassword)).setTransformationMethod(SingleLineTransformationMethod.getInstance())
                        ((EditText) findViewById(R.id.editPassword)).setText(R.string.saved_password)
                    }
                    this.enableAutoClear = true
                    if (accountInfo.getGridUUID() != null) {
                        int gridIndex = this.gridList.getGridIndex(accountInfo.getGridUUID())
                        ((Spinner) findViewById(R.id.spinnerGrid)).setSelection(gridIndex)
                        this.lastSelectedGrid = gridIndex
                        Object selectedItem = ((Spinner) findViewById(R.id.spinnerGrid)).getSelectedItem()
                        if (selectedItem instanceof GridList.GridInfo) {
                            this.lastSelectedGridUUID = ((GridList.GridInfo) selectedItem).getGridUUID()
                        }
                    }
                    SharedPreferences.Editor edit = getPreferences(0).edit()
                    edit.putString(KEY_LOGIN, accountInfo.getLoginName())
                    edit.putBoolean(KEY_SAVE_PASSWORD, !passwordHash == (""))
                    edit.putString(KEY_PASSWORD, passwordHash)
                    if (accountInfo.getGridUUID() != null) {
                        edit.putString(KEY_SELECTED_GRID, accountInfo.getGridUUID().toString())
                    }
                    edit.apply()
                    }
                }
                }
            5 -> {
                if (i2 == -1) {
                    SharedPreferences.Editor editor = getPreferences(0).edit()
                    editor.putBoolean(KEY_TOS_ACCEPTED, true)
                    editor.apply()
                    DoLogin()
                    }
                }
                }
        }
    }

    override fun onClick(view: View) {
        when (view.getId()) {
            R.id.whatsnewText -> {
                startActivity(Intent(this, (Class<?>) WhatsNewActivity.class))
                }
            R.id.buttonLogin -> {
                CheckTOSAndLogin()
                }
            R.id.loginCancelButton -> {
                this.loggingIn = false
                SLGridConnection gridConnection = GridConnectionService.getGridConnection()
                if (gridConnection != null) {
                    gridConnection.CancelConnect()
                }
                showProgressView(false)
                }
        }
    }

    override fun onCreate(bundle: Bundle) {
        super.onCreate(bundle)
        SLGridConnection gridConnection = GridConnectionService.getGridConnection()
        if (gridConnection != null) {
            SLGridConnection.ConnectionState connectionState = gridConnection.getConnectionState()
            UUID activeAgentUUID = gridConnection.getActiveAgentUUID()
            Debug.Log("LoginActivity: connectionState = " + connectionState.toString())
            if (connectionState == SLGridConnection.ConnectionState.Connected && activeAgentUUID != null) {
                startChatActivity(activeAgentUUID)
                finish()
                return
            }
        }
        setContentView(R.layout.login)
        Debug.Log("LoginActivity: created.")
        this.gridList = GridList(this)
        this.accountList = AccountList(this)
        this.gridList.getGridList(this.gridDisplayList, true)
        this.enableAutoClear = false
        findViewById(R.id.buttonLogin).setOnClickListener(this)
        ((EditText) findViewById(R.id.editPassword)).addTextChangedListener(this)
        loadSavedLogin()
        SpannableStringBuilder spannableStringBuilder = SpannableStringBuilder()
        spannableStringBuilder.append((CharSequence) getString(R.string.whatsnew_caption, arrayOfNulls<Object>(]{LumiyaApp.getAppVersion()}))
        spannableStringBuilder.setSpan(URLSpan(""), 0, spannableStringBuilder.length(), 33)
        ((TextView) findViewById(R.id.whatsnewText)).setText(spannableStringBuilder, TextView.BufferType.SPANNABLE)
        findViewById(R.id.whatsnewText).setClickable(true)
        findViewById(R.id.whatsnewText).setOnClickListener(this)
        this.gridDisplayAdapter = GridList.GridArrayAdapter(this, this.gridDisplayList)
        ((Spinner) findViewById(R.id.spinnerGrid)).setAdapter((SpinnerAdapter) this.gridDisplayAdapter)
        setSelectedGrid()
        ((Spinner) findViewById(R.id.spinnerGrid)).setOnItemSelectedListener(AdapterView.OnItemSelectedListener() {
            override fun onItemSelected(adapterView: AdapterView<?>, view: View, lastSelectedGrid: Int, j: Long) {
                if (lastSelectedGrid != LoginActivity.this.lastSelectedGrid) {
                    Object item = adapterView.getAdapter().getItem(lastSelectedGrid)
                    if (item instanceof GridList.GridInfo) {
                        GridList.GridInfo gridInfo = (GridList.GridInfo) item
                        if (gridInfo.getLoginURL() == null) {
                            GridEditDialog gridEditDialog = GridEditDialog(LoginActivity.this, LoginActivity.this.gridList, null)
                            gridEditDialog.setOnGridEditResultListener(LoginActivity.this)
                            gridEditDialog.show()
                        } else {
                            LoginActivity.this.lastSelectedGrid = lastSelectedGrid
                            LoginActivity.this.lastSelectedGridUUID = gridInfo.getGridUUID()
                        }
                    }
                }
            }

            override fun onNothingSelected(adapterView: AdapterView<?>) {
            }
        })
        findViewById(R.id.whatsnewText).getViewTreeObserver().addOnGlobalLayoutListener(ViewTreeObserver.OnGlobalLayoutListener() {
                LoginActivity.this.m646lambda$com_lumiyaviewer_lumiya_ui_login_LoginActivity_5985()
            }

            override fun onGlobalLayout() {
