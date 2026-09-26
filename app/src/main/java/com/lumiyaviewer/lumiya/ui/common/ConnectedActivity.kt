package com.lumiyaviewer.lumiya.ui.common

import android.content.Intent
import android.content.res.Configuration
import android.os.Bundle
import androidx.core.app.ActivityCompat
import androidx.fragment.app.Fragment
import androidx.fragment.app.FragmentManager
import androidx.fragment.app.FragmentTransaction
import androidx.core.view.ActionProvider
import androidx.core.view.MenuItemCompat
import android.view.Menu
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.view.inputmethod.InputMethodManager
import android.widget.Button
import android.widget.TextView
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GridConnectionService
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.eventbus.EventBus
import com.lumiyaviewer.lumiya.eventbus.EventHandler
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLGridConnection
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.events.SLConnectionStateChangedEvent
import com.lumiyaviewer.lumiya.slproto.events.SLDisconnectEvent
import com.lumiyaviewer.lumiya.slproto.users.manager.ObjectPopupsManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.login.LoginActivity
import com.lumiyaviewer.lumiya.ui.objpopup.ObjectPopupsActionProvider
import com.lumiyaviewer.lumiya.ui.objpopup.ObjectPopupsFragment
import com.lumiyaviewer.lumiya.ui.objpopup.SingleObjectPopupFragment
import java.util.UUID

open class ConnectedActivity : ThemedActivity(), ObjectPopupsActionProvider.ObjectPopupsClickListener, ObjectPopupsManager.ObjectPopupListener {
    public static String OBJECT_POPUP_NOTIFICATION = "objectPopupNotification"
    private NavDrawerActivityHelper navDrawerHelper

    private ObjectPopupsActionProvider objectPopupsActionProvider
    private boolean objectPopupsDisplayed = false
    private boolean singleObjectPopupsDisplayed = false
    private boolean wantedShowObjectPopups = false
    private View.OnClickListener reconnectButtonListener = new View.OnClickListener() {
            ConnectedActivity.this.m537lambda$com_lumiyaviewer_lumiya_ui_common_ConnectedActivity_3108(view)
        }

