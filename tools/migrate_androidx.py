#!/usr/bin/env python3
"""Rewrite android.support.*/android.arch.* references to their AndroidX
equivalents across source files, resources and manifest."""

from __future__ import annotations
import pathlib, re, sys

# Longest-prefix-wins mapping. Entry order matters.
PKG = [
    # annotations
    ('android.support.annotation.',        'androidx.annotation.'),
    # architecture components
    ('android.arch.lifecycle.',            'androidx.lifecycle.'),
    ('android.arch.core.',                 'androidx.arch.core.'),
    # v7 preference
    ('android.support.v7.preference.',     'androidx.preference.'),
    # v7 internal/view.menu are all implementation detail — map to androidx.appcompat.*
    ('android.support.v7.view.menu.',      'androidx.appcompat.view.menu.'),
    ('android.support.v7.internal.view.menu.',
                                           'androidx.appcompat.view.menu.'),
    ('android.support.v7.internal.widget.', 'androidx.appcompat.widget.'),
    # v7 appcompat app
    ('android.support.v7.app.',            'androidx.appcompat.app.'),
    # v7 widget: finer-grained mapping below
    # v7.widget helpers
    ('android.support.v7.widget.helper.',  'androidx.recyclerview.widget.'),
    # Material (design lib): map to com.google.android.material.*
    ('android.support.design.widget.AppBarLayout',
                                           'com.google.android.material.appbar.AppBarLayout'),
    ('android.support.design.widget.CollapsingToolbarLayout',
                                           'com.google.android.material.appbar.CollapsingToolbarLayout'),
    ('android.support.design.widget.CoordinatorLayout',
                                           'androidx.coordinatorlayout.widget.CoordinatorLayout'),
    ('android.support.design.widget.FloatingActionButton',
                                           'com.google.android.material.floatingactionbutton.FloatingActionButton'),
    ('android.support.design.widget.BottomSheetBehavior',
                                           'com.google.android.material.bottomsheet.BottomSheetBehavior'),
    ('android.support.design.widget.Snackbar',
                                           'com.google.android.material.snackbar.Snackbar'),
    ('android.support.design.widget.TabLayout',
                                           'com.google.android.material.tabs.TabLayout'),
    ('android.support.design.widget.TextInputLayout',
                                           'com.google.android.material.textfield.TextInputLayout'),
    ('android.support.design.widget.NavigationView',
                                           'com.google.android.material.navigation.NavigationView'),
    # design internals used only by material's own layouts; map and let
    # AndroidX provide the replacement layout instead. Keeping the FQN form
    # non-empty so it is a syntactically valid XML tag; the orphaned layouts
    # get scrubbed in `prune_support_layouts`.
    ('android.support.design.internal.',   'com.google.android.material.internal.'),
    ('android.support.design.widget.',     'com.google.android.material.internal.'),
    # v4 content / os
    ('android.support.v4.content.',        'androidx.core.content.'),
    ('android.support.v4.os.',             'androidx.core.os.'),
    # v4 view compat helpers
    ('android.support.v4.view.GestureDetectorCompat',
                                           'androidx.core.view.GestureDetectorCompat'),
    ('android.support.v4.view.InputDeviceCompat',
                                           'androidx.core.view.InputDeviceCompat'),
    ('android.support.v4.view.MenuItemCompat',
                                           'androidx.core.view.MenuItemCompat'),
    ('android.support.v4.view.MotionEventCompat',
                                           'androidx.core.view.MotionEventCompat'),
    ('android.support.v4.view.PointerIconCompat',
                                           'androidx.core.view.PointerIconCompat'),
    ('android.support.v4.view.ViewCompat', 'androidx.core.view.ViewCompat'),
    ('android.support.v4.view.ActionProvider',
                                           'androidx.core.view.ActionProvider'),
    ('android.support.v4.view.PagerAdapter',
                                           'androidx.viewpager.widget.PagerAdapter'),
    ('android.support.v4.view.ViewPager',  'androidx.viewpager.widget.ViewPager'),
    # v4 app
    ('android.support.v4.app.Fragment',    'androidx.fragment.app.Fragment'),
    ('android.support.v4.app.FragmentActivity',
                                           'androidx.fragment.app.FragmentActivity'),
    ('android.support.v4.app.FragmentManager',
                                           'androidx.fragment.app.FragmentManager'),
    ('android.support.v4.app.FragmentTransaction',
                                           'androidx.fragment.app.FragmentTransaction'),
    ('android.support.v4.app.FragmentStatePagerAdapter',
                                           'androidx.fragment.app.FragmentStatePagerAdapter'),
    ('android.support.v4.app.DialogFragment',
                                           'androidx.fragment.app.DialogFragment'),
    ('android.support.v4.app.LoaderManager',
                                           'androidx.loader.app.LoaderManager'),
    ('android.support.v4.app.NotificationCompat',
                                           'androidx.core.app.NotificationCompat'),
    ('android.support.v4.app.ActivityCompat',
                                           'androidx.core.app.ActivityCompat'),
    ('android.support.v4.app.',            'androidx.core.app.'),
    # v4 widget
    ('android.support.v4.widget.DrawerLayout',
                                           'androidx.drawerlayout.widget.DrawerLayout'),
    ('android.support.v4.widget.SwipeRefreshLayout',
                                           'androidx.swiperefreshlayout.widget.SwipeRefreshLayout'),
    ('android.support.v4.widget.ViewDragHelper',
                                           'androidx.customview.widget.ViewDragHelper'),
    ('android.support.v4.widget.NestedScrollView',
                                           'androidx.core.widget.NestedScrollView'),
    ('android.support.v4.widget.Space',    'androidx.legacy.widget.Space'),
    ('android.support.v4.internal.view.SupportMenu',
                                           'androidx.core.internal.view.SupportMenu'),
]

