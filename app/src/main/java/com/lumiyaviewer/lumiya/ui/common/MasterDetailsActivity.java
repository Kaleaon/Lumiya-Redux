package com.lumiyaviewer.lumiya.ui.common;

import com.lumiyaviewer.lumiya.LumiyaApp;

import android.content.Intent;
import android.os.Bundle;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentManager;
import androidx.fragment.app.FragmentTransaction;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.R;

public abstract class MasterDetailsActivity extends DetailsActivity {
    protected static final String FROM_SAME_ACTIVITY = "fromSameActivity";
    private static final String IMPLICIT_DETAILS_TAG = "MasterDetailsActivityIsImplicitDetails";
    public static final String INTENT_SELECTION_KEY = "selection";
    public static final String WEAK_SELECTION_KEY = "weakSelection";
    private boolean isSplitScreen = false;

    protected abstract FragmentActivityFactory getDetailsFragmentFactory();

    protected Bundle getNewDetailsFragmentArguments(@Nullable Bundle bundle, @Nullable Bundle bundle2) {
        return bundle2;
    }

    protected boolean isAlwaysImplicitFragment(Class<? extends Fragment> cls) {
        return false;
    }

    @Override
    protected boolean isRootDetailsFragment(Class<? extends Fragment> cls) {
        return getDetailsFragmentFactory().getFragmentClass().isAssignableFrom(cls);
    }

