package com.lumiyaviewer.lumiya.render

import android.opengl.GLES20
import android.opengl.Matrix
import java.nio.FloatBuffer
import java.nio.IntBuffer

class MatrixStack @JvmOverloads constructor(maxDepth: Int = DEFAULT_MAX_DEPTH) {

    private var mMatrix: FloatArray
    private var mTemp: FloatArray
    private var mTop: Int = 0

    init {
        mMatrix = FloatArray(maxDepth * MATRIX_SIZE)
        mTemp = FloatArray(32)
        glLoadIdentity()
    }

    private fun adjust(i: Int) {
        mTop += i * MATRIX_SIZE
    }

    private fun fixedToFloat(i: Int): Float = i * 1.5258789E-5f

    private fun preflightAdjust(i: Int) {
        val newTop = mTop + (i * MATRIX_SIZE)
        if (newTop < 0) {
            throw IllegalArgumentException("stack underflow")
        }
        if (newTop + MATRIX_SIZE > mMatrix.size) {
            throw IllegalArgumentException("stack overflow")
        }
    }

    fun getMatrix(floats: FloatArray, offset: Int) {
        System.arraycopy(mMatrix, mTop, floats, offset, MATRIX_SIZE)
    }

    fun getMatrixData(): FloatArray = mMatrix

    fun getMatrixDataOffset(): Int = mTop

    val matrixData: FloatArray
        get() = mMatrix

    val matrixDataOffset: Int
        get() = mTop

    fun glApplyUniformMatrix(location: Int) {
        GLES20.glUniformMatrix4fv(location, 1, false, mMatrix, mTop)
    }

    fun glFrustumf(left: Float, right: Float, bottom: Float, top: Float, near: Float, far: Float) {
        Matrix.frustumM(mMatrix, mTop, left, right, bottom, top, near, far)
    }

    fun glFrustumx(left: Int, right: Int, bottom: Int, top: Int, near: Int, far: Int) {
        glFrustumf(fixedToFloat(left), fixedToFloat(right), fixedToFloat(bottom), fixedToFloat(top), fixedToFloat(near), fixedToFloat(far))
    }

    fun glLoadIdentity() {
        Matrix.setIdentityM(mMatrix, mTop)
    }

    fun glLoadMatrixf(floatBuffer: FloatBuffer) {
        floatBuffer.get(mMatrix, mTop, MATRIX_SIZE)
    }

    fun glLoadMatrixf(floats: FloatArray, offset: Int) {
        System.arraycopy(floats, offset, mMatrix, mTop, MATRIX_SIZE)
    }

    fun glLoadMatrixx(intBuffer: IntBuffer) {
        for (i in 0 until MATRIX_SIZE) {
            mMatrix[mTop + i] = fixedToFloat(intBuffer.get())
        }
    }

    fun glLoadMatrixx(ints: IntArray, offset: Int) {
        for (j in 0 until MATRIX_SIZE) {
            mMatrix[mTop + j] = fixedToFloat(ints[offset + j])
        }
    }

    fun glMultMatrixf(floatBuffer: FloatBuffer) {
        floatBuffer.get(mTemp, MATRIX_SIZE, MATRIX_SIZE)
        glMultMatrixf(mTemp, MATRIX_SIZE)
    }

    fun glMultMatrixf(floats: FloatArray, offset: Int) {
        System.arraycopy(mMatrix, mTop, mTemp, 0, MATRIX_SIZE)
        Matrix.multiplyMM(mMatrix, mTop, mTemp, 0, floats, offset)
    }

    fun glMultMatrixx(intBuffer: IntBuffer) {
        for (i in 0 until MATRIX_SIZE) {
            mTemp[i + MATRIX_SIZE] = fixedToFloat(intBuffer.get())
        }
        glMultMatrixf(mTemp, MATRIX_SIZE)
    }

    fun glMultMatrixx(ints: IntArray, offset: Int) {
        for (j in 0 until MATRIX_SIZE) {
            mTemp[j + MATRIX_SIZE] = fixedToFloat(ints[offset + j])
        }
        glMultMatrixf(mTemp, MATRIX_SIZE)
    }

    fun glOrthof(left: Float, right: Float, bottom: Float, top: Float, near: Float, far: Float) {
        Matrix.orthoM(mMatrix, mTop, left, right, bottom, top, near, far)
    }

    fun glOrthox(left: Int, right: Int, bottom: Int, top: Int, near: Int, far: Int) {
        glOrthof(fixedToFloat(left), fixedToFloat(right), fixedToFloat(bottom), fixedToFloat(top), fixedToFloat(near), fixedToFloat(far))
    }

    fun glPopMatrix() {
        preflightAdjust(-1)
        adjust(-1)
    }

    fun glPushAndLoadMatrixf(floats: FloatArray, offset: Int) {
        System.arraycopy(floats, offset, mMatrix, mTop + MATRIX_SIZE, MATRIX_SIZE)
        mTop += MATRIX_SIZE
    }

    fun glPushAndMultMatrixf(floats: FloatArray, offset: Int) {
        Matrix.multiplyMM(mMatrix, mTop + MATRIX_SIZE, mMatrix, mTop, floats, offset)
        mTop += MATRIX_SIZE
    }

    fun glPushMatrix() {
        preflightAdjust(1)
        System.arraycopy(mMatrix, mTop, mMatrix, mTop + MATRIX_SIZE, MATRIX_SIZE)
        adjust(1)
    }

    fun glRotatef(angle: Float, x: Float, y: Float, z: Float) {
        Matrix.setRotateM(mTemp, 0, angle, x, y, z)
        System.arraycopy(mMatrix, mTop, mTemp, MATRIX_SIZE, MATRIX_SIZE)
        Matrix.multiplyMM(mMatrix, mTop, mTemp, MATRIX_SIZE, mTemp, 0)
    }

    fun glRotatex(angle: Int, x: Int, y: Int, z: Int) {
        glRotatef(angle.toFloat(), fixedToFloat(x), fixedToFloat(y), fixedToFloat(z))
    }

    fun glScalef(x: Float, y: Float, z: Float) {
        Matrix.scaleM(mMatrix, mTop, x, y, z)
    }

    fun glScalex(x: Int, y: Int, z: Int) {
        glScalef(fixedToFloat(x), fixedToFloat(y), fixedToFloat(z))
    }

    fun glTranslatef(x: Float, y: Float, z: Float) {
        Matrix.translateM(mMatrix, mTop, x, y, z)
    }

    fun glTranslatex(x: Int, y: Int, z: Int) {
        glTranslatef(fixedToFloat(x), fixedToFloat(y), fixedToFloat(z))
    }

    fun reset() {
        mTop = 0
    }

    companion object {
        private const val DEFAULT_MAX_DEPTH = 32
        private const val MATRIX_SIZE = 16
    }
}
