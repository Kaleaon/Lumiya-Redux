package com.lumiyaviewer.lumiya.ui.inventory;

import android.app.AlertDialog;
import android.app.ProgressDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.graphics.Bitmap;
import android.os.AsyncTask;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG;
import com.lumiyaviewer.lumiya.slproto.SLAgentCircuit;
import com.lumiyaviewer.lumiya.slproto.caps.SLCaps;
import com.lumiyaviewer.lumiya.slproto.https.LLSDXMLRequest;
import com.lumiyaviewer.lumiya.slproto.https.SLHTTPSConnection;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException;
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDMap;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDString;
import com.lumiyaviewer.lumiya.slproto.llsd.types.LLSDUUID;
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager;
import java.io.File;
import java.io.IOException;
import java.util.UUID;
import javax.annotation.Nullable;
import okhttp3.MediaType;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;

public class UploadImageAsyncTask extends AsyncTask<UploadImageParams, Void, UploadImageResult> {
    private static final MediaType MEDIA_TYPE_JP2 = MediaType.parse("image/jp2");
    private final UUID agentUUID;
    private final Context context;
    private ProgressDialog progressDialog = null;

    protected static class UploadImageResult {

        @Nullable
        public final String errorMessage;
        public final boolean success;

        private UploadImageResult(boolean z, @Nullable String str) {
            this.success = z;
            this.errorMessage = str;
        }

        /* synthetic */ UploadImageResult(boolean z, String str, UploadImageResult uploadImageResult) {
            this(z, str);
        }
    }

    public UploadImageAsyncTask(Context context, UUID uuid) {
        this.context = context;
        this.agentUUID = uuid;
    }

    /* JADX WARN: Removed duplicated region for block: B:83:0x0253  */
    @Override
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public UploadImageResult doInBackground(UploadImageParams... uploadImageParamsArr) throws Throwable {
        Bitmap bitmapCreateScaledBitmap;
        boolean z;
        File fileCreateTempFile;
        UserManager userManager;
        SLAgentCircuit activeAgentCircuit;
        String capability;
        String str;
        boolean z2 = true;
        String str2 = null;
        int length = uploadImageParamsArr.length;
        int i = 0;
        while (i < length) {
            UploadImageParams uploadImageParams = uploadImageParamsArr[i];
            Bitmap bitmap = uploadImageParams.bitmap;
            int width = bitmap.getWidth();
            int height = bitmap.getHeight();
            int iHighestOneBit = Integer.highestOneBit(width);
            int iHighestOneBit2 = Integer.highestOneBit(height);
            if (iHighestOneBit != width) {
                iHighestOneBit *= 2;
            }
            if (iHighestOneBit2 != height) {
                iHighestOneBit2 *= 2;
            }
            while (true) {
                if (iHighestOneBit <= 1024 && iHighestOneBit2 <= 1024) {
                    break;
                }
                iHighestOneBit /= 2;
                iHighestOneBit2 /= 2;
            }
            if (iHighestOneBit == bitmap.getWidth() && iHighestOneBit2 == bitmap.getHeight()) {
                bitmapCreateScaledBitmap = bitmap;
            } else {
                Debug.Printf("UploadImage: scaled bitmap from %d x %d to %d x %d", Integer.valueOf(bitmap.getWidth()), Integer.valueOf(bitmap.getHeight()), Integer.valueOf(iHighestOneBit), Integer.valueOf(iHighestOneBit2));
                bitmapCreateScaledBitmap = Bitmap.createScaledBitmap(bitmap, iHighestOneBit, iHighestOneBit2, true);
            }
            int width2 = bitmapCreateScaledBitmap.getWidth();
            int height2 = bitmapCreateScaledBitmap.getHeight();
            int i2 = bitmapCreateScaledBitmap.hasAlpha() ? 4 : 3;
            OpenJPEG openJPEG = new OpenJPEG(width2, height2, i2, i2, 0, 0);
            int[] iArr = new int[width2];
            for (int i3 = 0; i3 < height2; i3++) {
                bitmapCreateScaledBitmap.getPixels(iArr, 0, width2, 0, i3, width2, 1);
                openJPEG.putPixelRow((height2 - 1) - i3, iArr, width2);
            }
            try {
                fileCreateTempFile = File.createTempFile("uploadtex", "j2k", this.context.getCacheDir());
                openJPEG.SaveJPEG2K(fileCreateTempFile);
                userManager = UserManager.getUserManager(uploadImageParams.agentUUID);
                activeAgentCircuit = userManager != null ? userManager.getActiveAgentCircuit() : null;
            } catch (LLSDException e) {
                e = e;
            } catch (IOException e2) {
                e = e2;
            }
            if (activeAgentCircuit == null || (capability = activeAgentCircuit.getCaps().getCapability(SLCaps.SLCapability.NewFileAgentInventory)) == null) {
                z = false;
            } else {
                LLSDNode lLSDNodePerformRequest = new LLSDXMLRequest().PerformRequest(capability, new LLSDMap(new LLSDMap.LLSDMapEntry("asset_type", new LLSDString("texture")), new LLSDMap.LLSDMapEntry("description", new LLSDString("(No description)")), new LLSDMap.LLSDMapEntry("folder_id", new LLSDUUID(uploadImageParams.folderID)), new LLSDMap.LLSDMapEntry("inventory_type", new LLSDString("texture")), new LLSDMap.LLSDMapEntry("name", new LLSDString(uploadImageParams.name))));
                if (lLSDNodePerformRequest == null) {
                    throw new IOException("Upload request refused");
                }
                Response responseExecute = SLHTTPSConnection.getOkHttpClient().newCall(new Request.Builder().url(lLSDNodePerformRequest.byKey("uploader").asString()).header("Accept", "application/llsd+xml").post(RequestBody.create(MEDIA_TYPE_JP2, fileCreateTempFile)).build()).execute();
                if (responseExecute == null) {
                    throw new IOException("Null response");
                }
                try {
                    if (!responseExecute.isSuccessful()) {
                        throw new IOException("Invalid HTTP response");
                    }
                    LLSDNode xml = LLSDNode.parseXML(responseExecute.body().byteStream(), null);
                    Debug.Log("upload reply: " + xml.serializeToXML());
                    if (xml.keyExists("error")) {
                        LLSDNode lLSDNodeByKey = xml.byKey("error");
                        if (lLSDNodeByKey.keyExists("message") && lLSDNodeByKey.keyExists("success") && !lLSDNodeByKey.byKey("success").asBoolean()) {
                            String strAsString = lLSDNodeByKey.byKey("message").asString();
                            z = false;
                            str = strAsString;
                        } else {
                            str = str2;
                            z = z2;
                        }
                        try {
                            userManager.getInventoryManager().requestFolderUpdate(uploadImageParams.folderID);
                            try {
                                responseExecute.close();
                                str2 = str;
                            } catch (LLSDException e3) {
                                e = e3;
                                str2 = str;
                                Debug.Warning(e);
                                z = false;
                                i++;
                                z2 = z;
                            } catch (IOException e4) {
                                e = e4;
                                str2 = str;
                                Debug.Warning(e);
                                z = false;
                                i++;
                                z2 = z;
                            }
                        } catch (Throwable th) {
                            th = th;
                            responseExecute.close();
                            throw th;
                        }
                    }
                    i++;
                    z2 = z;
                } catch (Throwable th2) {
                    th = th2;
                    str = str2;
                }
            }
            fileCreateTempFile.delete();
            i++;
            z2 = z;
        }
        return new UploadImageResult(z2, str2, null);
    }

