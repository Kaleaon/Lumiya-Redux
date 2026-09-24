package com.lumiyaviewer.lumiya.render.avatar;

import android.opengl.GLES11;
import android.opengl.GLES20;
import android.opengl.Matrix;
import com.google.common.collect.ArrayListMultimap;
import com.google.common.collect.Multimap;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.render.DrawableObject;
import com.lumiyaviewer.lumiya.render.DrawableStore;
import com.lumiyaviewer.lumiya.render.RenderContext;
import com.lumiyaviewer.lumiya.render.picking.CollisionBox;
import com.lumiyaviewer.lumiya.render.picking.GLRayTrace;
import com.lumiyaviewer.lumiya.render.picking.IntersectInfo;
import com.lumiyaviewer.lumiya.render.picking.IntersectPickable;
import com.lumiyaviewer.lumiya.render.picking.ObjectIntersectInfo;
import com.lumiyaviewer.lumiya.render.spatial.DrawEntryList;
import com.lumiyaviewer.lumiya.render.spatial.DrawListEntry;
import com.lumiyaviewer.lumiya.render.spatial.DrawListObjectEntry;
import com.lumiyaviewer.lumiya.render.spatial.DrawListPrimEntry;
import com.lumiyaviewer.lumiya.res.executors.PrimComputeExecutor;
import com.lumiyaviewer.lumiya.slproto.avatar.MeshIndex;
import com.lumiyaviewer.lumiya.slproto.avatar.SLAttachmentPoint;
import com.lumiyaviewer.lumiya.slproto.avatar.SLBaseAvatar;
import com.lumiyaviewer.lumiya.slproto.avatar.SLSkeletonBone;
import com.lumiyaviewer.lumiya.slproto.avatar.SLSkeletonBoneID;
import com.lumiyaviewer.lumiya.slproto.mesh.MeshJointTranslations;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectAvatarInfo;
import com.lumiyaviewer.lumiya.slproto.objects.SLObjectInfo;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.lumiya.utils.IdentityMatrix;
import com.lumiyaviewer.lumiya.utils.LinkedTreeNode;
import java.util.Collections;
import java.util.EnumMap;
import java.util.HashMap;
import java.util.IdentityHashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import javax.annotation.Nonnull;

public class DrawableAvatar extends DrawableAvatarStub implements IntersectPickable, DrawEntryList.EntryRemovalListener {
    private final Object animationLock;
    private final AnimationSkeletonData animationSkeletonData;
    private final Map<UUID, AvatarAnimationState> animations;
    private volatile boolean animationsInitialized;
    private final Set<DrawListEntry> deadAttachmentsList;
    private final Object deadAttachmentsLock;
    private final AtomicInteger displayedHUDid;

