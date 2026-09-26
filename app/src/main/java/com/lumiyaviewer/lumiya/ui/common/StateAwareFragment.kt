package com.lumiyaviewer.lumiya.ui.common

import androidx.fragment.app.Fragment

open class StateAwareFragment : Fragment() {
    private var fragmentStarted = false
    private var fragmentVisible = false

    fun isFragmentStarted(): Boolean = fragmentStarted

    fun isFragmentVisible(): Boolean = fragmentVisible

    override fun onPause() {
        fragmentVisible = false
        super.onPause()
    }

    override fun onResume() {
        super.onResume()
        fragmentVisible = true
    }

    override fun onStart() {
        super.onStart()
        fragmentStarted = true
    }

    override fun onStop() {
        fragmentStarted = false
        super.onStop()
    }
}
