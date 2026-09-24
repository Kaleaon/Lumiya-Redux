package com.lumiyaviewer.lumiya.ui.chat;

import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Environment;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.R;
import com.lumiyaviewer.lumiya.dao.ChatMessage;
import com.lumiyaviewer.lumiya.react.UIThreadExecutor;
import com.lumiyaviewer.lumiya.slproto.chat.generic.SLChatEvent;
import com.lumiyaviewer.lumiya.slproto.users.ChatterID;
import com.lumiyaviewer.lumiya.slproto.users.ChatterNameRetriever;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import de.greenrobot.dao.query.LazyList;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.util.Iterator;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicReference;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

public class ExportChatHistoryTask extends AsyncTask<ChatterID, Void, ExportResult> implements DialogInterface.OnCancelListener {
    private static final String forbiddenChars = "./\\*?:\"'~";
    private final Context context;
    private ProgressDialog progressDialog;
    private final Lock nameReadyLock = new ReentrantLock();
    private final Condition nameReadyCondition = this.nameReadyLock.newCondition();
    private final AtomicBoolean isNameReady = new AtomicBoolean();
    private final AtomicReference<String> gotChatterName = new AtomicReference<>();
    private final ChatterNameRetriever.OnChatterNameUpdated onChatterNameUpdated = new ChatterNameRetriever.OnChatterNameUpdated() {
        private final /* synthetic */ void $m$0(ChatterNameRetriever chatterNameRetriever) {
            ExportChatHistoryTask.this.m431x863366ea(chatterNameRetriever);
        }

        @Override
        public final void onChatterNameUpdated(ChatterNameRetriever chatterNameRetriever) {
            $m$0(chatterNameRetriever);
        }
    };

    public ExportChatHistoryTask(Context context) {
        this.context = context;
    }

    private String sanitizeName(String str) {
        if (str == null) {
            str = "";
        }
        StringBuilder sb = new StringBuilder();
        int length = str.length();
        for (int i = 0; i < length; i++) {
            char charAt = str.charAt(i);
            if (charAt < ' ') {
                charAt = ' ';
            }
            if (charAt > 127) {
                charAt = '_';
            }
            if (forbiddenChars.indexOf(charAt) < 0) {
                sb.append(charAt);
            }
        }
        String trim = sb.toString().trim();
        return trim.isEmpty() ? "Chat Log" : trim;
    }

