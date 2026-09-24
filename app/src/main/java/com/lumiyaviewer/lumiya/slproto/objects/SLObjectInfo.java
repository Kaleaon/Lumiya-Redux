package com.lumiyaviewer.lumiya.slproto.objects;

import android.opengl.Matrix;
import com.google.common.base.Objects;
import com.google.common.base.Strings;
import com.lumiyaviewer.lumiya.render.DrawableObject;
import com.lumiyaviewer.lumiya.Debug;
import com.lumiyaviewer.lumiya.render.MatrixStack;
import com.lumiyaviewer.lumiya.render.avatar.DrawableAvatar;
import com.lumiyaviewer.lumiya.render.spatial.DrawListObjectEntry;
import com.lumiyaviewer.lumiya.render.spatial.DrawListPrimEntry;
import com.lumiyaviewer.lumiya.render.spatial.SpatialIndex;
import com.lumiyaviewer.lumiya.render.spatial.SpatialObjectIndex;
import com.lumiyaviewer.lumiya.slproto.SLMessage;
import com.lumiyaviewer.lumiya.slproto.messages.ImprovedTerseObjectUpdate;
import com.lumiyaviewer.lumiya.slproto.messages.ObjectProperties;
import com.lumiyaviewer.lumiya.slproto.messages.ObjectUpdate;
import com.lumiyaviewer.lumiya.slproto.messages.ObjectUpdateCompressed;
import com.lumiyaviewer.lumiya.slproto.prims.PrimDrawParams;
import com.lumiyaviewer.lumiya.slproto.prims.PrimParamsPool;
import com.lumiyaviewer.lumiya.slproto.prims.PrimVolumeParams;
import com.lumiyaviewer.lumiya.slproto.textures.SLTextureEntry;
import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion;
import com.lumiyaviewer.lumiya.slproto.types.LLVector3;
import com.lumiyaviewer.lumiya.slproto.types.Vector3Array;
import com.lumiyaviewer.lumiya.utils.Identifiable;
import com.lumiyaviewer.lumiya.utils.IdentityMatrix;
import com.lumiyaviewer.lumiya.utils.LinkedTreeNode;
import com.lumiyaviewer.lumiya.utils.UUIDPool;
import java.lang.ref.WeakReference;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.util.Arrays;
import java.util.Iterator;
import java.util.NoSuchElementException;
import java.util.UUID;
import javax.annotation.Nonnull;
import javax.annotation.Nullable;

public abstract class SLObjectInfo implements Identifiable<UUID> {
    private static final int AGENT_ATTACH_MASK = 240;
    private static final int AGENT_ATTACH_OFFSET = 4;
    public static final int FLAGS_ALLOW_INVENTORY_DROP = 65536;
    public static final int FLAGS_ANIM_SOURCE = 2097152;
    public static final int FLAGS_CAMERA_DECOUPLED = 1048576;
    public static final int FLAGS_CAMERA_SOURCE = 4194304;
    public static final int FLAGS_CAST_SHADOWS = 8388608;
    public static final int FLAGS_CREATE_SELECTED = 2;
    public static final int FLAGS_HANDLE_TOUCH = 128;
    public static final int FLAGS_INCLUDE_IN_SEARCH = 32768;
    public static final int FLAGS_INVENTORY_EMPTY = 2048;
    public static final int FLAGS_JOINT_HINGE = 4096;
    public static final int FLAGS_JOINT_LP2P = 16384;
    public static final int FLAGS_JOINT_P2P = 8192;
    public static final int FLAGS_OBJECT_ANY_OWNER = 16;
    public static final int FLAGS_OBJECT_COPY = 8;
    public static final int FLAGS_OBJECT_GROUP_OWNED = 262144;
    public static final int FLAGS_OBJECT_MODIFY = 4;
    public static final int FLAGS_OBJECT_MOVE = 256;
    public static final int FLAGS_OBJECT_OWNER_MODIFY = 268435456;
    public static final int FLAGS_OBJECT_TRANSFER = 131072;
    public static final int FLAGS_OBJECT_YOU_OWNER = 32;
    public static final int FLAGS_PHANTOM = 1024;
    public static final int FLAGS_SCRIPTED = 64;
    public static final int FLAGS_TAKES_MONEY = 512;
    public static final int FLAGS_TEMPORARY = 1073741824;
    public static final int FLAGS_TEMPORARY_ON_REZ = 536870912;
    public static final int FLAGS_USE_PHYSICS = 1;
    public static final int FLAGS_ZLIB_COMPRESSED = Integer.MIN_VALUE;
    public static final int OBJ_COORD_POSITION = 0;
    public static final int OBJ_COORD_SCALE = 1;
    public static final int OBJ_COORD_VELOCITY = 2;
    public static final int OBJ_COORD_WORLD_CENTER = 3;
    public static final int PAY_DEFAULT = -2;
    public static final int PAY_HIDE = -1;
    public int UpdateFlags;

