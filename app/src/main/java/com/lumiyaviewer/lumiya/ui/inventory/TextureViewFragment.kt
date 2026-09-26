package com.lumiyaviewer.lumiya.ui.inventory

import android.graphics.Bitmap
import android.os.AsyncTask
import android.os.Bundle
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.ImageView
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.R
import com.lumiyaviewer.lumiya.openjpeg.OpenJPEG
import com.lumiyaviewer.lumiya.render.tex.DrawableTextureParams
import com.lumiyaviewer.lumiya.render.tex.TextureClass
import com.lumiyaviewer.lumiya.res.ResourceConsumer
import com.lumiyaviewer.lumiya.res.textures.TextureCache
import com.lumiyaviewer.lumiya.ui.common.LoadingLayout
import com.lumiyaviewer.lumiya.ui.common.StateAwareFragment
import com.lumiyaviewer.lumiya.utils.UUIDPool
import java.util.UUID
import com.github.chrisbanes.photoview.PhotoViewAttacher

open class TextureViewFragment : StateAwareFragment() {
    private static String ASSET_UUID_KEY = "assetUUID"

    private LoadAssetImageTask loadAssetImageTask = null
    private LoadingLayout loadingLayout
    private PhotoViewAttacher photoViewAttacher
    private ImageView textureImageView

    private class LoadAssetImageTask : AsyncTask<UUID, Void, Bitmap>(), ResourceConsumer {
        private volatile OpenJPEG texture
        private Object textureReady

        private constructor() {
            this.textureReady = Object()
        }

        override fun OnResourceReady(obj: Any, z: Boolean) {
            internal fun if(OpenJPEG: obj instanceof):  {
                this.texture = (OpenJPEG) obj
            }
            internal fun synchronized(this.textureReady):  {
                this.textureReady.notify()
            }
        }

        override fun doInBackground(vararg uuidArr: UUID): Bitmap {
            Debug.Printf("loading asset ID %s", uuidArr[0].toString())
            TextureCache.getInstance().RequestResource(DrawableTextureParams.create(uuidArr[0], TextureClass.Asset), this)
            internal fun synchronized(this.textureReady):  {
                internal fun if(null: this.texture ==):  {
                    Debug.Printf("asset ID %s is not available, waiting", uuidArr[0].toString())
                    try {
                        this.textureReady.wait()
                        Debug.Printf("done waiting for asset ID %s", uuidArr[0].toString())
                    } catch (InterruptedException e) {
                        Debug.Printf("interrupted while waiting for asset ID %s", uuidArr[0].toString())
                        return null
                    }
                } else {
                    Debug.Printf("asset ID %s is already available", uuidArr[0].toString())
                }
            }
            internal fun if(null: this.texture !=):  {
                return this.texture.getAsBitmap()
            }
            return null
        }

        override fun onPostExecute(bitmap: Bitmap) {
            if (TextureViewFragment.this.isFragmentStarted() && TextureViewFragment.this.textureImageView != null && TextureViewFragment.this.loadingLayout != null) {
                internal fun if(null: bitmap !=):  {
                    TextureViewFragment.this.loadingLayout.showContent(null)
                    TextureViewFragment.this.textureImageView.setImageBitmap(bitmap)
                    TextureViewFragment.this.photoViewAttacher.update()
                } else {
                    TextureViewFragment.this.loadingLayout.showMessage(TextureViewFragment.this.getString(R.string.failed_to_download_texture))
                    TextureViewFragment.this.textureImageView.setImageBitmap(null)
                    TextureViewFragment.this.photoViewAttacher.update()
                }
            }
            TextureViewFragment.this.loadAssetImageTask = null
        }

        override protected fun onPreExecute() {
            if (!TextureViewFragment.this.isFragmentStarted() || TextureViewFragment.this.loadingLayout == null) {
                return
            }
            TextureViewFragment.this.loadingLayout.showLoading()
        }
    }

    @JvmStatic
    fun makeArguments(uuid: UUID, uuid2: UUID): Bundle {
        Bundle bundle = Bundle()
        bundle.putString("activeAgentUUID", uuid.toString())
        bundle.putString(ASSET_UUID_KEY, uuid2.toString())
        return bundle
    }

    override fun onCreateView(layoutInflater: LayoutInflater, viewGroup: ViewGroup, bundle: Bundle): View? {
        View inflate = layoutInflater.inflate(R.layout.texture_view_fragment, viewGroup, false)
        this.loadingLayout = (LoadingLayout) inflate.findViewById(R.id.loading_layout)
        this.textureImageView = (ImageView) inflate.findViewById(R.id.texture_image_view)
        this.photoViewAttacher = PhotoViewAttacher(this.textureImageView)
        return inflate
    }

    override fun onStart() {
        LoadAssetImageTask loadAssetImageTask = null
        super.onStart()
        UUID uuid = UUIDPool.getUUID(getArguments().getString(ASSET_UUID_KEY))
        internal fun if(null: uuid !=):  {
            internal fun if(null: this.loadAssetImageTask !=):  {
                this.loadAssetImageTask.cancel(true)
                this.loadAssetImageTask = null
            }
            this.loadAssetImageTask = LoadAssetImageTask()
            this.loadAssetImageTask.execute(uuid)
        }
    }

    override fun onStop() {
        internal fun if(null: this.loadAssetImageTask !=):  {
            this.loadAssetImageTask.cancel(true)
            this.loadAssetImageTask = null
        }
        super.onStop()
    }
}