    @Override
    public void onPostExecute(UploadImageResult uploadImageResult) {
        UUID uuidFindSpecialFolder;
        super.onPostExecute((UploadImageAsyncTask) uploadImageResult);
        if (this.progressDialog != null) {
            this.progressDialog.cancel();
            this.progressDialog = null;
        }
        if (!(uploadImageResult != null ? uploadImageResult.success : false)) {
            String string = uploadImageResult != null ? uploadImageResult.errorMessage : null;
            AlertDialog.Builder builder = new AlertDialog.Builder(this.context);
            if (string == null) {
                string = this.context.getString(com.lumiyaviewer.lumiya.R.string.failed_to_upload_picture);
            }
            builder.setMessage(string).setCancelable(true).setNegativeButton("Dismiss", new DialogInterface.OnClickListener() {
                private final /* synthetic */ void $m$0(DialogInterface dialogInterface, int i) {
                    dialogInterface.cancel();
                }

                @Override
                public final void onClick(DialogInterface dialogInterface, int i) {
                    $m$0(dialogInterface, i);
                }
            }).create().show();
            return;
        }
        UserManager userManager = UserManager.getUserManager(this.agentUUID);
        SLAgentCircuit activeAgentCircuit = userManager != null ? userManager.getActiveAgentCircuit() : null;
        if (activeAgentCircuit == null || (uuidFindSpecialFolder = activeAgentCircuit.getModules().inventory.findSpecialFolder(0)) == null) {
            return;
        }
        userManager.getInventoryManager().requestFolderUpdate(uuidFindSpecialFolder);
    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();
        this.progressDialog = new ProgressDialog(this.context);
        this.progressDialog.setMessage(this.context.getString(com.lumiyaviewer.lumiya.R.string.uploading_picture));
        this.progressDialog.setIndeterminate(true);
        this.progressDialog.show();
    }
}
