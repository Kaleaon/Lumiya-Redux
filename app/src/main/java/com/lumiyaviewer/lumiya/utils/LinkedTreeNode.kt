package com.lumiyaviewer.lumiya.utils

import java.util.NoSuchElementException

class LinkedTreeNode<T>(val dataObject: T) : Iterable<T> {

    private var firstChild: LinkedTreeNode<T>? = null
    private var nextChild: LinkedTreeNode<T>? = null
    private var parentObject: LinkedTreeNode<T>? = null
    private var prevChild: LinkedTreeNode<T>? = null

    class LinkedTreeIterator<T>(private var node: LinkedTreeNode<T>) : Iterator<T> {
        private var isFirst = true

        override fun hasNext(): Boolean {
            return if (isFirst) node.firstChild != null else node.nextChild != null
        }

        override fun next(): T {
            if (isFirst) {
                node = node.firstChild ?: throw NoSuchElementException()
                isFirst = false
            } else {
                node = node.nextChild ?: throw NoSuchElementException()
            }
            return node.dataObject
        }
    }

    @Synchronized
    fun addChild(child: LinkedTreeNode<T>) {
        if (child.parentObject !== this) {
            child.unlinkFromParent()
            child.parentObject = this
            child.prevChild = null
            child.nextChild = this.firstChild
            this.firstChild = child
            child.nextChild?.prevChild = child
        }
    }

    @Synchronized
    fun getFirstChild(): LinkedTreeNode<T>? = firstChild

    @Synchronized
    fun getNextChild(): LinkedTreeNode<T>? = nextChild

    @Synchronized
    fun getParent(): T? = parentObject?.dataObject

    @Synchronized
    fun hasChild(child: LinkedTreeNode<*>): Boolean = child.parentObject === this

    @Synchronized
    fun hasChildren(): Boolean = firstChild != null

    override fun iterator(): Iterator<T> = LinkedTreeIterator(this)

    @Synchronized
    fun removeChild(child: LinkedTreeNode<T>) {
        if (child.parentObject === this) {
            child.unlinkFromParent()
        }
    }

    @Synchronized
    fun unlinkFromParent() {
        val parent = parentObject ?: return
        val prev = prevChild
        val next = nextChild
        if (prev != null) {
            prev.nextChild = next
        } else {
            parent.firstChild = next
        }
        next?.prevChild = prev
        parentObject = null
    }
}
