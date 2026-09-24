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

public class UploadImageAsyncTask extends AsyncTask<UploadImageParams, Void, UploadImageAsyncTask.UploadImageResult> {
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

    /**
     * Upload each picture as a texture through the NewFileAgentInventory
     * capability (the viewer's LLNewFileResourceUploadInfo flow): request an
     * uploader URL with the asset/inventory metadata, POST the JPEG-2000 data
     * to it, and read the LLSD reply. The result reports the last picture's
     * outcome and the last error message the grid sent.
     */
    @Override
    protected UploadImageResult doInBackground(UploadImageParams... uploads) {
        boolean success = true;
        String errorMessage = null;
        for (UploadImageParams upload : uploads) {
            Bitmap bitmap = upload.bitmap;
            // Second Life textures are power-of-two sized, at most 1024 x 1024.
            int width = bitmap.getWidth();
            int height = bitmap.getHeight();
            int textureWidth = Integer.highestOneBit(width);
            int textureHeight = Integer.highestOneBit(height);
            if (textureWidth != width) {
                textureWidth *= 2;
            }
            if (textureHeight != height) {
                textureHeight *= 2;
            }
            while (textureWidth > 1024 || textureHeight > 1024) {
                textureWidth /= 2;
                textureHeight /= 2;
            }
            Bitmap scaled;
            if (textureWidth == bitmap.getWidth() && textureHeight == bitmap.getHeight()) {
                scaled = bitmap;
            } else {
                Debug.Printf("UploadImage: scaled bitmap from %d x %d to %d x %d", Integer.valueOf(bitmap.getWidth()), Integer.valueOf(bitmap.getHeight()), Integer.valueOf(textureWidth), Integer.valueOf(textureHeight));
                scaled = Bitmap.createScaledBitmap(bitmap, textureWidth, textureHeight, true);
            }
            int scaledWidth = scaled.getWidth();
            int scaledHeight = scaled.getHeight();
            int components = scaled.hasAlpha() ? 4 : 3;
            OpenJPEG encoder = new OpenJPEG(scaledWidth, scaledHeight, components, components, 0, 0);
            int[] row = new int[scaledWidth];
            for (int y = 0; y < scaledHeight; y++) {
                scaled.getPixels(row, 0, scaledWidth, 0, y, scaledWidth, 1);
                // JPEG-2000 rows are stored bottom-up.
                encoder.putPixelRow((scaledHeight - 1) - y, row, scaledWidth);
            }
            File cacheDir = this.context.getCacheDir();
            boolean uploaded;
            try {
                File encodedFile = File.createTempFile("uploadtex", "j2k", cacheDir);
                encoder.SaveJPEG2K(encodedFile);
                UserManager userManager = UserManager.getUserManager(upload.agentUUID);
                SLAgentCircuit agentCircuit = userManager != null ? userManager.getActiveAgentCircuit() : null;
                String capabilityURL;
                if (agentCircuit == null) {
                    uploaded = false;
                } else if ((capabilityURL = agentCircuit.getCaps().getCapability(SLCaps.SLCapability.NewFileAgentInventory)) == null) {
                    uploaded = false;
                } else {
                    LLSDNode uploadTicket = new LLSDXMLRequest().PerformRequest(capabilityURL, new LLSDMap(
                            new LLSDMap.LLSDMapEntry("asset_type", new LLSDString("texture")),
                            new LLSDMap.LLSDMapEntry("description", new LLSDString("(No description)")),
                            new LLSDMap.LLSDMapEntry("folder_id", new LLSDUUID(upload.folderID)),
                            new LLSDMap.LLSDMapEntry("inventory_type", new LLSDString("texture")),
                            new LLSDMap.LLSDMapEntry("name", new LLSDString(upload.name))));
                    if (uploadTicket == null) {
                        throw new IOException("Upload request refused");
                    }
                    String uploaderURL = uploadTicket.byKey("uploader").asString();
                    Response response = SLHTTPSConnection.getOkHttpClient().newCall(new Request.Builder()
                            .url(uploaderURL)
                            .header("Accept", "application/llsd+xml")
                            .post(RequestBody.create(MEDIA_TYPE_JP2, encodedFile))
                            .build()).execute();
                    if (response == null) {
                        throw new IOException("Null response");
                    }
                    try {
                        if (!response.isSuccessful()) {
                            throw new IOException("Invalid HTTP response");
                        }
                        LLSDNode reply = LLSDNode.parseXML(response.body().byteStream(), null);
                        Debug.Log("upload reply: " + reply.serializeToXML());
                        uploaded = success;
                        if (reply.keyExists("error")) {
                            LLSDNode error = reply.byKey("error");
                            if (error.keyExists("message") && error.keyExists("success") && !error.byKey("success").asBoolean()) {
                                errorMessage = error.byKey("message").asString();
                                uploaded = false;
                            }
                        }
                        userManager.getInventoryManager().requestFolderUpdate(upload.folderID);
                    } finally {
                        response.close();
                    }
                }
                encodedFile.delete();
            } catch (IOException e) {
                Debug.Warning(e);
                uploaded = false;
            } catch (LLSDException e) {
                Debug.Warning(e);
                uploaded = false;
            }
            success = uploaded;
        }
        return new UploadImageResult(success, errorMessage, null);
    }

    @Override
    public void onPostExecute(UploadImageResult uploadImageResult) {
        UUID uuidFindSpecialFolder;
        super.onPostExecute(uploadImageResult);
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