    @Nonnull
    private volatile DrawableAttachments drawableAttachmentList;
    private final DrawEntryList drawableAttachments;
    private volatile DrawableHUD drawableHUD;
    private LLVector3 headPosition;
    private boolean jointMatrixUpdated;
    private final float[] localAviWorldMatrix;
    private final Map<MeshIndex, DrawableAvatarPart> parts;
    private float pelvisTranslateX;
    private float pelvisTranslateY;
    private float pelvisTranslateZ;
    private final Set<DrawableObject> riggedMeshes;
    private volatile AvatarAnimationList runningAnimations;
    private volatile AvatarShapeParams shapeParams;
    private final Runnable shapeParamsUpdate;
    private volatile AvatarSkeleton skeleton;
    private final Runnable updateAttachmentsRunnable;
    private final AtomicReference<AvatarSkeleton> updatedSkeleton;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public DrawableAvatar(DrawableStore drawableStore, UUID uuid, SLObjectAvatarInfo objectAvatarInfo, UUID uuid2, Map<UUID, AnimationSequenceInfo> map) {
        super(drawableStore, uuid, objectAvatarInfo);
        this.updatedSkeleton = new AtomicReference<>(null);
        this.parts = new EnumMap(MeshIndex.class);
        this.animationLock = new Object();
        this.animations = new HashMap();
        this.runningAnimations = null;
        this.animationsInitialized = false;
        this.drawableAttachmentList = new DrawableAttachments();
        this.displayedHUDid = new AtomicInteger();
        this.drawableAttachments = new DrawEntryList(this);
        this.deadAttachmentsLock = new Object();
        this.deadAttachmentsList = Collections.newSetFromMap(new IdentityHashMap());
        this.riggedMeshes = Collections.newSetFromMap(new ConcurrentHashMap());
        this.animationSkeletonData = new AnimationSkeletonData();
        this.pelvisTranslateX = 0.0f;
        this.pelvisTranslateY = 0.0f;
        this.pelvisTranslateZ = 0.0f;
        this.localAviWorldMatrix = new float[16];
        this.jointMatrixUpdated = false;
        this.updateAttachmentsRunnable = this::processUpdateAttachments;
        this.shapeParamsUpdate = this::m63x3d2f5f87;
        SLBaseAvatar baseAvatar = SLBaseAvatar.getInstance();
        for (MeshIndex meshIndex : MeshIndex.VALUES) {
            this.parts.put(meshIndex, new DrawableAvatarPart(uuid2, baseAvatar.getMeshEntry(meshIndex).textureFaceIndex, baseAvatar.getMeshEntry(meshIndex).polyMesh, drawableStore.hasGL20));
        }
        synchronized (this.animationLock) {
            if (map != null) {
                for (AnimationSequenceInfo animationSequenceInfo : map.values()) {
                    this.animations.put(animationSequenceInfo.animationID, new AvatarAnimationState(animationSequenceInfo, this));
                }
            }
            this.animationsInitialized = true;
            updateRunningAnimations();
        }
        updateAttachments();
    }

    private void DrawParts(RenderContext renderContext) {
        AvatarSkeleton avatarSkeleton = this.skeleton;
        if (avatarSkeleton == null) {
            return;
        }
        float pelvisToFoot = this.avatarObject.parentID == 0 ? ((-avatarSkeleton.getBodySize()) / 2.0f) + avatarSkeleton.getPelvisToFoot() + avatarSkeleton.getPelvisOffset() : 0.0f;
        this.pelvisTranslateX = -avatarSkeleton.rootBone.getPositionX();
        this.pelvisTranslateY = -avatarSkeleton.rootBone.getPositionY();
        this.pelvisTranslateZ = pelvisToFoot + (-avatarSkeleton.rootBone.getPositionZ());
        renderContext.glObjWorldTranslatef(this.pelvisTranslateX, this.pelvisTranslateY, this.pelvisTranslateZ);
        renderContext.objWorldMatrix.getMatrix(this.localAviWorldMatrix, 0);
        GLPrepare(renderContext, avatarSkeleton.jointMatrix);
        MeshIndex[] meshIndexArr = MeshIndex.VALUES;
        int length = meshIndexArr.length;
        for (int i = 0; i < length; i++) {
            MeshIndex meshIndex = meshIndexArr[i];
            DrawableAvatarPart drawableAvatarPart = this.parts.get(meshIndex);
            SLSkeletonBone skeletonBone = meshIndex == MeshIndex.MESH_ID_EYEBALL_LEFT ? avatarSkeleton.bones.get(SLSkeletonBoneID.mEyeLeft) : meshIndex == MeshIndex.MESH_ID_EYEBALL_RIGHT ? avatarSkeleton.bones.get(SLSkeletonBoneID.mEyeRight) : null;
            if (skeletonBone != null) {
                renderContext.glObjWorldPushAndMultMatrixf(skeletonBone.getGlobalMatrix(), 0);
            }
            drawableAvatarPart.GLDraw(renderContext, avatarSkeleton.jointMatrix, this.jointMatrixUpdated);
            if (skeletonBone != null) {
                renderContext.glObjWorldPopMatrix();
            }
        }
        SLSkeletonBone skeletonBone2 = avatarSkeleton.bones.get(SLSkeletonBoneID.mHead);
        if (skeletonBone2 != null) {
            renderContext.glObjWorldPushAndMultMatrixf(skeletonBone2.getGlobalMatrix(), 0);
            float[] matrixData = renderContext.objWorldMatrix.getMatrixData();
            int matrixDataOffset = renderContext.objWorldMatrix.getMatrixDataOffset();
            float f = matrixData[matrixDataOffset + 12];
            float f2 = matrixData[matrixDataOffset + 13];
            float f3 = matrixData[matrixDataOffset + 14];
            if (this.headPosition == null) {
                this.headPosition = new LLVector3();
            }
            this.headPosition.set(f, f2, f3);
            renderContext.glObjWorldPopMatrix();
        }
        renderContext.curPrimProgram = null;
        if (this.drawableAttachmentList.Draw(renderContext, avatarSkeleton, this.jointMatrixUpdated)) {
            this.drawableAttachmentList = new DrawableAttachments(this.drawableAttachmentList);
        }
        this.jointMatrixUpdated = false;
    }

