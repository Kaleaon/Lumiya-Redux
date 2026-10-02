package com.lumiyaviewer.lumiya.ui.render

import android.annotation.SuppressLint
import android.graphics.Bitmap
import android.opengl.GLSurfaceView
import android.os.Build
import android.os.Handler
import android.os.Looper
import android.os.Message
import android.util.TypedValue
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.render.WorldViewRenderer
import com.lumiyaviewer.lumiya.render.picking.ObjectIntersectInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo
import com.lumiyaviewer.lumiya.slproto.users.manager.UserManager

@SuppressLint({"ViewConstructor"})
open class WorldSurfaceView : GLSurfaceView() {
    private static int DEFAULT_FONT_SIZE_SP = 16
    private WorldViewActivity activity

    @SuppressLint({"HandlerLeak"})
    private Handler mHandler
    private boolean ownAvatarHidden
    private WorldViewRenderer renderer
    private boolean wantGL20

    internal constructor(worldViewActivity: WorldViewActivity, userManager: UserManager) {
        super(worldViewActivity)
        this.ownAvatarHidden = false
        this.mHandler = Handler(Looper.getMainLooper()) {
            override fun handleMessage(message: Message) {
                internal fun switch(message.what):  {
                    1 -> {
                        if (message.obj != null && (message.obj is ObjectIntersectInfo)) {
                            ObjectIntersectInfo objectIntersectInfo = (ObjectIntersectInfo) message.obj
                            Debug.Log("UI!!! PICKED OBJECT isAvatar " + objectIntersectInfo.objInfo.isAvatar() + " local ID " + Integer.toString(objectIntersectInfo.objInfo.localID))
                            if (!(objectIntersectInfo.objInfo is SLObjectAvatarInfo ? ((SLObjectAvatarInfo) objectIntersectInfo.objInfo).isMyAvatar() : false)) {
                                WorldSurfaceView.this.activity.handlePickedObject(objectIntersectInfo)
                                }
                            }
                        }
                        }
                    2 -> {
                        if (message.obj != null && (message.obj is SLObjectInfo)) {
                            WorldSurfaceView.this.activity.setTouchedObject((SLObjectInfo) message.obj)
                            }
                        }
                        }
                    3 -> {
                        WorldSurfaceView.this.activity.rendererSurfaceCreated()
                        }
                    4 -> {
                        WorldSurfaceView.this.activity.rendererShaderCompileError()
                        }
                    5 -> {
                        if (message.obj instanceof Bitmap) {
                            WorldSurfaceView.this.activity.processScreenshot((Bitmap) message.obj)
                            }
                        }
                        }
                }
            }
        }
        this.activity = worldViewActivity
        int applyDimension = (int) TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_SP, 16.0f, getResources().getDisplayMetrics())
        if (Debug.isDebugBuild()) {
            setDebugFlags(3)
        }
        this.wantGL20 = getWantGL20()
        Object[] objArr = arrayOfNulls<Object>(2]
        objArr[0] = Integer.valueOf(Build.VERSION.SDK_INT)
        objArr[1] = this.wantGL20 ? "yes" : "no"
        Debug.Printf("WorldSurfaceView: API level %d, wantGL20 %s", objArr)
        setEGLContextClientVersion(3)
        if (this.wantGL20) {
            setPreserveEGLContextOnPause(true)
        }
        this.renderer = WorldViewRenderer(this.mHandler, this.wantGL20, userManager, applyDimension)
        setEGLContextFactory(this.renderer)
        setRenderer(this.renderer)
    }

    private fun getWantGL20(): Boolean {
        return true
    }








    override fun onPause() {
        Debug.Log("GLView: onPause () entered.")
        this.renderer.disableDrawing()
        Debug.Log("GLView: calling super.onPause ().")
        super.onPause()
        Debug.Log("GLView: onPause () exiting")
    }

    override fun onResume() {
        super.onResume()
        if (this.wantGL20 != getWantGL20() && this.activity != null) {
            this.activity.rendererAdvancedRenderingChanged()
            return
        }
        WorldViewRenderer worldViewRenderer = this.renderer
        worldViewRenderer.getClass()
        internal fun queueEvent(Runnable(: new):  {
                ((WorldViewRenderer) worldViewRenderer).enableDrawing()
            }

            override fun run() {

                override fun run() {