    @Nullable
    private volatile WeakReference<DrawListObjectEntry> drawListEntry;
    public int localID;
    public float objRadius;

    @Nullable
    private PayInfo payInfo;
    private PrimDrawParams primDrawParams;
    private LLQuaternion rotation;
    public int salePrice;
    protected UUID uuid;
    public float[] worldMatrix;
    public int parentID = 0;
    public String name = "(loading)";
    public String description = "";
    public String touchName = "";
    public UUID attachedToUUID = null;
    public UUID ownerUUID = null;
    public UUID creatorUUID = null;
    public byte saleType = 0;
    public int attachmentID = 0;
    private final Vector3Array objectCoords = new Vector3Array(4);
    private volatile HoverText hoverText = null;
    public volatile boolean isDead = false;
    public boolean isAttachment = false;
    public boolean nameKnown = false;
    public boolean nameRequested = false;
    public long nameRequestedAt = 0;
    public int hierLevel = 0;
    public final LinkedTreeNode<SLObjectInfo> treeNode = new LinkedTreeNode<>(this);

    private void ParseObjectData(ByteBuffer byteBuffer) {
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN);
        switch (byteBuffer.limit()) {
            case 16:
                this.objectCoords.set(0, LLVector3.parseU8Vec(byteBuffer, 384.0f, 384.0f, -256.0f, 4096.0f));
                this.objectCoords.set(2, LLVector3.parseU8Vec(byteBuffer, -256.0f, 256.0f, -256.0f, 256.0f));
                byteBuffer.position(byteBuffer.position() + 3);
                this.rotation = LLQuaternion.parseU8Vec3(byteBuffer, -1.0f, 1.0f);
                break;
            case 48:
                byteBuffer.position(byteBuffer.position() + 16);
            case 32:
                this.objectCoords.set(0, LLVector3.parseU16Vec(byteBuffer, -128.0f, 384.0f, -256.0f, 4096.0f));
                this.objectCoords.set(2, LLVector3.parseU16Vec(byteBuffer, -256.0f, 256.0f, -256.0f, 256.0f));
                byteBuffer.position(byteBuffer.position() + 6);
                this.rotation = LLQuaternion.parseU16Vec3(byteBuffer, -1.0f, 1.0f);
                break;
            case 76:
                byteBuffer.position(byteBuffer.position() + 16);
            case 60:
                this.objectCoords.set(0, LLVector3.parseFloatVec(byteBuffer));
                this.objectCoords.set(2, LLVector3.parseFloatVec(byteBuffer));
                byteBuffer.position(byteBuffer.position() + 12);
                this.rotation = LLQuaternion.parseFloatVec3(byteBuffer);
                break;
        }
    }

    private void applyHoverText(@Nullable HoverText hoverText) {
        if (Objects.equal(this.hoverText, hoverText)) {
            return;
        }
        this.hoverText = hoverText;
        DrawableObject drawableObject = getDrawableObject();
        if (drawableObject != null) {
            drawableObject.setHoverText(hoverText);
        }
    }

    private static int attachmentIDFromState(int i) {
        return (((i & 255) & AGENT_ATTACH_MASK) >> 4) | (((i & 255) & (-241)) << 4);
    }

    private float[] calculateWorldMatrix(float[] floats3) {
        LLQuaternion rotation = this.rotation;
        if (rotation == null) {
            return null;
        }
        float[] floats = new float[16];
        float[] floats2 = new float[16];
        this.objectCoords.MatrixTranslate(floats2, 0, floats3, 0, 0);
        Matrix.multiplyMM(floats, 0, floats2, 0, rotation.getInverseMatrix(), 0);
        return floats;
    }

    public static SLObjectInfo create(ObjectUpdateCompressed.ObjectData objectData) throws UnsupportedObjectTypeException {
        SLObjectPrimInfo objectPrimInfo = new SLObjectPrimInfo();
        objectPrimInfo.ApplyObjectUpdate(objectData);
        return objectPrimInfo;
    }

    public static SLObjectInfo create(UUID uuid, ObjectUpdate.ObjectData objectData, UUID uuid2) {
        SLObjectInfo objectInfo = objectData.PCode == 47 ? new SLObjectAvatarInfo(uuid, UUIDPool.getUUID(objectData.FullID), uuid2.equals(objectData.FullID)) : new SLObjectPrimInfo();
        objectInfo.ApplyObjectUpdate(objectData);
        return objectInfo;
    }

    @Nullable
    private DrawableObject getDrawableObject() {
        DrawListObjectEntry existingDrawListEntry = getExistingDrawListEntry();
        if (existingDrawListEntry instanceof DrawListPrimEntry) {
            return ((DrawListPrimEntry) existingDrawListEntry).getDrawableObject();
        }
        return null;
    }

    public static int getLocalID(ImprovedTerseObjectUpdate.ObjectData objectData) {
        ByteBuffer wrap = ByteBuffer.wrap(objectData.Data);
        wrap.order(ByteOrder.LITTLE_ENDIAN);
        return wrap.getInt();
    }

    public static int getLocalID(ObjectUpdateCompressed.ObjectData objectData) {
        ByteBuffer wrap = ByteBuffer.wrap(objectData.Data);
        wrap.position(16);
        wrap.order(ByteOrder.LITTLE_ENDIAN);
        return wrap.getInt();
    }

    private void parseNameValuePairs(String str) {
        for (String part : str.split("\n")) {
            if (part.startsWith("AttachItemID ")) {
                int i = 0;
                while (i < 4) {
                    int indexOf = part.indexOf(32);
                    if (indexOf >= 0) {
                        part = part.substring(indexOf + 1);
                    }
                    i++;
                    part = part.trim();
                }
                try {
                    this.attachedToUUID = UUIDPool.getUUID(UUID.fromString(part));
                } catch (Exception e) {
                    this.attachedToUUID = null;
                }
            } else if (part.startsWith("DisplayName ")) {
                int i2 = 0;
                while (i2 < 4) {
                    int index = part.indexOf(32);
                    if (index >= 0) {
                        part = part.substring(index + 1);
                    }
                    i2++;
                    part = part.trim();
                }
                this.name = part;
                this.nameKnown = true;
            }
        }
    }

    private void updateAttachments() {
        DrawableAvatar drawableAvatar;
        if (!isAvatar() || (drawableAvatar = SpatialIndex.getInstance().getDrawableAvatar(this)) == null) {
            return;
        }
        drawableAvatar.updateAttachments();
    }

    private void updateSpatialIndex(SpatialObjectIndex spatialObjectIndex, boolean z) {
        updateWorldMatrix(false);
        if (z) {
            synchronized (this) {
                this.drawListEntry = null;
            }
        }
        if (spatialObjectIndex != null && (!this.isDead)) {
            spatialObjectIndex.updateObject(getDrawListEntry());
        }
        if (isAvatar()) {
            Iterator<SLObjectInfo> it = this.treeNode.iterator();
            while (it.hasNext()) {
                it.next().updateWorldMatrix(true);
            }
        } else {
            Iterator<SLObjectInfo> iterator = this.treeNode.iterator();
            while (iterator.hasNext()) {
                iterator.next().updateSpatialIndex(z);
            }
        }
    }

    public void ApplyObjectProperties(ObjectProperties.ObjectData objectData) {
        this.name = SLMessage.stringFromVariableOEM(objectData.Name);
        this.description = SLMessage.stringFromVariableUTF(objectData.Description);
        this.touchName = SLMessage.stringFromVariableUTF(objectData.TouchName);
        this.creatorUUID = objectData.CreatorID;
        this.ownerUUID = objectData.OwnerID;
        this.saleType = (byte) objectData.SaleType;
        this.salePrice = objectData.SalePrice;
        this.nameKnown = true;
        this.nameRequested = false;
    }

    public void ApplyObjectUpdate(ObjectUpdate.ObjectData objectData) {
        this.localID = objectData.ID;
        this.uuid = UUIDPool.getUUID(objectData.FullID);
        this.UpdateFlags = objectData.UpdateFlags;
        this.parentID = objectData.ParentID;
        this.attachmentID = attachmentIDFromState(objectData.State);
        if (objectData.OwnerID.getLeastSignificantBits() != 0 || objectData.OwnerID.getMostSignificantBits() != 0) {
            this.ownerUUID = UUIDPool.getUUID(objectData.OwnerID);
        }
        this.objectCoords.set(1, objectData.Scale);
        String stringFromVariableOEM = SLMessage.stringFromVariableOEM(objectData.Text);
        applyHoverText(Strings.isNullOrEmpty(stringFromVariableOEM) ? null : HoverText.create(stringFromVariableOEM, objectData.TextColor.length >= 4 ? (objectData.TextColor[0] & 0xFF) | ((objectData.TextColor[1] << 8) & 0xFF00) | ((objectData.TextColor[2] << 16) & 0xFF0000) | ((objectData.TextColor[3] << 24) & 0xFF000000) : 0));
        PrimVolumeParams createFromObjectUpdate = PrimVolumeParams.createFromObjectUpdate(objectData);
        if (createFromObjectUpdate != null && objectData.ExtraParams != null) {
            createFromObjectUpdate.unpackExtraParams(ByteBuffer.wrap(objectData.ExtraParams).order(ByteOrder.LITTLE_ENDIAN));
        }
        ParseObjectData(ByteBuffer.wrap(objectData.ObjectData));
        PrimDrawParams primDrawParams = PrimParamsPool.get(new PrimDrawParams(createFromObjectUpdate != null ? PrimParamsPool.get(createFromObjectUpdate) : null, SLTextureEntry.create(ByteBuffer.wrap(objectData.TextureEntry), objectData.TextureEntry.length)));
        onTexturesUpdate(primDrawParams.getTextures());
        if (!Objects.equal(this.primDrawParams, primDrawParams)) {
            this.primDrawParams = primDrawParams;
            DrawableObject drawableObject = getDrawableObject();
            if (drawableObject != null) {
                drawableObject.setPrimDrawParams(this.primDrawParams);
            }
        }
        this.primDrawParams = PrimParamsPool.get(primDrawParams);
        parseNameValuePairs(SLMessage.stringFromVariableUTF(objectData.NameValue));
        updateSpatialIndex(false);
    }

    /* JADX WARN: Removed duplicated region for block: B:73:0x017e  */
    /* JADX WARN: Removed duplicated region for block: B:76:0x0188  */
    /* JADX WARN: Removed duplicated region for block: B:79:0x019b  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public void ApplyObjectUpdate(ObjectUpdateCompressed.ObjectData objectData) throws UnsupportedObjectTypeException {
        SLTextureEntry textureEntry;
        String str;
        this.UpdateFlags = objectData.UpdateFlags;
        ByteBuffer byteBuffer = ByteBuffer.wrap(objectData.Data);
        byteBuffer.order(ByteOrder.BIG_ENDIAN);
        this.uuid = UUIDPool.setUUID(this.uuid, byteBuffer.getLong(), byteBuffer.getLong());
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN);
        this.localID = byteBuffer.getInt();
        byte b = byteBuffer.get();
        if (b != 9) {
            throw new UnsupportedObjectTypeException(b);
        }
        this.attachmentID = attachmentIDFromState(byteBuffer.get());
        byteBuffer.position(byteBuffer.position() + 4 + 1 + 1);
        LLVector3 floatVec = LLVector3.parseFloatVec(byteBuffer);
        LLVector3 floatVec2 = LLVector3.parseFloatVec(byteBuffer);
        this.objectCoords.set(1, floatVec);
        this.objectCoords.set(0, floatVec2);
        this.rotation = LLQuaternion.parseFloatVec3(byteBuffer);
        int i = byteBuffer.getInt();
        byteBuffer.order(ByteOrder.BIG_ENDIAN);
        long j = byteBuffer.getLong();
        long j2 = byteBuffer.getLong();
        if (this.ownerUUID == null || (j != 0 && j2 != 0)) {
            this.ownerUUID = UUIDPool.setUUID(this.ownerUUID, j, j2);
        }
        byteBuffer.order(ByteOrder.LITTLE_ENDIAN);
        if ((i & 128) != 0) {
            byteBuffer.position(byteBuffer.position() + 12);
        }
        if ((i & 32) != 0) {
            this.parentID = byteBuffer.getInt();
        }
        if ((i & 2) != 0) {
            byteBuffer.position(byteBuffer.position() + 1);
        } else if ((i & 1) != 0) {
            byteBuffer.position(byteBuffer.get() + byteBuffer.position());
        }
        if ((i & 4) != 0) {
            int iPosition = byteBuffer.position();
            int i2 = 0;
            while (iPosition + i2 < byteBuffer.capacity() && byteBuffer.get(iPosition + i2) != 0) {
                i2++;
            }
            if (i2 != 0) {
                byte[] bytes = new byte[i2];
                byteBuffer.get(bytes, 0, i2);
                try {
                    str = new String(bytes, "ISO-8859-1");
                } catch (UnsupportedEncodingException e) {
                    str = null;
                }
            } else {
                str = null;
            }
            byteBuffer.position(i2 + iPosition + 1);
            applyHoverText(Strings.isNullOrEmpty(str) ? null : HoverText.create(str, byteBuffer.getInt()));
        }
        if ((i & 512) != 0) {
            while (byteBuffer.get() != 0) {
            }
        }
        if ((i & 8) != 0) {
            byteBuffer.position(byteBuffer.position() + 86);
        }
        int iPosition2 = byteBuffer.position();
        int i3 = byteBuffer.get() & 0xFF;
        for (int k = 0; k < i3; k++) {
            byteBuffer.getShort();
            byteBuffer.position(byteBuffer.getInt() + byteBuffer.position());
        }
        if ((i & 16) != 0) {
            byteBuffer.position(byteBuffer.position() + 16);
            byteBuffer.position(byteBuffer.position() + 4 + 1 + 4);
        }
        if ((i & 256) != 0) {
            while (byteBuffer.get() != 0) {
            }
        }
        PrimVolumeParams fromPackedData = PrimVolumeParams.createFromPackedData(byteBuffer);
        try {
            textureEntry = SLTextureEntry.create(byteBuffer, byteBuffer.getInt());
        } catch (Exception e2) {
            textureEntry = null;
        }
        try {
            onTexturesUpdate(textureEntry);
        } catch (Exception e3) {
            Debug.Log("Failed to retrieve textures in compressed update");
        }
        if (fromPackedData != null) {
            byteBuffer.position(iPosition2);
            fromPackedData.unpackExtraParams(byteBuffer);
        }
        PrimDrawParams primDrawParams = PrimParamsPool.get(new PrimDrawParams(fromPackedData != null ? PrimParamsPool.get(fromPackedData) : null, textureEntry));
        if (!Objects.equal(this.primDrawParams, primDrawParams)) {
            this.primDrawParams = primDrawParams;
            DrawableObject drawableObject = getDrawableObject();
            if (drawableObject != null) {
                drawableObject.setPrimDrawParams(this.primDrawParams);
            }
        }
        updateSpatialIndex(false);
    }

    public void ApplyTerseObjectUpdate(ImprovedTerseObjectUpdate.ObjectData objectData) {
        ByteBuffer wrap = ByteBuffer.wrap(objectData.Data);
        wrap.order(ByteOrder.LITTLE_ENDIAN);
        wrap.getInt();
        this.attachmentID = attachmentIDFromState(wrap.get());
        if (wrap.get() != 0) {
            wrap.position(wrap.position() + 16);
        }
        LLVector3 parseFloatVec = LLVector3.parseFloatVec(wrap);
        LLVector3 parseU16Vec = LLVector3.parseU16Vec(wrap, -128.0f, 128.0f, -128.0f, 128.0f);
        this.objectCoords.set(0, parseFloatVec);
        this.objectCoords.set(2, parseU16Vec);
        wrap.position(wrap.position() + 6);
        this.rotation = LLQuaternion.parseU16Vec3(wrap, -1.0f, 1.0f);
        wrap.position(wrap.position() + 6);
        if (objectData.TextureEntry.length > 4) {
            ByteBuffer byteBuffer = ByteBuffer.wrap(objectData.TextureEntry);
            byteBuffer.position(4);
            SLTextureEntry create = SLTextureEntry.create(byteBuffer, byteBuffer.remaining());
            onTexturesUpdate(create);
            PrimDrawParams primDrawParams = this.primDrawParams;
            if (primDrawParams != null && !create.equals(primDrawParams.getTextures())) {
                PrimDrawParams primDrawParams2 = PrimParamsPool.get(new PrimDrawParams(primDrawParams.getVolumeParams(), create));
                if (!Objects.equal(this.primDrawParams, primDrawParams2)) {
                    this.primDrawParams = primDrawParams2;
                    DrawableObject drawableObject = getDrawableObject();
                    if (drawableObject != null) {
                        drawableObject.setPrimDrawParams(this.primDrawParams);
                    }
                }
            }
        }
        updateSpatialIndex(false);
    }

    public synchronized void addChild(SLObjectInfo objectInfo) {
        SLObjectInfo attachedTo;
        this.treeNode.addChild(objectInfo.treeNode);
        if (objectInfo.isAttachment && (attachedTo = objectInfo.getAttachedTo()) != null) {
            attachedTo.updateAttachments();
        }
    }

    public void clearDrawListEntry() {
        synchronized (this) {
            this.drawListEntry = null;
        }
    }

    @Nonnull
    protected abstract DrawListObjectEntry createDrawListEntry();

    public LLVector3 getAbsolutePosition() {
        SLObjectInfo parentObject = getParentObject();
        LLVector3 vector3 = this.objectCoords.get(0);
        if (parentObject == null) {
            return vector3;
        }
        while (parentObject != null) {
            parentObject.objectCoords.addToVector(0, vector3);
            parentObject = parentObject.getParentObject();
        }
        return vector3;
    }

    public SLObjectInfo getAttachedTo() {
        SLObjectInfo parentObject = getParentObject();
        if (parentObject != null) {
            return parentObject.isAvatar() ? parentObject : parentObject.getAttachedTo();
        }
        return null;
    }

    public String getDescription() {
        return this.description;
    }

    @Nonnull
    public DrawListObjectEntry getDrawListEntry() {
        WeakReference<DrawListObjectEntry> weakReference = this.drawListEntry;
        DrawListObjectEntry drawListObjectEntry = weakReference != null ? weakReference.get() : null;
        if (drawListObjectEntry == null) {
            synchronized (this) {
                WeakReference<DrawListObjectEntry> drawListEntry = this.drawListEntry;
                drawListObjectEntry = drawListEntry != null ? drawListEntry.get() : null;
                if (drawListObjectEntry == null) {
                    drawListObjectEntry = createDrawListEntry();
                    this.drawListEntry = new WeakReference<>(drawListObjectEntry);
                }
            }
        }
        return drawListObjectEntry;
    }

    @Nullable
    public DrawListObjectEntry getExistingDrawListEntry() {
        WeakReference<DrawListObjectEntry> weakReference = this.drawListEntry;
        if (weakReference != null) {
            return weakReference.get();
        }
        return null;
    }

    @Nullable
    public HoverText getHoverText() {
        return this.hoverText;
    }

    @Override
    public UUID getId() {
        return this.uuid;
    }

    public String getName() {
        return this.name;
    }

    public Vector3Array getObjectCoords() {
        return this.objectCoords;
    }

    public void getObjectExtents(MatrixStack matrixStack, boolean z, LLVector3 vector3, LLVector3 vector33) {
        int elementOffset = this.objectCoords.getElementOffset(0);
        int elementOffset2 = this.objectCoords.getElementOffset(1);
        float[] data = this.objectCoords.getData();
        matrixStack.glPushMatrix();
        matrixStack.glTranslatef(data[elementOffset + 0], data[elementOffset + 1], data[elementOffset + 2]);
        matrixStack.glMultMatrixf(this.rotation.getInverseMatrix(), 0);
        float[] floats = {(-data[elementOffset2 + 0]) / 2.0f, (-data[elementOffset2 + 1]) / 2.0f, (-data[elementOffset2 + 2]) / 2.0f, 1.0f, 0.0f, 0.0f, 0.0f, 0.0f};
        Matrix.multiplyMV(floats, 4, matrixStack.getMatrixData(), matrixStack.getMatrixDataOffset(), floats, 0);
        if (z) {
            vector3.x = floats[4];
            vector3.y = floats[5];
            vector3.z = floats[6];
            vector33.x = floats[4];
            vector33.y = floats[5];
            vector33.z = floats[6];
        } else {
            vector3.x = Math.min(vector3.x, floats[4]);
            vector3.y = Math.min(vector3.y, floats[5]);
            vector3.z = Math.min(vector3.z, floats[6]);
            vector33.x = Math.max(vector33.x, floats[4]);
            vector33.y = Math.max(vector33.y, floats[5]);
            vector33.z = Math.max(vector33.z, floats[6]);
        }
        floats[0] = data[elementOffset2 + 0] / 2.0f;
        floats[1] = data[elementOffset2 + 1] / 2.0f;
        floats[2] = data[elementOffset2 + 2] / 2.0f;
        floats[3] = 1.0f;
        Matrix.multiplyMV(floats, 4, matrixStack.getMatrixData(), matrixStack.getMatrixDataOffset(), floats, 0);
        vector3.x = Math.min(vector3.x, floats[4]);
        vector3.y = Math.min(vector3.y, floats[5]);
        vector3.z = Math.min(vector3.z, floats[6]);
        vector33.x = Math.max(vector33.x, floats[4]);
        vector33.y = Math.max(vector33.y, floats[5]);
        vector33.z = Math.max(vector33.z, floats[6]);
        try {
            Iterator<SLObjectInfo> it = this.treeNode.iterator();
            while (it.hasNext()) {
                it.next().getObjectExtents(matrixStack, false, vector3, vector33);
            }
        } catch (NoSuchElementException e) {
            e.printStackTrace();
        }
        matrixStack.glPopMatrix();
    }

    public UUID getOwnerUUID() {
        return (this.ownerUUID != null && this.ownerUUID.getLeastSignificantBits() == 0 && this.ownerUUID.getMostSignificantBits() == 0) ? this.creatorUUID : this.ownerUUID;
    }

    public SLObjectInfo getParentObject() {
        return this.treeNode.getParent();
    }

    @Nullable
    public PayInfo getPayInfo() {
        return this.payInfo;
    }

    public PrimDrawParams getPrimDrawParams() {
        return this.primDrawParams;
    }

    public SLObjectInfo getRootPrim() {
        SLObjectInfo parent = this.treeNode.getParent();
        return (parent == null || parent.isAvatar()) ? this : parent.getRootPrim();
    }

    public final LLQuaternion getRotation() {
        return this.rotation;
    }

    public String getTouchName() {
        return this.touchName;
    }

    public boolean hasTouchableChildren() {
        try {
            Iterator<SLObjectInfo> it = this.treeNode.iterator();
            while (it.hasNext()) {
                if (it.next().isTouchable()) {
                    return true;
                }
            }
            return false;
        } catch (NoSuchElementException e) {
            e.printStackTrace();
            return false;
        }
    }

    public abstract boolean isAvatar();

    public synchronized boolean isAvatarSittingOn() {
        try {
            for (SLObjectInfo objectInfo : this.treeNode) {
                if ((objectInfo instanceof SLObjectAvatarInfo) && ((SLObjectAvatarInfo) objectInfo).isMyAvatar()) {
                    return true;
                }
            }
        } catch (NoSuchElementException e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean isMyAttachment() {
        SLObjectInfo parentObject = getParentObject();
        if (parentObject instanceof SLObjectAvatarInfo) {
            return ((SLObjectAvatarInfo) parentObject).isMyAvatar();
        }
        return false;
    }

    public final boolean isPayable() {
        return (this.UpdateFlags & 512) != 0;
    }

    public final boolean isTouchable() {
        return (this.UpdateFlags & 128) != 0;
    }

    protected void onTexturesUpdate(SLTextureEntry textureEntry) {
    }

    public synchronized void removeChild(SLObjectInfo objectInfo) {
        SLObjectInfo attachedTo;
        if (objectInfo.isAttachment && (attachedTo = objectInfo.getAttachedTo()) != null) {
            attachedTo.updateAttachments();
        }
        this.treeNode.removeChild(objectInfo.treeNode);
    }

    public void removeFromSpatialIndex() {
        DrawListObjectEntry existingDrawListEntry = getExistingDrawListEntry();
        if (existingDrawListEntry != null) {
            existingDrawListEntry.requestEntryRemoval();
        }
        if (isAvatar()) {
            return;
        }
        Iterator<SLObjectInfo> it = this.treeNode.iterator();
        while (it.hasNext()) {
            it.next().removeFromSpatialIndex();
        }
    }

    public synchronized void setIsAttachmentAll(boolean isAttachment) {
        this.isAttachment = isAttachment;
        try {
            for (SLObjectInfo objectInfo : this.treeNode) {
                if (!objectInfo.isAvatar()) {
                    objectInfo.setIsAttachmentAll(isAttachment);
                }
            }
        } catch (NoSuchElementException e) {
            e.printStackTrace();
        }
    }

    public void setPayInfo(@Nullable PayInfo payInfo) {
        this.payInfo = payInfo;
    }

    public void updateSpatialIndex(boolean z) {
        updateSpatialIndex(SpatialIndex.getInstance().getObjectIndex(), z);
    }

    public void updateWorldMatrix(boolean z) {
        SLObjectInfo parentObject = getParentObject();
        float[] matrix = parentObject == null ? IdentityMatrix.getMatrix() : parentObject.isAvatar() ? IdentityMatrix.getMatrix() : parentObject.worldMatrix;
        if (matrix != null) {
            this.objRadius = this.objectCoords.getMaxComponent(1) / 2.0f;
            float[] calculateWorldMatrix = calculateWorldMatrix(matrix);
            float[] worldMatrix = this.worldMatrix;
            if (worldMatrix == null || !Arrays.equals(calculateWorldMatrix, worldMatrix)) {
                this.worldMatrix = calculateWorldMatrix;
                this.objectCoords.set(3, this.worldMatrix[12], this.worldMatrix[13], this.worldMatrix[14]);
                if (z) {
                    Iterator<SLObjectInfo> it = this.treeNode.iterator();
                    while (it.hasNext()) {
                        it.next().updateWorldMatrix(true);
                    }
                }
            }
        }
    }
}