    public boolean isSplitScreen() {
        return this.isSplitScreen;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:38:0x00eb  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x00f0  */
    /* JADX WARN: Removed duplicated region for block: B:53:0x0122  */
    /* JADX WARN: Removed duplicated region for block: B:56:0x0141  */
    /* JADX WARN: Removed duplicated region for block: B:70:0x01a4  */
    /* JADX WARN: Removed duplicated region for block: B:73:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:83:0x0222  */
    /* JADX WARN: Removed duplicated region for block: B:87:0x01f2  */
    /* JADX WARN: Removed duplicated region for block: B:94:0x01e5  */
    /* JADX WARN: Removed duplicated region for block: B:98:0x01c0  */
    @Override
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    protected void onCreate(@Nullable Bundle bundle) {
        boolean z = false;
        Bundle bundleExtra;
        boolean z2;
        Bundle bundleExtra3;
        Bundle arguments = null;
        Bundle bundle3;
        Bundle bundleExtra2;
        Bundle arguments3;
        super.onCreate(bundle);
        this.isSplitScreen = LumiyaApp.isSplitScreenNeeded(this);
        if (this.isSplitScreen) {
            setContentView(R.layout.split_two_panels);
        } else {
            setContentView(R.layout.split_one_panel);
        }
        Object[] objArr = new Object[4];
        objArr[0] = Boolean.valueOf(findViewById(R.id.selector) != null);
        objArr[1] = Boolean.valueOf(getSupportFragmentManager().findFragmentById(R.id.selector) != null);
        objArr[2] = Boolean.valueOf(findViewById(R.id.details) != null);
        objArr[3] = Boolean.valueOf(getSupportFragmentManager().findFragmentById(R.id.details) != null);
        Debug.Printf("MasterDetailsActivity: hasSelectorView = %b, sel fragment %b, hasDetailsView = %b, details fragment %b", objArr);
        Debug.Printf("MasterDetailsActivity: intent = %s", getIntent());
        FragmentTransaction beginTransaction = getSupportFragmentManager().beginTransaction();
        Fragment fragmentById = getSupportFragmentManager().findFragmentById(R.id.selector);
        Fragment fragmentById2 = getSupportFragmentManager().findFragmentById(R.id.details);
        if (fragmentById2 == null || (arguments3 = fragmentById2.getArguments()) == null) {
            z = false;
        } else {
            Debug.Printf("MasterDetailsActivity: implicit details tag = %b", Boolean.valueOf(arguments3.getBoolean(IMPLICIT_DETAILS_TAG, false)));
            if (!arguments3.getBoolean(IMPLICIT_DETAILS_TAG, false)) {
                z = true;
            }
        }
        Debug.Printf("MasterDetailsActivity: hasExplicitDetails = %b", Boolean.valueOf(z));
        if (z || bundle != null || (bundleExtra = getIntent().getBundleExtra(INTENT_SELECTION_KEY)) == null) {
            bundleExtra = null;
        } else {
            z = true;
        }
        if (z || bundle != null || !this.isSplitScreen || (bundleExtra2 = getIntent().getBundleExtra(WEAK_SELECTION_KEY)) == null) {
            z2 = z;
            bundleExtra3 = bundleExtra;
        } else {
            bundleExtra3 = bundleExtra2;
            z2 = true;
        }
        boolean z3 = !this.isSplitScreen ? !z2 : true;
        if (z3) {
            Object[] objArr2 = new Object[1];
            objArr2[0] = fragmentById != null ? fragmentById.toString() : "null";
            Debug.Printf("MasterDetailsActivity: existing fragment %s", objArr2);
            if (fragmentById != null) {
                Object[] objArr3 = new Object[1];
                objArr3[0] = fragmentById.isVisible() ? "visible" : "not visible";
                Debug.Printf("MasterDetailsActivity: existing fragment is %s", objArr3);
                if (fragmentById.isDetached()) {
                    beginTransaction.attach(fragmentById);
                } else if (fragmentById.isHidden()) {
                    beginTransaction.show(fragmentById);
                }
            } else {
                beginTransaction.add(R.id.selector, onCreateMasterFragment(getIntent(), bundleExtra3));
            }
        } else if (fragmentById != null && !fragmentById.isDetached()) {
            beginTransaction.detach(fragmentById);
        }
        boolean z4 = !this.isSplitScreen ? z2 : true;
        Debug.Printf("MasterDetailsActivity: selectorVisible %b, detailsVisible %b, hasExplicitDetails %b", Boolean.valueOf(z3), Boolean.valueOf(z4), Boolean.valueOf(z2));
        if (z4) {
            if (fragmentById2 == null) {
                Debug.Printf("MasterDetailsActivity: creating new details fragment", new Object[0]);
                // 3.4.2 guards the whole creation: a details fragment that cannot
                // be created is logged and the activity continues without it.
                try {
                    Bundle masterArguments = fragmentById != null ? fragmentById.getArguments() : null;
                    Bundle newDetailsFragmentArguments = getNewDetailsFragmentArguments(masterArguments, bundleExtra3);
                    Fragment fragment = getDetailsFragmentFactory().getFragmentClass().newInstance();
                    if (fragment instanceof ReloadableFragment) {
                        fragment.setArguments(new Bundle());
                        ((ReloadableFragment) fragment).setFragmentArgs(getIntent(), newDetailsFragmentArguments);
                    } else {
                        fragment.setArguments(newDetailsFragmentArguments);
                    }
                    Bundle detailsArguments;
                    if (!z2 && (detailsArguments = fragment.getArguments()) != null) {
                        detailsArguments.putBoolean(IMPLICIT_DETAILS_TAG, true);
                    }
                    Debug.Printf("MasterDetailsActivity: adding new details fragment: %s", fragment);
                    beginTransaction.add(R.id.details, fragment, DetailsActivity.DEFAULT_DETAILS_FRAGMENT_TAG);
                } catch (Exception e) {
                    Debug.Warning(e);
                }
            } else {
                Debug.Printf("MasterDetailsActivity: not creating new details fragment. existing is detached: %b (%s)", Boolean.valueOf(fragmentById2.isDetached()), fragmentById2);
                if (fragmentById2.isDetached()) {
                    beginTransaction.attach(fragmentById2);
                }
            }
        } else if (fragmentById2 != null && !fragmentById2.isDetached()) {
            beginTransaction.remove(fragmentById2);
        }
        if (beginTransaction.isEmpty()) {
            return;
        }
        beginTransaction.commit();
    }

    protected abstract Fragment onCreateMasterFragment(Intent intent, @Nullable Bundle bundle);

    @Override
    protected boolean onDetailsStackEmpty() {
        FragmentManager supportFragmentManager;
        Fragment findFragmentById;
        if (this.isSplitScreen || (findFragmentById = (supportFragmentManager = getSupportFragmentManager()).findFragmentById(R.id.details)) == null || !(!findFragmentById.isDetached())) {
            return true;
        }
        Debug.Printf("MasterDetailsFragment: onDetailsStackEmpty has detailsFragment (%s), detached: %b", findFragmentById, Boolean.valueOf(findFragmentById.isDetached()));
        FragmentTransaction beginTransaction = supportFragmentManager.beginTransaction();
        beginTransaction.setCustomAnimations(android.R.anim.fade_in, R.anim.slide_to_right, 0, android.R.anim.fade_out);
        beginTransaction.remove(findFragmentById);
        Fragment fragmentById = supportFragmentManager.findFragmentById(R.id.selector);
        Object[] objArr = new Object[3];
        objArr[0] = Boolean.valueOf(fragmentById != null);
        objArr[1] = Boolean.valueOf(fragmentById != null ? fragmentById.isDetached() : false);
        objArr[2] = Boolean.valueOf(fragmentById != null ? fragmentById.isHidden() : false);
        Debug.Printf("MasterDetailsFragment: existing selector %b, detached %b, hidden %b", objArr);
        if (fragmentById == null) {
            beginTransaction.add(R.id.selector, onCreateMasterFragment(getIntent(), null));
        } else {
            if (fragmentById.isDetached()) {
                beginTransaction.attach(fragmentById);
            }
            if (fragmentById.isHidden()) {
                beginTransaction.show(fragmentById);
            }
        }
        beginTransaction.commit();
        updateTitle();
        return false;
    }

    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
        Debug.Printf("MasterDetailsActivity: onNewIntent, intent = %s", intent);
        Bundle bundle = intent.hasExtra(INTENT_SELECTION_KEY) ? intent.getBundleExtra(INTENT_SELECTION_KEY) : null;
        Bundle bundle2 = intent.hasExtra(WEAK_SELECTION_KEY) ? intent.getBundleExtra(WEAK_SELECTION_KEY) : null;
        if (bundle != null) {
            showDetails(this, getDetailsFragmentFactory(), bundle);
            return;
        }
        if (this.isSplitScreen && bundle2 != null) {
            showDetails(this, getDetailsFragmentFactory(), bundle2);
            return;
        }
        if (this.isSplitScreen) {
            return;
        }
        if (getSupportFragmentManager().findFragmentById(R.id.details) == null && bundle2 != null && intent.getBooleanExtra(FROM_SAME_ACTIVITY, false)) {
            showDetails(this, getDetailsFragmentFactory(), bundle2);
        } else {
            clearDetailsStack();
            onDetailsStackEmpty();
        }
    }

