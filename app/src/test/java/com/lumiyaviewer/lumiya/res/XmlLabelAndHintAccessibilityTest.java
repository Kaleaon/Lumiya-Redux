package com.lumiyaviewer.lumiya.res;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;

import android.app.Application;
import android.content.Context;
import android.view.ContextThemeWrapper;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.EditText;
import android.widget.FrameLayout;
import android.widget.TextView;
import androidx.test.core.app.ApplicationProvider;
import com.lumiyaviewer.lumiya.R;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.robolectric.RobolectricTestRunner;
import org.robolectric.annotation.Config;

@RunWith(RobolectricTestRunner.class)
@Config(sdk = 34, application = Application.class)
public class XmlLabelAndHintAccessibilityTest {

    @Test
    public void testLoginLayoutAccessibilityBindings() {
        Context app = ApplicationProvider.getApplicationContext();
        Context themed = new ContextThemeWrapper(app, R.style.Theme_Lumiya);
        LayoutInflater inflater = LayoutInflater.from(themed);
        View root = inflater.inflate(R.layout.login, new FrameLayout(themed), true);

        TextView userNameLabel = root.findViewById(R.id.loginUserNameLabel);
        assertNotNull("loginUserNameLabel should exist", userNameLabel);
        assertEquals(R.id.editUserName, userNameLabel.getLabelFor());

        EditText editUserName = root.findViewById(R.id.editUserName);
        assertNotNull("editUserName should exist", editUserName);
        assertEquals(app.getString(R.string.login_user_name), editUserName.getHint().toString());

        TextView passwordLabel = root.findViewById(R.id.loginPasswordLabel);
        assertNotNull("loginPasswordLabel should exist", passwordLabel);
        assertEquals(R.id.editPassword, passwordLabel.getLabelFor());

        EditText editPassword = root.findViewById(R.id.editPassword);
        assertNotNull("editPassword should exist", editPassword);
        assertEquals(app.getString(R.string.login_password), editPassword.getHint().toString());

        TextView gridLabel = root.findViewById(R.id.loginGridLabel);
        assertNotNull("loginGridLabel should exist", gridLabel);
        assertEquals(R.id.spinnerGrid, gridLabel.getLabelFor());
    }

    @Test
    public void testGridEditDialogAccessibilityBindings() {
        Context app = ApplicationProvider.getApplicationContext();
        Context themed = new ContextThemeWrapper(app, R.style.Theme_Lumiya);
        LayoutInflater inflater = LayoutInflater.from(themed);
        View root = inflater.inflate(R.layout.grid_edit_dialog, new FrameLayout(themed), true);

        TextView gridNameLabel = root.findViewById(R.id.gridNameLabel);
        assertNotNull("gridNameLabel should exist", gridNameLabel);
        assertEquals(R.id.gridNameText, gridNameLabel.getLabelFor());

        EditText gridNameText = root.findViewById(R.id.gridNameText);
        assertNotNull("gridNameText should exist", gridNameText);
        assertEquals(app.getString(R.string.grid_dialog_grid_name), gridNameText.getHint().toString());

        TextView gridLoginURILabel = root.findViewById(R.id.gridLoginURILabel);
        assertNotNull("gridLoginURILabel should exist", gridLoginURILabel);
        assertEquals(R.id.gridLoginURIText, gridLoginURILabel.getLabelFor());

        EditText gridLoginURIText = root.findViewById(R.id.gridLoginURIText);
        assertNotNull("gridLoginURIText should exist", gridLoginURIText);
        assertEquals(app.getString(R.string.grid_dialog_grid_uri), gridLoginURIText.getHint().toString());
    }

    @Test
    public void testAccountEditDialogAccessibilityBindings() {
        Context app = ApplicationProvider.getApplicationContext();
        Context themed = new ContextThemeWrapper(app, R.style.Theme_Lumiya);
        LayoutInflater inflater = LayoutInflater.from(themed);
        View root = inflater.inflate(R.layout.account_edit_dialog, new FrameLayout(themed), true);

        TextView accountUserNameLabel = root.findViewById(R.id.accountUserNameLabel);
        assertNotNull("accountUserNameLabel should exist", accountUserNameLabel);
        assertEquals(R.id.loginNameText, accountUserNameLabel.getLabelFor());

        EditText loginNameText = root.findViewById(R.id.loginNameText);
        assertNotNull("loginNameText should exist", loginNameText);
        assertEquals(app.getString(R.string.login_user_name), loginNameText.getHint().toString());

        TextView accountPasswordLabel = root.findViewById(R.id.accountPasswordLabel);
        assertNotNull("accountPasswordLabel should exist", accountPasswordLabel);
        assertEquals(R.id.loginPasswordText, accountPasswordLabel.getLabelFor());

        EditText loginPasswordText = root.findViewById(R.id.loginPasswordText);
        assertNotNull("loginPasswordText should exist", loginPasswordText);
        assertEquals(app.getString(R.string.login_password), loginPasswordText.getHint().toString());

        TextView accountGridLabel = root.findViewById(R.id.accountGridLabel);
        assertNotNull("accountGridLabel should exist", accountGridLabel);
        assertEquals(R.id.spinnerGrid, accountGridLabel.getLabelFor());
    }
}
