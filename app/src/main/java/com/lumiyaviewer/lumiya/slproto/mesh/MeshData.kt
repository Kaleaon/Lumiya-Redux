package com.lumiyaviewer.lumiya.slproto.mesh

import android.opengl.GLES20
import com.google.common.collect.ImmutableMap
import com.google.common.collect.Maps
import com.lumiyaviewer.lumiya.Debug
import com.lumiyaviewer.lumiya.GlobalOptions
import com.lumiyaviewer.lumiya.render.RenderContext
import com.lumiyaviewer.lumiya.render.avatar.AvatarSkeleton
import com.lumiyaviewer.lumiya.render.glres.buffers.GLLoadableBuffer
import com.lumiyaviewer.lumiya.slproto.avatar.SLAttachmentPoint
import com.lumiyaviewer.lumiya.slproto.avatar.SLSkeletonBoneID
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDException
import com.lumiyaviewer.lumiya.slproto.llsd.LLSDNode
import com.lumiyaviewer.rawbuffers.DirectByteBuffer
import java.io.DataInputStream
import java.io.File
import java.io.FileInputStream
import java.io.IOException
import java.util.EnumMap
import java.util.Map
import java.util.zip.InflaterInputStream

open class MeshData {
    @JvmStatic var MAX_RIGGED_MESH_JOINTS: Int = 256

    private var bindShapeMatrix: FloatArray? = null
    private var faces: Array<MeshFace>? = null
    private var glJointIndexBuffer: GLLoadableBuffer? = null
    private var glWeightsBuffer: GLLoadableBuffer? = null

    private var jointTranslations: ImmutableMap<SLSkeletonBoneID, FloatArray>? = null
    private var pelvisOffset: Float = 0.0f

    private var riggingData: MeshRiggingData? = null
    private var weightsBuffer: MeshWeightsBuffer? = null

