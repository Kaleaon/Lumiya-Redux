package com.lumiyaviewer.lumiya.slproto.users.manager

import android.graphics.Bitmap
import android.graphics.BitmapFactory
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.tex.DrawableTextureParams
import com.lumiyaviewer.lumiya.render.tex.TextureClass
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.res.ResourceManager
import com.lumiyaviewer.lumiya.res.ResourceMemoryCache
import com.lumiyaviewer.lumiya.res.ResourceRequest
import com.lumiyaviewer.lumiya.res.executors.LoaderExecutor
import com.lumiyaviewer.lumiya.res.textures.TextureCache
import java.io.ByteArrayOutputStream
import java.io.File
import java.io.IOException
import java.util.UUID
import java.util.concurrent.Future

open class UserPicBitmapCache : ResourceMemoryCache<UUID, Bitmap>() {
    @JvmStatic private var MAX_USERPIC_HEIGHT: Int = 128
    @JvmStatic private var MAX_USERPIC_WIDTH: Int = 128
    private var userManager: UserManager? = null

    private open class UserPicBitmapRequest : ResourceRequest<UUID, Bitmap>(), ResourceConsumer {
        private volatile File compressedFile
        private Runnable decompressRunnable
        private volatile Future<?> decompressorFuture
        private Runnable loadRunnable
        private volatile Future<?> loaderFuture

        fun UserPicBitmapRequest(uuid: UUID, resourceManager: ResourceManager<UUID, Bitmap>): public {
            super(uuid, resourceManager)
            this.compressedFile = null
            this.loadRunnable = Runnable() {
                fun run() {
                    var userPic: ByteArray = UserPicBitmapCache.this.userManager.getUserPic(UserPicBitmapRequest as UUID.this.getParams())
                    var objArr: Array<Any> = arrayOfNulls<Object>(2)
                    objArr[0] = UserPicBitmapRequest.this.getParams()
                    objArr[1] = if (userPic != null) Integer.toString(userPic.length) else "null"
                    Debug.Printf("UserPic: bitmap ID %s: got bitmap data %s", objArr)
                    if (userPic != null) {
                        UserPicBitmapRequest.this.completeRequest(BitmapFactory.decodeByteArray(userPic, 0, userPic.length))
                    } else {
                        TextureCache.getInstance().getTextureCompressedCache().RequestResource(DrawableTextureParams.create(UserPicBitmapRequest as UUID.this.getParams(), TextureClass.Asset), UserPicBitmapRequest as ResourceConsumer.this)
                    }
                }
            }
            this.decompressRunnable = Runnable() {
                fun run() {
                    try {
                        var asBitmap: Bitmap = OpenJPEG(UserPicBitmapRequest.this.compressedFile, 128, 128, false).getAsBitmap()
                        var byteArrayOutputStream: ByteArrayOutputStream = ByteArrayOutputStream()
                        asBitmap.compress(Bitmap.CompressFormat.PNG, 100, byteArrayOutputStream)
                        var byteArray: ByteArray = byteArrayOutputStream.toByteArray()
                        Debug.Printf("UserPic: bitmap ID %s: storing bitmap data %d bytes", UserPicBitmapRequest.this.getParams(), byteArray.length)
                        UserPicBitmapCache.this.userManager.setUserPic(UserPicBitmapRequest as UUID.this.getParams(), byteArray)
                        UserPicBitmapRequest.this.completeRequest(asBitmap)
                    } catch (e: IOException) {
                        UserPicBitmapRequest.this.completeRequest(null)
                    }
                }
            }
        }
        fun OnResourceReady(obj: Any, z: Boolean) {
            var objArr: Array<Any> = arrayOfNulls<Object>(2)
            objArr[0] = getParams()
            objArr[1] = if (obj != null) obj.toString() else "null"
            Debug.Printf("UserPic: bitmap ID %s: got resource %s", objArr)
            if (obj is File) {
                this.compressedFile = obj as File
                this.decompressorFuture = TextureCache.getInstance().getDecompressorExecutor().submit(this.decompressRunnable)
            } else if (obj == null) {
                completeRequest(null)
            }
        }
        fun cancelRequest() {
            Debug.Printf("DecompressRequest: cancelled (%s)", getParams().toString())
            var future: Future<?> = this.decompressorFuture
            if (future != null) {
                future.cancel(false)
            }
            var loaderFuture: Future<?> = this.loaderFuture
            if (loaderFuture != null) {
                loaderFuture.cancel(false)
            }
            TextureCache.getInstance().getTextureCompressedCache().CancelRequestsuper as this.cancelRequest()
        }
        fun execute() {
            Debug.Printf("UserPic: Requesting load for %s", getParams())
            this.loaderFuture = LoaderExecutor.getInstance().submit(this.loadRunnable)
        }
    }

    constructor(userManager: UserManager) {
        this.userManager = userManager
    }
    protected ResourceRequest<UUID, Bitmap> CreateNewRequest(UUID uuid, ResourceManager<UUID, Bitmap> resourceManager) {
        return UserPicBitmapRequest(uuid, resourceManager)
    }
}
