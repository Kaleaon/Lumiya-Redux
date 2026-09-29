package com.lumiyaviewer.lumiya.ui.common

import android.content.Intent
import android.content.res.Configuration
import android.os.Bundle
import androidx.core.app.ActivityCompat
import androidx.fragment.app.Fragment
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
    companion object {
        const val OBJECT_POPUP_NOTIFICATION = "objectPopupNotification"
    }

    private lateinit var navDrawerHelper: NavDrawerActivityHelper

    private var objectPopupsActionProvider: ObjectPopupsActionProvider? = null
    private var objectPopupsDisplayed = false
    private var singleObjectPopupsDisplayed = false
    private var wantedShowObjectPopups = false
    private val reconnectButtonListener = View.OnClickListener { _ ->
        val gridConnection = GridConnectionService.getGridConnection()
        val connectionState = gridConnection.getConnectionState()
        if (connectionState == SLGridConnection.ConnectionState.Connecting) {
            gridConnection.Disconnect()
        } else if (connectionState == SLGridConnection.ConnectionState.Idle) {
            EventBus.getInstance().publish(SLDisconnectEvent(true, null))
            ActivityCompat.finishAffinity(this)
            startActivity(Intent(this, LoginActivity::class.java).setFlags(335577088))
        }
    }

    private fun displayObjectPopups() {
        val supportFragmentManager = supportFragmentManager
        val activeAgentID = ActivityUtils.getActiveAgentID(intent)
        if (activeAgentID != null) {
            val userManager = UserManager.getUserManager(activeAgentID)
            if (userManager != null) {
                userManager.getObjectPopupsManager().dismissDisplayedObjectPopup(null)
            }
            this.singleObjectPopupsDisplayed = false
            this.objectPopupsDisplayed = true
            val currentFocus = currentFocus
            if (currentFocus != null) {
                currentFocus.clearFocus()
                (getSystemService("input_method") as InputMethodManager).hideSoftInputFromWindow(currentFocus.windowToken, 0)
            }
            val beginTransaction = supportFragmentManager.beginTransaction()
            beginTransaction.setTransition(androidx.fragment.app.FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
            beginTransaction.replace(R.id.object_popups_container, ObjectPopupsFragment.create(activeAgentID))
            beginTransaction.commit()
        }
    }

    private fun hideSingleObjectPopup() {
        if (this.singleObjectPopupsDisplayed) {
            this.singleObjectPopupsDisplayed = false
            val supportFragmentManager = supportFragmentManager
            val findFragmentById = supportFragmentManager.findFragmentById(R.id.object_popups_container)
            if (findFragmentById is SingleObjectPopupFragment) {
                val beginTransaction = supportFragmentManager.beginTransaction()
                beginTransaction.setCustomAnimations(0, R.anim.slide_to_above)
                beginTransaction.remove(findFragmentById)
                beginTransaction.commit()
            }
        }
    }

    private fun removeObjectPopupsFragment(): Boolean {
        if (!this.objectPopupsDisplayed && !this.singleObjectPopupsDisplayed) {
            return false
        }
        this.objectPopupsDisplayed = false
        this.singleObjectPopupsDisplayed = false
        val supportFragmentManager = supportFragmentManager
        val findFragmentById = supportFragmentManager.findFragmentById(R.id.object_popups_container) ?: return true
        val beginTransaction = supportFragmentManager.beginTransaction()
        beginTransaction.setTransition(8194)
        beginTransaction.remove(findFragmentById)
        beginTransaction.commit()
        return true
    }

    private fun updateConnectionStatus() {
        if (!handleConnectionEvents() || isFinishing) {
            return
        }
        val findViewById = findViewById<View>(R.id.offline_notify_status_layout)
        if (findViewById is ViewGroup) {
            val gridConnection = GridConnectionService.getGridConnection()
            val connectionState = gridConnection.getConnectionState()
            if (connectionState == SLGridConnection.ConnectionState.Connected) {
                findViewById.visibility = View.GONE
                return
            }
            if (connectionState != SLGridConnection.ConnectionState.Connecting) {
                if (connectionState == SLGridConnection.ConnectionState.Idle) {
                    findViewById.visibility = View.VISIBLE
                    findViewById.findViewById<TextView>(R.id.offline_notify_message).setText(R.string.disconnnected_message)
                    findViewById.findViewById<Button>(R.id.offline_connect_button).setText(R.string.offline_connect_button)
                    findViewById.findViewById<View>(R.id.offline_notify_reconnect).visibility = View.GONE
                    return
                }
                return
            }
            findViewById.visibility = View.VISIBLE
            if (gridConnection.getIsReconnecting()) {
                findViewById.findViewById<TextView>(R.id.offline_notify_message).text =
                    getString(R.string.reconnecting_offline_message, gridConnection.getReconnectAttempt())
            } else {
                findViewById.findViewById<TextView>(R.id.offline_notify_message).setText(R.string.connecting_message)
            }
            findViewById.findViewById<Button>(R.id.offline_connect_button).setText(R.string.cancel)
            findViewById.findViewById<View>(R.id.offline_notify_reconnect).visibility = View.VISIBLE
        }
    }

    fun dismissSingleObjectPopup() {
        hideSingleObjectPopup()
        val userManager = ActivityUtils.getUserManager(intent)
        if (userManager != null) {
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
    fun handleConnectionStateChangedEvent(connectionStateChangedEvent: SLConnectionStateChangedEvent) {
        updateConnectionStatus()
    }

    @EventHandler
    fun handleDisconnectEvent(disconnectEvent: SLDisconnectEvent) {
        if (handleConnectionEvents()) {
            Debug.Printf("ConnectedActivity: disconnect event, normalDisconnect %b", disconnectEvent.normalDisconnect)
            if (!disconnectEvent.normalDisconnect) {
                updateConnectionStatus()
                return
            }
            Debug.Printf("ConnectedActivity: starting login activity")
            ActivityCompat.finishAffinity(this)
            startActivity(Intent(this, LoginActivity::class.java).setFlags(335577088))
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

    override fun onCreate(bundle: Bundle?) {
        super.onCreate(bundle)
        if (handleConnectionEvents()) {
            if (bundle == null) {
                this.wantedShowObjectPopups = intent.getBooleanExtra(OBJECT_POPUP_NOTIFICATION, false)
                return
            }
            this.objectPopupsDisplayed = bundle.getBoolean("objectPopupsDisplayed")
            this.singleObjectPopupsDisplayed = bundle.getBoolean("singleObjectPopupsDisplayed")
            this.wantedShowObjectPopups = bundle.getBoolean("wantedShowObjectPopups")
        }
    }

    override fun onCreateOptionsMenu(menu: Menu): Boolean {
        Debug.Printf("ObjectPopup: createOptionsMenu")
        if (!handleConnectionEvents()) {
            return super.onCreateOptionsMenu(menu)
        }
        menuInflater.inflate(R.menu.object_popups_action_menu, menu)
        val actionProvider = MenuItemCompat.getActionProvider(menu.findItem(R.id.item_object_popups))
        if (actionProvider !is ObjectPopupsActionProvider) {
            this.objectPopupsActionProvider = null
            return true
        }
        this.objectPopupsActionProvider = actionProvider
        actionProvider.setObjectPopupsClickListener(this)
        val userManager = ActivityUtils.getUserManager(intent)
        val objectPopupsActionProvider = this.objectPopupsActionProvider
        if (userManager == null || objectPopupsActionProvider == null) {
            return true
        }
        onObjectPopupCountChanged(userManager.getObjectPopupsManager().getObjectPopupCount())
        return true
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        if (handleConnectionEvents()) {
            if (intent.getBooleanExtra(OBJECT_POPUP_NOTIFICATION, false)) {
                this.wantedShowObjectPopups = true
                return
            }
            val userManager = ActivityUtils.getUserManager(this.intent)
            if (userManager != null) {
                userManager.getObjectPopupsManager().dismissDisplayedObjectPopup(null)
            }
            removeObjectPopupsFragment()
        }
    }

    override fun onNewObjectPopup(chatEvent: SLChatEvent?) {
        if (findViewById<View>(R.id.object_popups_container) == null) {
            return
        }
        val activeAgentID = ActivityUtils.getActiveAgentID(intent) ?: return
        val supportFragmentManager = supportFragmentManager
        if (this.objectPopupsDisplayed) {
            val userManager = UserManager.getUserManager(activeAgentID)
            if (userManager != null) {
                userManager.getObjectPopupsManager().dismissDisplayedObjectPopup(chatEvent)
                return
            }
        } else if (this.singleObjectPopupsDisplayed && chatEvent == null) {
            this.singleObjectPopupsDisplayed = false
            val findFragmentById = supportFragmentManager.findFragmentById(R.id.object_popups_container)
            if (findFragmentById != null) {
                val beginTransaction = supportFragmentManager.beginTransaction()
                beginTransaction.setTransition(8194)
                beginTransaction.remove(findFragmentById)
                beginTransaction.commit()
            }
        }
        if (chatEvent != null) {
            this.singleObjectPopupsDisplayed = true
            this.objectPopupsDisplayed = false
            val beginTransaction2 = supportFragmentManager.beginTransaction()
            beginTransaction2.setTransition(androidx.fragment.app.FragmentTransaction.TRANSIT_FRAGMENT_OPEN)
            beginTransaction2.replace(R.id.object_popups_container, SingleObjectPopupFragment.create(activeAgentID))
            beginTransaction2.commit()
        }
    }

    override fun onObjectPopupCountChanged(i: Int) {
        val objectPopupsActionProvider = this.objectPopupsActionProvider
        if (objectPopupsActionProvider != null) {
            objectPopupsActionProvider.setObjectPopupCount(i)
        }
        if (i == 0 && this.objectPopupsDisplayed) {
            this.objectPopupsDisplayed = false
            val supportFragmentManager = supportFragmentManager
            val findFragmentById = supportFragmentManager.findFragmentById(R.id.object_popups_container)
            if (findFragmentById is ObjectPopupsFragment) {
                val beginTransaction = supportFragmentManager.beginTransaction()
                beginTransaction.setTransition(8194)
                beginTransaction.remove(findFragmentById)
                beginTransaction.commit()
            }
        }
    }

    override fun onObjectPopupsClicked() {
        if (findViewById<View>(R.id.object_popups_container) != null) {
            val supportFragmentManager = supportFragmentManager
            if (!this.objectPopupsDisplayed) {
                displayObjectPopups()
                return
            }
            this.objectPopupsDisplayed = false
            val findFragmentById = supportFragmentManager.findFragmentById(R.id.object_popups_container)
            if (findFragmentById != null) {
                val beginTransaction = supportFragmentManager.beginTransaction()
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

    override fun onPause() {
        val userManager = ActivityUtils.getUserManager(intent)
        if (userManager != null && handleConnectionEvents()) {
            userManager.getObjectPopupsManager().removeObjectPopupListener(this)
            userManager.getObjectPopupsManager().removePopupWatcher(this)
        }
        super.onPause()
    }

    override fun onPostCreate(bundle: Bundle?) {
        super.onPostCreate(bundle)
        if (handleConnectionEvents()) {
            val findViewById = findViewById<View>(R.id.offline_notify_status_layout)
            if (findViewById is ViewGroup) {
                findViewById.findViewById<View>(R.id.offline_connect_button).setOnClickListener(this.reconnectButtonListener)
            }
        }
        this.navDrawerHelper = NavDrawerActivityHelper(this)
        this.navDrawerHelper.syncState()
    }

    override fun onResume() {
        super.onResume()
        val userManager = ActivityUtils.getUserManager(intent)
        if (userManager != null && handleConnectionEvents()) {
            val objectPopupCount = userManager.getObjectPopupsManager().getObjectPopupCount()
            if (this.objectPopupsActionProvider != null) {
                onObjectPopupCountChanged(objectPopupCount)
            }
            userManager.getObjectPopupsManager().addPopupWatcher(this)
            userManager.getObjectPopupsManager().setObjectPopupListener(this, UIThreadExecutor.getInstance())
            if (this.wantedShowObjectPopups) {
                this.wantedShowObjectPopups = false
                if (objectPopupCount != 0 && !this.objectPopupsDisplayed) {
                    displayObjectPopups()
                }
            }
        }
        updateConnectionStatus()
    }

    override fun onSaveInstanceState(bundle: Bundle) {
        super.onSaveInstanceState(bundle)
        if (handleConnectionEvents()) {
            bundle.putBoolean("objectPopupsDisplayed", this.objectPopupsDisplayed)
            bundle.putBoolean("singleObjectPopupsDisplayed", this.singleObjectPopupsDisplayed)
            bundle.putBoolean("wantedShowObjectPopups", this.wantedShowObjectPopups)
        }
    }
}