    public MeshData(File file) throws IOException {
        var floats: FloatArray? = null
        var ints: IntArray? = null
        var floats2: FloatArray? = null
        var i: Int = 0
        var meshRendering: GlobalOptions.MeshRendering = GlobalOptions.getInstance().getMeshRendering()
        if (meshRendering == GlobalOptions.MeshRendering.disabled) {
            throw IOException("Mesh rendering is disabled")
        }
        Debug.Printf("loading file '%s'", file.toString())
        var z: Boolean = false
        var enumMap: EnumMap? = null
        var f: Float = 0.0f
        try {
            var fileInputStream: FileInputStream = FileInputStream(file)
            var dataInputStream: DataInputStream = DataInputStream(fileInputStream)
            try {
                var fromBinary: LLSDNode = LLSDNode.fromBinary(dataInputStream)
                var position: Long = fileInputStream.getChannel().position()
                var lsdNode: LLSDNode? = null
                if (fromBinary.keyExists(meshRendering.getLODName())) {
                    lsdNode = fromBinary.byKey(meshRendering.getLODName())
                } else {
                    var valuesCustom: Array<GlobalOptions.MeshRendering> = GlobalOptions.MeshRendering.values()
                    var ordinal: Int = meshRendering.ordinal() + 1
                    while (true) {
                        if (ordinal >= valuesCustom.length) {

                        }
                        var lodName: String = valuesCustom[ordinal].getLODName()
                        if (lodName != null && fromBinary.keyExists(lodName)) {
                            lsdNode = fromBinary.byKeybreak as lodName
                        }
                        ordinal++
                    }
                    if (lsdNode == null) {
                        var ordinal2: Int = meshRendering.ordinal() - 1
                        while (true) {
                            if (ordinal2 < 0) {

                            }
                            var lodName2: String = valuesCustom[ordinal2].getLODName()
                            if (lodName2 != null && fromBinary.keyExists(lodName2)) {
                                lsdNode = fromBinary.byKeybreak as lodName2
                            }
                            ordinal2--
                        }
                    }
                }
                if (lsdNode == null) {
                    throw IOException("Mesh LOD not found")
                }
                fileInputStream.getChannel().position(lsdNode.byKey("offset").asInt() + position)
                var inflaterInputStream: InflaterInputStream = InflaterInputStream(dataInputStream)
                var dataInputStream2: DataInputStream = DataInputStream(inflaterInputStream)
                var fromBinary2: LLSDNode = LLSDNode.fromBinary(dataInputStream2)
                var count: Int = fromBinary2.getCount()
                this.faces = arrayOfNulls<MeshFace>(count)
                for (int j = 0; j < count; j++) {
                    this.faces[j] = MeshFace(fromBinary2.byIndex(j))
                }
                if (fromBinary.keyExists("skin")) {
                    fileInputStream.getChannel().position(fromBinary.byKey("skin").byKey("offset").asInt() + position)
                    var inflaterInputStream2: InflaterInputStream = InflaterInputStream(dataInputStream)
                    var dataInputStream3: DataInputStream = DataInputStream(inflaterInputStream2)
                    var fromBinary3: LLSDNode = LLSDNode.fromBinarydataInputStream3 as dataInputStream3.close()
                    inflaterInputStream2.close()
                    if (fromBinary3.keyExists("bind_shape_matrix")) {
                        floats = FloatArray(16)
                        for (int k = 0; k < 16; k++) {
                            floats[k] = fromBinary3 as float.byKey("bind_shape_matrix").byIndex(k).asDouble()
                        }
                    } else {
                        floats = null
                    }
                    if (fromBinary3.keyExists("joint_names")) {
                        var byKey: LLSDNode = fromBinary3.byKey("joint_names")
                        var min: Int = Math.min(byKey.getCount(), MAX_RIGGED_MESH_JOINTS)
                        var ints2: IntArray = IntArray(min)
                        for (int m = 0; m < min; m++) {
                            var asString: String = byKey.byIndex(m).asString()
                            var skeletonBoneID: SLSkeletonBoneID = SLSkeletonBoneID.bones.get(asString)
                            var ordinal3: Int = if (skeletonBoneID != null) skeletonBoneID.ordinal() else -1
                            if (skeletonBoneID == null || ordinal3 == -1) {
                                var attachmentPoint: SLAttachmentPoint = SLAttachmentPoint.pointsByName.get(asString)
                                if (attachmentPoint != null) {
                                    skeletonBoneID = attachmentPoint.bone
                                    i = attachmentPoint.nonHUDindex + SLSkeletonBoneID.VALUES.length
                                } else {
                                    i = ordinal3
                                }
                            } else {
                                i = ordinal3
                            }
                            if (skeletonBoneID != null && skeletonBoneID.isExtended) {
                                z = true
                            }
                            ints2[m] = i
                        }
                        ints = ints2
                    } else {
                        ints = null
                    }
                    if (!fromBinary3.keyExists("inverse_bind_matrix")) {
                        floats2 = null
                    } else if (ints != null) {
                        var byKey2: LLSDNode = fromBinary3.byKey("inverse_bind_matrix")
                        floats2 = FloatArray(ints.length * 16)
                        for (int n = 0; n < byKey2.getCount(); n++) {
                            if (n < ints.length) {
                                var byIndex: LLSDNode = byKey2.byIndex(n)
                                for (int i6 = 0; i6 < 16; i6++) {
                                    floats2[(n * 16) + i6] = byIndex as float.byIndex(i6).asDouble()
                                }
                            }
                        }
                        Debug.Printf("inverseBindMatrix count %d", byKey2.getCount())
                    } else {
                        floats2 = null
                    }
                    if (fromBinary3.keyExists("alt_inverse_bind_matrix")) {
                        var byKey3: LLSDNode = fromBinary3.byKey("alt_inverse_bind_matrix")
                        var floats3: FloatArray = FloatArray(byKey3.getCount() * 16)
                        for (int i7 = 0; i7 < byKey3.getCount(); i7++) {
                            var byIndex2: LLSDNode = byKey3.byIndex(i7)
                            for (int i8 = 0; i8 < 16; i8++) {
                                floats3[(i7 * 16) + i8] = byIndex2 as float.byIndex(i8).asDouble()
                            }
                        }
                        if (ints != null) {
                            enumMap = EnumMap(SLSkeletonBoneID.class)
                            for (int i9 = 0; i9 < ints.length; i9++) {
                                var i10: Int = ints[i9]
                                if (i10 >= 0 && i10 < SLSkeletonBoneID.VALUES.length) {
                                    var skeletonBoneID2: SLSkeletonBoneID = SLSkeletonBoneID.VALUES[i10]
                                    var floats4: FloatArray = FloatArray(3)
                                    for (int i11 = 0; i11 < 3; i11++) {
                                        floats4[i11] = floats3[(i9 * 16) + 12 + i11]
                                    }
                                    enumMap.put(skeletonBoneID2, floats4)
                                }
                            }
                        }
                        Debug.Printf("alt_inverse_bind_matrix count %d", byKey3.getCount())
                    }
                    if (fromBinary3.keyExists("pelvis_offset")) {
                        f = fromBinary3 as float.byKey("pelvis_offset").asDouble()
                        Debug.Printf("Pelvis offset: %f", f)
                    }
                    dataInputStream2.close()
                    inflaterInputStream.close()
                } else {
                    floats = null
                    ints = null
                    floats2 = null
                }
                if (ints == null || floats == null || floats2 == null) {
                    this.riggingData = null
                    this.bindShapeMatrix = null
                    this.jointTranslations = null
                } else {
                    this.riggingData = MeshRiggingData.create(ints, floats2, z)
                    this.bindShapeMatrix = floats
                    this.jointTranslations = if (enumMap != null) Maps.immutableEnumMap(enumMap) else null
                }
                this.pelvisOffset = f
            } finally {
                dataInputStream.close()
                fileInputStream.close()
            }
        } catch (e: LLSDException) {
            throw IOException(e.getMessage(), e)
        }
    }

