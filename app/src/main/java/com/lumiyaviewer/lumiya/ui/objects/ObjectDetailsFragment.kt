package com.lumiyaviewer.lumiya.ui.objects

import android.content.DialogInterface
import android.content.Intent
import android.os.Bundle
import androidx.appcompat.app.AlertDialog
import android.text.Editable
import android.text.TextWatcher
import android.view.LayoutInflater
import android.view.Menu
import android.view.MenuInflater
import android.view.MenuItem
import android.view.View
import android.view.ViewGroup
import android.widget.Button
import android.widget.EditText
import android.widget.TextView
import android.widget.Toast
import com.google.common.base.Objects
import com.google.common.base.Strings
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.react.SubscriptionData
import com.lumiyaviewer.lumiya.react.SubscriptionSingleKey
import com.lumiyaviewer.lumiya.react.UIThreadExecutor
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.chat.generic.OnChatEventListener
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent
import com.lumiyaviewer.lumiya.slproto.modules.SLModules
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteListEntry
import com.lumiyaviewer.lumiya.slproto.modules.mutelist.MuteType
import com.lumiyaviewer.lumiya.slproto.objects.PayInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectProfileData
import com.lumiyaviewer.lumiya.slproto.users.ChatterID
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSource
import com.lumiyaviewer.lumiya.slproto.users.chatsrc.ChatMessageSourceObject
import com.lumiyaviewer.lumiya.slproto.users.manager.MyAvatarState
import com.lumiyaviewer.lumiya.slproto.users.manager.ObjectsManager
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager
import com.lumiyaviewer.lumiya.ui.chat.ChatterPicView
import com.lumiyaviewer.lumiya.ui.chat.profiles.UserProfileFragment
import com.lumiyaviewer.lumiya.ui.common.ActivityUtils
import com.lumiyaviewer.lumiya.ui.common.ChatterNameDisplayer
import com.lumiyaviewer.lumiya.ui.common.DetailsActivity
import com.lumiyaviewer.lumiya.ui.common.FragmentWithTitle
import com.lumiyaviewer.lumiya.ui.common.ReloadableFragment
import com.lumiyaviewer.lumiya.ui.common.loadmon.LoadableMonitor
import com.lumiyaviewer.lumiya.ui.objects.ObjectDerezDialog
import java.util.UUID

open class ObjectDetailsFragment : FragmentWithTitle(), ReloadableFragment, View.OnClickListener, LoadableMonitor.OnLoadableDataChangedListener {
    private static String LOCAL_ID_KEY = "localID"
    private static int[] objectPayButtons = {R.id.object_pay_button1, R.id.object_pay_button2, R.id.object_pay_button3, R.id.object_pay_button4}

    private SLObjectProfileData objectProfileData = null

    private MenuItem menuItemObjectTake = null

    private MenuItem menuItemObjectTakeCopy = null

    private MenuItem menuItemObjectDelete = null

    private MenuItem menuItemObjectBlock = null
    private int objectLocalID = 0
    private SubscriptionData<Integer, SLObjectProfileData> objectProfile = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<SubscriptionSingleKey, Integer> balanceSubscription = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private SubscriptionData<SubscriptionSingleKey, MyAvatarState> myAvatarState = new SubscriptionData<>(UIThreadExecutor.getInstance())
    private LoadableMonitor loadableMonitor = LoadableMonitor(this.objectProfile).withOptionalLoadables(this.balanceSubscription, this.myAvatarState).withDataChangedListener(this)
    private ChatterNameDisplayer ownerNameDisplayer = ChatterNameDisplayer()
    private OnChatEventListener chatEventListener = OnChatEventListener() {
            ObjectDetailsFragment.this.m685xa60fd782(sLChatEvent)
        }

