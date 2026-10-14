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
import java.io.ByteArrayInputStream
import java.io.DataInputStream
import java.io.File
import java.io.IOException
import java.util.EnumMap
import java.util.zip.InflaterInputStream

open class MeshData(file: File) {

    private var bindShapeMatrix: FloatArray? = null
    private var faces: Array<MeshFace?>? = null
    private var glJointIndexBuffer: GLLoadableBuffer? = null
    private var glWeightsBuffer: GLLoadableBuffer? = null

    private var jointTranslations: ImmutableMap<SLSkeletonBoneID, FloatArray>? = null
    private var pelvisOffset: Float = 0.0f

    private var riggingData: MeshRiggingData? = null
    private var weightsBuffer: MeshWeightsBuffer? = null

    init {
        var floats: FloatArray? = null
        var ints: IntArray? = null
        var floats2: FloatArray? = null
        var boneIndex: Int = 0
        val meshRendering: GlobalOptions.MeshRendering = GlobalOptions.getInstance().meshRendering
        if (meshRendering == GlobalOptions.MeshRendering.disabled) {
            throw IOException("Mesh rendering is disabled")
        }
        Debug.Printf("loading file '%s'", file.toString())
        var hasExtendedBonesFlag = false
        var enumMap: EnumMap<SLSkeletonBoneID, FloatArray>? = null
        var pelvisOff = 0.0f

        try {
            val bytes = file.readBytes()
            val bais = ByteArrayInputStream(bytes)
            val dataInputStream = DataInputStream(bais)

            val fromBinary: LLSDNode = LLSDNode.fromBinary(dataInputStream)
            val headerOffset = (bytes.size - bais.available()).toLong()

            var lsdNode: LLSDNode? = null
            if (fromBinary.keyExists(meshRendering.getLODName())) {
                lsdNode = fromBinary.byKey(meshRendering.getLODName())
            } else {
                val valuesCustom = GlobalOptions.MeshRendering.values()
                var ordinal = meshRendering.ordinal + 1
                while (ordinal < valuesCustom.size) {
                    val lodName = valuesCustom[ordinal].getLODName()
                    if (lodName != null && fromBinary.keyExists(lodName)) {
                        lsdNode = fromBinary.byKey(lodName)
                        break
                    }
                    ordinal++
                }
                if (lsdNode == null) {
                    var ordinal2 = meshRendering.ordinal - 1
                    while (ordinal2 >= 0) {
                        val lodName2 = valuesCustom[ordinal2].getLODName()
                        if (lodName2 != null && fromBinary.keyExists(lodName2)) {
                            lsdNode = fromBinary.byKey(lodName2)
                            break
                        }
                        ordinal2--
                    }
                }
            }

            if (lsdNode == null) {
                throw IOException("Mesh LOD not found")
            }

            val lodOffset = (lsdNode.byKey("offset").asInt() + headerOffset).toInt()
            val lodBais = ByteArrayInputStream(bytes, lodOffset, bytes.size - lodOffset)
            val inflaterInputStream = InflaterInputStream(lodBais)
            val dataInputStream2 = DataInputStream(inflaterInputStream)
            val fromBinary2: LLSDNode = LLSDNode.fromBinary(dataInputStream2)
            val count = fromBinary2.getCount()
            val faceArr = arrayOfNulls<MeshFace>(count)
            for (j in 0 until count) {
                faceArr[j] = MeshFace(fromBinary2.byIndex(j))
            }
            this.faces = faceArr
            dataInputStream2.close()
            inflaterInputStream.close()

            if (fromBinary.keyExists("skin")) {
                val skinOffset = (fromBinary.byKey("skin").byKey("offset").asInt() + headerOffset).toInt()
                val skinBais = ByteArrayInputStream(bytes, skinOffset, bytes.size - skinOffset)
                val inflaterInputStream2 = InflaterInputStream(skinBais)
                val dataInputStream3 = DataInputStream(inflaterInputStream2)
                val fromBinary3: LLSDNode = LLSDNode.fromBinary(dataInputStream3)
                dataInputStream3.close()
                inflaterInputStream2.close()

                if (fromBinary3.keyExists("bind_shape_matrix")) {
                    val bsmNode = fromBinary3.byKey("bind_shape_matrix")
                    val bsmFloats = FloatArray(16)
                    for (k in 0 until 16) {
                        bsmFloats[k] = bsmNode.byIndex(k).asDouble().toFloat()
                    }
                    floats = bsmFloats
                } else {
                    floats = null
                }

                if (fromBinary3.keyExists("joint_names")) {
                    val jointNamesNode = fromBinary3.byKey("joint_names")
                    val min = Math.min(jointNamesNode.getCount(), MAX_RIGGED_MESH_JOINTS)
                    val ints2 = IntArray(min)
                    for (m in 0 until min) {
                        val jointName = jointNamesNode.byIndex(m).asString()
                        var boneId = SLSkeletonBoneID.bones[jointName]
                        val ordinal3 = boneId?.ordinal ?: -1
                        if (boneId == null || ordinal3 == -1) {
                            val attachmentPoint = SLAttachmentPoint.pointsByName[jointName]
                            if (attachmentPoint != null) {
                                boneId = attachmentPoint.bone
                                boneIndex = attachmentPoint.nonHUDindex + SLSkeletonBoneID.VALUES.size
                            } else {
                                boneIndex = ordinal3
                            }
                        } else {
                            boneIndex = ordinal3
                        }
                        if (boneId != null && boneId.isExtended) {
                            hasExtendedBonesFlag = true
                        }
                        ints2[m] = boneIndex
                    }
                    ints = ints2
                } else {
                    ints = null
                }

                if (!fromBinary3.keyExists("inverse_bind_matrix")) {
                    floats2 = null
                } else if (ints != null) {
                    val ibmNode = fromBinary3.byKey("inverse_bind_matrix")
                    val ibmFloats = FloatArray(ints.size * 16)
                    for (n in 0 until ibmNode.getCount()) {
                        if (n < ints.size) {
                            val matrixNode = ibmNode.byIndex(n)
                            for (i6 in 0 until 16) {
                                ibmFloats[n * 16 + i6] = matrixNode.byIndex(i6).asDouble().toFloat()
                            }
                        }
                    }
                    floats2 = ibmFloats
                    Debug.Printf("inverseBindMatrix count %d", ibmNode.getCount())
                } else {
                    floats2 = null
                }

                if (fromBinary3.keyExists("alt_inverse_bind_matrix")) {
                    val altIbmNode = fromBinary3.byKey("alt_inverse_bind_matrix")
                    val floats3 = FloatArray(altIbmNode.getCount() * 16)
                    for (i7 in 0 until altIbmNode.getCount()) {
                        val matrixNode = altIbmNode.byIndex(i7)
                        for (i8 in 0 until 16) {
                            floats3[i7 * 16 + i8] = matrixNode.byIndex(i8).asDouble().toFloat()
                        }
                    }
                    if (ints != null) {
                        val map = EnumMap<SLSkeletonBoneID, FloatArray>(SLSkeletonBoneID::class.java)
                        for (i9 in ints.indices) {
                            val idx = ints[i9]
                            if (idx >= 0 && idx < SLSkeletonBoneID.VALUES.size) {
                                val bone = SLSkeletonBoneID.VALUES[idx]
                                val floats4 = FloatArray(3)
                                for (i11 in 0 until 3) {
                                    floats4[i11] = floats3[i9 * 16 + 12 + i11]
                                }
                                map[bone] = floats4
                            }
                        }
                        enumMap = map
                    }
                    Debug.Printf("alt_inverse_bind_matrix count %d", altIbmNode.getCount())
                }

                if (fromBinary3.keyExists("pelvis_offset")) {
                    pelvisOff = fromBinary3.byKey("pelvis_offset").asDouble().toFloat()
                    Debug.Printf("Pelvis offset: %f", pelvisOff)
                }
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
                this.riggingData = MeshRiggingData.create(ints, floats2, hasExtendedBonesFlag)
                this.bindShapeMatrix = floats
                this.jointTranslations = if (enumMap != null) Maps.immutableEnumMap(enumMap) else null
            }
            this.pelvisOffset = pelvisOff
        } catch (e: LLSDException) {
            throw IOException(e.message, e)
        }
    }