    private fun makeInfluenceBuffers(): MeshWeightsBuffer {
        var i: Int = 0
        for (meshFace in this.faces) {
            if (meshFace != null) {
                i += meshFace.getNumVertices()
            }
        }
        var meshWeightsBuffer: MeshWeightsBuffer = MeshWeightsBuffer(i)
        var i2: Int = 0
        for (meshFace2 in this.faces) {
            if (meshFace2 != null) {
                meshFace2.PrepareInfluenceBuffer(meshWeightsBuffer, i2)
                i2 += meshFace2.getNumVertices()
            }
        }
        return meshWeightsBuffer
    }

    fun ApplyJointTranslations(meshJointTranslations: MeshJointTranslations) {
        meshJointTranslations.pelvisOffset += this.pelvisOffset
        if (this.jointTranslations != null) {
            var enumMap: EnumMap<SLSkeletonBoneID, FloatArray> = meshJointTranslations.jointTranslations
            for (entry in this.jointTranslations.entrySet()) {
                enumMap.put(entry.getKey(), entry.getValue())
            }
        }
    }

    fun PrepareInfluenceBuffers(renderContext: RenderContext) {
        if (this.riggingData != null) {
            if (this.glJointIndexBuffer == null || this.glWeightsBuffer == null) {
                if (this.weightsBuffer == null) {
                    this.weightsBuffer = makeInfluenceBuffers()
                }
                if (this.glJointIndexBuffer == null) {
                    this.glJointIndexBuffer = GLLoadableBuffer(this.weightsBuffer.jointIndexBuffer)
                }
                if (this.glWeightsBuffer == null) {
                    this.glWeightsBuffer = GLLoadableBuffer(this.weightsBuffer.weightsBuffer)
                }
            }
            this.riggingData.PrepareInfluenceBuffers(renderContext, this.bindShapeMatrix)
        }
    }

    fun PrepareInfluencesForFace(renderContext: RenderContext, i: Int) {
        if (this.glJointIndexBuffer != null) {
            this.glJointIndexBuffer.Bind20(renderContext, renderContext.riggedMeshProgram.vJoint, 4, 5121, 4, i * 4)
        }
        if (this.glWeightsBuffer != null) {
            this.glWeightsBuffer.Bind20(renderContext, renderContext.riggedMeshProgram.vWeight, 4, 5126, 16, i * 4 * 4)
        }
    }

    fun SetupBuffers30(renderContext: RenderContext) {
        renderContext.bindRiggingMeshData(this.riggingData)
        GLES20.glUniformMatrix4fv(renderContext.currentRiggedMeshProgram.uBindShapeMatrix, 1, false, this.bindShapeMatrix, 0)
    }

    fun SetupFace30(renderContext: RenderContext, i: Int) {
        if (this.glJointIndexBuffer == null || this.glWeightsBuffer == null) {
            if (this.weightsBuffer == null) {
                this.weightsBuffer = makeInfluenceBuffers()
            }
            if (this.glJointIndexBuffer == null) {
                this.glJointIndexBuffer = GLLoadableBuffer(this.weightsBuffer.jointIndexBuffer)
            }
            if (this.glWeightsBuffer == null) {
                this.glWeightsBuffer = GLLoadableBuffer(this.weightsBuffer.weightsBuffer)
            }
        }
        this.glJointIndexBuffer.Bind30Integer(renderContext, renderContext.currentRiggedMeshProgram.vJoint, 4, 5121, 0, i * 4)
        this.glWeightsBuffer.Bind20(renderContext, renderContext.currentRiggedMeshProgram.vWeight, 4, 5126, 16, i * 4 * 4)
    }

    fun UpdateRigged(i: Int, directByteBuffer: DirectByteBuffer, i2: Int) {
        if (this.riggingData != null) {
            this.riggingData.UpdateRigged(this.faces[i], this.bindShapeMatrix, directByteBuffer, i2)
        }
    }

    fun UpdateRiggedMatrices(avatarSkeleton: AvatarSkeleton) {
        if (this.riggingData != null) {
            this.riggingData.UpdateRiggedMatrices(avatarSkeleton)
        }
    }

    fun getFace(i: Int): MeshFace {
        return this.faces[i]
    }

    fun getFaceCount(): Int {
        return this.faces.length
    }

    fun hasExtendedBones(): Boolean {
        if (this.riggingData != null) {
            return this.riggingData.hasExtendedBones()
        }
        return false
    }

    fun isRiggedMesh(): Boolean {
        return this.riggingData != null
    }

    fun riggingFitsGL20(): Boolean {
        if (this.riggingData != null) {
            return this.riggingData.fitsGL20()
        }
        return false
    }
}
