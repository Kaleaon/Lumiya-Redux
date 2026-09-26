package com.lumiyaviewer.lumiya.slproto.avatar

import com.lumiyaviewer.lumiya.slproto.types.LLQuaternion
import com.lumiyaviewer.lumiya.slproto.types.LLVector3

class SLAttachmentPoint private constructor(
    val id: Int,
    val name: String,
    val nonHUDindex: Int,
    val isHUD: Boolean,
    val bone: SLSkeletonBoneID?,
    val position: LLVector3,
    val rotation: LLQuaternion
) {
    companion object {
        const val NON_HUD_ATTACHMENT_POINTS: Int = 47
        const val NUM_ATTACHMENT_POINTS: Int = 56

        @JvmField
        val nonHUDpoints: IntArray = intArrayOf(
            1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
            21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 39, 40, 41, 42, 43, 44, 45, 46, 47,
            48, 49, 50, 51, 52, 53, 54, 55
        )

        @JvmField
        val attachmentPoints: Array<SLAttachmentPoint?> = arrayOfNulls(56)

        @JvmField
        val pointsByName: MutableMap<String, SLAttachmentPoint> = HashMap()

        init {
            attachmentPoints[1] = SLAttachmentPoint(1, "Chest", 0, false, SLSkeletonBoneID.mChest, LLVector3(0.15f, 0.0f, -0.1f), LLQuaternion(0.5f, 0.5f, 0.5f, 0.5f))
            attachmentPoints[2] = SLAttachmentPoint(2, "Skull", 1, false, SLSkeletonBoneID.mHead, LLVector3(0.0f, 0.0f, 0.15f), LLQuaternion(0.0f, 0.0f, 0.707107f, 0.707107f))
            attachmentPoints[3] = SLAttachmentPoint(3, "Left Shoulder", 2, false, SLSkeletonBoneID.mCollarLeft, LLVector3(0.0f, 0.0f, 0.08f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[4] = SLAttachmentPoint(4, "Right Shoulder", 3, false, SLSkeletonBoneID.mCollarRight, LLVector3(0.0f, 0.0f, 0.08f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[5] = SLAttachmentPoint(5, "Left Hand", 4, false, SLSkeletonBoneID.mWristLeft, LLVector3(0.0f, 0.08f, -0.02f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[6] = SLAttachmentPoint(6, "Right Hand", 5, false, SLSkeletonBoneID.mWristRight, LLVector3(0.0f, -0.08f, -0.02f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[7] = SLAttachmentPoint(7, "Left Foot", 6, false, SLSkeletonBoneID.mFootLeft, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[8] = SLAttachmentPoint(8, "Right Foot", 7, false, SLSkeletonBoneID.mFootRight, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[9] = SLAttachmentPoint(9, "Spine", 8, false, SLSkeletonBoneID.mChest, LLVector3(-0.15f, 0.0f, -0.1f), LLQuaternion(-0.5f, -0.5f, 0.5f, 0.5f))
            attachmentPoints[10] = SLAttachmentPoint(10, "Pelvis", 9, false, SLSkeletonBoneID.mPelvis, LLVector3(0.0f, 0.0f, -0.15f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[11] = SLAttachmentPoint(11, "Mouth", 10, false, SLSkeletonBoneID.mHead, LLVector3(0.12f, 0.0f, 0.001f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[12] = SLAttachmentPoint(12, "Chin", 11, false, SLSkeletonBoneID.mHead, LLVector3(0.12f, 0.0f, -0.04f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[13] = SLAttachmentPoint(13, "Left Ear", 12, false, SLSkeletonBoneID.mHead, LLVector3(0.015f, 0.08f, 0.017f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[14] = SLAttachmentPoint(14, "Right Ear", 13, false, SLSkeletonBoneID.mHead, LLVector3(0.015f, -0.08f, 0.017f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[15] = SLAttachmentPoint(15, "Left Eyeball", 14, false, SLSkeletonBoneID.mEyeLeft, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[16] = SLAttachmentPoint(16, "Right Eyeball", 15, false, SLSkeletonBoneID.mEyeRight, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[17] = SLAttachmentPoint(17, "Nose", 16, false, SLSkeletonBoneID.mHead, LLVector3(0.1f, 0.0f, 0.05f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[18] = SLAttachmentPoint(18, "R Upper Arm", 17, false, SLSkeletonBoneID.mShoulderRight, LLVector3(0.01f, -0.13f, 0.01f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[19] = SLAttachmentPoint(19, "R Forearm", 18, false, SLSkeletonBoneID.mElbowRight, LLVector3(0.0f, -0.12f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[20] = SLAttachmentPoint(20, "L Upper Arm", 19, false, SLSkeletonBoneID.mShoulderLeft, LLVector3(0.01f, 0.15f, -0.01f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[21] = SLAttachmentPoint(21, "L Forearm", 20, false, SLSkeletonBoneID.mElbowLeft, LLVector3(0.0f, 0.113f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[22] = SLAttachmentPoint(22, "Right Hip", 21, false, SLSkeletonBoneID.mHipRight, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[23] = SLAttachmentPoint(23, "R Upper Leg", 22, false, SLSkeletonBoneID.mHipRight, LLVector3(-0.017f, 0.041f, -0.31f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[24] = SLAttachmentPoint(24, "R Lower Leg", 23, false, SLSkeletonBoneID.mKneeRight, LLVector3(-0.044f, -0.007f, -0.262f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[25] = SLAttachmentPoint(25, "Left Hip", 24, false, SLSkeletonBoneID.mHipLeft, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[26] = SLAttachmentPoint(26, "L Upper Leg", 25, false, SLSkeletonBoneID.mHipLeft, LLVector3(-0.019f, -0.034f, -0.31f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[27] = SLAttachmentPoint(27, "L Lower Leg", 26, false, SLSkeletonBoneID.mKneeLeft, LLVector3(-0.044f, -0.007f, -0.261f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[28] = SLAttachmentPoint(28, "Stomach", 27, false, SLSkeletonBoneID.mPelvis, LLVector3(0.092f, 0.0f, 0.088f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[29] = SLAttachmentPoint(29, "Left Pec", 28, false, SLSkeletonBoneID.mTorso, LLVector3(0.104f, 0.082f, 0.247f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[30] = SLAttachmentPoint(30, "Right Pec", 29, false, SLSkeletonBoneID.mTorso, LLVector3(0.104f, -0.082f, 0.247f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[31] = SLAttachmentPoint(31, "Center 2", -1, true, null, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[32] = SLAttachmentPoint(32, "Top Right", -1, true, null, LLVector3(0.0f, -0.5f, 0.5f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[33] = SLAttachmentPoint(33, "Top", -1, true, null, LLVector3(0.0f, 0.0f, 0.5f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[34] = SLAttachmentPoint(34, "Top Left", -1, true, null, LLVector3(0.0f, 0.5f, 0.5f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[35] = SLAttachmentPoint(35, "Center", -1, true, null, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[36] = SLAttachmentPoint(36, "Bottom Left", -1, true, null, LLVector3(0.0f, 0.5f, -0.5f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[37] = SLAttachmentPoint(37, "Bottom", -1, true, null, LLVector3(0.0f, 0.0f, -0.5f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[38] = SLAttachmentPoint(38, "Bottom Right", -1, true, null, LLVector3(0.0f, -0.5f, -0.5f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[39] = SLAttachmentPoint(39, "Neck", 30, false, SLSkeletonBoneID.mNeck, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[40] = SLAttachmentPoint(40, "Avatar Center", 31, false, null, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[41] = SLAttachmentPoint(41, "Left Ring Finger", 32, false, SLSkeletonBoneID.mHandRing1Left, LLVector3(-0.006f, 0.019f, -0.002f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[42] = SLAttachmentPoint(42, "Right Ring Finger", 33, false, SLSkeletonBoneID.mHandRing1Right, LLVector3(-0.006f, -0.019f, -0.002f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[43] = SLAttachmentPoint(43, "Tail Base", 34, false, SLSkeletonBoneID.mTail1, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[44] = SLAttachmentPoint(44, "Tail Tip", 35, false, SLSkeletonBoneID.mTail6, LLVector3(-0.025f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[45] = SLAttachmentPoint(45, "Left Wing", 36, false, SLSkeletonBoneID.mWing4Left, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[46] = SLAttachmentPoint(46, "Right Wing", 37, false, SLSkeletonBoneID.mWing4Right, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[47] = SLAttachmentPoint(47, "Jaw", 38, false, SLSkeletonBoneID.mFaceJaw, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[48] = SLAttachmentPoint(48, "Alt Left Ear", 39, false, SLSkeletonBoneID.mFaceEar1Left, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[49] = SLAttachmentPoint(49, "Alt Right Ear", 40, false, SLSkeletonBoneID.mFaceEar1Right, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[50] = SLAttachmentPoint(50, "Alt Left Eye", 41, false, SLSkeletonBoneID.mFaceEyeAltLeft, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[51] = SLAttachmentPoint(51, "Alt Right Eye", 42, false, SLSkeletonBoneID.mFaceEyeAltRight, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[52] = SLAttachmentPoint(52, "Tongue", 43, false, SLSkeletonBoneID.mFaceTongueTip, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[53] = SLAttachmentPoint(53, "Groin", 44, false, SLSkeletonBoneID.mGroin, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[54] = SLAttachmentPoint(54, "Left Hind Foot", 45, false, SLSkeletonBoneID.mHindLimb4Left, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            attachmentPoints[55] = SLAttachmentPoint(55, "Right Hind Foot", 46, false, SLSkeletonBoneID.mHindLimb4Right, LLVector3(0.0f, 0.0f, 0.0f), LLQuaternion(0.0f, 0.0f, 0.0f, 1.0f))
            pointsByName["Chest"] = attachmentPoints[1]!!
            pointsByName["Skull"] = attachmentPoints[2]!!
            pointsByName["Left Shoulder"] = attachmentPoints[3]!!
            pointsByName["Right Shoulder"] = attachmentPoints[4]!!
            pointsByName["Left Hand"] = attachmentPoints[5]!!
            pointsByName["Right Hand"] = attachmentPoints[6]!!
            pointsByName["Left Foot"] = attachmentPoints[7]!!
            pointsByName["Right Foot"] = attachmentPoints[8]!!
            pointsByName["Spine"] = attachmentPoints[9]!!
            pointsByName["Pelvis"] = attachmentPoints[10]!!
            pointsByName["Mouth"] = attachmentPoints[11]!!
            pointsByName["Chin"] = attachmentPoints[12]!!
            pointsByName["Left Ear"] = attachmentPoints[13]!!
            pointsByName["Right Ear"] = attachmentPoints[14]!!
            pointsByName["Left Eyeball"] = attachmentPoints[15]!!
            pointsByName["Right Eyeball"] = attachmentPoints[16]!!
            pointsByName["Nose"] = attachmentPoints[17]!!
            pointsByName["R Upper Arm"] = attachmentPoints[18]!!
            pointsByName["R Forearm"] = attachmentPoints[19]!!
            pointsByName["L Upper Arm"] = attachmentPoints[20]!!
            pointsByName["L Forearm"] = attachmentPoints[21]!!
            pointsByName["Right Hip"] = attachmentPoints[22]!!
            pointsByName["R Upper Leg"] = attachmentPoints[23]!!
            pointsByName["R Lower Leg"] = attachmentPoints[24]!!
            pointsByName["Left Hip"] = attachmentPoints[25]!!
            pointsByName["L Upper Leg"] = attachmentPoints[26]!!
            pointsByName["L Lower Leg"] = attachmentPoints[27]!!
            pointsByName["Stomach"] = attachmentPoints[28]!!
            pointsByName["Left Pec"] = attachmentPoints[29]!!
            pointsByName["Right Pec"] = attachmentPoints[30]!!
            pointsByName["Center 2"] = attachmentPoints[31]!!
            pointsByName["Top Right"] = attachmentPoints[32]!!
            pointsByName["Top"] = attachmentPoints[33]!!
            pointsByName["Top Left"] = attachmentPoints[34]!!
            pointsByName["Center"] = attachmentPoints[35]!!
            pointsByName["Bottom Left"] = attachmentPoints[36]!!
            pointsByName["Bottom"] = attachmentPoints[37]!!
            pointsByName["Bottom Right"] = attachmentPoints[38]!!
            pointsByName["Neck"] = attachmentPoints[39]!!
            pointsByName["Avatar Center"] = attachmentPoints[40]!!
            pointsByName["Left Ring Finger"] = attachmentPoints[41]!!
            pointsByName["Right Ring Finger"] = attachmentPoints[42]!!
            pointsByName["Tail Base"] = attachmentPoints[43]!!
            pointsByName["Tail Tip"] = attachmentPoints[44]!!
            pointsByName["Left Wing"] = attachmentPoints[45]!!
            pointsByName["Right Wing"] = attachmentPoints[46]!!
            pointsByName["Jaw"] = attachmentPoints[47]!!
            pointsByName["Alt Left Ear"] = attachmentPoints[48]!!
            pointsByName["Alt Right Ear"] = attachmentPoints[49]!!
            pointsByName["Alt Left Eye"] = attachmentPoints[50]!!
            pointsByName["Alt Right Eye"] = attachmentPoints[51]!!
            pointsByName["Tongue"] = attachmentPoints[52]!!
            pointsByName["Groin"] = attachmentPoints[53]!!
            pointsByName["Left Hind Foot"] = attachmentPoints[54]!!
            pointsByName["Right Hind Foot"] = attachmentPoints[55]!!
        }
    }
}