    private void GLPrepare(RenderContext renderContext, float[] floats) {
        if (!renderContext.hasGL20) {
            GLES11.glMatrixMode(5890);
            GLES11.glLoadMatrixf(IdentityMatrix.getMatrix(), 0);
            GLES11.glMatrixMode(5888);
        } else {
            GLES20.glUseProgram(renderContext.avatarProgram.getHandle());
            GLES20.glUniform1i(renderContext.avatarProgram.sTexture, 0);
            GLES20.glUniform4f(renderContext.avatarProgram.uObjCoordScale, 1.0f, 1.0f, 1.0f, 1.0f);
            renderContext.glModelApplyMatrix(renderContext.avatarProgram.uMVPMatrix);
            renderContext.avatarProgram.SetupLighting(renderContext, renderContext.windlightPreset);
            GLES20.glUniformMatrix4fv(renderContext.avatarProgram.uJointMatrix, 133, false, floats, 0);
        }
    }

    private boolean animate(AvatarSkeleton avatarSkeleton) {
        boolean needForceAnimate = avatarSkeleton.needForceAnimate();
        AvatarAnimationList avatarAnimationList = this.runningAnimations;
        if (!avatarAnimationList.needAnimate(System.currentTimeMillis()) && !needForceAnimate) {
            return false;
        }
        this.animationSkeletonData.animate(avatarSkeleton, avatarAnimationList);
        return true;
    }