    private fun makeInfluenceBuffers(): MeshWeightsBuffer {
        var count = 0
        val faceList = this.faces ?: return MeshWeightsBuffer(0)
        for (meshFace in faceList) {
            if (meshFace != null) {
                count += meshFace.getNumVertices()
            }
        }
        val meshWeightsBuffer = MeshWeightsBuffer(count)
        var offset = 0
        for (meshFace in faceList) {
            if (meshFace != null) {
                meshFace.PrepareInfluenceBuffer(meshWeightsBuffer, offset)
                offset += meshFace.getNumVertices()
            }
        }
        return meshWeightsBuffer
    }

    fun ApplyJointTranslations(meshJointTranslations: MeshJointTranslations) {
        meshJointTranslations.pelvisOffset += this.pelvisOffset
        val translations = this.jointTranslations
        if (translations != null) {
            val enumMap = meshJointTranslations.jointTranslations
            for ((key, value) in translations.entries) {
                enumMap[key] = value
            }
        }
    }

    fun PrepareInfluenceBuffers(renderContext: RenderContext) {
        val rigging = this.riggingData
        if (rigging != null) {
            if (this.glJointIndexBuffer == null || this.glWeightsBuffer == null) {
                if (this.weightsBuffer == null) {
                    this.weightsBuffer = makeInfluenceBuffers()
                }
                val weights = this.weightsBuffer
                if (this.glJointIndexBuffer == null && weights != null) {
                    this.glJointIndexBuffer = GLLoadableBuffer(weights.jointIndexBuffer)
                }
                if (this.glWeightsBuffer == null && weights != null) {
                    this.glWeightsBuffer = GLLoadableBuffer(weights.weightsBuffer)
                }
            }
            rigging.PrepareInfluenceBuffers(renderContext, this.bindShapeMatrix)
        }
    }