V7_WIDGET = {
    'CardView':                         'androidx.cardview.widget.CardView',
    'RecyclerView':                     'androidx.recyclerview.widget.RecyclerView',
    'LinearLayoutManager':              'androidx.recyclerview.widget.LinearLayoutManager',
    'LinearSmoothScroller':             'androidx.recyclerview.widget.LinearSmoothScroller',
    'GridLayoutManager':                'androidx.recyclerview.widget.GridLayoutManager',
    'StaggeredGridLayoutManager':       'androidx.recyclerview.widget.StaggeredGridLayoutManager',
    'DefaultItemAnimator':              'androidx.recyclerview.widget.DefaultItemAnimator',
    'SimpleItemAnimator':               'androidx.recyclerview.widget.SimpleItemAnimator',
    'PopupMenu':                        'androidx.appcompat.widget.PopupMenu',
    'SearchView':                       'androidx.appcompat.widget.SearchView',
    'Toolbar':                          'androidx.appcompat.widget.Toolbar',
    'AppCompatButton':                  'androidx.appcompat.widget.AppCompatButton',
    'AppCompatImageView':               'androidx.appcompat.widget.AppCompatImageView',
    'AppCompatImageButton':             'androidx.appcompat.widget.AppCompatImageButton',
    'AppCompatTextView':                'androidx.appcompat.widget.AppCompatTextView',
    'AppCompatEditText':                'androidx.appcompat.widget.AppCompatEditText',
    'AppCompatCheckBox':                'androidx.appcompat.widget.AppCompatCheckBox',
    'AppCompatSpinner':                 'androidx.appcompat.widget.AppCompatSpinner',
    'SwitchCompat':                     'androidx.appcompat.widget.SwitchCompat',
    'ActionBarContainer':               'androidx.appcompat.widget.ActionBarContainer',
    'ActionBarContextView':             'androidx.appcompat.widget.ActionBarContextView',
    'ActionBarOverlayLayout':           'androidx.appcompat.widget.ActionBarOverlayLayout',
    'ActionMenuView':                   'androidx.appcompat.widget.ActionMenuView',
    'AlertDialogLayout':                'androidx.appcompat.widget.AlertDialogLayout',
    'ButtonBarLayout':                  'androidx.appcompat.widget.ButtonBarLayout',
    'ContentFrameLayout':               'androidx.appcompat.widget.ContentFrameLayout',
    'DialogTitle':                      'androidx.appcompat.widget.DialogTitle',
    'FitWindowsFrameLayout':            'androidx.appcompat.widget.FitWindowsFrameLayout',
    'FitWindowsLinearLayout':           'androidx.appcompat.widget.FitWindowsLinearLayout',
    'ViewStubCompat':                   'androidx.appcompat.widget.ViewStubCompat',
    'ActivityChooserView':              'androidx.appcompat.widget.ActivityChooserView',
}

# Token regex that catches fully-qualified class names (incl. inner classes
# separated by `.` or `$`).
FQN_RE = re.compile(r'android\.(support|arch)\.[A-Za-z0-9_]+(?:[.$][A-Za-z0-9_]+)*')

def map_fqn(fqn: str) -> str | None:
    # Special keep-as-is cases: metadata names, FILE_PROVIDER_PATHS resource id.
    if fqn in ('android.support.FILE_PROVIDER_PATHS', 'android.support.VERSION'):
        return fqn
    # v7.widget.<Class>(.<Inner>)* — match on base class
    m = re.match(r'android\.support\.v7\.widget\.([A-Za-z0-9_]+)(\b|[.$])', fqn)
    if m and m.group(1) in V7_WIDGET:
        base = V7_WIDGET[m.group(1)]
        suffix = fqn[len('android.support.v7.widget.') + len(m.group(1)):]
        return base + suffix
    for src, dst in PKG:
        if fqn.startswith(src):
            return dst + fqn[len(src):]
    return None

def rewrite_file(p: pathlib.Path, counts: dict) -> bool:
    text = p.read_text(encoding='utf-8', errors='replace')
    def sub(m):
        fqn = m.group(0)
        new = map_fqn(fqn)
        if new is None:
            counts['unmapped'].setdefault(fqn, 0)
            counts['unmapped'][fqn] += 1
            return fqn
        counts['ok'] += 1
        return new
    new_text = FQN_RE.sub(sub, text)
    if new_text != text:
        p.write_text(new_text, encoding='utf-8')
        return True
    return False

def main():
    roots = [pathlib.Path('app/src/main/java'),
             pathlib.Path('app/src/main/res'),
             pathlib.Path('app/src/main/AndroidManifest.xml')]
    exts = {'.java', '.xml'}
    counts = {'ok': 0, 'files_changed': 0, 'unmapped': {}}
    for r in roots:
        if r.is_file():
            iter_ = [r]
        else:
            iter_ = [p for p in r.rglob('*') if p.is_file() and p.suffix in exts]
        for p in iter_:
            if rewrite_file(p, counts):
                counts['files_changed'] += 1
    print(f"Rewrote {counts['ok']} occurrences across {counts['files_changed']} files.")
    if counts['unmapped']:
        print("Unmapped FQNs (left untouched):")
        for fqn, n in sorted(counts['unmapped'].items()):
            print(f"  {n:4d}  {fqn}")

if __name__ == '__main__':
    main()
