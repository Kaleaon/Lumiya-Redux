package com.lumiyaviewer.lumiya.ui.common;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import androidx.fragment.app.Fragment;

public interface FragmentActivityFactory {
    Intent createIntent(Context context, Bundle bundle);

    Class<? extends Fragment> getFragmentClass();
}