    private AvatarAnimationList getRunningAnimations() {
        AvatarAnimationList avatarAnimationList;
        synchronized (this.animationLock) {
            avatarAnimationList = new AvatarAnimationList(this.animations.values());
        }
        return avatarAnimationList;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r0v27, types: [com.lumiyaviewer.lumiya.render.spatial.DrawListEntry[]] */
    /**
     * Rebuild the attachment draw lists from the avatar's child objects: world
     * attachments are grouped per attachment point, the one displayed HUD gets
     * a DrawableHUD, and dead attachments queued by other threads are removed.
     * Rigged meshes are re-collected; updateRiggedMeshes() runs when that set
     * changed.
     */
    private void processUpdateAttachments() {
        ArrayListMultimap<Integer, DrawableObject> attachmentsByPoint = ArrayListMultimap.create();
        Set<DrawableObject> liveRiggedMeshes = Collections.newSetFromMap(new IdentityHashMap<DrawableObject, Boolean>());
        int displayedHUD = this.displayedHUDid.get();
        DrawableHUD hud = null;
        for (LinkedTreeNode<SLObjectInfo> child = this.avatarObject.treeNode.getFirstChild(); child != null; child = child.getNextChild()) {
            SLObjectInfo attachment = child.getDataObject();
            if (attachment.isDead) {
                continue;
            }
            int attachmentPoint = attachment.attachmentID;
            // 56 attachment points (llvoavatar attachment IDs 0..55); others ignored.
            if (attachmentPoint < 0 || attachmentPoint >= 56) {
                continue;
            }
            SLAttachmentPoint point = SLAttachmentPoint.attachmentPoints[attachmentPoint];
            if (point == null) {
                continue;
            }
            if (!point.isHUD) {
                updateAttachmentParts(attachment, attachmentsByPoint, attachmentPoint);
            } else if (displayedHUD == attachment.localID) {
                hud = new DrawableHUD(point, this.drawableAttachments, attachment, this.drawableStore, this);
            }
        }
        DrawListEntry[] deadEntries;
        synchronized (this.deadAttachmentsLock) {
            if (this.deadAttachmentsList.isEmpty()) {
                deadEntries = null;
            } else {
                deadEntries = this.deadAttachmentsList.toArray(new DrawListEntry[this.deadAttachmentsList.size()]);
                this.deadAttachmentsList.clear();
            }
        }
        boolean riggedMeshesChanged = false;
        for (DrawableObject drawable : attachmentsByPoint.values()) {
            if (drawable.isRiggedMesh()) {
                if (this.riggedMeshes.add(drawable)) {
                    riggedMeshesChanged = true;
                }
                liveRiggedMeshes.add(drawable);
            }
        }
        if (deadEntries != null) {
            for (DrawListEntry dead : deadEntries) {
                this.drawableAttachments.removeEntry(dead);
                if (dead instanceof DrawListPrimEntry) {
                    DrawableObject drawable = ((DrawListPrimEntry) dead).getDrawableObject();
                    if (drawable != null) {
                        liveRiggedMeshes.remove(drawable);
                        if (this.riggedMeshes.remove(drawable)) {
                            riggedMeshesChanged = true;
                        }
                    }
                }
            }
        }
        for (DrawableObject drawable : this.riggedMeshes) {
            if (!liveRiggedMeshes.contains(drawable)) {
                this.riggedMeshes.remove(drawable);
                riggedMeshesChanged = true;
            }
        }
        this.drawableHUD = hud;
        this.drawableAttachmentList = new DrawableAttachments(attachmentsByPoint);
        if (riggedMeshesChanged) {
            updateRiggedMeshes();
        }
    }

    private void updateAttachmentParts(SLObjectInfo objectInfo, Multimap<Integer, DrawableObject> multimap, int i) {
        DrawListObjectEntry drawListEntry = objectInfo.getDrawListEntry();
        this.drawableAttachments.addEntry(drawListEntry);
        if (drawListEntry instanceof DrawListPrimEntry) {
            multimap.put(Integer.valueOf(i), ((DrawListPrimEntry) drawListEntry).getDrawableAttachment(this.drawableStore, this));
        }
        for (LinkedTreeNode<SLObjectInfo> firstChild = objectInfo.treeNode.getFirstChild(); firstChild != null; firstChild = firstChild.getNextChild()) {
            SLObjectInfo dataObject = firstChild.getDataObject();
            if (dataObject != null) {
                updateAttachmentParts(dataObject, multimap, i);
            }
        }
    }

    private void updateRiggedMeshes() {
        PrimComputeExecutor.getInstance().execute(this.shapeParamsUpdate);
    }

    void AnimationRemove(UUID uuid) {
        boolean z;
        synchronized (this.animationLock) {
            z = this.animations.remove(uuid) != null;
        }
        if (z) {
            updateRunningAnimations();
        }
    }

    void AnimationUpdate(AnimationSequenceInfo animationSequenceInfo) {
        UUID uuid = animationSequenceInfo.animationID;
        synchronized (this.animationLock) {
            AvatarAnimationState avatarAnimationState = this.animations.get(uuid);
            if (avatarAnimationState == null) {
                this.animations.put(uuid, new AvatarAnimationState(animationSequenceInfo, this));
            } else {
                avatarAnimationState.updateSequenceInfo(animationSequenceInfo);
            }
        }
        updateRunningAnimations();
    }

    public void Draw(RenderContext renderContext) {
        float[] worldMatrix = getWorldMatrix(renderContext);
        if (worldMatrix != null) {
            try {
                renderContext.glObjWorldPushAndMultMatrixf(worldMatrix, 0);
                DrawParts(renderContext);
                renderContext.glObjWorldPopMatrix();
            } catch (Exception e) {
                Debug.Warning(e);
            }
        }
    }

    @Override
    public void DrawNameTag(RenderContext renderContext) {
        DrawableHoverText drawableHoverText = this.drawableNameTag;
        if (drawableHoverText != null) {
            LLVector3 headPosition = this.headPosition;
            if (headPosition != null) {
                drawableHoverText.DrawAtWorld(renderContext, headPosition.x, headPosition.y, headPosition.z, 0.5f, renderContext.projectionMatrix, false, 0);
            } else {
                super.DrawNameTag(renderContext);
            }
        }
    }

    boolean IsAnimationStopped(UUID uuid) {
        boolean hasStopped;
        synchronized (this.animationLock) {
            AvatarAnimationState avatarAnimationState = this.animations.get(uuid);
            hasStopped = avatarAnimationState != null ? avatarAnimationState.hasStopped() : false;
        }
        return hasStopped;
    }

    @Override
    public ObjectIntersectInfo PickObject(RenderContext renderContext, float f, float f2, float f3) {
        ObjectIntersectInfo objectIntersectInfo;
        float[] worldMatrix = getWorldMatrix(renderContext);
        AvatarSkeleton avatarSkeleton = this.skeleton;
        if (worldMatrix == null || avatarSkeleton == null) {
            return null;
        }
        int[] viewportRect = renderContext.viewportRect;
        float[] floats = new float[32];
        float[] floats2 = new float[6];
        float f4 = viewportRect[3] - f2;
        renderContext.glObjWorldPushAndMultMatrixf(worldMatrix, 0);
        renderContext.glObjWorldTranslatef(this.pelvisTranslateX, this.pelvisTranslateY, this.pelvisTranslateZ);
        Iterator<SLSkeletonBone> it = avatarSkeleton.bones.values().iterator();
        while (true) {
            if (!it.hasNext()) {
                objectIntersectInfo = null;
                break;
            }
            SLSkeletonBone skeletonBone = (SLSkeletonBone) it.next();
            if (!skeletonBone.boneID.isJoint) {
                renderContext.glObjWorldPushAndMultMatrixf(avatarSkeleton.jointWorldMatrix, skeletonBone.boneID.ordinal() * 16);
                if (renderContext.hasGL20) {
                    Matrix.scaleM(floats, 0, renderContext.objWorldMatrix.getMatrixData(), renderContext.objWorldMatrix.getMatrixDataOffset(), 1.0f, 1.0f, 1.0f);
                    RenderContext.gluUnProject(f, f4, 0.0f, floats, 0, renderContext.modelViewMatrix.getMatrixData(), renderContext.modelViewMatrix.getMatrixDataOffset(), viewportRect, 0, floats2, 0);
                    RenderContext.gluUnProject(f, f4, 1.0f, floats, 0, renderContext.modelViewMatrix.getMatrixData(), renderContext.modelViewMatrix.getMatrixDataOffset(), viewportRect, 0, floats2, 3);
                } else {
                    Matrix.scaleM(floats, 16, renderContext.objWorldMatrix.getMatrixData(), renderContext.objWorldMatrix.getMatrixDataOffset(), 1.0f, 1.0f, 1.0f);
                    Matrix.multiplyMM(floats, 0, renderContext.modelViewMatrix.getMatrixData(), renderContext.modelViewMatrix.getMatrixDataOffset(), floats, 16);
                    RenderContext.gluUnProject(f, f4, 0.0f, floats, 0, renderContext.projectionMatrix.getMatrixData(), renderContext.projectionMatrix.getMatrixDataOffset(), viewportRect, 0, floats2, 0);
                    RenderContext.gluUnProject(f, f4, 1.0f, floats, 0, renderContext.projectionMatrix.getMatrixData(), renderContext.projectionMatrix.getMatrixDataOffset(), viewportRect, 0, floats2, 3);
                }
                renderContext.glObjWorldPopMatrix();
                LLVector3 vector3 = new LLVector3(floats2[0], floats2[1], floats2[2]);
                LLVector3 vector33 = new LLVector3(floats2[3], floats2[4], floats2[5]);
                LLVector3[] vertices = CollisionBox.getInstance().vertices;
                GLRayTrace.RayIntersectInfo rayIntersectInfo = null;
                for (int i = 0; i < 12 && (rayIntersectInfo = GLRayTrace.intersect_RayTriangle(vector3, vector33, vertices, i * 3)) == null; i++) {
                }
                if (rayIntersectInfo != null) {
                    float intersectionDepth = GLRayTrace.getIntersectionDepth(renderContext, rayIntersectInfo.intersectPoint, floats);
                    if (intersectionDepth >= f3) {
                        objectIntersectInfo = new ObjectIntersectInfo(new IntersectInfo(rayIntersectInfo.intersectPoint), this.avatarObject, intersectionDepth);
                        break;
                    }
                } else {
                    continue;
                }
            }
        }
        renderContext.glObjWorldPopMatrix();
        return objectIntersectInfo;
    }

    public void RunAnimations() {
        AvatarSkeleton andSet = this.updatedSkeleton.getAndSet(null);
        if (andSet != null) {
            this.skeleton = andSet;
        }
        AvatarSkeleton avatarSkeleton = this.skeleton;
        if (avatarSkeleton == null || !animate(avatarSkeleton)) {
            return;
        }
        avatarSkeleton.UpdateGlobalPositions(this.animationSkeletonData);
        this.jointMatrixUpdated |= true;
    }

    void UpdateShapeParams(AvatarShapeParams avatarShapeParams) {
        this.shapeParams = avatarShapeParams;
        PrimComputeExecutor.getInstance().execute(this.shapeParamsUpdate);
    }

    void UpdateTextures(AvatarTextures avatarTextures) {
        Iterator<Map.Entry<MeshIndex, DrawableAvatarPart>> it = this.parts.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry entry = (Map.Entry) it.next();
            ((DrawableAvatarPart) entry.getValue()).setTexture(this.drawableStore.glTextureCache, avatarTextures.getTexture(((DrawableAvatarPart) entry.getValue()).getFaceIndex()));
        }
    }

