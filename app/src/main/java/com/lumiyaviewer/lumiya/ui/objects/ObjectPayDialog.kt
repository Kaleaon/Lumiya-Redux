package com.lumiyaviewer.lumiya.ui.objects

import android.content.Context
import android.content.DialogInterface
import androidx.appcompat.app.AlertDialog
import android.view.View
import android.widget.Button
import android.widget.EditText
import com.google.common.collect.ImmutableList
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit
import com.lumiyaviewer.lumiya.slproto.objects.PayInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectProfileData
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager

open class ObjectPayDialog {



    @JvmStatic
    fun show(context: Context, userManager: UserManager, sLObjectProfileData: SLObjectProfileData) {
        PayInfo payInfo = sLObjectProfileData.payInfo()
        if (payInfo != null) {
            AlertDialog.Builder builder = AlertDialog.Builder(context)
            builder.setTitle(context.getString(R.string.object_pay_dialog_caption, sLObjectProfileData.name().or(context.getString(R.string.name_loading_title))))
            builder.setCancelable(true)
            builder.setView(R.layout.object_pay_dialog)
            AlertDialog create = builder.create()
            create.setOnShowListener(DialogInterface.OnShowListener() {
                    ObjectPayDialog.m687lambda$com_lumiyaviewer_lumiya_ui_objects_ObjectPayDialog_1356((AlertDialog) create, (PayInfo) payInfo, (Context) context, (UserManager) userManager, (SLObjectProfileData) sLObjectProfileData, dialogInterface)
                }

                override fun onShow(dialogInterface: DialogInterface) {
