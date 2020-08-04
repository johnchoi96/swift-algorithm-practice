//
//  BinarySearchTree.swift
//  SwiftAlgorithmPractice
//
//  Created by John Choi on 8/3/20.
//  Copyright © 2020 John Choi. All rights reserved.
//

import Foundation

class BinaryTree<E: Comparable> {
    
    private var root: Node<E>?
    
    var size: Int {
        return root != nil ? reportNodes(current: root!) : 0
    }
    
    private class Node<E> {
        
        let data: E
        var left: Node?
        var right: Node?
        
        init(data: E) {
            self.data = data
        }
    }
    
    func insert(data: E) {
        // make new node
        let newNode = Node<E>(data: data)
        // check if root exists
        if root != nil {
            add(root: root!, node: newNode)
        } else {
            self.root = newNode
        }
    }
    
    func contains(for data: E) -> Bool {
        return root == nil ? false : find(current: root!, for: data)
    }
}

extension BinaryTree {
    
    private func add(root: Node<E>, node: Node<E>) {
        if root.data > node.data {
            // go right
            if let right = root.right {
                add(root: right, node: node)
            } else {
                root.right = node
            }
        } else {
            // go left
            if let left = root.left {
                add(root:left, node: node)
            } else {
                root.left = node
            }
        }
    }
    
    private func reportNodes(current: Node<E>) -> Int {
        var counter = 1
        // go left
        if let left = current.left {
            counter += reportNodes(current: left)
        }
        // go right
        if let right = current.right {
            counter += reportNodes(current: right)
        }
        return counter
    }
    
    private func find(current: Node<E>, for data: E) -> Bool {
        if current.data == data {
            return true
        }
        var found = false
        if current.data > data {
            // search right
            if let right = current.right {
                found = find(current: right, for: data)
            }
        } else {
            // search left
            if let left = current.left {
                found = find(current: left, for: data)
            }
        }
        return found
    }
}
