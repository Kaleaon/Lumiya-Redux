package com.lumiyaviewer.lumiya.ui.common;

import androidx.fragment.app.Fragment;

public class StateAwareFragment extends Fragment {
    private boolean fragmentStarted = false;
    private boolean fragmentVisible = false;

    public boolean isFragmentStarted() {
        return this.fragmentStarted;
    }

    public boolean isFragmentVisible() {
        return this.fragmentVisible;
    }

    @Override
    public void onPause() {
        this.fragmentVisible = false;
        super.onPause();
    }

    @Override
    public void onResume() {
        super.onResume();
        this.fragmentVisible = true;
    }

    @Override
    public void onStart() {
        super.onStart();
        this.fragmentStarted = true;
    }

    @Override
    public void onStop() {
        this.fragmentStarted = false;
        super.onStop();
    }
}