    public DrawableHUD getDrawableHUD() {
        return this.drawableHUD;
    }

    /* renamed from: lambda$-com_lumiyaviewer_lumiya_render_avatar_DrawableAvatar_15479, reason: not valid java name */
    /* synthetic */ void m63x3d2f5f87() {
        boolean z;
        boolean z2 = false;
        AvatarShapeParams avatarShapeParams = this.shapeParams;
        if (avatarShapeParams != null) {
            Debug.Printf("Avatar: shapeParamsUpdate: %d rigged meshes", Integer.valueOf(this.riggedMeshes.size()));
            MeshJointTranslations meshJointTranslations = new MeshJointTranslations();
            Iterator<DrawableObject> it = this.riggedMeshes.iterator();
            while (true) {
                z = z2;
                if (!it.hasNext()) {
                    break;
                }
                DrawableObject drawableObject = (DrawableObject) it.next();
                drawableObject.ApplyJointTranslations(meshJointTranslations);
                z2 = drawableObject.hasExtendedBones() | z;
            }
            AvatarSkeleton avatarSkeleton = new AvatarSkeleton(avatarShapeParams, meshJointTranslations, z);
            this.updatedSkeleton.set(avatarSkeleton);
            Iterator<Map.Entry<MeshIndex, DrawableAvatarPart>> iterator = this.parts.entrySet().iterator();
            while (iterator.hasNext()) {
                Map.Entry entry = (Map.Entry) iterator.next();
                ((DrawableAvatarPart) entry.getValue()).setPartMorphParams(avatarSkeleton.getMorphParams((MeshIndex) entry.getKey()));
            }
        }
    }

    @Override
    public void onEntryRemovalRequested(DrawListEntry drawListEntry) {
        synchronized (this.deadAttachmentsLock) {
            this.deadAttachmentsList.add(drawListEntry);
        }
        updateAttachments();
    }

    public void onRiggedMeshReady(DrawableObject drawableObject) {
        if (this.riggedMeshes.add(drawableObject)) {
            updateRiggedMeshes();
        }
    }

    public void setDisplayedHUDid(int displayedHUDid) {
        if (this.displayedHUDid.getAndSet(displayedHUDid) != displayedHUDid) {
            updateAttachments();
        }
    }

    public void updateAttachments() {
        PrimComputeExecutor.getInstance().execute(this.updateAttachmentsRunnable);
    }

    void updateRunningAnimations() {
        if (this.animationsInitialized) {
            this.runningAnimations = getRunningAnimations();
            AvatarSkeleton avatarSkeleton = this.skeleton;
            if (avatarSkeleton != null) {
                avatarSkeleton.setForceAnimate();
            }
        }
    }
}