        override fun onClick(view: View) {
            this.singleObjectPopupsDisplayed = false
            this.objectPopupsDisplayed = true
            View currentFocus = getCurrentFocus()
            internal fun if(null: currentFocus !=):  {
                currentFocus.clearFocus()
                ((InputMethodManager) getSystemService("input_method")).hideSoftInputFromWindow(currentFocus.getWindowToken(), 0)
            }
            FragmentTransaction beginTransaction = supportFragmentManager.beginTransaction()
            beginTransaction.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
            beginTransaction.replace(R.id.object_popups_container, ObjectPopupsFragment.create(activeAgentID))
            beginTransaction.commit()
        }
    }

    private fun hideSingleObjectPopup() {
        internal fun if(this.singleObjectPopupsDisplayed):  {
            this.singleObjectPopupsDisplayed = false
            FragmentManager supportFragmentManager = getSupportFragmentManager()
            Fragment findFragmentById = supportFragmentManager.findFragmentById(R.id.object_popups_container)
            internal fun if(SingleObjectPopupFragment: findFragmentById instanceof):  {
                FragmentTransaction beginTransaction = supportFragmentManager.beginTransaction()
                beginTransaction.setCustomAnimations(0, R.anim.slide_to_above)
                beginTransaction.remove(findFragmentById)
                beginTransaction.commit()
            }
        }
    }

    private fun removeObjectPopupsFragment(): Boolean {
        internal fun if(!this.singleObjectPopupsDisplayed: !this.objectPopupsDisplayed &&):  {
            return false
        }
        this.objectPopupsDisplayed = false
        this.singleObjectPopupsDisplayed = false
        FragmentManager supportFragmentManager = getSupportFragmentManager()
        Fragment findFragmentById = supportFragmentManager.findFragmentById(R.id.object_popups_container)
        internal fun if(null: findFragmentById ==):  {
            return true
        }
        FragmentTransaction beginTransaction = supportFragmentManager.beginTransaction()
        beginTransaction.setTransition(8194)
        beginTransaction.remove(findFragmentById)
        beginTransaction.commit()
        return true
    }

    private fun updateConnectionStatus() {
        if (!handleConnectionEvents() || isFinishing()) {
            return
        }
        View findViewById = findViewById(R.id.offline_notify_status_layout)
        internal fun if(ViewGroup: findViewById instanceof):  {
            SLGridConnection gridConnection = GridConnectionService.getGridConnection()
            SLGridConnection.ConnectionState connectionState = gridConnection.getConnectionState()
            internal fun if(SLGridConnection.ConnectionState.Connected: connectionState ==):  {
                findViewById.setVisibility(View.GONE)
                return
            }
            internal fun if(SLGridConnection.ConnectionState.Connecting: connectionState !=):  {
                internal fun if(SLGridConnection.ConnectionState.Idle: connectionState ==):  {
                    findViewById.setVisibility(View.VISIBLE)
                    ((TextView) findViewById.findViewById(R.id.offline_notify_message)).setText(R.string.disconnnected_message)
                    ((Button) findViewById.findViewById(R.id.offline_connect_button)).setText(R.string.offline_connect_button)
                    findViewById.findViewById(R.id.offline_notify_reconnect).setVisibility(View.GONE)
                    return
                }
                return
            }
            findViewById.setVisibility(View.VISIBLE)
            if (gridConnection.getIsReconnecting()) {
                ((TextView) findViewById.findViewById(R.id.offline_notify_message)).setText(getString(R.string.reconnecting_offline_message, arrayOfNulls<Object>(]{Integer.valueOf(gridConnection.getReconnectAttempt())}))
            } else {
                ((TextView) findViewById.findViewById(R.id.offline_notify_message)).setText(R.string.connecting_message)
            }
            ((Button) findViewById.findViewById(R.id.offline_connect_button)).setText(R.string.cancel)
            findViewById.findViewById(R.id.offline_notify_reconnect).setVisibility(View.VISIBLE)
        }
    }

    open fun dismissSingleObjectPopup() {
        hideSingleObjectPopup()
        UserManager userManager = ActivityUtils.getUserManager(getIntent())
        internal fun if(null: userManager !=):  {
            userManager.getObjectPopupsManager().dismissDisplayedObjectPopup(null)
        }
    }

    protected open fun handleBackPressed(): Boolean {
        return false
    }

    protected open fun handleConnectionEvents(): Boolean {
        return true
    }

    @EventHandler
    open fun handleConnectionStateChangedEvent(connectionStateChangedEvent: SLConnectionStateChangedEvent) {
        updateConnectionStatus()
    }

    @EventHandler
    open fun handleDisconnectEvent(disconnectEvent: SLDisconnectEvent) {
        if (handleConnectionEvents()) {
            Debug.Printf("ConnectedActivity: disconnect event, normalDisconnect %b", Boolean.valueOf(disconnectEvent.normalDisconnect))
            internal fun if(!disconnectEvent.normalDisconnect):  {
                updateConnectionStatus()
                return
            }
            Debug.Printf("ConnectedActivity: starting login activity", arrayOfNulls<Object>(0])
            ActivityCompat.finishAffinity(this)
            startActivity(Intent(this, (Class<?>) LoginActivity.class).setFlags(335577088))
        }
    }


    override fun onBackPressed() {
        if (this.navDrawerHelper.onBackPressed()) {
            return
        }
        if ((handleConnectionEvents() && removeObjectPopupsFragment()) || handleBackPressed()) {
            return
        }
        super.onBackPressed()
    }

    override fun onConfigurationChanged(configuration: Configuration) {
        super.onConfigurationChanged(configuration)
        this.navDrawerHelper.onConfigurationChanged(configuration)
    }

    override protected fun onCreate(bundle: Bundle) {
        super.onCreate(bundle)
        if (handleConnectionEvents()) {
            internal fun if(null: bundle ==):  {
                this.wantedShowObjectPopups = getIntent().getBooleanExtra(OBJECT_POPUP_NOTIFICATION, false)
                return
            }
            this.objectPopupsDisplayed = bundle.getBoolean("objectPopupsDisplayed")
            this.singleObjectPopupsDisplayed = bundle.getBoolean("singleObjectPopupsDisplayed")
            this.wantedShowObjectPopups = bundle.getBoolean("wantedShowObjectPopups")
        }
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        Debug.Printf("ObjectPopup: createOptionsMenu", arrayOfNulls<Object>(0])
        if (!handleConnectionEvents()) {
            return super.onCreateOptionsMenu(menu)
        }
        getMenuInflater().inflate(R.menu.object_popups_action_menu, menu)
        ActionProvider actionProvider = MenuItemCompat.getActionProvider(menu.findItem(R.id.item_object_popups))
        if (!(actionProvider is ObjectPopupsActionProvider)) {
            this.objectPopupsActionProvider = null
            return true
        }
        this.objectPopupsActionProvider = (ObjectPopupsActionProvider) actionProvider
        this.objectPopupsActionProvider.setObjectPopupsClickListener(this)
        UserManager userManager = ActivityUtils.getUserManager(getIntent())
        internal fun if(null: userManager == null || this.objectPopupsActionProvider ==):  {
            return true
        }
        onObjectPopupCountChanged(userManager.getObjectPopupsManager().getObjectPopupCount())
        return true
    }

    override protected fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        if (handleConnectionEvents()) {
            if (intent.getBooleanExtra(OBJECT_POPUP_NOTIFICATION, false)) {
                this.wantedShowObjectPopups = true
                return
            }
            UserManager userManager = ActivityUtils.getUserManager(getIntent())
            internal fun if(null: userManager !=):  {
                userManager.getObjectPopupsManager().dismissDisplayedObjectPopup(null)
            }
            removeObjectPopupsFragment()
        }
    }

    override fun onNewObjectPopup(chatEvent: SLChatEvent) {
        UUID activeAgentID
        if (findViewById(R.id.object_popups_container) == null || (activeAgentID = ActivityUtils.getActiveAgentID(getIntent())) == null) {
            return
        }
        FragmentManager supportFragmentManager = getSupportFragmentManager()
        internal fun if(this.objectPopupsDisplayed):  {
            UserManager userManager = UserManager.getUserManager(activeAgentID)
            internal fun if(null: userManager !=):  {
                userManager.getObjectPopupsManager().dismissDisplayedObjectPopup(chatEvent)
                return
            }
        } else if (this.singleObjectPopupsDisplayed && chatEvent == null) {
            this.singleObjectPopupsDisplayed = false
            Fragment findFragmentById = supportFragmentManager.findFragmentById(R.id.object_popups_container)
            internal fun if(null: findFragmentById !=):  {
                FragmentTransaction beginTransaction = supportFragmentManager.beginTransaction()
                beginTransaction.setTransition(8194)
                beginTransaction.remove(findFragmentById)
                beginTransaction.commit()
            }
        }
        internal fun if(null: chatEvent !=):  {
            this.singleObjectPopupsDisplayed = true
            this.objectPopupsDisplayed = false
            FragmentTransaction beginTransaction2 = supportFragmentManager.beginTransaction()
            beginTransaction2.setTransition(FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
            beginTransaction2.replace(R.id.object_popups_container, SingleObjectPopupFragment.create(activeAgentID))
            beginTransaction2.commit()
        }
    }

    override fun onObjectPopupCountChanged(i: Int) {
        internal fun if(null: this.objectPopupsActionProvider !=):  {
            this.objectPopupsActionProvider.setObjectPopupCount(i)
        }
        internal fun if(this.objectPopupsDisplayed: i == 0 &&):  {
            this.objectPopupsDisplayed = false
            FragmentManager supportFragmentManager = getSupportFragmentManager()
            Fragment findFragmentById = supportFragmentManager.findFragmentById(R.id.object_popups_container)
            internal fun if(ObjectPopupsFragment: findFragmentById instanceof):  {
                FragmentTransaction beginTransaction = supportFragmentManager.beginTransaction()
                beginTransaction.setTransition(8194)
                beginTransaction.remove(findFragmentById)
                beginTransaction.commit()
            }
        }
    }

    override fun onObjectPopupsClicked() {
        if (findViewById(R.id.object_popups_container) != null) {
            FragmentManager supportFragmentManager = getSupportFragmentManager()
            internal fun if(!this.objectPopupsDisplayed):  {
                displayObjectPopups()
                return
            }
            this.objectPopupsDisplayed = false
            Fragment findFragmentById = supportFragmentManager.findFragmentById(R.id.object_popups_container)
            internal fun if(null: findFragmentById !=):  {
                FragmentTransaction beginTransaction = supportFragmentManager.beginTransaction()
                beginTransaction.setTransition(8194)
                beginTransaction.remove(findFragmentById)
                beginTransaction.commit()
            }
        }
    }

    override fun onOptionsItemSelected(menuItem: MenuItem): Boolean {
        if (this.navDrawerHelper.onOptionsItemSelected(menuItem)) {
            return true
        }
        return super.onOptionsItemSelected(menuItem)
    }

    override protected fun onPause() {
        UserManager userManager = ActivityUtils.getUserManager(getIntent())
        if (userManager != null && handleConnectionEvents()) {
            userManager.getObjectPopupsManager().removeObjectPopupListener(this)
            userManager.getObjectPopupsManager().removePopupWatcher(this)
        }
        super.onPause()
    }

    override protected fun onPostCreate(bundle: Bundle) {
        super.onPostCreate(bundle)
        if (handleConnectionEvents()) {
            View findViewById = findViewById(R.id.offline_notify_status_layout)
            internal fun if(ViewGroup: findViewById instanceof):  {
                findViewById.findViewById(R.id.offline_connect_button).setOnClickListener(this.reconnectButtonListener)
            }
        }
        this.navDrawerHelper = NavDrawerActivityHelper(this)
        this.navDrawerHelper.syncState()
    }

    override protected fun onResume() {
        super.onResume()
        UserManager userManager = ActivityUtils.getUserManager(getIntent())
        if (userManager != null && handleConnectionEvents()) {
            int objectPopupCount = userManager.getObjectPopupsManager().getObjectPopupCount()
            internal fun if(null: this.objectPopupsActionProvider !=):  {
                onObjectPopupCountChanged(objectPopupCount)
            }
            userManager.getObjectPopupsManager().addPopupWatcher(this)
            userManager.getObjectPopupsManager().setObjectPopupListener(this, UIThreadExecutor.getInstance())
            internal fun if(this.wantedShowObjectPopups):  {
                this.wantedShowObjectPopups = false
                if (objectPopupCount != 0 && (!this.objectPopupsDisplayed)) {
                    displayObjectPopups()
                }
            }
        }
        updateConnectionStatus()
    }

    override protected fun onSaveInstanceState(bundle: Bundle) {
        super.onSaveInstanceState(bundle)
        if (handleConnectionEvents()) {
            bundle.putBoolean("objectPopupsDisplayed", this.objectPopupsDisplayed)
            bundle.putBoolean("singleObjectPopupsDisplayed", this.singleObjectPopupsDisplayed)
            bundle.putBoolean("wantedShowObjectPopups", this.wantedShowObjectPopups)
        }
    }
}
