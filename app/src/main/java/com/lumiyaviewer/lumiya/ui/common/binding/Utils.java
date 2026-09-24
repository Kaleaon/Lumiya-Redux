package com.lumiyaviewer.lumiya.ui.common.binding;

import android.view.View;
import androidx.annotation.IdRes;

/**
 * View lookups used by the <code>*_ViewBinding</code> classes. Same checks
 * and messages as <code>butterknife.internal.Utils</code> (10.2.3): a missing
 * required view or a view of the wrong type fails at bind time, naming the
 * resource and the field or method it was bound for.
 */
public final class Utils {
    private Utils() {
    }

    public static View findRequiredView(View source, @IdRes int id, String who) {
        View view = source.findViewById(id);
        if (view != null) {
            return view;
        }
        String name = getResourceEntryName(source, id);
        throw new IllegalStateException("Required view '" + name + "' with ID " + id + " for " + who
                + " was not found.");
    }

    public static <T> T findRequiredViewAsType(View source, @IdRes int id, String who, Class<T> cls) {
        return castView(findRequiredView(source, id, who), id, who, cls);
    }

    public static <T> T castView(View view, @IdRes int id, String who, Class<T> cls) {
        try {
            return cls.cast(view);
        } catch (ClassCastException e) {
            String name = getResourceEntryName(view, id);
            throw new IllegalStateException("View '" + name + "' with ID " + id + " for " + who
                    + " was of the wrong type. See cause for more info.", e);
        }
    }

    private static String getResourceEntryName(View view, @IdRes int id) {
        if (view.isInEditMode()) {
            return "<unavailable while editing>";
        }
        return view.getContext().getResources().getResourceEntryName(id);
    }
}
