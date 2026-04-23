package com.lumiyaviewer.lumiya.ui.settings;

import android.content.Context;
import androidx.preference.EditTextPreference;
import android.text.TextUtils;
import android.util.AttributeSet;

/* loaded from: classes.dex */
public class FriendlyEditTextPreference extends EditTextPreference {
    public FriendlyEditTextPreference(Context context) {
        super(context);
    }

    public FriendlyEditTextPreference(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
    }

    public FriendlyEditTextPreference(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
    }

    @Override // androidx.preference.Preference
    public CharSequence getSummary() {
        CharSequence summary;
        String text = getText();
        if (TextUtils.isEmpty(text) || (summary = super.getSummary()) == null) {
            return null;
        }
        return String.format(summary.toString(), text);
    }
}