    fun PrepareInfluencesForFace(renderContext: RenderContext, i: Int) {
        val jointBuf = this.glJointIndexBuffer
        if (jointBuf != null) {
            jointBuf.Bind20(renderContext, renderContext.riggedMeshProgram.vJoint, 4, 5121, 4, i * 4)
        }
        val weightsBuf = this.glWeightsBuffer
        if (weightsBuf != null) {
            weightsBuf.Bind20(renderContext, renderContext.riggedMeshProgram.vWeight, 4, 5126, 16, i * 4 * 4)
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
            val weights = this.weightsBuffer
            if (this.glJointIndexBuffer == null && weights != null) {
                this.glJointIndexBuffer = GLLoadableBuffer(weights.jointIndexBuffer)
            }
            if (this.glWeightsBuffer == null && weights != null) {
                this.glWeightsBuffer = GLLoadableBuffer(weights.weightsBuffer)
            }
        }
        val jointBuf = this.glJointIndexBuffer
        if (jointBuf != null) {
            jointBuf.Bind30Integer(renderContext, renderContext.currentRiggedMeshProgram.vJoint, 4, 5121, 0, i * 4)
        }
        val weightsBuf = this.glWeightsBuffer
        if (weightsBuf != null) {
            weightsBuf.Bind20(renderContext, renderContext.currentRiggedMeshProgram.vWeight, 4, 5126, 16, i * 4 * 4)
        }
    }

    fun UpdateRigged(i: Int, directByteBuffer: DirectByteBuffer, i2: Int) {
        val rigging = this.riggingData
        val faceList = this.faces
        if (rigging != null && faceList != null && i in faceList.indices) {
            val face = faceList[i]
            if (face != null) {
                rigging.UpdateRigged(face, this.bindShapeMatrix, directByteBuffer, i2)
            }
        }
    }

    fun UpdateRiggedMatrices(avatarSkeleton: AvatarSkeleton) {
        val rigging = this.riggingData
        if (rigging != null) {
            rigging.UpdateRiggedMatrices(avatarSkeleton)
        }
    }

    fun getFace(i: Int): MeshFace? {
        val faceList = this.faces
        return if (faceList != null && i in faceList.indices) faceList[i] else null
    }

    fun getFaceCount(): Int {
        return this.faces?.size ?: 0
    }

    fun hasExtendedBones(): Boolean {
        return this.riggingData?.hasExtendedBones() ?: false
    }

    fun isRiggedMesh(): Boolean {
        return this.riggingData != null
    }

    fun riggingFitsGL20(): Boolean {
        return this.riggingData?.fitsGL20() ?: false
    }

    companion object {
        @JvmStatic
        var MAX_RIGGED_MESH_JOINTS: Int = 256
    }
}
