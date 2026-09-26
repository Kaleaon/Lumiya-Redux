package com.lumiyaviewer.lumiya.ui.common

import android.content.Intent
import android.os.Bundle

fun interface ReloadableFragment {
    fun setFragmentArgs(intent: Intent?, bundle: Bundle?)
}
