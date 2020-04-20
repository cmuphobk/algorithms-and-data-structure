//
//  BinaryTree.swift
//  AlgorithmsAndDataStructures
//
//  Created by ksmirnov on 19.04.2020.
//  Copyright © 2020 ksmirnov. All rights reserved.
//

import Foundation

public indirect enum BinaryTree<T> {
    case node(BinaryTree<T>, T, BinaryTree<T>)
    case empty
    
    var count: Int {
        guard case let .node(leftNode, _, rightNode) = self else { return 0 }
        return leftNode.count + 1 + rightNode.count
    }
    
    func traverseInOrder(process: (T) -> Void) {
        guard case let .node(leftNode, value, rightNode) = self else { return }
        leftNode.traverseInOrder(process: process)
        process(value)
        rightNode.traverseInOrder(process: process)
    }
    
    func traversePreOrder(process: (T) -> Void) {
        guard case let .node(leftNode, value, rightNode) = self else { return }
        process(value)
        leftNode.traversePreOrder(process: process)
        rightNode.traversePreOrder(process: process)
    }
    
    func traversePostOrder(process: (T) -> Void) {
        guard case let .node(leftNode, value, rightNode) = self else { return }
        leftNode.traversePostOrder(process: process)
        rightNode.traversePostOrder(process: process)
        process(value)
    }
}