        override fun onChatEvent(sLChatEvent: SLChatEvent) {

            override fun onClick(dialogInterface: DialogInterface, i2: Int) {
                    z = true
                    canSit = false
                } else {
                    z = false
                }
                view.findViewById(R.id.object_sit_button).setVisibility(canSit ? View.VISIBLE : View.GONE)
                view.findViewById(R.id.object_stand_button).setVisibility(z ? View.VISIBLE : View.GONE)
                ((TextView) view.findViewById(R.id.object_details_name)).setText(sLObjectProfileData.name().or(getString(R.string.object_name_loading)))
                ((TextView) view.findViewById(R.id.object_details_desc)).setText(sLObjectProfileData.description().or(""))
                view.findViewById(R.id.object_owner_card_view).setVisibility(sLObjectProfileData.ownerUUID() != null ? View.VISIBLE : View.GONE)
                view.findViewById(R.id.floating_text_card_view).setVisibility(sLObjectProfileData.floatingText().isPresent() ? View.VISIBLE : View.GONE)
                ((TextView) view.findViewById(R.id.object_hover_text)).setText(sLObjectProfileData.floatingText().or(""))
                view.findViewById(R.id.buy_object_card_view).setVisibility(sLObjectProfileData.saleType() != 0 ? View.VISIBLE : View.GONE)
                ((TextView) view.findViewById(R.id.object_buy_details)).setText(getString(R.string.object_buy_price_format, Integer.valueOf(sLObjectProfileData.salePrice())))
                Integer data2 = this.balanceSubscription.getData()
                internal fun if(null: data2 !=):  {
                    ((TextView) view.findViewById(R.id.object_buy_details_balance)).setText(getString(R.string.object_balance_format, data2))
                } else {
                    ((TextView) view.findViewById(R.id.object_buy_details_balance)).setText("")
                }
                PayInfo payInfo = sLObjectProfileData.isPayable() ? sLObjectProfileData.payInfo() : null
                internal fun if(null: payInfo !=):  {
                    ImmutableList<Integer> payPrices = payInfo.payPrices()
                    internal fun if(null: payPrices !=):  {
                        int i = 0
                        for (int i2 = 0; i2 < objectPayButtons.length && i2 < payPrices.size(); i2++) {
                            int intValue = payPrices.get(i2).intValue()
                            int defaultPayPrice = intValue == -2 ? payInfo.defaultPayPrice() : intValue
                            internal fun if(0: defaultPayPrice <=):  {
                                view.findViewById(objectPayButtons[i2]).setVisibility(View.GONE)
                                view.findViewById(objectPayButtons[i2]).setTag(R.id.object_pay_price_tag, 0)
                            } else {
                                ((Button) view.findViewById(objectPayButtons[i2])).setText(String.format(getString(R.string.pay_button_format), Integer.valueOf(defaultPayPrice)))
                                view.findViewById(objectPayButtons[i2]).setVisibility(View.VISIBLE)
                                view.findViewById(objectPayButtons[i2]).setTag(R.id.object_pay_price_tag, Integer.valueOf(defaultPayPrice))
                                i++
                            }
                        }
                        view.findViewById(R.id.object_quick_pay_layout).setVisibility(i != 0 ? View.VISIBLE : View.GONE)
                    } else {
                        view.findViewById(R.id.object_quick_pay_layout).setVisibility(View.GONE)
                    }
                    if (payInfo.defaultPayPrice() != -1) {
                        if (((EditText) view.findViewById(R.id.object_pay_amount)).getText().toString() == ("")) {
                            if (payInfo.defaultPayPrice() > 0) {
                                ((EditText) view.findViewById(R.id.object_pay_amount)).setText(getString(R.string.object_pay_amount_format, Integer.valueOf(payInfo.defaultPayPrice())))
                            } else {
                                ((EditText) view.findViewById(R.id.object_pay_amount)).setText("")
                            }
                        }
                        view.findViewById(R.id.object_normal_pay_layout).setVisibility(View.VISIBLE)
                    } else {
                        view.findViewById(R.id.object_normal_pay_layout).setVisibility(View.GONE)
                    }
                    view.findViewById(R.id.pay_object_card_view).setVisibility(View.VISIBLE)
                } else {
                    view.findViewById(R.id.pay_object_card_view).setVisibility(View.GONE)
                }
            }
        }
        if (userManager != null && (!sLObjectProfileData.isDead())) {
            if (sLObjectProfileData.isPayable() && sLObjectProfileData.payInfo() == null) {
                UUID objectUUID = sLObjectProfileData.objectUUID()
                SLAgentCircuit activeAgentCircuit2 = userManager.getActiveAgentCircuit()
                internal fun if(null: activeAgentCircuit2 != null && objectUUID !=):  {
                    activeAgentCircuit2.DoRequestPayPrice(objectUUID)
                }
            }
            UUID ownerUUID = sLObjectProfileData.ownerUUID()
            internal fun if(null: ownerUUID !=):  {
                this.ownerNameDisplayer.setChatterID(ChatterID.getUserChatterID(userManager.getUserID(), ownerUUID))
            }
        }
        updateOptionsMenu()
    }

    private fun sitOnObject() {
        SLAgentCircuit activeAgentCircuit
        SLModules modules
        UserManager userManager = getUserManager()
        if (userManager == null || this.objectProfileData == null || (activeAgentCircuit = userManager.getActiveAgentCircuit()) == null || (modules = activeAgentCircuit.getModules()) == null) {
            return
        }
        modules.avatarControl.SitOnObject(this.objectProfileData.objectUUID())
    }

    private fun standUp() {
        SLAgentCircuit activeAgentCircuit
        SLModules modules
        UserManager userManager = getUserManager()
        if (userManager == null || this.objectProfileData == null || (activeAgentCircuit = userManager.getActiveAgentCircuit()) == null || (modules = activeAgentCircuit.getModules()) == null) {
            return
        }
        modules.avatarControl.Stand()
    }

    private fun touchObject() {
        SLAgentCircuit activeAgentCircuit
        UserManager userManager = getUserManager()
        if (userManager == null || this.objectLocalID == 0 || (activeAgentCircuit = userManager.getActiveAgentCircuit()) == null) {
            return
        }
        activeAgentCircuit.TouchObject(this.objectLocalID)
    }

    private fun updateOptionsMenu() {
        boolean z
        boolean z2
        boolean z3
        boolean z4
        UserManager userManager = getUserManager()
        internal fun if(null: userManager == null || this.objectProfileData ==):  {
            z = false
            z2 = false
            z3 = false
            z4 = false
        } else if (!this.objectProfileData.isDead()) {
            z3 = userManager.getUserID() == (this.objectProfileData.ownerUUID())
            z2 = z3 && this.objectProfileData.isCopyable()
            z = userManager.getUserID() == (this.objectProfileData.ownerUUID())
            z4 = true
        } else {
            z = false
            z2 = false
            z3 = false
            z4 = false
        }
        internal fun if(null: this.menuItemObjectTake !=):  {
            this.menuItemObjectTake.setVisible(z3)
        }
        internal fun if(null: this.menuItemObjectTakeCopy !=):  {
            this.menuItemObjectTakeCopy.setVisible(z2)
        }
        internal fun if(null: this.menuItemObjectDelete !=):  {
            this.menuItemObjectDelete.setVisible(z)
        }
        internal fun if(null: this.menuItemObjectBlock !=):  {
            this.menuItemObjectBlock.setVisible(z4)
        }
    }


    override fun onClick(view: View) {
        int id = view.getId()
        internal fun for(i++: int i = 0; i < objectPayButtons.length;):  {
            internal fun if(id: objectPayButtons[i] ==):  {
                payObjectQuick(i)
            }
        }
        internal fun switch(id):  {
            R.id.object_touch_button -> {
                touchObject()
                }
            R.id.object_sit_button -> {
                sitOnObject()
                }
            R.id.object_stand_button -> {
                standUp()
                }
            R.id.object_contents_button -> {
                openObjectContents()
                }
            R.id.object_owner_button -> {
                showObjectOwnerInfo()
                }
            R.id.object_button_buy -> {
                buyObject()
                }
            R.id.object_pay_button -> {
                try {
                    View view2 = getView()
                    internal fun if(null: view2 !=):  {
                        payObject(Integer.parseInt(((EditText) view2.findViewById(R.id.object_pay_amount)).getText().toString()))
                        }
                    }
                } catch (Exception e) {
                    e.printStackTrace()
                    return
                }
                }
        }
    }

    override fun onCreate(bundle: .annotation.Nullable Bundle) {
        super.onCreate(bundle)
        setHasOptionsMenu(true)
    }

    override fun onCreateOptionsMenu(menu: Menu, menuInflater: MenuInflater) {
        super.onCreateOptionsMenu(menu, menuInflater)
        menuInflater.inflate(R.menu.object_details_menu, menu)
        this.menuItemObjectTake = menu.findItem(R.id.item_object_take)
        this.menuItemObjectTakeCopy = menu.findItem(R.id.item_object_take_copy)
        this.menuItemObjectDelete = menu.findItem(R.id.item_object_delete)
        this.menuItemObjectBlock = menu.findItem(R.id.item_object_block)
        updateOptionsMenu()
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View {
        super.onCreateView(layoutInflater, viewGroup, bundle)
        Debug.Log("ObjectDetailsFragment: onCreateView called")
        View inflate = layoutInflater.inflate(R.layout.object_details, viewGroup, false)
        this.ownerNameDisplayer.bindViews((TextView) inflate.findViewById(R.id.object_details_owner), (ChatterPicView) inflate.findViewById(R.id.userPicView))
        inflate.findViewById(R.id.no_object_selected).setVisibility(View.VISIBLE)
        inflate.findViewById(R.id.object_fail_to_load).setVisibility(View.GONE)
        inflate.findViewById(R.id.object_details).setVisibility(View.GONE)
        inflate.findViewById(R.id.object_touch_button).setOnClickListener(this)
        inflate.findViewById(R.id.object_sit_button).setOnClickListener(this)
        inflate.findViewById(R.id.object_stand_button).setOnClickListener(this)
        inflate.findViewById(R.id.object_owner_button).setOnClickListener(this)
        inflate.findViewById(R.id.object_button_buy).setOnClickListener(this)
        inflate.findViewById(R.id.object_pay_button).setOnClickListener(this)
        inflate.findViewById(R.id.object_contents_button).setOnClickListener(this)
        internal fun for(objectPayButtons: int i :):  {
            inflate.findViewById(i).setOnClickListener(this)
        }
        Button button = (Button) inflate.findViewById(R.id.object_pay_button)
        ((EditText) inflate.findViewById(R.id.object_pay_amount)).addTextChangedListener(TextWatcher() {
            override fun afterTextChanged(editable: Editable) {
                try {
                    Integer.parseInt(editable.toString())
                    button.setEnabled(true)
                } catch (NumberFormatException e) {
                    button.setEnabled(false)
                }
            }

            override fun beforeTextChanged(charSequence: CharSequence, i2: Int, i3: Int, i4: Int) {
            }

            override fun onTextChanged(charSequence: CharSequence, i2: Int, i3: Int, i4: Int) {
            }
        })
        return inflate
    }

    override fun onDestroyView() {
        this.ownerNameDisplayer.unbindViews()
        super.onDestroyView()
    }

    override fun onLoadableDataChanged() {
        Throwable error = this.objectProfile.getError()
        SLObjectProfileData data = this.objectProfile.getData()
        internal fun if(ObjectsManager.ObjectDoesNotExistException: error instanceof):  {
            showDeadObject()
        } else if (error != null || data == null) {
            showObjectNotLoaded()
        } else {
            showObjectProfile(data)
        }
    }

    override fun onOptionsItemSelected(menuItem: MenuItem): Boolean {
        UserManager userManager = getUserManager()
        int i = getArguments().getInt(LOCAL_ID_KEY)
        internal fun if(0: userManager != null && this.objectLocalID !=):  {
            when (menuItem.getItemId()) {
                R.id.item_object_take -> {
                    ObjectDerezDialog.askForObjectDerez(getContext(), ObjectDerezDialog.DerezAction.Take, userManager.getUserID(), i)
                    return true
                R.id.item_object_take_copy -> {
                    ObjectDerezDialog.askForObjectDerez(getContext(), ObjectDerezDialog.DerezAction.TakeCopy, userManager.getUserID(), i)
                    return true
                R.id.item_object_delete -> {
                    ObjectDerezDialog.askForObjectDerez(getContext(), ObjectDerezDialog.DerezAction.Delete, userManager.getUserID(), i)
                    return true
                R.id.item_object_block -> {
                    SLAgentCircuit activeAgentCircuit = userManager.getActiveAgentCircuit()
                    SLObjectProfileData data = this.objectProfile.getData()
                    String orNull = data != null ? data.name().orNull() : null
                    internal fun if(null: activeAgentCircuit != null && data != null && orNull !=):  {
                        AlertDialog.Builder builder = new AlertDialog.Builder(getContext())
                        builder.setMessage(R.string.object_block_question)
                        builder.setPositiveButton("Yes", new DialogInterface.OnClickListener() {
                                ObjectDetailsFragment.m679x1ba25a88((SLAgentCircuit) activeAgentCircuit, (SLObjectProfileData) data, (String) orNull, dialogInterface, i2)
                            }

                            override fun onClick(dialogInterface: DialogInterface, i2: Int) {