    @Override
    protected void onSaveInstanceState(Bundle bundle) {
        super.onSaveInstanceState(bundle);
    }

    @Override
    protected void replaceDetailsFragment(FragmentManager fragmentManager, Fragment fragment) {
        Fragment findFragmentById;
        FragmentTransaction beginTransaction = fragmentManager.beginTransaction();
        beginTransaction.setCustomAnimations(R.anim.slide_from_right, android.R.anim.fade_out, 0, android.R.anim.fade_out);
        if (!this.isSplitScreen && (findFragmentById = fragmentManager.findFragmentById(R.id.selector)) != null && findFragmentById.isVisible()) {
            beginTransaction.hide(findFragmentById);
        }
        beginTransaction.replace(R.id.details, fragment);
        beginTransaction.commit();
        updateTitle();
    }

    @Override
    public Fragment showDetailsFragment(Class<? extends Fragment> cls, Intent intent, Bundle bundle) {
        Bundle arguments;
        Fragment showDetailsFragment = super.showDetailsFragment(cls, intent, bundle);
        if (showDetailsFragment != null && (arguments = showDetailsFragment.getArguments()) != null) {
            arguments.putBoolean(IMPLICIT_DETAILS_TAG, isAlwaysImplicitFragment(cls));
        }
        return showDetailsFragment;
    }

    @Override
    protected void updateTitleNoDetails() {
        boolean handled = false;
        Fragment findFragmentById = getSupportFragmentManager().findFragmentById(R.id.selector);
        if (findFragmentById != null
                && (findFragmentById instanceof FragmentHasTitle)
                && findFragmentById.isAdded()
                && !findFragmentById.isDetached()) {
            String title = ((FragmentHasTitle) findFragmentById).getTitle();
            String subTitle = ((FragmentHasTitle) findFragmentById).getSubTitle();
            if (title != null) {
                setActivityTitle(title, subTitle);
                handled = true;
            }
        }
        if (!handled) {
            super.updateTitleNoDetails();
        }
    }
}