    @Override
    public ExportResult doInBackground(ChatterID... chatterID2) {
        ChatterID chatterID;
        UserManager userManager;
        File file = null;
        FileOutputStream fileOutputStream;
        LazyList<ChatMessage> lazyList;
        if (chatterID2.length != 1 || (userManager = (chatterID = chatterID2[0]).getUserManager()) == null) {
            return null;
        }
        ChatterNameRetriever chatterNameRetriever = new ChatterNameRetriever(chatterID, this.onChatterNameUpdated, UIThreadExecutor.getInstance());
        try {
            try {
                this.nameReadyLock.lock();
                while (!this.isNameReady.get() && (!isCancelled())) {
                    this.nameReadyCondition.await();
                }
                this.nameReadyLock.unlock();
                chatterNameRetriever.dispose();
                if (isCancelled()) {
                    return null;
                }
                File file2 = new File(Environment.getExternalStoragePublicDirectory(Environment.DIRECTORY_DOCUMENTS), "Lumiya");
                File file3 = new File(file2, "Chat Logs");
                File file4 = new File(file3, sanitizeName(this.gotChatterName.get()) + ".txt");
                DateFormat dateTimeInstance = DateFormat.getDateTimeInstance(3, 3);
                try {
                    file2.mkdirs();
                    file3.mkdirs();
                    try {
                        fileOutputStream = new FileOutputStream(file4, false);
                        try {
                            lazyList = userManager.getChatterList().getActiveChattersManager().getMessages(chatterID);
                            if (lazyList != null) {
                                try {
                                    Iterator<ChatMessage> it = lazyList.iterator();
                                    while (it.hasNext()) {
                                        SLChatEvent loadFromDatabaseObject = SLChatEvent.loadFromDatabaseObject(it.next(), userManager.getUserID());
                                        if (loadFromDatabaseObject != null) {
                                            fileOutputStream.write(("[" + dateTimeInstance.format(loadFromDatabaseObject.getTimestamp()) + "] " + loadFromDatabaseObject.getPlainTextMessage(this.context, userManager, false).toString() + "\n").getBytes());
                                        }
                                        if (isCancelled()) {
                                            break;
                                        }
                                    }
                                } catch (Throwable th) {
                                    if (lazyList != null) {
                                        lazyList.close();
                                    }
                                    if (fileOutputStream != null) {
                                        fileOutputStream.close();
                                    }
                                    throw th;
                                }
                            }
                            if (lazyList != null) {
                                lazyList.close();
                            }
                            if (fileOutputStream != null) {
                                fileOutputStream.close();
                            }
                            file = file4;
                        } catch (Throwable e) {
                            Debug.Warning(e);
                            lazyList = null;
                        }
                    } catch (Throwable e5) {
                        Debug.Warning(e5);
                        fileOutputStream = null;
                        lazyList = null;
                    }
                } catch (SecurityException e2) {
                    Debug.Warning(e2);
                    file = null;
                } catch (Exception e3) {
                    Debug.Warning(e3);
                    file = null;
                }
                if (!isCancelled()) {
                    if (file != null) {
                        return new ExportResult(file, null, null);
                    }
                    String str = sanitizeName(this.gotChatterName.get()) + ".txt";
                    StringBuilder sb = new StringBuilder();
                    LazyList<ChatMessage> messages = userManager.getChatterList().getActiveChattersManager().getMessages(chatterID);
                    if (messages != null) {
                        Iterator<ChatMessage> iterator = messages.iterator();
                        while (iterator.hasNext()) {
                            SLChatEvent fromDatabaseObject = SLChatEvent.loadFromDatabaseObject(iterator.next(), userManager.getUserID());
                            if (fromDatabaseObject != null) {
                                sb.append("[").append(dateTimeInstance.format(fromDatabaseObject.getTimestamp())).append("] ").append(fromDatabaseObject.getPlainTextMessage(this.context, userManager, false).toString()).append("\n");
                            }
                            if (isCancelled()) {
                                break;
                            }
                        }
                    }
                    String text = sb.toString();
                    if (!isCancelled()) {
                        return new ExportResult(null, text, str);
                    }
                }
                return null;
            } catch (Throwable e6) {
                this.nameReadyLock.unlock();
                throw e6;
            }
        } catch (InterruptedException e4) {
            return null;
        }
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_ui_chat_ExportChatHistoryTask_2020, reason: not valid java name */
    /* synthetic */ void m431x863366ea(ChatterNameRetriever chatterNameRetriever) {
        try {
            this.nameReadyLock.lock();
            this.isNameReady.set(true);
            this.gotChatterName.set(chatterNameRetriever.getResolvedName());
            this.nameReadyCondition.signal();
        } finally {
            this.nameReadyLock.unlock();
        }
    }

    @Override
    public void onCancel(DialogInterface dialogInterface) {
        cancel(false);
        try {
            this.nameReadyLock.lock();
            this.nameReadyCondition.signal();
        } finally {
            this.nameReadyLock.unlock();
        }
    }

    @Override
    protected void onCancelled() {
        if (this.progressDialog != null) {
            this.progressDialog.dismiss();
        }
    }

    @Override
    public void onPostExecute(ExportResult exportResult) {
        if (this.progressDialog != null) {
            this.progressDialog.dismiss();
        }
        if (exportResult != null) {
            Intent intent = new Intent();
            intent.setAction("android.intent.action.SEND");
            intent.setType("text/plain");
            if (exportResult.outputFile != null) {
                Debug.Printf("Export: exported as stream %s", exportResult.outputFile);
                intent.putExtra("android.intent.extra.STREAM", Uri.fromFile(exportResult.outputFile));
            } else {
                Debug.Printf("Export: exported as text, %d bytes", Integer.valueOf(exportResult.rawText.length()));
                intent.putExtra("android.intent.extra.TEXT", exportResult.rawText);
                intent.putExtra("android.intent.extra.SUBJECT", exportResult.rawTextTitle);
            }
            this.context.startActivity(Intent.createChooser(intent, this.context.getText(R.string.export_chat_history_to)));
        }
    }

    @Override
    protected void onPreExecute() {
        this.progressDialog = ProgressDialog.show(this.context, this.context.getString(R.string.please_wait_title), this.context.getString(R.string.exporting_chat_history), true, true, this);
    }
}
