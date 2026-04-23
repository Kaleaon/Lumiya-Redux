package com.google.vr.cardboard;

import android.content.ContentProviderClient;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ProviderInfo;
import android.content.pm.ResolveInfo;
import android.os.Build;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/* loaded from: classes.dex */
public final class VrParamsProviderFactory {
    private static final boolean DEBUG = false;
    private static final String TAG = VrParamsProviderFactory.class.getSimpleName();
    private static VrParamsProvider providerForTesting;

    public static class ContentProviderClientHandle {
        public final String authority;
        public final ContentProviderClient client;

        ContentProviderClientHandle(ContentProviderClient contentProviderClient, String str) {
            this.client = contentProviderClient;
            this.authority = str;
        }
    }

    public static VrParamsProvider create(Context context) {
        if (providerForTesting != null) {
            return providerForTesting;
        }
        ContentProviderClientHandle tryToGetContentProviderClientHandle = tryToGetContentProviderClientHandle(context);
        return tryToGetContentProviderClientHandle == null ? new LegacyVrParamsProvider() : new ContentProviderVrParamsProvider(tryToGetContentProviderClientHandle.client, tryToGetContentProviderClientHandle.authority);
    }

    private static List<String> getValidContentProviderAuthorities(Context context) {
        List<ResolveInfo> queryIntentContentProviders;
        if (Build.VERSION.SDK_INT < 19 || (queryIntentContentProviders = context.getPackageManager().queryIntentContentProviders(new Intent(VrSettingsProviderContract.PROVIDER_INTENT_ACTION), 0)) == null || queryIntentContentProviders.isEmpty()) {
            return null;
        }
        ArrayList arrayList = new ArrayList();
        Iterator<ResolveInfo> it = queryIntentContentProviders.iterator();
        while (it.hasNext()) {
            ProviderInfo providerInfo = it.next().providerInfo;
            if (PackageUtils.isGooglePackage(providerInfo.packageName)) {
                arrayList.add(providerInfo.authority);
            }
        }
        return arrayList;
    }

    public static boolean isContentProviderAvailable(Context context) {
        if (providerForTesting != null && (providerForTesting instanceof ContentProviderVrParamsProvider)) {
            return true;
        }
        List<String> validContentProviderAuthorities = getValidContentProviderAuthorities(context);
        return (validContentProviderAuthorities == null || validContentProviderAuthorities.isEmpty()) ? false : true;
    }

    public static void setProviderForTesting(VrParamsProvider vrParamsProvider) {
        providerForTesting = vrParamsProvider;
    }

    public static ContentProviderClientHandle tryToGetContentProviderClientHandle(Context context) {
        List<String> validContentProviderAuthorities = getValidContentProviderAuthorities(context);
        if (validContentProviderAuthorities != null) {
            for (String str : validContentProviderAuthorities) {
                ContentProviderClient acquireContentProviderClient = context.getContentResolver().acquireContentProviderClient(str);
                if (acquireContentProviderClient != null) {
                    return new ContentProviderClientHandle(acquireContentProviderClient, str);
                }
            }
        }
        return null;
    }
}
